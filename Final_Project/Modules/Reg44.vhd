----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2021 09:40:43 PM
-- Design Name: 
-- Module Name: Reg44 - Behavioral
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

entity reg_4_4 is
    Port ( 
            set_i    : in std_logic;
            pass_i   : in std_logic;
            reset_i  : in std_logic;
            reg0_i   : in STD_LOGIC_VECTOR (3 downto 0);
            reg1_i   : in STD_LOGIC_VECTOR (3 downto 0);
            reg2_i   : in STD_LOGIC_VECTOR (3 downto 0);
            reg3_i   : in STD_LOGIC_VECTOR (3 downto 0);
            reg0_o   : out STD_LOGIC_VECTOR (3 downto 0) := "0011";
            reg1_o   : out STD_LOGIC_VECTOR (3 downto 0) := "0001";
            reg2_o   : out STD_LOGIC_VECTOR (3 downto 0) := "0100";
            reg3_o   : out STD_LOGIC_VECTOR (3 downto 0) := "0010"
           );
end reg_4_4;

architecture Behavioral of reg_4_4 is

    signal s_local_check : std_logic;

begin

    p_register : process(pass_i, set_i, reset_i, reg0_i, reg1_i, reg2_i, reg3_i)
    begin
    
    if (pass_i='1' and set_i='1' and reset_i='1') then
            reg0_o <= "0011";
            reg1_o <= "0001";
            reg2_o <= "0100";
            reg3_o <= "0010";
            s_local_check <= '1';
    elsif (pass_i='1' and set_i='1' and reset_i='0' and s_local_check <= '0') then
            reg0_o <= reg0_i;
            reg1_o <= reg1_i;
            reg2_o <= reg2_i;
            reg3_o <= reg3_i;
    elsif (set_i = '0') then -- pass_i='1' and
        s_local_check <= '0';
    end if;
    
    end process p_register;
end Behavioral;
