-- n -> m decoder
-- a input bit width n
-- b output one-hot width m

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n2m_decoder is 
  generic(
    n: integer:= 3;
    m: integer:= 8
  	);

  port(
    a: in  std_logic_vector(n-1 downto 0);
    b: out std_logic_vector(m-1 downto 0)
  	);
end n2m_decoder;

architecture behav of n2m_decoder is 
  signal one_hot: u_unsigned(m-1 downto 0);          --unsigned即可代表一位无符号数，也可代表无符号数组，无符号数在numeric_std包中
  signal shift: integer;                             --广泛使用
begin
  shift<= to_integer(u_unsigned(a));                 --参数是无符号数组
  one_hot<= to_unsigned(1,m);                        --参数是两个整数
  b<= to_stdlogicvector(std_ulogic_vector(one_hot sll shift));  --逻辑左移的左参数是无符号数组，右参数是整数
end behav;