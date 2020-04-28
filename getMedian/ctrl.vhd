library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
  port(clk,rst, start, ieqn, jeqn, altb, counteqnplus1: in std_logic;
      m_ld, m_sel, m2, j_ld, i_ld, a_sel, b_sel: out std_logic);
end ctrl;

architecture rtl of ctrl is
  type state_type is (s0,s1,s2,s3,s4);
  signal current_state, next_state: state_type;
begin 
  process(ieqn, jeqn, altb, counteqnplus1, start, current_state)
  begin
    case current_state is
	when s0 =>  
	 m_ld <= '0';
     m_sel <= '0';
     m2 <= '0';
     j_ld <= '0';
     i_ld <= '0';
     a_sel <= '0';
     b_sel <= '0';
	next_state <= s1;
	when s1 => 
     m_ld <= '0';
     m_sel <= '0';
     m2 <= '0';
     j_ld <= '0';
     i_ld <= '0';
     a_sel <= '0';
     b_sel <= '0';
	  if (start = '1') then 
	    next_state <= s2 ;
	  else
	    next_state <= s1;	
	  end if;
	when s2 => 
     m_ld <= '1';
     m_sel <= '0';
     m2 <= '0';
     j_ld <= '1';
     i_ld <= '1';
     a_sel <= '0';
     b_sel <= '0';
	  next_state <= s3 ;
	when s3 =>  
     m_ld <= '0';
     m_sel <= '0';
     m2 <= '0';
     j_ld <= '0';
     i_ld <= '0';
     a_sel <= '0';
     b_sel <= '0';
      if (counteqnplus1 = '0')  then
      next_state <= s4;
      else
      next_state <= s1;
      end if;
	when s4 =>  
     m_ld <= '1';
     m_sel <= '1';
     m2 <= ieqn or (jeqn nor altb);
     j_ld <= not (ieqn) and (jeqn nor altb);
     i_ld <= altb and (jeqn nor ieqn);
     a_sel <= not jeqn;
     b_sel <= not ieqn;
     if((ieqn or jeqn) = '1') then
     next_state <= s1;
     else
     next_state <= s3;
     end if;
	 end case;
  end process;
  process (rst, clk)
  begin
    if (rst ='1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;
end rtl;