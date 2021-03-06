library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity b_rom is
    port(addr: in std_logic_vector (3 downto 0);
    data: out std_logic_vector (7 downto 0));
    end b_rom;
    architecture rtl of b_rom is
    type rom_type is array (0 to 15) of
    std_logic_vector (7 downto 0);
    constant program : rom_type := (
    "00000010", -- sample contents
    "00001101",
    "00010001",
    "00011110",
    "00101101",
    "00000101",
    "00000111",
    "00001101",
    "00010000",
    "00010100",
    "10100000",
    "11001111",
    "11100000",
    "11110000",
    "11111000",
    "11111111");
    begin
    data <= program(conv_integer(unsigned(addr)));
    end rtl;