----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2021 08:35:46 PM
-- Design Name: 
-- Module Name: reset_driver - Behavioral
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
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reset_driver is
    Port(
        m_reset : in STD_LOGIC; -- Manual reset
        a_reset : in STD_LOGIC; -- Automatic reset
        
        reset_o : out STD_LOGIC := '0'
    );
end reset_driver;

architecture Behavioral of reset_driver is

begin
    p_reset_driver : process(m_reset, a_reset)
    begin
        
        if (a_reset = '1' or m_reset = '1') then
            reset_o <= '1';
        else
            reset_o <= '0';
        end if;
        
    end process p_reset_driver;

end Behavioral;
