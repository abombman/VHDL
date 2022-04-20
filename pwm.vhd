-- pwm

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pwm is
    port(
        duty    : in  std_logic_vector(7 downto 0);
        period  : in  std_logic_vector(7 downto 0);
        clk     : in  std_logic;
        clr     : in  std_logic;
        pwm     : out std_logic
        );
end pwm;

architecture behav_pwm of pwm is
    signal count : std_logic_vector(7 downto 0);
    signal set, reset : std_logic;
begin
    P1 : process(clk, clr)
    begin
        if(clr = '1') then
            count <= "00000000";
        elseif rising_edge(clk) then
            if(count = period -1) then
                count <= "00000000";
            else
                count <= count + 1;
            end if;
        end if;
    end process P1;

    set <= '1' when count = "00000000";
    
    P2 : process(clk)
    begin
        if rising_edge(clk) then
            reset <= '1';
        else
            reset <= '0';
        end if;
    end process P2; 

    P3 : process(clk)
    begin
        if rising_edge(clk) then
            if(set = '1') then
                pwm <= '1';
            elseif(reset = '1') then
                pwm <= '0';
            end if;
        end if;
    end process P3;
    --  P3:
    --  pwm <= '1' when(set = '1' & rising_edge(clk)) else
    --      <= '0' when(reset = '1' & rising_edge(clk));

end behav_pwm;

