----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2021 11:05:24 AM
-- Design Name: 
-- Module Name: tb_reset_driver - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_reset_driver is
--  Port ( );
end tb_reset_driver;

architecture Behavioral of tb_reset_driver is

    signal s_m_reset : std_logic := '0';
    signal s_a_reset : std_logic := '0';
    
    signal s_reset_o : std_logic := '0';
    
begin
    uut_reset_driver : entity work.reset_driver
        port map(
            m_reset => s_m_reset,
            a_reset => s_a_reset,
            
            reset_o => s_reset_o
        );

    p_stimulus : process  
    begin                 
                          
        wait for 50 ns;   
        s_m_reset <= '1';
        wait for 50 ns;   
        s_m_reset <= '0';
        wait for 50 ns;   
        s_a_reset <= '1';
        wait for 50 ns;   
        s_a_reset <= '0';
        wait for 50 ns;   
        s_m_reset <= '1';
        s_a_reset <= '1';
        wait for 50 ns;   
        s_m_reset <= '0';
        s_a_reset <= '0';
        wait;
          
    end process p_stimulus;

end Behavioral;
