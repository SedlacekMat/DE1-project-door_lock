----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2021 01:03:17 AM
-- Design Name: 
-- Module Name: tb_keypad_driver - Behavioral
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

entity tb_keypad_driver is
--  Port ( );
end tb_keypad_driver;

architecture Behavioral of tb_keypad_driver is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    
    signal s_button_set : std_logic := '0'; 
    signal s_button_0   : std_logic := '0';
    signal s_button_1   : std_logic := '0';
    signal s_button_2   : std_logic := '0';
    signal s_button_3   : std_logic := '0';
    signal s_button_4   : std_logic := '0';
    signal s_button_5   : std_logic := '0';
    signal s_button_6   : std_logic := '0';
    signal s_button_7   : std_logic := '0';
    signal s_button_8   : std_logic := '0';
    signal s_button_9   : std_logic := '0';
    
    signal s_a_reset    : std_logic := '0';
    signal s_num        : std_logic_vector(4 - 1 downto 0) := "1111";
    signal s_pos        : std_logic_vector(2 - 1 downto 0) := "00";
    signal s_act        : std_logic := '1';
    
begin
    uut_keypad_driver : entity work.keypad_driver
        port map(
            clk        => s_clk_100MHz,
            reset      => s_reset,
            
            button_set => s_button_set,
            button_0   => s_button_0,
            button_1   => s_button_1,
            button_2   => s_button_2,
            button_3   => s_button_3,
            button_4   => s_button_4,
            button_5   => s_button_5,
            button_6   => s_button_6,
            button_7   => s_button_7,
            button_8   => s_button_8,
            button_9   => s_button_9,
            
            num_o       => s_num,
            pos_o       => s_pos,
            act_o       => s_act,
            a_reset_o   => s_a_reset
        );
        
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 1750 ns;
        -- Reset activated
        s_reset <= '1'; wait for 20 ns;
        -- Reset deactivated
        s_reset <= '0'; wait for 680 ns;
        -- Reset activated
        s_reset <= '1'; wait for 20 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        wait for 20 ns;
        s_button_1 <= '1';
        wait for 40 ns;
        s_button_1 <= '0';
        wait for 10 ns;
        s_button_2 <= '1';
        wait for 40 ns;
        s_button_2 <= '0';
        wait for 20 ns;
        s_button_2 <= '1';
        s_button_9 <= '1';
        wait for 20 ns;
        s_button_2 <= '0';
        s_button_9 <= '0';
        wait for 2000 ns;
        s_button_5 <= '1';
        s_button_7 <= '1';
        wait for 40 ns;
        s_button_5 <= '0';
        s_button_7 <= '0';
        wait for 40 ns;
        s_button_1 <= '1';
        wait for 40 ns;
        s_button_1 <= '0';
        wait for 40 ns;
        s_button_4 <= '1';
        wait for 40 ns;
        s_button_4 <= '0';
        wait for 60 ns;
        s_button_7 <= '1';
        wait for 40 ns;
        s_button_7 <= '0';
        wait;
    end process p_stimulus;
    
end Behavioral;
