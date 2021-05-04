----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2021 01:02:17 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port(
        CLK100MHZ   : in STD_LOGIC;
        
        B0      : in STD_LOGIC;
        B1      : in STD_LOGIC;
        B2      : in STD_LOGIC;
        B3      : in STD_LOGIC;
        B4      : in STD_LOGIC;
        B5      : in STD_LOGIC;
        B6      : in STD_LOGIC;
        B7      : in STD_LOGIC;
        B8      : in STD_LOGIC;
        B9      : in STD_LOGIC;
        B_SET   : in STD_LOGIC;
        B_RESET : in STD_LOGIC;
        
        CA  : out STD_LOGIC_VECTOR(7 - 1 downto 0);
        AN  : out STD_LOGIC_VECTOR(4 - 1 downto 0);
        
        LED_R       : out STD_LOGIC;
        LED_G       : out STD_LOGIC;
        RELAY_EXT   : out STD_LOGIC
    );
    
end top;

architecture Behavioral of top is

begin
    door_lock : entity work.door_lock
        port map(
            clk         => CLK100MHZ,
            -------------------------
            button_0    => B0,
            button_1    => B1,
            button_2    => B2,
            button_3    => B3,
            button_4    => B4,
            button_5    => B5,
            button_6    => B6,
            button_7    => B7,
            button_8    => B8,
            button_9    => B9,
            set         => B_SET,
            m_reset     => B_RESET,
            -------------------------
            ledg_o      => LED_G,
            ledr_o      => LED_R,
            relayext_o  => RELAY_EXT,
            seg_o       => CA, -- Might not work properly
            dig_o       => AN  -- Might not work properly
        );


end Behavioral;
