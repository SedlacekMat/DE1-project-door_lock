----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2021 11:07:05 PM
-- Design Name: 
-- Module Name: tb_Reg44 - testbench
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

entity tb_Reg44 is
--  Port ( );
end tb_Reg44;

architecture testbench of tb_Reg44 is
        
        signal s_set   : STD_LOGIC;   
        signal s_pass  : STD_LOGIC;    
        signal s_reset : STD_LOGIC;
        signal s_reg0i : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg1i : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg2i : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg3i : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg0o : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg1o : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg2o : STD_LOGIC_VECTOR (3 downto 0);
        signal s_reg3o : STD_LOGIC_VECTOR (3 downto 0);
                       
begin
    
    uut_Reg44: entity work.reg_4_4
        port map(       
                    set_i   => s_set,   
                    pass_i  => s_pass,  
                    reset_i => s_reset,
                    reg0_i  => s_reg0i,
                    reg1_i  => s_reg1i,
                    reg2_i  => s_reg2i, 
                    reg3_i  => s_reg3i, 
                    reg0_o  => s_reg0o,
                    reg1_o  => s_reg1o,
                    reg2_o  => s_reg2o,
                    reg3_o  => s_reg3o
                           
                    );

        p_regIn: process
        begin
        s_reg0i  <= "1110";
        s_reg1i  <= "0111";
        s_reg2i  <= "1010";
        s_reg3i  <= "0101";
        wait for 400 ns;
        s_reg0i  <= "0100";
        wait for 50 ns;
        s_reg1i  <= "0010";
        wait for 50 ns;
        s_reg2i  <= "0000";
        wait for 50 ns;
        s_reg3i  <= "0101";
        wait for 50 ns;         
        end process p_regIn;
        
        p_control: process    
        begin               
        s_pass   <= '0'; 
        s_set    <= '0'; 
        s_reset  <= '0'; 
        wait for 200 ns;    
        
        s_pass   <= '1';
        s_set    <= '0';
        s_reset  <= '0';
        wait for 200 ns;
        
        s_pass   <= '1';
        s_set    <= '1';
        s_reset  <= '0';
        wait for 200 ns;
        
        s_pass   <= '0';
        s_set    <= '1';
        s_reset  <= '0';
        wait for 200 ns;
        
        s_pass   <= '1';
        s_set    <= '1';
        s_reset  <= '1';
        wait for 200 ns;
        
        end process p_control;



end testbench;
