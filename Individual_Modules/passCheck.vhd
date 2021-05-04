----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2021 10:54:40 PM
-- Design Name: 
-- Module Name: passCheck - Behavioral
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

entity pass_check is
    
    Port (  butt_i     : in STD_LOGIC_VECTOR (3 downto 0);
            reset_i    : in std_logic;
            write_i    : in std_logic;
            seconds_i  : in std_logic_vector;
            ledg_o     : out std_logic;
            ledr_o     : out std_logic;
            relayint_o : out std_logic;
            relayext_o : out std_logic;
            timestart_o: out std_logic;
            check0_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check1_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check2_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check3_i   : in STD_LOGIC_VECTOR (3 downto 0);
            check0_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check1_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check2_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111";
            check3_o   : out STD_LOGIC_VECTOR (3 downto 0) := "1111"
             );
end pass_check;

architecture Behavioral of pass_check is
    type t_state is (NEUTRAL,
                     PASS0,
                     PASS1,
                     PASS2,
                     PASS_FINAL,
                     FAIL0,
                     FAIL1,
                     FAIL2,
                     FAIL_FINAL);
    
    signal s_state  : t_state;


begin
    
    p_passcheck: process(reset_i, write_i, butt_i,seconds_i, check0_i, check1_i, check2_i, check3_i)
    begin
        if (reset_i ='1') then
            s_state <= NEUTRAL;
        elsif (reset_i ='0') then
            case s_state is 
                
                when NEUTRAL =>
                
                    timestart_o <= '0';
                    ledg_o <= '0';
                    ledr_o <= '0';
                    relayint_o <= '0';
                    relayext_o <= '0';
                
                    check0_o <= "1111";
                    check1_o <= "1111";
                    check2_o <= "1111";
                    check3_o <= "1111";
                    if ((check0_i = butt_i) and write_i = '1') then
                        check0_o <= butt_i;
                        s_state <= PASS0;
                    elsif ((check0_i /= butt_i) and write_i = '1') then
                        check0_o <= butt_i;
                        s_state <= FAIL0;
                    else
                        null;
                    end if;
                    
                when PASS0 =>
                    if ((check1_i = butt_i) and write_i = '1') then
                        check1_o <= butt_i;
                        s_state <= PASS1;
                    elsif ((check1_i /= butt_i) and write_i = '1') then
                        check1_o <= butt_i;
                        s_state <= FAIL1;
                    else
                        null;
                    end if;
                
                when PASS1 =>
                    if ((check2_i = butt_i) and write_i = '1') then
                        check2_o <= butt_i;
                        s_state <= PASS2;
                    elsif ((check2_i /= butt_i) and write_i = '1') then
                        check2_o <= butt_i;
                        s_state <= FAIL2;
                    else
                        null;
                    end if;
                
                when PASS2 =>
                    if ((check3_i = butt_i) and write_i = '1') then
                        check3_o <= butt_i;
                        s_state <= PASS_FINAL;
                    elsif ((check3_i /= butt_i) and write_i = '1') then
                        check3_o <= butt_i;
                        s_state <= FAIL_FINAL;
                    else
                        null;
                    end if;
                    
                when PASS_FINAL =>
                    timestart_o <= '1';
                    if (seconds_i < "101") then
                        ledg_o <= '1';
                        relayint_o <= '1';
                        relayext_o <= '1';
                    elsif (seconds_i = "101") then
                        ledg_o <= '0';
                        relayint_o <= '0';    
                        relayext_o <= '0';                       
                        timestart_o <= '0';
                        s_state <= NEUTRAL;
                    end if;
                
                when FAIL0 =>
                    if (write_i = '1') then
                        check1_o <= butt_i;
                        s_state <= FAIL1;
                    end if;    
                
                when FAIL1 =>
                    if (write_i = '1') then
                        check2_o <= butt_i;
                        s_state <= FAIL2;
                    end if;
                    
                when FAIL2 =>
                    if (write_i = '1') then
                        check3_o <= butt_i;
                        s_state <= FAIL_FINAL;
                    end if;
                
                when FAIL_FINAL =>
                    timestart_o <= '1';
                    if (seconds_i < "001") then
                        ledr_o <= '1';
                        relayint_o <= '0'; 
                        relayext_o <= '0'; 
                    elsif (seconds_i = "001") then
                        ledr_o <= '0';                        
                        timestart_o <= '0';
                        s_state <= NEUTRAL;
                    end if;
                    
                when others =>
                    s_state <= NEUTRAL;
                    
              end case;
             end if;
           end process p_passcheck;     
                  
end Behavioral;