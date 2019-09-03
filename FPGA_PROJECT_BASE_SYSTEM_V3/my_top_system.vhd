--*****************************************************************************
--*  DEFINE: Library                                                          *
--*****************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.mult_dim_ports.ALL;
--*****************************************************************************
--*  DEFINE: Entity                                                           *
--*****************************************************************************
entity my_top_system is
  port ( 
         --
         -- Input clock 
         --
         CLK_50      : in  std_logic;
        
         --
         -- EPCS
         --
         EPCS_DCLK     : out   std_logic;
         EPCS_SCE     : out   std_logic;
         EPCS_SDO     : out   std_logic;
         EPCS_DATA0    : in    std_logic;
			
			         --
         -- SDRAM interface,
         -- here a IS42S16160B (143MHz@CL-3) is used.
         -- Reference is made to ISSI datasheet:
         -- IS42S16160B, 12/14/05 
         --        
         SDRAM_CLK     : out   std_logic;                       -- Master Clock
         SDRAM_CKE     : out   std_logic;                       -- Clock Enable    
         SDRAM_CS_N    : out   std_logic;                       -- Chip Select
         SDRAM_RAS_N   : out   std_logic;                       -- Row Address Strobe
         SDRAM_CAS_N   : out   std_logic;                       -- Column Address Strobe
         SDRAM_WE_N    : out   std_logic;                       -- Write Enable
         SDRAM_DQ      : inout std_logic_vector(15 downto 0);   -- Data I/O (16 bits)
         SDRAM_DQML    : out   std_logic;                       -- Output Disable / Write Mask (low)
         SDRAM_DQMU    : out   std_logic;                       -- Output Disable / Write Mask (high)
         SDRAM_ADDR    : out   std_logic_vector(12 downto 0);   -- Address Input (13 bits)
         SDRAM_BA_0    : out   std_logic;                       -- Bank Address 0
         SDRAM_BA_1    : out   std_logic;                       -- Bank Address 1
                  
          --
        -- ADC
        --
        ADC_CS_N        : out std_logic;
        ADC_SADDR       : out std_logic;
        ADC_SDAT        : in std_logic;
        ADC_SCLK        : out std_logic;


          -- PWM
          PWM_STEERING : out std_logic;
          PWM_THROTTLE : out std_logic;
          --
        -- UART
        --
        TxD : out std_logic;
        RxD : in std_logic;
        -- Spektrum receiver
        RECEIVER_CHANNEL : in std_logic_vector(5 downto 0);
        
        --push button
        KEY : in std_logic_vector (1 downto 0);
        
        --DIP Switch
        DIP_SWITCH : in std_logic_vector (3 downto 0); 
        
		  DIGITAL_OUTPUT1 : out std_logic;
		  HALL_EFFECT	: in std_logic;
            --On board LEDs
            LED     : out std_logic_vector(7 downto 0)
                  
       );
end entity my_top_system;
--*****************************************************************************
--*  DEFINE: Architecture                                                     *
--*****************************************************************************
architecture syn of my_top_system is


   --
   -- Define all components which are included here
   --
	component HE_counter is
	port(
			CLOCK_IN : in std_logic;
			reset_n	: in std_logic;
			pulse_signal : in std_logic;
			pulse_counts : out std_logic_vector(31 downto 0)
			);
			
	end component HE_counter;

	component mux_4bit is
        GENERIC ( 
                bits : INTEGER := 8; 
                selections :   INTEGER := 4
        ); 
        PORT ( 
                a:      IN      std_logic_vector(bits - 1 downto 0);
					 b:      IN      std_logic_vector(bits - 1 downto 0);
					 c:      IN      std_logic_vector(bits - 1 downto 0);
					 d:      IN      std_logic_vector(bits - 1 downto 0);
					 e:      IN      std_logic_vector(bits - 1 downto 0);
					 f:      IN      std_logic_vector(bits - 1 downto 0);
					 g:      IN      std_logic_vector(bits - 1 downto 0);
                Output:      OUT     STD_LOGIC_VECTOR(bits - 1 DOWNTO 0); 
                sel :   IN      std_logic_vector( selections - 1 downto 0)
        ); 
		 end component mux_4bit;
	component mux_4bit_1 is
        GENERIC ( 
                bits : INTEGER := 1; 
                selections :   INTEGER := 4
        ); 
        PORT ( 
                a:      IN      std_logic_vector(bits - 1 downto 0);
					 b:      IN      std_logic_vector(bits - 1 downto 0);
					 c:      IN      std_logic_vector(bits - 1 downto 0);
					 d:      IN      std_logic_vector(bits - 1 downto 0);
					 e:      IN      std_logic_vector(bits - 1 downto 0);
					 f:      IN      std_logic_vector(bits - 1 downto 0);
					 g:      IN      std_logic_vector(bits - 1 downto 0);
                Output:      OUT     STD_LOGIC_VECTOR(bits - 1 DOWNTO 0); 
                sel :   IN      std_logic_vector( selections - 1 downto 0)
        ); 
		 end component mux_4bit_1;
			 
                --want a 20ms pwm frequency with 1ms to 2ms pulse width
            --this means duty cycle must be 1/20 to 2/20 (0.05 to 0.1)
            --20ms pwm period = 1/(20ms)=50Hz pwm frequency
            --2^(bit_resolution)-1 = 100% duty cycle
            component pwm IS
              GENERIC(
                    sys_clk         : INTEGER := 50_000_000; --system clock frequency in Hz
                    pwm_freq        : INTEGER := 50;    --PWM switching frequency in Hz
                    bits_resolution : INTEGER := 15;          --bits of resolution setting the duty cycle
                    phases          : INTEGER := 1);         --number of output pwms and phases
              PORT(
                    clk       : IN  STD_LOGIC;                                    --system clock
                    reset_n   : IN  STD_LOGIC;                                    --asynchronous reset
                    ena       : IN  STD_LOGIC;                                    --latches in new duty cycle
                    duty      : IN  STD_LOGIC_VECTOR(bits_resolution-1 DOWNTO 0); --duty cycle
                    pwm_out   : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);          --pwm outputs
                    pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0));         --pwm inverse outputs
            END component pwm;

            --this PWM module used for analog sensors
            component pwm_1 IS
              GENERIC(
                    sys_clk         : INTEGER := 50_000_000; --system clock frequency in Hz
                    pwm_freq        : INTEGER := 50;    --PWM switching frequency in Hz
                    bits_resolution : INTEGER := 12;          --bits of resolution setting the duty cycle
                    phases          : INTEGER := 1);         --number of output pwms and phases
              PORT(
                    clk       : IN  STD_LOGIC;                                    --system clock
                    reset_n   : IN  STD_LOGIC;                                    --asynchronous reset
                    ena       : IN  STD_LOGIC;                                    --latches in new duty cycle
                    duty      : IN  STD_LOGIC_VECTOR(bits_resolution-1 DOWNTO 0); --duty cycle
                    pwm_out   : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);          --pwm outputs
                    pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0));         --pwm inverse outputs
            END component pwm_1;

                
    component mynios2 is
        port (
            clk_clk       : in  std_logic := 'X'; -- clk
            reset_reset_n : in  std_logic := 'X'; -- reset_n
            epcs_dclk     : out std_logic;        -- dclk
            epcs_sce      : out std_logic;        -- sce
            epcs_sdo      : out std_logic;        -- sdo
            multi_reg_dataout_14  : out   std_logic_vector(31 downto 0);                    -- dataout_14 steering
            multi_reg_dataout_15  : out   std_logic_vector(31 downto 0);                    -- dataout_15 throttle

            multi_reg_datain_0   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_0
            multi_reg_datain_1   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_1
            multi_reg_datain_2   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_2
            multi_reg_datain_3   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_3
            multi_reg_datain_4   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_4
            multi_reg_datain_5   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_5
            
            --ADC channel 1 to 8 values 
            multi_reg_datain_6      : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 1
            multi_reg_datain_7      : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 2
            multi_reg_datain_8      : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 3
            multi_reg_datain_9      : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 4
            multi_reg_datain_10     : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 5
            multi_reg_datain_11     : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 6
            multi_reg_datain_12     : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 7
            --multi_reg_datain_13     : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 8
            
				--Second set of mm registers
--            multi_reg_1_dataout_0  : out std_logic_vector(31 downto 0);                    -- dataout_0
--            multi_reg_1_dataout_1  : out std_logic_vector(31 downto 0);                    -- dataout_1
--            multi_reg_1_dataout_2  : out std_logic_vector(31 downto 0);                    -- dataout_2
--            multi_reg_1_dataout_3  : out std_logic_vector(31 downto 0);                    -- dataout_3
--            multi_reg_1_dataout_4  : out std_logic_vector(31 downto 0);                    -- dataout_4
--            multi_reg_1_dataout_5  : out std_logic_vector(31 downto 0);                    -- dataout_5
--            multi_reg_1_dataout_6  : out std_logic_vector(31 downto 0);                    -- dataout_6
--            multi_reg_1_dataout_7  : out std_logic_vector(31 downto 0);                    -- dataout_7
--            multi_reg_1_dataout_8  : out std_logic_vector(31 downto 0);                    -- dataout_8
--            multi_reg_1_dataout_9  : out std_logic_vector(31 downto 0);                    -- dataout_9
--            multi_reg_1_dataout_10 : out std_logic_vector(31 downto 0);                    -- dataout_10
--            multi_reg_1_dataout_11 : out std_logic_vector(31 downto 0);                    -- dataout_11
--            multi_reg_1_dataout_12 : out std_logic_vector(31 downto 0);                    -- dataout_12
--            multi_reg_1_dataout_13 : out std_logic_vector(31 downto 0);                    -- dataout_13
--            multi_reg_1_dataout_14 : out std_logic_vector(31 downto 0);                    -- dataout_14
--            multi_reg_1_dataout_15 : out std_logic_vector(31 downto 0);                    -- dataout_15
            multi_reg_1_datain_0   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_0 hall effect sensor
--            multi_reg_1_datain_1   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_1
--            multi_reg_1_datain_2   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_2
--            multi_reg_1_datain_3   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_3
--            multi_reg_1_datain_4   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_4
--            multi_reg_1_datain_5   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_5
--            multi_reg_1_datain_6   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_6
--            multi_reg_1_datain_7   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_7
--            multi_reg_1_datain_8   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_8
--            multi_reg_1_datain_9   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_9
--            multi_reg_1_datain_10  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_10
--            multi_reg_1_datain_11  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_11
--            multi_reg_1_datain_12  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_12
--            multi_reg_1_datain_13  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_13
--            multi_reg_1_datain_14  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain_14
--            multi_reg_1_datain_15  : in  std_logic_vector(31 downto 0) := (others => 'X');  -- datain_15
--            
            sdram_clk_clk          : out   std_logic;                                        -- clk
            sdram_addr             : out   std_logic_vector(12 downto 0);                    -- addr
            sdram_ba               : out   std_logic_vector(1 downto 0);                     -- ba
            sdram_cas_n            : out   std_logic;                                        -- cas_n
            sdram_cke              : out   std_logic;                                        -- cke
            sdram_cs_n             : out   std_logic;                                        -- cs_n
            sdram_dq               : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            sdram_dqm              : out   std_logic_vector(1 downto 0);                     -- dqm
            sdram_ras_n            : out   std_logic;                                        -- ras_n
            sdram_we_n             : out   std_logic;                                         -- we_n
            uart_export_rxd      : in    std_logic                     := 'X';             -- rxd
            uart_export_txd      : out   std_logic;                                        -- txd
                pio_led_export : inout std_logic_vector(15 downto 0) := (others => 'X');  -- export
            epcs_data0    : in  std_logic := 'X'  -- data0
        );
    end component mynios2;
     
     component counter is
        port(  
         clk         : in  std_logic;
         counter_out : out std_logic
       );
        end component counter;
        
             component SPIPLL is
        port(
            inclk0 : in std_logic;
            c0 : out std_logic;
            c1 : out std_logic
            );
            end component SPIPLL;
            
     component ADC_CTRL is
        port(
           iRST : in std_logic;
           iCLK : in std_logic;
           iCLK_n : in std_logic;
           iGO : in std_logic;
--           iCH : in std_logic_vector(2 downto 0);
           oLED : out std_logic_vector(7 downto 0);
           
          oADC_value0 : out std_logic_vector(11 downto 0); 
          oADC_value1 : out std_logic_vector(11 downto 0); 
          oADC_value2 : out std_logic_vector(11 downto 0); 
          oADC_value3 : out std_logic_vector(11 downto 0); 
          oADC_value4 : out std_logic_vector(11 downto 0); 
          oADC_value5 : out std_logic_vector(11 downto 0); 
          oADC_value6 : out std_logic_vector(11 downto 0); 
          oADC_value7 : out std_logic_vector(11 downto 0); 
                      
           oDIN : out std_logic;
           oCS_n : out std_logic;
           oSCLK : out std_logic;
           iDOUT : in std_logic
           );
           end component ADC_CTRL;
              
          component pulse_width_measure is
            port(
                    clk_50mhz : in std_logic;
        --          Q1_O, Q2_O : out std_logic;
--                  reset : in std_logic;
                    pulse_signal : in std_logic;
        --          pulse_counter_O : out std_logic_vector(31 downto 0);
                    pulse_width : out std_logic_vector(31 downto 0)
                
                    );
                     
        end component pulse_width_measure;

	        component pulse_width_measure_toggle is
            port(
                    clk_50mhz : in std_logic;
        --          Q1_O, Q2_O : out std_logic;
--                  reset : in std_logic;
                    pulse_signal : in std_logic;
        --          pulse_counter_O : out std_logic_vector(31 downto 0);
                    pulse_width : out std_logic_vector(31 downto 0);
						  digital_output : out std_logic
                
                    );
                     
        end component pulse_width_measure_toggle;
	  
    --
    -- Define all signals here
    --
    Signal sig_pulse_width_count0  : std_logic_vector(31 downto 0);
    Signal sig_pulse_width_count1  : std_logic_vector(31 downto 0);
    Signal sig_pulse_width_count2  : std_logic_vector(31 downto 0);
    Signal sig_pulse_width_count3  : std_logic_vector(31 downto 0);
    Signal sig_pulse_width_count4  : std_logic_vector(31 downto 0);
    Signal sig_pulse_width_count5  : std_logic_vector(31 downto 0);
    Signal sig_SPI_CLK : std_logic;
    Signal sig_SPI_CLK_n : std_logic;
    Signal sig_Heartbeat : std_logic;
    
    Signal sig_ADC_Channel1 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel2 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel3 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel4 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel5 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel6 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel7 : std_logic_vector(11 downto 0);
    Signal sig_ADC_Channel8 : std_logic_vector(11 downto 0);
    Signal sig_ADC_LED  : std_logic_vector(7 downto 0);
     Signal sig_PWM_Steering_Gen : std_logic_vector(0 downto 0);
     Signal sig_PWM_Steering32 : std_logic_vector(31 downto 0);
     Signal sig_PWM_Throttle_Gen : std_logic_vector(0 downto 0);
     Signal sig_PWM_Throttle32 : std_logic_vector(31 downto 0);
	  Signal sig_HE_counter : std_logic_vector(31 downto 0);
	  
	signal Counter_value : std_logic_vector(15 downto 0);
   signal sdram_ba   : std_logic_vector(1 downto 0);
   signal sdram_dqm  : std_logic_vector(1 downto 0);
begin
				inst_HE_sensor : component HE_counter
					port map (
						CLOCK_IN => CLK_50,
						pulse_signal => HALL_EFFECT,
						reset_n => KEY(0),
						pulse_counts => sig_HE_counter
						);
				inst_mux_LED : component mux_4bit 
					port map (
						a => "1" & "1" & sig_Heartbeat& sig_Heartbeat& sig_Heartbeat &"1" &sig_Heartbeat & "1",--sig_ADC_LED,							--0
						b => Counter_value(7 downto 0),		--1
						c => Counter_value (15 downto 8),	--2
						d => "1" & "1" & sig_Heartbeat& sig_Heartbeat& sig_Heartbeat &"1" &sig_Heartbeat & "1",							--3
						e => sig_PWM_Steering32(7 downto 0),							--4
						f => sig_PWM_Steering32(15 downto 8),							--5
						g => sig_HE_counter(6 downto 0) & HALL_EFFECT,							--6
						Output => LED,
						sel => DIP_SWITCH
						);
				inst_mux_steering : component mux_4bit_1 
					port map (
						a => sig_PWM_Steering_Gen(0 downto 0),							--0
						b => RECEIVER_CHANNEL(3 downto 3),									--1 RUDDER
						c => "0",		--2
						d => "0",							--3
						e => sig_PWM_Steering_Gen(0 downto 0),							--4
						f => sig_PWM_Steering_Gen(0 downto 0),							--5
						g => "0",							--6
						Output(0) => PWM_STEERING,
						sel => DIP_SWITCH
						);
						
				inst_mux_throttle : component mux_4bit_1 
					port map (
						a => sig_PWM_Throttle_Gen(0 downto 0),							--0 ELEVATOR
						b => RECEIVER_CHANNEL(2 downto 2),		--1
						c => "0",		--2
						d => "0",							--3
						e => "0",							--4
						f => "0",							--5
						g => "0",							--6
						Output(0) => PWM_THROTTLE,
						sel => DIP_SWITCH
						);
						
										
    -- PWM_STEERING <= sig_PWM_Steering_Gen(0);
	 -- PWM_THROTTLE <= sig_PWM_Throttle_Gen(0);

	  
            inst_pwmGen_steering : component pwm
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_PWM_Steering32(14 downto 0), --duty cycle
                    pwm_out   => sig_PWM_Steering_Gen
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_Throttle : component pwm
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_PWM_Throttle32(14 downto 0), --duty cycle
                    pwm_out   => sig_PWM_Throttle_Gen
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs

            inst_pwmGen_sensor1 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel1(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(0 downto 0)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor2 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel2(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(1 downto 1)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor3 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel3(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(2 downto 2)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor4 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel4(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(3 downto 3)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor5 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel5(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(4 downto 4)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor6 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel6(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(5 downto 5)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs
            inst_pwmGen_sensor7 : component pwm_1
              PORT map(
                    clk       => CLK_50,                             --system clock
                    reset_n   => KEY(0),                                  --asynchronous reset
                    ena       => '1',                                  --latches in new duty cycle
                    duty      => sig_ADC_Channel7(11 downto 0), --duty cycle
                    pwm_out   => sig_ADC_LED(6 downto 6)
                    --pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0)
                    );         --pwm inverse outputs

    inst_SPIPLL0 : component SPIPLL
            port map (
            inclk0 => CLK_50,
            c0 => sig_SPI_CLK,
            c1 => sig_SPI_CLK_n
            );
            
    inst_ADC_CTRL0 : component ADC_CTRL
            port map (
           iRST => KEY(0),
           iCLK => sig_SPI_CLK,
           iCLK_n => sig_SPI_CLK_n,
           iGO => KEY(1),
--           iCH => DIP_SWITCH(2 downto 0),
           oLED => open,
           
           oADC_value0 => open, --sig_ADC_Channel8 ,
           oADC_value1 => sig_ADC_Channel7 ,
           oADC_value2 => sig_ADC_Channel6 ,
           oADC_value3 => sig_ADC_Channel5 ,
           oADC_value4 => sig_ADC_Channel4 ,
           oADC_value5 => sig_ADC_Channel3 ,
           oADC_value6 => sig_ADC_Channel2 ,
           oADC_value7 => sig_ADC_Channel1 ,
           
           oDIN => ADC_SADDR,
           oCS_n=> ADC_CS_N,
           oSCLK=> ADC_SCLK,  
           iDOUT=> ADC_SDAT 
           );
   
    inst_qsys : component mynios2
        port map (
            clk_clk       => CLK_50,       --   clk.clk
            reset_reset_n => '1', -- reset.reset_n
                pio_led_export => Counter_value,
                multi_reg_dataout_14 => sig_PWM_Steering32,
                multi_reg_dataout_15 => sig_PWM_Throttle32,
                
            multi_reg_datain_0   => sig_pulse_width_count0,   --             .datain_0
            multi_reg_datain_1   => sig_pulse_width_count1,   --             .datain_1
            multi_reg_datain_2   => sig_pulse_width_count2,   --             .datain_2
            multi_reg_datain_3   => sig_pulse_width_count3,   --             .datain_3
            multi_reg_datain_4   => sig_pulse_width_count4,   --             .datain_4
            multi_reg_datain_5   => sig_pulse_width_count5,   --             .datain_5
            
            --ADC channel 1 to 8 values
            multi_reg_datain_6    => "00000000000000000000" & sig_ADC_Channel1,
            multi_reg_datain_7    => "00000000000000000000" & sig_ADC_Channel2,
            multi_reg_datain_8    => "00000000000000000000" & sig_ADC_Channel3,
            multi_reg_datain_9    => "00000000000000000000" & sig_ADC_Channel4,
            multi_reg_datain_10   => "00000000000000000000" & sig_ADC_Channel5,
            multi_reg_datain_11   => "00000000000000000000" & sig_ADC_Channel6,
            multi_reg_datain_12   => "00000000000000000000" & sig_ADC_Channel7,
            --multi_reg_datain_13   => "00000000000000000000" & sig_ADC_Channel8,
            
				--Second set of mm registers
--            multi_reg_1_dataout_0  => CONNECTED_TO_multi_reg_1_dataout_0,  -- multi_reg_1.dataout_0
--            multi_reg_1_dataout_1  => CONNECTED_TO_multi_reg_1_dataout_1,  --            .dataout_1
--            multi_reg_1_dataout_2  => CONNECTED_TO_multi_reg_1_dataout_2,  --            .dataout_2
--            multi_reg_1_dataout_3  => CONNECTED_TO_multi_reg_1_dataout_3,  --            .dataout_3
--            multi_reg_1_dataout_4  => CONNECTED_TO_multi_reg_1_dataout_4,  --            .dataout_4
--            multi_reg_1_dataout_5  => CONNECTED_TO_multi_reg_1_dataout_5,  --            .dataout_5
--            multi_reg_1_dataout_6  => CONNECTED_TO_multi_reg_1_dataout_6,  --            .dataout_6
--            multi_reg_1_dataout_7  => CONNECTED_TO_multi_reg_1_dataout_7,  --            .dataout_7
--            multi_reg_1_dataout_8  => CONNECTED_TO_multi_reg_1_dataout_8,  --            .dataout_8
--            multi_reg_1_dataout_9  => CONNECTED_TO_multi_reg_1_dataout_9,  --            .dataout_9
--            multi_reg_1_dataout_10 => CONNECTED_TO_multi_reg_1_dataout_10, --            .dataout_10
--            multi_reg_1_dataout_11 => CONNECTED_TO_multi_reg_1_dataout_11, --            .dataout_11
--            multi_reg_1_dataout_12 => CONNECTED_TO_multi_reg_1_dataout_12, --            .dataout_12
--            multi_reg_1_dataout_13 => CONNECTED_TO_multi_reg_1_dataout_13, --            .dataout_13
--            multi_reg_1_dataout_14 => CONNECTED_TO_multi_reg_1_dataout_14, --            .dataout_14
--            multi_reg_1_dataout_15 => CONNECTED_TO_multi_reg_1_dataout_15, --            .dataout_15
            multi_reg_1_datain_0   => sig_HE_counter,   --            .datain_0  connect to hall effect sensor
--            multi_reg_1_datain_1   => CONNECTED_TO_multi_reg_1_datain_0,   --            .datain_1
--            multi_reg_1_datain_2   => CONNECTED_TO_multi_reg_1_datain_2,   --            .datain_2
--            multi_reg_1_datain_3   => CONNECTED_TO_multi_reg_1_datain_3,   --            .datain_3
--            multi_reg_1_datain_4   => CONNECTED_TO_multi_reg_1_datain_4,   --            .datain_4
--            multi_reg_1_datain_5   => CONNECTED_TO_multi_reg_1_datain_5,   --            .datain_5
--            multi_reg_1_datain_6   => CONNECTED_TO_multi_reg_1_datain_6,   --            .datain_6
--            multi_reg_1_datain_7   => CONNECTED_TO_multi_reg_1_datain_7,   --            .datain_7
--            multi_reg_1_datain_8   => CONNECTED_TO_multi_reg_1_datain_8,   --            .datain_8
--            multi_reg_1_datain_9   => CONNECTED_TO_multi_reg_1_datain_9,   --            .datain_9
--            multi_reg_1_datain_10  => CONNECTED_TO_multi_reg_1_datain_10,  --            .datain_10
--            multi_reg_1_datain_11  => CONNECTED_TO_multi_reg_1_datain_11,  --            .datain_11
--            multi_reg_1_datain_12  => CONNECTED_TO_multi_reg_1_datain_12,  --            .datain_12
--            multi_reg_1_datain_13  => CONNECTED_TO_multi_reg_1_datain_13,  --            .datain_13
--            multi_reg_1_datain_14  => CONNECTED_TO_multi_reg_1_datain_14,  --            .datain_14
--            multi_reg_1_datain_15  => CONNECTED_TO_multi_reg_1_datain_15,   --            .datain_15
--            
            sdram_clk_clk          => SDRAM_CLK,          --   sdram_clk.clk
                 sdram_addr           => SDRAM_ADDR,
                 sdram_ba             => sdram_ba,
                 sdram_cas_n          => SDRAM_CAS_N,
                 sdram_cke            => SDRAM_CKE,
                 sdram_cs_n           => SDRAM_CS_N,
                 sdram_dq             => SDRAM_DQ,
                 sdram_dqm            => sdram_dqm,
                 sdram_ras_n          => SDRAM_RAS_N,
                 sdram_we_n           => SDRAM_WE_N,
                 
            uart_export_rxd      => RxD,      --  uart_export.rxd
            uart_export_txd      => TxD,      --             .txd
            epcs_dclk     => EPCS_DCLK,     --  epcs.dclk
            epcs_sce      => EPCS_SCE,      --      .sce
            epcs_sdo      => EPCS_SDO,      --      .sdo
            epcs_data0    => EPCS_DATA0     --      .data0
        );
          
    inst_counter : component counter
        port map (
         clk         => CLK_50,
            
         counter_out => sig_Heartbeat
       );
             inst_pwM1 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(0),
            pulse_width => sig_pulse_width_count0
            );

     inst_pwM2 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(1),
            pulse_width => sig_pulse_width_count1
            );

     inst_pwM3 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(2),
            pulse_width => sig_pulse_width_count2
            );

     inst_pwM4 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(3),
            pulse_width => sig_pulse_width_count3
            );

     inst_pwM5 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(4),
            pulse_width => sig_pulse_width_count4
            );
     inst_pwM6 : component pulse_width_measure
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(5),
            pulse_width => sig_pulse_width_count5
            );
 
     inst_pwMt : component pulse_width_measure_toggle
            port map (
            clk_50mhz => CLK_50,
            pulse_signal => RECEIVER_CHANNEL(5),
            --pulse_width => sig_pulse_width_count5,
				digital_output => DIGITAL_OUTPUT1
				
            ); 
   SDRAM_BA_1 <= sdram_ba(1);
   SDRAM_BA_0 <= sdram_ba(0);
   
   SDRAM_DQMU <= sdram_dqm(1);
   SDRAM_DQML <= sdram_dqm(0);

end architecture syn;
-- *** EOF ***
