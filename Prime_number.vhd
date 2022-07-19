library ieee;
use ieee.std_logic_1164.all;

entity prime_dec is
  port(
    input:    in std_logic_vector(3 downto 0);
    isprime: out std_logic
  	);
end prime_dec;

architecture impl of prime_dec is
begin
  process (input)
  begin
    case input is
      when x"0" | x"4" | x"6" | x"8" | x"9"=> isprime<= '0';
      when x"1" | x"2" | x"3" | x"5" | x"7"=> isprime<= '1';
      when others=> isprime<= '-';
    end case;
  end process;
end impl;