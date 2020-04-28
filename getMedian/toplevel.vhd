library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is 
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    a, b : in std_logic_vector(7 downto 0);
    a_addr, b_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, m_ld, m_sel, s2, j_ld, i_ld, a_sel, b_sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    a, b : in std_logic_vector(7 downto 0);
    ieqn, jeqn, altb, counteqnplus1 : out std_logic;
    a_addr, b_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
  port(clk,rst, start, ieqn, jeqn, altb, counteqnplus1: in std_logic;
      m_ld, m_sel, m2, j_ld, i_ld, a_sel, b_sel: out std_logic);
end component;
signal m_ld, m_sel, s2, j_ld, i_ld, a_sel, b_sel, ieqn, jeqn, altb,  counteqnplus1 : std_logic;
begin
    datapath : dp port map (clk, rst, m_ld, m_sel, s2, j_ld, i_ld, a_sel, b_sel, n , a, b, ieqn, jeqn, altb, counteqnplus1, a_addr, b_addr, y);
    control : ctrl port map (clk,rst, start, ieqn, jeqn, altb, counteqnplus1, m_ld, m_sel, s2, j_ld, i_ld, a_sel, b_sel);
end rtl;