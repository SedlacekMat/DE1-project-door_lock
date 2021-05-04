----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2021 11:58:25 PM
-- Design Name: 
-- Module Name: keypad_driver - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keypad_driver is
    Port(
        clk         : in std_logic;
        reset       : in std_logic;
        
        -- Input buttons
        button_set  : in std_logic;
        button_0    : in std_logic;
        button_1    : in std_logic;
        button_2    : in std_logic;
        button_3    : in std_logic;
        button_4    : in std_logic;
        button_5    : in std_logic;
        button_6    : in std_logic;
        button_7    : in std_logic;
        button_8    : in std_logic;
        button_9    : in std_logic;
        
        -- Outputs
        a_reset_o   : out std_logic := '0';
        act_o       : out std_logic := '0';    -- Active Button
        pos_o       : out std_logic_vector(2 - 1 downto 0) := "00"; -- Position
        num_o       : out std_logic_vector(4 - 1 downto 0) := "1111" -- Number value
    );
end keypad_driver;

architecture Behavioral of keypad_driver is

    type decoder_state is (POS0, POS0_R, POS1, POS1_R, POS2, POS2_R, POS3, POS3_R);
    signal s_state  : decoder_state;

    signal s_cnt    : unsigned(8 - 1 downto 0);

    constant c_DELAY_1SEC : unsigned(8 - 1 downto 0) := b"1001_0110"; --shortened fo the purposes of simulation
    constant c_ZERO       : unsigned(8 - 1 downto 0) := b"0000_0000";
    
begin
    p_decoder_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                s_state <= POS0;
                
                num_o   <= "1111";
                act_o   <= '0';
                -- Reset counter
                s_cnt   <= c_ZERO;
                
                a_reset_o <= '0';
           
            else
                case s_state is
                
                    when POS0 =>
                        
                        pos_o <= "00";
                        
                        if (button_0 = '1') then                          
                            num_o   <= "0000";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_1 = '1') then   
                            num_o <= "0001";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_2 = '1') then   
                            num_o <= "0010";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_3 = '1') then   
                            num_o <= "0011";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;    
                        elsif (button_4 = '1') then   
                            num_o <= "0100";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_5 = '1') then   
                            num_o <= "0101";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;       
                        elsif (button_6 = '1') then   
                            num_o <= "0110";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_7 = '1') then   
                            num_o <= "0111";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_8 = '1') then   
                            num_o <= "1000";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_9 = '1') then   
                            num_o <= "1001";
                            s_state <= POS0_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        --else
                 
                        end if;
                        
                    when POS0_R =>
                        
                        pos_o <= "00";
                        
                        if (button_0 = '0' and button_1 = '0' and
                            button_2 = '0' and button_3 = '0' and
                            button_4 = '0' and button_5 = '0' and
                            button_6 = '0' and button_7 = '0' and
                            button_8 = '0' and button_9 = '0') then
                            s_state <= POS1;
                            act_o <= '0';     
                        end if;
                        
                    when POS1 =>
                        
                        pos_o <= "01";
                        
                        if (button_0 = '1') then                          
                            num_o   <= "0000";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_1 = '1') then   
                            num_o <= "0001";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;   
                        elsif (button_2 = '1') then   
                            num_o <= "0010";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_3 = '1') then   
                            num_o <= "0011";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_4 = '1') then   
                            num_o <= "0100";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;       
                        elsif (button_5 = '1') then   
                            num_o <= "0101";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;          
                        elsif (button_6 = '1') then   
                            num_o <= "0110";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;          
                        elsif (button_7 = '1') then   
                            num_o <= "0111";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;  
                        elsif (button_8 = '1') then   
                            num_o <= "1000";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;       
                        elsif (button_9 = '1') then   
                            num_o <= "1001";
                            s_state <= POS1_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        else
                            if (s_cnt < c_DELAY_1SEC) then
                                s_cnt <= s_cnt + 1;
                                num_o <= "1111";
                            else
                                -- s_state <= POS0;
                                -- s_cnt <= c_ZERO;
                                a_reset_o <= '1';
                            end if;  
                        end if;
                        
                    when POS1_R =>
                        
                        pos_o <= "01";
                        
                        if (button_0 = '0' and button_1 = '0' and
                            button_2 = '0' and button_3 = '0' and
                            button_4 = '0' and button_5 = '0' and
                            button_6 = '0' and button_7 = '0' and
                            button_8 = '0' and button_9 = '0') then
                            s_state <= POS2;
                            act_o <= '0';                        
                        end if; 
                       
                    when POS2 =>
                        
                        pos_o <= "10";
                        
                        if (button_0 = '1') then                          
                            num_o   <= "0000";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_1 = '1') then   
                            num_o <= "0001";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO; 
                        elsif (button_2 = '1') then   
                            num_o <= "0010";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;      
                        elsif (button_3 = '1') then   
                            num_o <= "0011";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_4 = '1') then   
                            num_o <= "0100";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_5 = '1') then   
                            num_o <= "0101";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_6 = '1') then   
                            num_o <= "0110";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_7 = '1') then   
                            num_o <= "0111";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;       
                        elsif (button_8 = '1') then   
                            num_o <= "1000";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_9 = '1') then   
                            num_o <= "1001";
                            s_state <= POS2_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        else
                            if (s_cnt < c_DELAY_1SEC) then
                                s_cnt <= s_cnt + 1;
                                num_o <= "1111";
                            else
                                -- s_state <= POS0;
                                -- s_cnt <= c_ZERO;
                                a_reset_o <= '1';
                            end if;                            
                        end if;
                        
                    when POS2_R =>
                        
                        pos_o <= "10";
                        
                        if (button_0 = '0' and button_1 = '0' and
                            button_2 = '0' and button_3 = '0' and
                            button_4 = '0' and button_5 = '0' and
                            button_6 = '0' and button_7 = '0' and
                            button_8 = '0' and button_9 = '0') then
                            s_state <= POS3;
                            act_o <= '0';                      
                        end if; 
                        
                    when POS3 =>
                        
                        pos_o <= "11";
                        
                        if (button_0 = '1') then                          
                            num_o   <= "0000";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        elsif (button_1 = '1') then   
                            num_o <= "0001";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;    
                        elsif (button_2 = '1') then   
                            num_o <= "0010";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_3 = '1') then   
                            num_o <= "0011";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_4 = '1') then   
                            num_o <= "0100";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_5 = '1') then   
                            num_o <= "0101";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_6 = '1') then   
                            num_o <= "0110";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;        
                        elsif (button_7 = '1') then   
                            num_o <= "0111";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;       
                        elsif (button_8 = '1') then   
                            num_o <= "1000";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;         
                        elsif (button_9 = '1') then   
                            num_o <= "1001";
                            s_state <= POS3_R;
                            act_o <= '1';
                            s_cnt <= c_ZERO;
                        else
                            if (s_cnt < c_DELAY_1SEC) then
                                s_cnt <= s_cnt + 1;
                                num_o <= "1111";
                            else
                                -- s_state <= POS0;
                                -- s_cnt <= c_ZERO;
                                a_reset_o <= '1';
                            end if;
                        end if;
                        
                    when POS3_R =>
                        
                        pos_o <= "11";
                        
                        if (button_0 = '0' and button_1 = '0' and
                            button_2 = '0' and button_3 = '0' and
                            button_4 = '0' and button_5 = '0' and
                            button_6 = '0' and button_7 = '0' and
                            button_8 = '0' and button_9 = '0' and
                            button_set = '0') then
                            s_state <= POS0;
                            act_o <= '0';          
                        end if; 
                                   
                end case;
            end if; 
        end if;
    end process p_decoder_fsm; 


end Behavioral;





















