----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 05:31:22 PM
-- Design Name: 
-- Module Name: timer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    
    generic(
        g_MAXCHECK : natural := 50       -- Number of clk pulses to generate
                                    -- one enable signal period
    );   
    
    Port (  clk        : in std_logic;
            reset_i    : in std_logic;
            timestart_i: in std_logic;
            seconds_o  : inout std_logic_vector(2 downto 0):= "000"
            
    
        );
end timer;

architecture Behavioral of timer is
        signal s_cnt_local : natural:= 0;
        signal s_seconds_local : natural:= 1;
begin

p_timer: process(clk)
      begin 
        if timestart_i = '1' then
          if rising_edge(clk) then
              if  (reset_i = '1') then
                    s_cnt_local <= 0;
                    seconds_o <= "000";
              elsif (s_cnt_local >= (g_MAXCHECK - 1)) then
                  s_cnt_local <= 0;                
                  s_seconds_local <= (s_seconds_local + 1);
                  seconds_o <= std_logic_vector(TO_UNSIGNED(s_seconds_local,3)); 
              else
                  s_cnt_local <= (s_cnt_local + 1);
              end if;
          end if;
          elsif timestart_i = '0' then
          seconds_o <= "000"; 
          s_seconds_local <= 1;
          s_cnt_local <= 0;
        end if;
                           
      end process p_timer;  

end Behavioral;