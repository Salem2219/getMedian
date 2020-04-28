library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is 
   port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end test;

architecture rtl of test is
component toplevel is 
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    a, b : in std_logic_vector(7 downto 0);
    a_addr, b_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component a_rom is
    port(addr: in std_logic_vector (3 downto 0);
    data: out std_logic_vector (7 downto 0));
end component;
component b_rom is
    port(addr: in std_logic_vector (3 downto 0);
    data: out std_logic_vector (7 downto 0));
end component;
signal a_addr, b_addr : std_logic_vector(3 downto 0);
signal a, b : std_logic_vector(7 downto 0);
begin
    romA : a_rom port map (a_addr, a);
    romB : b_rom port map (b_addr, b);
    median : toplevel port map (clk, rst, start, n, a, b, a_addr, b_addr, y);
end rtl;