
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pulse_generator is
port(
	clk_in       : in std_logic;
	reset_in     : in std_logic;
	p_width      : in std_logic_vector (15 downto 0);
	pulse_out    : out std_logic
);
end entity pulse_generator;

architecture Design of pulse_generator is
  signal cnt		   	: integer range 0 to 49;
  signal tick_1us		   : std_logic;
  signal rt_counter		: unsigned (14 downto 0)  := (others => '0') ;
  type state_type is (s0,s1);  --type of state machine.
  signal current_s: state_type;  --current and next state declaration.

begin	
	
--- ------------------------------------------------------------------------------
-- 1us counter
-- ------------------------------------------------------------------------------
   Obtain1us: process (clk_in, reset_in)
   begin
      if (reset_in = '0') then
      	cnt <= 0;
         tick_1us <= '0';
      elsif ((clk_in'event) and (clk_in = '1'))then --posedge of clk
         if (cnt = 49) then --reached 1us
   	    cnt <= 0;
   	    tick_1us <= '1';
	      else 
   	    cnt <= cnt + 1;
          tick_1us <= '0';
         end if;
      end if;
   end process Obtain1us;
	
	-- -------------------------------------------------------------------------
-- RealTime counter
-- -------------------------------------------------------------------------
   RTCountCalc: process (clk_in, reset_in)
   begin
      if ((clk_in'event) and (clk_in = '1')) then  --posedge of clk
         if (tick_1us = '1') then
				rt_counter <= rt_counter + 1;
			end if;
			
			if(rt_counter = 21000) then
				rt_counter <= (others => '0');
			end if;
      end if;
   end process RTCountCalc;
	
----------------------------------------------------------------------------
-- Pulse generator
----------------------------------------------------------------------------

	--state machine process.
	process (clk_in)
	begin
		case current_s is
			when s0 =>
				pulse_out <= '1';
				if(rt_counter = unsigned (p_width)) then
					current_s <= s1;
				end if;   

			when s1 => 
				pulse_out <= '0';
				if(rt_counter = 21000) then
						current_s <= s0;
				end if;
			when others =>
				current_s  <= s1;
		end case;
	end process;

end Design;