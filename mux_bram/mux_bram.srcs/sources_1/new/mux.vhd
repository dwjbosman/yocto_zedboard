----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 08:52:23 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port ( addra : in STD_LOGIC_VECTOR (31 downto 0);
           clka_0 : in STD_LOGIC;
           dina_0 : in STD_LOGIC_VECTOR (31 downto 0);
           douta_0 : out STD_LOGIC_VECTOR (31 downto 0);
           ena_0 : in STD_LOGIC;
           rsta_0 : in STD_LOGIC;
           wea_0 : in STD_LOGIC_VECTOR (3 downto 0);
           addrb : in STD_LOGIC_VECTOR (31 downto 0);
           clkb_0 : in STD_LOGIC;
           dinb_0 : in STD_LOGIC_VECTOR (31 downto 0);
           doutb_0 : out STD_LOGIC_VECTOR (31 downto 0);
           enb_0 : in STD_LOGIC;
           rstb_0 : in STD_LOGIC;
           web_0 : in STD_LOGIC_VECTOR (3 downto 0);
           mux_in : in STD_LOGIC;
           addrx : out STD_LOGIC_VECTOR (31 downto 0);
           clkx_0 : out STD_LOGIC;
           dinx_0 : out STD_LOGIC_VECTOR (31 downto 0);
           doutx_0 : in STD_LOGIC_VECTOR (31 downto 0);
           enx_0 : out STD_LOGIC;
           rstx_0 : out STD_LOGIC;
           wex_0 : out STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is


begin

    process(mux_in, addra, clka_0, dina_0, doutx_0, ena_0, rsta_0, wea_0, addrb, clkb_0, dinb_0, doutx_0, enb_0, rstb_0, web_0)
    begin
      case mux_in is
        when '0' =>
            addrx <= addra;
            clkx_0 <= clka_0;
            dinx_0 <= dina_0;
            douta_0 <= doutx_0;
            enx_0 <= ena_0;
            rstx_0 <= rsta_0;
            wex_0 <= wea_0;
            doutb_0 <= (others => '0');
        when '1' =>
            addrx <= addrb;
            clkx_0 <= clkb_0;
            dinx_0 <= dinb_0;
            doutb_0 <= doutx_0;
            enx_0 <= enb_0;
            rstx_0 <= rstb_0;
            wex_0 <= web_0;
            douta_0 <= (others => '0');
      end case;
    end process;

end Behavioral;

