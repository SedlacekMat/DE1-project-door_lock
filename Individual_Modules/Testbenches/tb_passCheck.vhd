----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2021 11:59:38 PM
-- Design Name: 
-- Module Name: tb_passCheck - testbench
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

entity tb_passCheck is
--  Port ( );
end tb_passCheck;

architecture testbench of tb_passCheck is
                              
        signal s_butt      : STD_LOGIC_VECTOR (3 downto 0);           
        signal s_reset     : std_logic;                               
        signal s_write     : std_logic;
        signal s_seconds   : STD_LOGIC_VECTOR (2 downto 0);                               
        signal s_ledg      : std_logic;                              
        signal s_ledr      : std_logic;                              
        signal s_relayext  : std_logic;
        signal s_relay     : std_logic;
        signal s_timestart : std_logic;                              
        signal s_check0i   : STD_LOGIC_VECTOR (3 downto 0);           
        signal s_check1i   : STD_LOGIC_VECTOR (3 downto 0);           
        signal s_check2i   : STD_LOGIC_VECTOR (3 downto 0);           
        signal s_check3i   : STD_LOGIC_VECTOR (3 downto 0);           
        signal s_check0o   : STD_LOGIC_VECTOR (3 downto 0);
        signal s_check1o   : STD_LOGIC_VECTOR (3 downto 0);
        signal s_check2o   : STD_LOGIC_VECTOR (3 downto 0);
        signal s_check3o   : STD_LOGIC_VECTOR (3 downto 0); 
               
begin          
    uut_passCheck: entity work.pass_check
        port map(
                   butt_i     =>   s_butt,   
                   reset_i    =>   s_reset,  
                   write_i    =>   s_write, 
                   seconds_i  =>   s_seconds,
                   ledg_o     =>   s_ledg,   
                   ledr_o     =>   s_ledr,   
                   relayext_o =>   s_relayext,
                   relayint_o =>   s_relay,
                   timestart_o=>   s_timestart, 
                   check0_i   =>   s_check0i,
                   check1_i   =>   s_check1i,
                   check2_i   =>   s_check2i,
                   check3_i   =>   s_check3i,
                   check0_o   =>   s_check0o,
                   check1_o   =>   s_check1o,
                   check2_o   =>   s_check2o,
                   check3_o   =>   s_check3o
                   
                   );
        p_passCheckTest : process
        begin
        s_reset <= '0';
        s_check0i <= "0011";
        s_check1i <= "0001";
        s_check2i <= "0100";
        s_check3i <= "0010";
        wait for 0.1sec;
        
        s_write <= '1';
        s_butt <= "0011";
        wait for 0.2 sec;
        s_write <= '0';
        wait for 0.1 sec;
        
        s_write <= '1';  
        s_butt <= "0001";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        
        s_write <= '1';  
        s_butt <= "0100";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        s_write <= '1';   
        s_butt <= "0010";
        wait for 0.2 sec; 
        s_write <= '0';
        
        wait for 0.5 sec;
        s_check0i <= "0001";
        wait for 0.5 sec;
        s_check1i <= "0010";
        wait for 0.5 sec;
        s_check2i <= "0011";
        wait for 0.5 sec;
        s_check3i <= "0100";
        wait for 0.3 sec;
        s_seconds <= "101"; 
        wait for 0.2 sec;
        s_seconds <= "000";
        
        wait for 0.5 sec;
        
        s_write <= '1';
        s_butt <= "0001";
        wait for 0.2 sec;
        s_write <= '0';
        wait for 0.1 sec;
        
        s_write <= '1';  
        s_butt <= "0101";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        
        s_write <= '1';  
        s_butt <= "0011";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        s_write <= '1';   
        s_butt <= "0100";
        wait for 0.2 sec; 
        s_write <= '0';
        
        wait for 0.8 sec;
        s_seconds <= "001"; 
        wait for 0.2 sec;
        s_seconds <= "000";
        
        wait for 1 sec;    
        
        s_write <= '1';   
        s_butt <= "0100";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        s_write <= '1';   
        s_butt <= "0110";
        wait for 0.2 sec; 
        s_write <= '0';
        wait for 0.1 sec;
        
        s_reset <= '1';
        wait for 0.2 sec;
        s_reset <= '0';
        
        s_butt <= "1110";
        wait for 0.2 sec;
        
        s_butt <= "0011";
        wait for 0.2 sec;
        

        
        wait;

        end process p_passCheckTest;
        
--    p_clk_gen : process
--    begin
--        while now < 10 sec loop  
--            s_clk <= '0';
--            wait for c_CLKPER / 2;
--            s_clk <= '1';
--            wait for c_CLKPER / 2;
--        end loop;
--        wait;
--    end process p_clk_gen;
end testbench;
