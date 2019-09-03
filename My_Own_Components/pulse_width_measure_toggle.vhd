----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael House
-- 
-- Create Date:    14:04:39 12/22/2013 
-- Design Name: 
-- Module Name:    pulse_width_measure_toggle - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: D-Flip-flop modules
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: this takes 2 extra cycles for count to be measured.
--	meaning on the third cycle pulse width can be read
--
-- Revision 0.02 - copied from pulse_width_measure.vhd
-- Adding feature so pulse widths measured less than 75000 results in digital
-- output toggled high. Note: on a hobby grade transmitter (the spektrume DX6)
-- channel 6 is a toggle switch, when toggled the pulse width measured is either
-- greater or less than 75000. 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity pulse_width_measure_toggle is
	port(
			clk_50mhz : in std_logic;
--			Q1_O, Q2_O : out std_logic;
--			reset : in std_logic;
			pulse_signal : in std_logic;
--			pulse_counter_O : out std_logic_vector(31 downto 0);
			pulse_width : out std_logic_vector(31 downto 0);
			digital_output: out std_logic
			);
			 
end pulse_width_measure_toggle;

architecture Behavioral of pulse_width_measure_toggle is

type state is 
(
	s_Reset, s_Start, s_Count, s_Stop
);

signal measurement_state : state;
signal pulse_counter : std_logic_vector(31 downto 0);
signal Q1 : std_logic;
signal Q2 : std_logic;

	component DFF
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component;
	
begin
	inst_dff1 : DFF port map(D => pulse_signal, CLK => clk_50mhz, Q => Q1);
	inst_dff2 : DFF port map(D => Q1, CLK => clk_50mhz, Q => Q2);
process (clk_50mhz)
	begin
--	if reset = '1' then
--		pulse_counter <= x"00000000";
--		pulse_width <= x"00000000";
--		measurement_state <= s_Reset;
	if clk_50mhz'event and clk_50mhz = '1'then
		case measurement_state is
			when s_Reset =>
				if Q1 = '1' and Q2 = '0' then
					measurement_state <= s_Start;
				end if;
			when s_Start =>
				if Q1 = '1' and Q2 = '1' then
					measurement_state <= s_Count;
				end if;
				pulse_counter <= x"00000000";
			when s_Count =>
				if Q1 = '0' and Q2 = '1' then
					measurement_state <= s_Stop;
				end if;
				pulse_counter <= pulse_counter +1;
			when s_Stop =>
				if Q1 = '0' and Q2 = '0' then
					measurement_state <= s_Reset;
				end if;
				pulse_width <= pulse_counter +1;
				if pulse_counter <= 75000 then 
					digital_output <= '0';
				end if;
			when others => 
				digital_output <= '0';
				measurement_state <= s_Reset;
				pulse_counter <= x"00000000";
				pulse_width <= x"00000000";
		end case;
	end if;
--	Q1_O <= Q1;
--	Q2_O <= Q2;
--	pulse_counter_O <= pulse_counter;
end process;

end Behavioral;

