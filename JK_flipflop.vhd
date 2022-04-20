-- JK flipflop

library ieee;
use ieee.std_logic_1164.all

entity JK_FF is
    port(
            J, K, CP   : in  std_logic;
            Rd, Sd, CE : in  std_logic;
            Q          : out std_logic
        );
end JK_FF;

architecture behav_JK_FF of JK_FF is
    signal Q_ps : std_logic;
begin
    process(Rd, Sd, CP)
        variable tmp = std_logic;
    begin
        if( (Rd = '1') & (Sd = '1') ) then
            tmp := 'X';
        elseif( (Rd = '1') & (Sd = '0') ) then
            tmp := '0';
        elseif( (Rd = '0') & (Sd = '1') ) then
            tmp := '1';
        elseif rising_edge(CP) then
            if( (CE = '1') & (J = '1') & (K = '0')) then
                tmp := '1';
            elseif( (CE = '1') & (J = '0') & (K = '1')) then
                tmp := '0';
            elseif( (CE = '1') & (J = '1') & (K = '1')) then
                tmp := not Q_ps;
            end if;
        else
            tmp := Q_ps;
        end if;
        Q <= tmp;
        Q_ps <= tmp;
    end process;
end behav_JK_FF;
