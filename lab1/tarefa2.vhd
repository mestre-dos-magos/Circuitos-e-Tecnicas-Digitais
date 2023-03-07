library ieee;
use ieee.std_logic_1164.all;

entity tarefa2 is
port(
	KEY: in std_logic_vector(3 downto 0);
	SW: in std_logic_vector(17 downto 0);
	LEDR: out std_logic_vector(17 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7	: out std_logic_vector(6 downto 0)
	);
end tarefa2;

architecture rtl of tarefa2 is
begin
    
    HEX6 <= "1000001";
    HEX5 <= "0001110";
    HEX4 <= "0010010";
    HEX3 <= "1000110";

end rtl;
