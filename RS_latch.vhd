-- RS latch

library ieee;
use ieee.std_logic_1164.all

entity RS_latch is
    port(
            R, S : in  std_logic;
            Q    : out std_logic
        );
end RS_latch;

architecture behav_RS_latch of RS_latch is
    signal Q_ps : std_logic;
begin
    Q_ps <= '1' when (R = '0' & S = '1') else
         <= '0' when (R = '1' & S = '0') else
         <= 'X' when (R = '1' & S = '1') ;
    Q    <= Q_ps;
end behav_RS_latch;