-- full adder

library ieee;
use ieee.std_logic_1164.all
use ieee.std_logic_arith.all
use ieee.std_logic_unsign.all

entity ful_adder is
    port(
            A, B, CI : in std_logic_vector(7 downto 0);
            S        : out std_logic_vector(7 downto 0);
            CO       : out std_logic
        );
end ful_adder;

architecture behav_ful_adder of ful_adder is
    signal tmp : std_logic_vector(8 downto 0);
begin
    tmp <= conv_std_logic_vector((conv_integer(A) + conv_integer(B) + conv_integer(CI)), 9);
    s   <= tmp(7 downto 0);
    CO  <= tmp(8);
end behav_ful_adder;