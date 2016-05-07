----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:10 04/11/2016 
-- Design Name: 
-- Module Name:    BCD - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD is

  Port ( 
			  CLK : in STD_LOGIC;
			  bufor_1 : in STD_logic_vector (7 downto 0);
			  bufor_2 : in STD_logic_vector (7  downto 0);
           a_to_g : out STD_LOGIC_VECTOR (6 downto 0);		-- poszczególne segmenty wyœwietlacza, segmenty a,b,c,d,e,f,g
			  anody : out STD_LOGIC_VECTOR (3 downto 0);			-- sekcje wyœwietlacza, wspólne anody
           dot : out  STD_LOGIC);									-- kropka
end BCD;

architecture Behavioral of BCD is
signal cz_1: STD_logic_vector (7 downto 0);
signal cz_2 : STD_logic_vector (7  downto 0);
signal x : STD_LOGIC_VECTOR (15 downto 0);						
signal digit : STD_LOGIC_VECTOR (3 downto 0);
signal clk_div : STD_LOGIC_VECTOR (19 downto 0) := X"00000";
signal L : STD_LOGIC_VECTOR (15 downto 0);
signal s : STD_LOGIC_VECTOR (1 downto 0);
begin
cz_1<= x"00" when bufor_1 = "00000000" else
			x"01" when bufor_1 = "00000001" else
			x"02" when bufor_1 = "00000010" else
			x"03" when bufor_1 = "00000011" else
			x"04" when bufor_1 = "00000100" else
			x"05" when bufor_1 = "00000101" else
			x"06" when bufor_1 = "00000110" else
			x"07" when bufor_1 = "00000111" else
			x"08" when bufor_1 = "00001000" else
			x"09" when bufor_1 = "00001001" else
			x"10" when bufor_1 = "00001010" else
			x"11" when bufor_1 = "00001011" else
			x"12" when bufor_1 = "00001100" else
			x"13" when bufor_1 = "00001101" else
			x"14" when bufor_1 = "00001110" else
			x"15" when bufor_1 = "00001111" else
			x"16" when bufor_1 = "00010000" else
			x"17" when bufor_1 = "00010001" else
			x"18" when bufor_1 = "00010010" else
			x"19" when bufor_1 = "00010011" else
			x"20" when bufor_1 = "00010100" else
			x"21" when bufor_1 = "00010101" else
			x"22" when bufor_1 = "00010110" else
			x"23" when bufor_1 = "00010111" else
			x"24" when bufor_1 = "00011000" else
			x"25" when bufor_1 = "00011001" else
			x"26" when bufor_1 = "00011010" else
			x"27" when bufor_1 = "00011011" else
			x"28" when bufor_1 = "00011100" else
			x"29" when bufor_1 = "00011101" else
			x"30" when bufor_1 = "00011110" else
			x"31" when bufor_1 = "00011111" else
			x"32" when bufor_1 = "00100000" else
			x"33" when bufor_1 = "00100001" else
			x"34" when bufor_1 = "00100010" else
			x"35" when bufor_1 = "00100011" else
			x"36" when bufor_1 = "00100100" else
			x"37" when bufor_1 = "00100101" else
			x"38" when bufor_1 = "00100110" else
			x"39" when bufor_1 = "00100111" else
			x"40" when bufor_1 = "00101000" else
			x"41" when bufor_1 = "00101001" else
			x"42" when bufor_1 = "00101010" else
			x"43" when bufor_1 = "00101011" else
			x"44" when bufor_1 = "00101100" else
			x"45" when bufor_1 = "00101101" else
			x"46" when bufor_1 = "00101110" else
			x"47" when bufor_1 = "00101110" else
			x"48" when bufor_1 = "00110000" else
			x"49" when bufor_1 = "00110001" else
			x"50" when bufor_1 = "00110010" else
			x"51" when bufor_1 = "00110011" else
			x"52" when bufor_1 = "00110100" else
			x"53" when bufor_1 = "00110101" else
			x"54" when bufor_1 = "00110110" else
			x"55" when bufor_1 = "00110111" else
			x"56" when bufor_1 = "00111000" else
			x"57" when bufor_1 = "00111001" else
			x"58" when bufor_1 = "00111010" else
			x"59";

cz_2<=x"00" when bufor_2 = "00000000" else
			x"01" when bufor_2 = "00000001" else
			x"02" when bufor_2 = "00000010" else
			x"03" when bufor_2 = "00000011" else
			x"04" when bufor_2 = "00000100" else
			x"05" when bufor_2 = "00000101" else
			x"06" when bufor_2 = "00000110" else
			x"07" when bufor_2 = "00000111" else
			x"08" when bufor_2 = "00001000" else
			x"09" when bufor_2 = "00001001" else
			x"10" when bufor_2 = "00001010" else
			x"11" when bufor_2 = "00001011" else
			x"12" when bufor_2 = "00001100" else
			x"13" when bufor_2 = "00001101" else
			x"14" when bufor_2 = "00001110" else
			x"15" when bufor_2 = "00001111" else
			x"16" when bufor_2 = "00010000" else
			x"17" when bufor_2 = "00010001" else
			x"18" when bufor_2 = "00010010" else
			x"19" when bufor_2 = "00010011" else
			x"20" when bufor_2 = "00010100" else
			x"21" when bufor_2 = "00010101" else
			x"22" when bufor_2 = "00010110" else
			x"23";
L<= H & MIN;
x <=L;
dot <= '0';	
--
	process (clk, s, x) is
	begin
		if (clk'event and clk ='1') then
			case s is 
				when "00" => digit <= x(3 downto 0);
					if s ="00" then anody <= "0001"; else null; end if; 
				when "01" => digit <= x(7 downto 4);
					if s ="01" then anody <= "0010"; else null; end if; 
				when "10" => digit <= x(11 downto 8);
					if s ="10" then anody <= "0100"; else null; end if; 
				when others => digit <= x(15 downto 12);
					if s ="11" then anody <= "1000"; else null; end if; 
			end case;
			end if; 
	end process;		
	
--		
	process (clk, digit) is
	begin 
		if (clk'event and clk ='1') then
			case digit is
				when X"0" => a_to_g <= "1111110";			--definicja cyfry 0
				when X"1" => a_to_g <= "0110000";			--definicja cyfry 1
				when X"2" => a_to_g <= "1101101";			--definicja cyfry 2
				when X"3" => a_to_g <= "1111001";			--definicja cyfry 3
				when X"4" => a_to_g <= "0110011";			--definicja cyfry 4
				when X"5" => a_to_g <= "1011011";			--definicja cyfry 5
				when X"6" => a_to_g <= "1011111";			--definicja cyfry 6
				when X"7" => a_to_g <= "1110010";			--definicja cyfry 7
				when X"8" => a_to_g <= "1111111";			--definicja cyfry 8
				when X"9" => a_to_g <= "1111011";			--definicja cyfry 9
				when others => a_to_g <= "1001111";			--definicja litery E
			end case;
		end if; 
	end process;
--			
	process (clk)
		 begin
			  if (clk'event and clk = '1') then
					clk_div <= clk_div + '1';
			  end if;
	end process;
--		
    process (clk_div(17))
    begin
        if (clk_div(17)'Event and clk_div(17) = '1') then

                s <= s + '1';   
        end if;
    end process;


end Behavioral;




--s<= sel;
--signal sel : STD_LOGIC_VECTOR (1 downto 0);

--preskaler : process (clk,reset)
--		 begin
--				if (reset = '1') then
--					--s<=(others=>'0');
--					sel<=(others=>'0');
--				elsif (clk'event and clk = '1') then
--					clk_div <= clk_div + '1';
--					if (clk_div = "00111101000010010000") then
--					  --if (clk_div = "00000000000000000100") then
--						sel <= sel + '1';
--						clk_div <= "00000000000000000000";
--					end if;
--				end if;
--end process preskaler;
--
--ktory : process (clk, reset,sel, x)
--begin 
--				if (reset = '1') then
--					anody<=(others=>'0');
--					digit<=(others=>'0');
--				elsif(clk'Event and clk='1') then
--					if sel="00" then 
--						digit<= x(3 downto 0);
--						anody<="0001";
--					end if;
--					if sel="01" then 
--						digit<= x(7 downto 4);
--						anody<="0010";
--					end if;
--					if sel="10" then 
--						digit<= x(11 downto 8);
--						anody<="0100";
--					end if;
--					if sel="11" then 
--						digit<= x(15 downto 12);
--						anody<="1000";
--					end if;
--					if (digit =x"0") then
--						a_to_g <= "1111110";
--					end if;
--					if (digit =x"1") then
--						a_to_g <= "0110000";
--					end if;
--					if (digit =x"2") then
--						a_to_g <= "1101101";
--					end if;
--					if (digit =x"3") then
--						a_to_g <= "1111001";
--					end if;
--					if (digit =x"4") then
--						a_to_g <= "0110011";
--					end if;
--					if (digit =x"5") then
--						a_to_g <= "1011011";
--					end if;
--					if (digit =x"6") then
--						a_to_g <= "1011111";
--					end if;
--					if (digit =x"7") then
--						a_to_g <= "1110010";
--					end if;
--					if (digit =x"8") then
--						a_to_g <= "1111111";
--					end if;
--					if (digit =x"9") then
--						a_to_g <= "1111011";
--					end if;
--				end if;
--end process ktory;
--		
--
--liczba_na : process (clk, reset, digit)
--begin 
--		if (reset = '1') then
--					digit<=(others=>'0');
--		elsif (clk'Event and clk='1') then
--			if (digit =x"0") then
--				a_to_g <= "1111110";
--			end if;
--			if (digit =x"1") then
--				a_to_g <= "0110000";
--			end if;
--			if (digit =x"2") then
--				a_to_g <= "1101101";
--			end if;
--			if (digit =x"3") then
--				a_to_g <= "1111001";
--			end if;
--			if (digit =x"4") then
--				a_to_g <= "0110011";
--			end if;
--			if (digit =x"5") then
--				a_to_g <= "1011011";
--			end if;
--			if (digit =x"6") then
--				a_to_g <= "1011111";
--			end if;
--			if (digit =x"7") then
--				a_to_g <= "1110010";
--			end if;
--			if (digit =x"8") then
--				a_to_g <= "1111111";
--			end if;
--			if (digit =x"9") then
--				a_to_g <= "1111011";
--			end if;
--		end if;
--end process liczba_na;

