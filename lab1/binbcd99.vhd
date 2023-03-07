library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity binbcd99 is
    port (
        SW: in std_logic_vector (17 downto 0);
        LEDR: out std_logic_vector (17 downto 0);
        HEX0, HEX1: out std_logic_vector (6 downto 0)
    );
end binbcd99;

architecture struct of binbcd99 is
    
    signal dez,unid,aux: std_logic_vector(6 downto 0);
           
begin

    aux <= "0000000" when SW(6 downto 0) < "0001010" else
           "0001010" when SW(6 downto 0) < "0010100" else
           "0010100" when SW(6 downto 0) < "0011110" else
           "0011110" when SW(6 downto 0) < "0101000" else
           "0101000" when SW(6 downto 0) < "0110010" else
           "0110010" when SW(6 downto 0) < "0111100" else
           "0111100" when SW(6 downto 0) < "1000110" else
           "1000110" when SW(6 downto 0) < "1010000" else
           "1010000" when SW(6 downto 0) < "1011010" else
           "1011010" when SW(6 downto 0) < "1100100" else
           "1111111";
    
    unid <= (SW(6 downto 0) - aux) when (aux < "1100100") else
            "1111111";
    
    with aux select dez <= "0000000" when "0000000",
                           "0000001" when "0001010",
                           "0000010" when "0010100",
                           "0000011" when "0011110",
                           "0000100" when "0101000",
                           "0000101" when "0110010",
                           "0000110" when "0111100",
                           "0000111" when "1000110",
                           "0001000" when "1010000",
                           "0001001" when "1011010",
                           "1111111" when others;
    
    LEDR(3 downto 0) <= unid(3 downto 0);
    LEDR(7 downto 4) <= dez(3 downto 0);
    
    HEX0 <=    "1000000" when unid(3 downto 0) = "0000" else
               "1111001" when unid(3 downto 0) = "0001" else
               "0100100" when unid(3 downto 0) = "0010" else
               "0110000" when unid(3 downto 0) = "0011" else
               "0011001" when unid(3 downto 0) = "0100" else
               "0010010" when unid(3 downto 0) = "0101" else
               "0000010" when unid(3 downto 0) = "0110" else
               "1111000" when unid(3 downto 0) = "0111" else
               "0000000" when unid(3 downto 0) = "1000" else
               "0011000" when unid(3 downto 0) = "1001" else
               "1111111";
    
    HEX1 <=    "1000000" when dez(3 downto 0) = "0000" else
               "1111001" when dez(3 downto 0) = "0001" else
               "0100100" when dez(3 downto 0) = "0010" else
               "0110000" when dez(3 downto 0) = "0011" else
               "0011001" when dez(3 downto 0) = "0100" else
               "0010010" when dez(3 downto 0) = "0101" else
               "0000010" when dez(3 downto 0) = "0110" else
               "1111000" when dez(3 downto 0) = "0111" else
               "0000000" when dez(3 downto 0) = "1000" else
               "0011000" when dez(3 downto 0) = "1001" else
               "1111111";
 
    

end struct;
