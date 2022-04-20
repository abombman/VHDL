-- D_filpflop

library ieee;
use ieee.std_logic_1164.all;

entity D_ff is
    port(
            RST, CLR, D, CP : in std_logic;
            Q               : out std_logic
        );
end D_ff;

architecture behav_D_ff of D_ff is
    signal Q_ps : std_logic;            -- previous state of Q
begin
    process(RST, CLR, CP)
        variable tmp : std_logic;
    begin
        if(RST = '1') then
            tmp := '1';
        elseif(CLR = '1') then
            tmp := '0';
        elseif(CP'event & CP='1') then
            tmp := 'D';
        else
            tmp := Q_ps;
        end if;
        Q <= tmp;
        Q_ps <= tmp;
    end process;
end behav_D_ff;
    
-- 在process中，最好使用变量。由于变量是局部的，因而声明后，可能需要进行值传递。process外都定义的信号，具有全局变量的性质，与C语言中的地址传值很相像，注意26至29行。
-- Q_ps信号声明应该不能省略，因为在26行应该不能使用 tmp := Q ，因为Q的type是IN，除非将Q的type声明为BUFFER，但Buffer端口能否被外部实体读取，有什么限制？
-- 此源码还能精简吗？