----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 09:42:33 PM
-- Design Name: 
-- Module Name: checker - Behavioral
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

entity checker is
    Port (  clk        : in std_logic;
            butt_i     : in STD_LOGIC_VECTOR (3 downto 0);
            reset_i    : in std_logic;
            write_i    : in std_logic;
            ledg_o     : out std_logic;
            ledr_o     : out std_logic;
            relayint_o : out std_logic;
            relayext_o : out std_logic;
            check0_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check1_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check2_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check3_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check0_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check1_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check2_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check3_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111"
    
             );
end checker;

architecture Behavioral of checker is

    signal s_timestart  : std_logic;
    signal s_seconds    : std_logic_vector(2 downto 0);

begin

    timer0 : entity work.timer
    
        generic map(
            g_MAXCHECK => 50
        )
        port map(
            clk => clk,
            reset_i => reset_i,
            timestart_i => s_timestart,
            seconds_o => s_seconds 
        );
        
    pass_check0 :  entity work.pass_check
          port map(
                butt_i       =>  butt_i,
                reset_i      =>  reset_i,
                write_i      =>  write_i,
                seconds_i    =>  s_seconds,
                ledg_o       =>  ledg_o,
                ledr_o       =>  ledr_o,
                relayint_o   =>  relayint_o,
                relayext_o   =>  relayext_o,
                timestart_o  =>  s_timestart,
                check0_i     =>  check0_i,
                check1_i     =>  check1_i,
                check2_i     =>  check2_i,
                check3_i     =>  check3_i,
                check0_o     =>  check0_o,
                check1_o     =>  check1_o,
                check2_o     =>  check2_o,
                check3_o     =>  check3_o
                                
                );  

end Behavioral;