-- 3/8 decoder

library ieee;
use ieee.std_logic_1164.all

entity 38_decoder is
    port(
        en   : in  std_logic;
        code : in  std_logic_vector(2 downto 0);
        sel  : out std_logic_vector(7 downto 0)
    );
end 38_decoder;

architecture behavorial_38decoder of 38_decoder is
begin
    process(en code)
    begin
        if( en = '1') then
            case code is
                when "000" =>
                    sel <= "00000001";
                when "001" =>
                    sel <= "00000010";
                when "010" =>
                    sel <= "00000100";
                when "011" =>
                    sel <= "00001000";
                when "100" =>
                    sel <= "00010000";
                when "101" =>
                    sel <= "00100000";
                when "110" =>
                    sel <= "01000000";
                when "111" =>
                    sel <= "10000000";
                when others =>
                    sel <= "00000000";
        else
            sel <= "zzzzzzzz";
        end if
    end process;
end behavorial_38decoder;