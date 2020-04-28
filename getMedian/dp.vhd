library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, m_ld, m_sel, s2, j_ld, i_ld, a_sel, b_sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    a, b : in std_logic_vector(7 downto 0);
    ieqn, jeqn, altb, counteqnplus1 : out std_logic;
    a_addr, b_addr : out std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component adder is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component avg is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component comp is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component complt is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component mux2_8 is
port (s : in std_logic;
a, b: in std_logic_vector(7 downto 0);
y: out std_logic_vector(7 downto 0)) ;
end component;
component mux2_4 is
port (s : in std_logic;
a, b: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)) ;
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component reg8 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(7 downto 0);
reg_out: out std_logic_vector(7 downto 0));
end component;
signal i_in, i, iplus1, j_in, j, nplus1, count, jplus1, count_in, countplus1, i_addr, j_addr : std_logic_vector(3 downto 0);
signal m1, m2, ab, m1_in, m2_in : std_logic_vector(7 downto 0);
signal i_uns, j_uns : unsigned(3 downto 0);
begin
i_uns <= unsigned(i) - "0001";
j_uns <= unsigned(j) - "0001";
i_addr <= std_logic_vector(i_uns);
j_addr <= std_logic_vector(j_uns);
i_reg : reg4 port map (clk, rst, i_ld, i_in, i);
i_mux : mux2_4 port map (m_sel, "0000", iplus1, i_in);
i_adder : adder port map (i, "0001", iplus1);
j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
j_mux : mux2_4 port map (m_sel, "0000", jplus1, j_in);
j_adder : adder port map (j, "0001", jplus1);
count_reg : reg4 port map (clk, rst, m_ld, count_in, count);
count_mux : mux2_4 port map (m_sel, "0000", countplus1, count_in);
count_adder : adder port map (count, "0001", countplus1);
m1_reg : reg8 port map (clk, rst, m_ld, m1_in, m1);
m2_reg : reg8 port map (clk, rst, m_ld, m2_in, m2);
m1_mux : mux2_8 port map (m_sel, "11111111", m2, m1_in);
m2_mux : mux2_8 port map (m_sel, "11111111", ab, m2_in );
ab_mux : mux2_8 port map (s2, a, b, ab);
a_mux : mux2_4 port map (a_sel, "0000", i, a_addr);
b_mux : mux2_4 port map (b_sel, "0000", j, b_addr);
y_avg : avg port map (m1, m2, y);
n_adder : adder port map (n, "0001", nplus1);
count_comp : comp port map (count, nplus1, counteqnplus1);
in_comp : comp port map (i, n, ieqn);
jn_comp : comp port map (j, n, jeqn);
ab_comp : complt port map (a, b, altb);
end rtl;







