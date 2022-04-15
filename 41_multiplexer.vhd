-- 4/1 multiplexer

library ieee;
use ieee.std_logic_1164.all;

entity 41_multiplexer is
    port(
        a, b, c, d : in  std_logic;
        sel        : in  std_logic_vector(1 downto 0);
        o          : out std_logic
    );
end 41_multiplexer;

architecture behavorial_41_multiplexer is
begin
    prosess(a, b, c, d, sel)
        with sel select
            o <= a when "00",
                 b when "01",
                 c when "10",
                 d when "11",
                 z when others;
end behavorial_41_multiplexer;
