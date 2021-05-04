----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 09:03:05 PM
-- Design Name: 
-- Module Name: tb_timer - Behavioral
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

entity tb_timer is
--  Port ( );
end tb_timer;

architecture testbench of tb_timer is
    
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
    signal s_clk        : std_logic;                     
    signal s_reset      : std_logic;                     
    signal s_timestart  : std_logic;                     
    signal s_seconds    : std_logic_vector(2 downto 0);
       
begin
    uut_timer: entity work.timer
        port map(     clk       =>      s_clk,        
                      reset_i     =>    s_reset,    
                      timestart_i =>    s_timestart,
                      seconds_o   =>    s_seconds  
                 );
                 
    p_clk_gen : process
    begin
        while now < 10000 ns loop
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
        
        
        
        p_timertest: process
        begin
        s_reset <= '0';
        s_timestart <= '0';
        wait for 100ns;
        s_timestart <= '1';
        wait for 650 ns;
        s_timestart <= '0';
        wait;
        end process p_timertest;
        
end architecture testbench;
