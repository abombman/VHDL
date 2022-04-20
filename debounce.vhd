-- debounce

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity debounce is
    port(
        input : in  std_logic;
        clk   : in  std_logic;
        clr   : in  std_logic;
        output: out std_logic
        );
end debounce;

architecture behav_debounce of debounce is
    signal z : std_logic_vector(2 downto 0);
begin
    process(input, clr, clk)
    begin
        if(clr = '1') then
            z <= "000";
        elseif(rising_edge(clk)) then
            z(0) <= input;
            z(1) <= z(0);
            z(2) <= z(1);
        end if;
    end process;
    output <= z(0) & z(1) & z(2);
end behav_debounce;