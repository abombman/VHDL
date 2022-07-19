----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 08:13:32 PM
-- Design Name: 
-- Module Name: tb_n2m_decoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_n2m_decoder is
--  Port ( );
end tb_n2m_decoder;

architecture Behavioral of tb_n2m_decoder is
  component n2m_decoder is
    generic(
    n: integer;
    m: integer
  	);
    port(
    a: in  std_logic_vector(n-1 downto 0);
    b: out std_logic_vector(m-1 downto 0)
  	);
  end component;
  signal a: std_logic_vector(3 downto 0);
  signal b: std_logic_vector(15 downto 0);
begin
  DUT: n2m_decoder 
    generic map(n=>4, m=>16)
    port map(a, b); 
  process begin
    a<= "0000";
    wait for 100ns;
    
    for i in 0 to 15 loop
      a<= a +'1';
      wait for 100ns;
    end loop;
    std.env.stop(0);
  end process;  
end Behavioral;
