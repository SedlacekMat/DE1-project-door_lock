----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2021 11:18:03 AM
-- Design Name: 
-- Module Name: door_lock - Behavioral
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

entity door_lock is
    Port( 
           button_0 : in STD_LOGIC;
           button_1 : in STD_LOGIC;
           button_2 : in STD_LOGIC;
           button_3 : in STD_LOGIC;
           button_4 : in STD_LOGIC;
           button_5 : in STD_LOGIC;
           button_6 : in STD_LOGIC;
           button_7 : in STD_LOGIC;
           button_8 : in STD_LOGIC;
           button_9 : in STD_LOGIC;
          
           m_reset  : in STD_LOGIC;
           set      : in STD_LOGIC;
           clk      : in STD_LOGIC;
           
           ledg_o       : out STD_LOGIC;
           ledr_o       : out STD_LOGIC;
           relayext_o   : out STD_LOGIC;
           seg_o        : out STD_LOGIC_VECTOR (7 - 1 downto 0);
           dig_o        : out STD_LOGIC_VECTOR (4 - 1 downto 0)
     );
           
end door_lock;

architecture Behavioral of door_lock is

    signal s_num  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_pos  : STD_LOGIC_VECTOR (2 - 1 downto 0);
    signal s_act  : STD_LOGIC;
    
    signal s_reset_o : STD_LOGIC;
    signal s_a_reset : STD_LOGIC;
    
    signal s_reg0  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_reg1  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_reg2  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_reg3  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    
    signal s_check0  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_check1  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_check2  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_check3  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    
    signal s_driver0  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_driver1  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_driver2  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    signal s_driver3  : STD_LOGIC_VECTOR (4 - 1 downto 0);
    
    signal s_relay  : STD_LOGIC;

begin

    keypad_driver0  : entity work.keypad_driver
        port map(
            clk         => clk,  
            reset       => s_reset_o,
        
            button_set  => set,
            button_0    => button_0,
            button_1    => button_1,
            button_2    => button_2,
            button_3    => button_3,
            button_4    => button_4,
            button_5    => button_5,
            button_6    => button_6,
            button_7    => button_7,
            button_8    => button_8,
            button_9    => button_9,
                    
            a_reset_o   => s_a_reset,        
            act_o       => s_act,
            pos_o       => s_pos,
            num_o       => s_num
        );
        
    reset_driver0   : entity work.reset_driver
        port map(
            m_reset     => m_reset,
            a_reset     => s_a_reset,
            
            reset_o     => s_reset_o   
        );
        
    demux0  : entity work.demux
        port map(
            butt_i      => s_num,
            pos_i       => s_pos,
            
            demux0_o    => s_reg0,
            demux1_o    => s_reg1,
            demux2_o    => s_reg2,
            demux3_o    => s_reg3
        );
        
    reg_4_40  : entity work.reg_4_4
        port map(
            set_i       => set,
            pass_i      => s_relay,
            reset_i     => s_reset_o,
            reg0_i      => s_reg0,
            reg1_i      => s_reg1,
            reg2_i      => s_reg2,
            reg3_i      => s_reg3,
            
            reg0_o      => s_check0,
            reg1_o      => s_check1,
            reg2_o      => s_check2,
            reg3_o      => s_check3
        );
        
    checker0  : entity work.checker
        port map(
            clk         => clk,
            butt_i      => s_num,
            reset_i     => s_reset_o,
            write_i     => s_act,
            
            ledg_o      => ledg_o,
            ledr_o      => ledr_o,
            
            relayext_o  => relayext_o,
            relayint_o  => s_relay,
            check0_i    => s_check0,
            check1_i    => s_check1,
            check2_i    => s_check2,
            check3_i    => s_check3,
            
            check0_o    => s_driver0,
            check1_o    => s_driver1,
            check2_o    => s_driver2,
            check3_o    => s_driver3
        );
       
    driver_7seg_4digits0 : entity work.driver_7seg_4digits
        port map(
            clk          => clk,
            reset        => s_reset_o,
            
            data0_i      => s_driver0,
            data1_i      => s_driver1,
            data2_i      => s_driver2,
            data3_i      => s_driver3,
            
            dig_o        => dig_o,
            seg_o        => seg_o
        );

end Behavioral;
