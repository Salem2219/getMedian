library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end adder;

architecture rtl of adder is
signal x : unsigned(3 downto 0);
begin
    x <= unsigned(a) + unsigned(b);
    y <= std_logic_vector(x);
end rtl;