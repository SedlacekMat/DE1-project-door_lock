----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2021 09:40:43 PM
-- Design Name: 
-- Module Name: DeMux - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux is
    Port(
        -- write_i : in STD_LOGIC;
        butt_i  : in STD_LOGIC_VECTOR (3 downto 0);
        pos_i   : in STD_LOGIC_VECTOR (1 downto 0);
        demux0_o : out STD_LOGIC_VECTOR (3 downto 0);
        demux1_o : out STD_LOGIC_VECTOR (3 downto 0);
        demux2_o : out STD_LOGIC_VECTOR (3 downto 0);
        demux3_o : out STD_LOGIC_VECTOR (3 downto 0)
     );
end demux;

    architecture Behavioral of demux is
        begin
        
        p_demux : process(pos_i, butt_i)
        begin

            case pos_i is
                when "00" => 
                    demux0_o <= butt_i;
                when "01" => 
                    demux1_o <= butt_i;
                when "10" => 
                    demux2_o <= butt_i;
                when "11" => 
                    demux3_o <= butt_i;
                when others =>
                    demux0_o <= "1111";
                    demux1_o <= "1111";
                    demux2_o <= "1111";
                    demux3_o <= "1111";
             end case;      
        
        end process p_demux;
    end Behavioral;
