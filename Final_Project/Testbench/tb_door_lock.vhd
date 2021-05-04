----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2021 11:56:00 AM
-- Design Name: 
-- Module Name: tb_door_lock - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_door_lock is
--  Port ( );
end tb_door_lock;

architecture Behavioral of tb_door_lock is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    
    signal s_clk_100MHz : std_logic;
    signal s_m_reset    : std_logic := '0';
    signal s_set        : std_logic := '0';
    
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
    
    signal s_ledg       : std_logic;
    signal s_ledr       : std_logic;
    signal s_relay_o    : std_logic;
    
    signal s_seg       : std_logic_vector(7 - 1 downto 0);
    signal s_dig       : std_logic_vector(4 - 1 downto 0);

begin
    uut_door_lock : entity work.door_lock
        port map(
            button_0  =>  s_button_0,
            button_1  =>  s_button_1,
            button_2  =>  s_button_2,
            button_3  =>  s_button_3,
            button_4  =>  s_button_4,
            button_5  =>  s_button_5,
            button_6  =>  s_button_6,
            button_7  =>  s_button_7,
            button_8  =>  s_button_8,
            button_9  =>  s_button_9,

            m_reset   =>  s_m_reset,
            set       =>  s_set,
            clk       =>  s_clk_100MHz,

            ledg_o    =>  s_ledg,
            ledr_o    =>  s_ledr,
            relayext_o =>  s_relay_o,
            seg_o     =>  s_seg,
            dig_o     =>  s_dig
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
        s_m_reset <= '0'; wait for 4100 ns;
        -- Reset activated
        s_m_reset <= '1'; wait for 200 ns;
        -- Reset deactivated
        s_m_reset <= '0';
        wait;
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process  
    begin                 
                          
        wait for 50 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 600 ns;  
        s_set   <= '1';   
        wait for 50 ns;   
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 50 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 100 ns;  
        s_set      <= '0';
        wait for 2000 ns; 
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 50 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 200 ns;  
                          
        s_set <= '1';     
        wait for 500 ns;  
        s_set <= '0';     
        wait for 600 ns;  
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        
        wait for 1000 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 600 ns;  
        s_set   <= '1';   
        wait for 50 ns;   
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 50 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 100 ns;  
        s_set      <= '0';
        wait for 2000 ns; 
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait for 50 ns;   
        s_button_3 <= '1';
        wait for 50 ns;   
        s_button_3 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 200 ns;  
                          
        s_set <= '1';     
        wait for 500 ns;  
        s_set <= '0';     
        wait for 600 ns;  
                          
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_1 <= '1';
        wait for 50 ns;   
        s_button_1 <= '0';
        wait for 50 ns;   
        s_button_4 <= '1';
        wait for 50 ns;   
        s_button_4 <= '0';
        wait for 50 ns;   
        s_button_2 <= '1';
        wait for 50 ns;   
        s_button_2 <= '0';
        wait;
          
    end process p_stimulus;

end Behavioral;
