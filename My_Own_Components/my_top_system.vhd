------------------------------------------------------------------------------
-- Entity: my_top_system
-- Date:2014-01-05  ${time}
-- Author: Mike     
--
-- Description: 
--------------------------------------------------------------------------------
--*****************************************************************************
--*  DEFINE: Library                                                          *
--*****************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--*****************************************************************************
--*  DEFINE: Entity                                                           *
--*****************************************************************************
entity my_top_system is
  port ( 
        --
        -- Input clock 
        --
        CLK_50          : in  std_logic;
        
        TOP_RESET       : in std_logic;
        
        --
        -- EPCS
        --
        EPCS_DCLK       : out   std_logic;
        EPCS_SCE        : out   std_logic;
        EPCS_SDO        : out   std_logic;
        EPCS_DATA0      : in    std_logic;
        
        --
        -- ADC
        --
        ADC_CS_N        : out std_logic;
        ADC_SADDR       : out std_logic;
        ADC_SDAT        : in std_logic;
        ADC_SCLK        : out std_logic;
        
        -- SDRAM
        --
        SDRAM_CLOCK      : out  std_logic;
        SDRAM_WIRE_ADDR  : out   std_logic_vector(12 downto 0);                    -- addr
        SDRAM_WIRE_BA    : out   std_logic_vector(1 downto 0);                     -- ba
        SDRAM_WIRE_CAS_N : out   std_logic;                                        -- cas_n
        SDRAM_WIRE_CKE   : out   std_logic;                                        -- cke
        SDRAM_WIRE_CS_N  : out   std_logic;                                        -- cs_n
        SDRAM_WIRE_DQ    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
        SDRAM_WIRE_DQM   : out   std_logic_vector(1 downto 0);                     -- dqm
        SDRAM_WIRE_RAS_N : out   std_logic;                                        -- ras_n
        SDRAM_WIRE_WE_N  : out   std_logic;                                        -- we_n

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
        DIP_SWITCH : in std_logic_vector (2 downto 0); 
        
          -- PWM
          PWM_STEERING : out std_logic;
        --LEDS
        --LED_COUNT : out std_logic_vector (6 downto 0);
        --LED_HEARTBEAT : out std_logic
        LED             : out std_logic_vector (7 downto 0)
              
       );
end entity my_top_system;
--*****************************************************************************
--*  DEFINE: Architecture                                                     *
--*****************************************************************************
architecture syn of my_top_system is


   --
   -- Define all components which are included here
   --
    component mynios2 is
        port (
            epcs_dclk          : out   std_logic;                                        -- dclk
            epcs_sce           : out   std_logic;                                        -- sce
            epcs_sdo           : out   std_logic;                                        -- sdo
            epcs_data0         : in    std_logic                     := 'X';             -- data0
            sdram_0_wire_addr  : out   std_logic_vector(12 downto 0);                    -- addr
            sdram_0_wire_ba    : out   std_logic_vector(1 downto 0);                     -- ba
            sdram_0_wire_cas_n : out   std_logic;                                        -- cas_n
            sdram_0_wire_cke   : out   std_logic;                                        -- cke
            sdram_0_wire_cs_n  : out   std_logic;                                        -- cs_n
            sdram_0_wire_dq    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            sdram_0_wire_dqm   : out   std_logic_vector(1 downto 0);                     -- dqm
            sdram_0_wire_ras_n : out   std_logic;                                        -- ras_n
            sdram_0_wire_we_n  : out   std_logic;                                        -- we_n
            clk_clk            : in    std_logic                     := 'X';             -- clk
            clk_reset_reset_n  : in    std_logic                     := 'X';             -- reset_n
--            pio_led_export       : inout std_logic_vector(7 downto 0)  := (others => 'X');  -- export
--            multi_reg_dataout_0  : out   std_logic_vector(31 downto 0);                    -- dataout_0
--            multi_reg_dataout_1  : out   std_logic_vector(31 downto 0);                    -- dataout_1
--            multi_reg_dataout_2  : out   std_logic_vector(31 downto 0);                    -- dataout_2
--            multi_reg_dataout_3  : out   std_logic_vector(31 downto 0);                    -- dataout_3
--            multi_reg_dataout_4  : out   std_logic_vector(31 downto 0);                    -- dataout_4
--            multi_reg_dataout_5  : out   std_logic_vector(31 downto 0);                    -- dataout_5
            multi_reg_dataout_14  : out   std_logic_vector(31 downto 0);                    -- dataout_14

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
            multi_reg_datain_13     : in std_logic_vector(31 downto 0) := (others => 'X'); --ADC channel 8
            
            
            uart_export_rxd      : in    std_logic                     := 'X';             -- rxd
            uart_export_txd      : out   std_logic;                                        -- txd
            sdram_clk_clk      : out   std_logic                                         -- clk
        );
    end component mynios2;
        
        
            component pulse_generator is 
                port(
                    clk_in       : in std_logic;
                    reset_in     : in std_logic;
                    p_width      : in std_logic_vector (15 downto 0);
                    pulse_out    : out std_logic
                );
                end component pulse_generator;
                
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
           iCH : in std_logic_vector(2 downto 0);
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
     
     Signal sig_PWM_Steering32 : std_logic_vector(31 downto 0);
    --Signal sig_PWM_Steering16 : std_logic_vector(15 downto 0);
    Signal sig_PWM_Steering_Gen : std_logic;
     signal sig_ADC_LED     : std_logic_vector(7 downto 0);
     
begin
    --sig_PWM_Steering16 <= std_logic_vector(resize(unsigned(sig_PWM_Steering32),sig_PWM_Steering16'length )); --Convert 32 bit signal to 16 bits
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
           iCH => DIP_SWITCH,
           oLED => sig_ADC_LED,
           
           oADC_value0 => sig_ADC_Channel1 ,
           oADC_value1 => sig_ADC_Channel2 ,
           oADC_value2 => sig_ADC_Channel3 ,
           oADC_value3 => sig_ADC_Channel4 ,
           oADC_value4 => sig_ADC_Channel5 ,
           oADC_value5 => sig_ADC_Channel6 ,
           oADC_value6 => sig_ADC_Channel7 ,
           oADC_value7 => sig_ADC_Channel8 ,
           
           oDIN => ADC_SADDR,
           oCS_n=> ADC_CS_N,
           oSCLK=> ADC_SCLK,  
           iDOUT=> ADC_SDAT 
           );
    
      inst_pwmGen : component pulse_generator
                    port map(
                    clk_in     => CLK_50,
                    reset_in   => KEY(0),
                    p_width    => sig_PWM_Steering32(15 downto 0),
                    pulse_out  => sig_PWM_Steering_Gen
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
            
    inst_qsys : component mynios2
        port map (

            epcs_dclk     => EPCS_DCLK,      --  epcs.dclk
            epcs_sce      => EPCS_SCE,       --      .sce
            epcs_sdo      => EPCS_SDO,       --      .sdo
            epcs_data0    => EPCS_DATA0,     --      .data0
            sdram_0_wire_addr  => SDRAM_WIRE_ADDR , -- sdram_0_wire.addr
            sdram_0_wire_ba    => SDRAM_WIRE_BA   , --             .ba
            sdram_0_wire_cas_n => SDRAM_WIRE_CAS_N, --             .cas_n
            sdram_0_wire_cke   => SDRAM_WIRE_CKE  , --             .cke
            sdram_0_wire_cs_n  => SDRAM_WIRE_CS_N , --             .cs_n
            sdram_0_wire_dq    => SDRAM_WIRE_DQ   , --             .dq
            sdram_0_wire_dqm   => SDRAM_WIRE_DQM  , --             .dqm
            sdram_0_wire_ras_n => SDRAM_WIRE_RAS_N, --             .ras_n
            sdram_0_wire_we_n  => SDRAM_WIRE_WE_N , --             .we_n    
            clk_clk            => CLK_50,            --          clk.clk
            clk_reset_reset_n  => TOP_RESET,   --    clk_reset.reset_n
                
                multi_reg_dataout_14 => sig_PWM_Steering32,
                
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
            multi_reg_datain_13   => "00000000000000000000" & sig_ADC_Channel8,
            
            
                uart_export_rxd      => RxD,      --  uart_export.rxd
            uart_export_txd      => TxD,      --             .txd
            sdram_clk_clk      => SDRAM_CLOCK       --    sdram_clk.clk
        );
          
    inst_counter : component counter
        port map (
         clk         => CLK_50,
         counter_out => sig_Heartbeat
       );
        PWM_STEERING <= sig_PWM_Steering_Gen;
        LED(7) <= sig_PWM_Steering_Gen;      
        LED(6) <= sig_PWM_Steering32(6);
        LED(5) <= sig_PWM_Steering32(5);
        LED(4) <= sig_PWM_Steering32(4);
        LED(3) <= sig_PWM_Steering32(3);
        LED(2) <= sig_PWM_Steering32(2);
        LED(1) <= sig_PWM_Steering32(1);
        LED(0) <= sig_PWM_Steering32(0);
end architecture syn;
-- *** EOF ***
