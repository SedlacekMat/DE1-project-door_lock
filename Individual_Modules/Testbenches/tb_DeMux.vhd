----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2021 10:11:43 PM
-- Design Name: 
-- Module Name: tb_DeMux - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_DeMux is
--  Port ( );
end tb_DeMux;

architecture testbench of tb_DeMux is
    signal s_butt   : STD_LOGIC_VECTOR (3 downto 0);   
    signal s_pos    : STD_LOGIC_VECTOR (1 downto 0);    
    signal s_demux0 : STD_LOGIC_VECTOR (3 downto 0);
    signal s_demux1 : STD_LOGIC_VECTOR (3 downto 0);
    signal s_demux2 : STD_LOGIC_VECTOR (3 downto 0);
    signal s_demux3 : STD_LOGIC_VECTOR (3 downto 0); 
begin
    uut_DeMux: entity work.demux
        port map(
            butt_i   => s_butt,  
            pos_i    => s_pos,   
            demux0_o => s_demux0,
            demux1_o => s_demux1,
            demux2_o => s_demux2,
            demux3_o => s_demux3
            );  
    
    p_muxtest : process
     begin
       wait for 100 ns;
       s_pos  <= "00";
       s_butt <= "0111";
       wait for 100 ns;
       s_pos  <= "01";
       s_butt <= "0001"; 
       wait for 100 ns;
       s_pos  <= "10";
       s_butt <= "0101"; 
       wait for 100 ns;
       s_pos  <= "11";
       s_butt <= "0000";
       wait for 100 ns;
       s_pos  <= "00";
      
       wait for 100 ns;
       s_pos  <= "01";
      
       wait for 100 ns;
       s_pos  <= "10";
        
        
    end process p_muxtest;
end testbench;
