8/3 encoder

library ieee;
use ieee.ste_logic_1164.all;

entity priority_encoder is 
    port( 
          sel : in  std_logic_vector(7 downto 0);
         code : out std_logic_vector(2 downto 0)
        );
end priority_encoder;

architecture dataflow_priority of priority_encoder is
begin
    code <= "000" when sel(0) = '1' else
            "001" when sel(1) = '1' else
            "010" when sel(2) = '1' else
            "011" when sel(3) = '1' else
            "100" when sel(4) = '1' else
            "101" when sel(5) = '1' else
            "110" when sel(6) = '1' else
            "111" when sel(7) = '1' else
            "zzz";
end dataflow_priority;
