library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity avg is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end avg;

architecture rtl of avg is
signal  x, g, h : unsigned(8 downto 0);
signal z : unsigned(7 downto 0);
begin
    g(7 downto 0) <= unsigned(a);
    h(7 downto 0) <= unsigned(b);
    g(8) <= '0';
    h(8) <= '0';
    x <= g + h;
    z <= x(8 downto 1);
    y <= std_logic_vector(z);
end rtl;