-- 16_fifo

library ieee;
use ieee.std_logic_1164.all;

entity fifo16 is
    port(
        Din, clk : in  std_logic;
        Dout     : out std_logic
        );
end fifo16;

architecture behav_fifo16 of fifo16 is
    component Dff 
        port(
            d, cp : in  std_logic;
            q     : out std_logic
            );
    end component;
    signal z : std_logic_vector(15 downto 0);
begin
    z(0) <= Din;
    for i in 1 to 14 generate
        Dffx : Dff port map(d => z(i), cp => clk, q => z(i+1));
    end generate;
    Dout <= z(15);
end behav_fifo16; 