library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end comp;

architecture rtl of comp is
begin
    y <= '1' when a = b else '0';
end rtl;

