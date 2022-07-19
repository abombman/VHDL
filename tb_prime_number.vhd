----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2022 10:42:52 AM
-- Design Name: 
-- Module Name: tb_prime_number - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library xil_defaultlib;
use xil_defaultlib.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_prime_number is
--  Port ( );
end tb_prime_number;

architecture Behavioral of tb_prime_number is
  signal input: std_logic_vector(3 downto 0);
  signal isprime :std_logic;
  signal vector_isprime: bit_vector(1 downto 0);
--  component prime_dec is
--    port(
--    input:    in std_logic_vector(3 downto 0);
--    isprime: out std_logic);
--  end component;
begin
  DUT: entity prime_dec port map (input, isprime);  --如果不用entity关键字，则需要将prime_dec声明为component
  vector_isprime<= b"0" & to_bit(isprime);          --用‘&’将两个bit拼成vector
  process
  begin
    for i in 0 to 15 loop
      input<= std_logic_vector(to_unsigned(i,4));
      wait for 10ns;
      report "input = " & to_hstring(to_bitvector(input)) & " isprime = " & to_hstring(vector_isprime);
    end loop;
    std.env.stop(0);
  end process;
end Behavioral;
