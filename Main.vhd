----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:05 04/10/2016 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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

entity Main is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  p1: in STD_LOGIC;
			  p2: in STD_LOGIC;
			  clock_set: in STD_LOGIC;
			  cc: in STD_LOGIC;
			  start_stop: in STD_LOGIC;
			  dot: out std_logic;
			  a_to_g : out STD_LOGIC_VECTOR (6 downto 0);
			  anody : out STD_LOGIC_VECTOR (3 downto 0));
end Main;

architecture Behavioral of Main is
type STANY is (USTAW_ZEGAR, PRACA, CZYSC, STOPER); 

signal STAN, STAN_NAST : STANY; 
signal counter:  std_logic_vector (25 downto 0);
signal clk_div1:  std_logic_vector (25 downto 0);
signal bufor_1: std_logic_vector (7 downto 0);
signal bufor_2: std_logic_vector (7 downto 0);
signal bufor_dsek: std_logic_vector (7 downto 0);
signal bufor_sek: std_logic_vector (7 downto 0);
signal bufor_min: std_logic_vector (7 downto 0);
signal bufor_h: std_logic_vector (7 downto 0);

begin 
blok_wys : entity work.BCD
    port map (CLK=>clk, bufor_1=>bufor_1, a_to_g =>a_to_g, bufor_2=>bufor_2, anody=>anody, dot=>dot);

reg:process(clk,reset)
begin
		if (reset='1')then
			STAN<=USTAW_ZEGAR;
		elsif(clk'Event and clk='1') then
			STAN<=STAN_NAST;
		end if;
end process reg;
automat : process (reset, clock_set, STAN, clk, cc, start_stop, bufor_dsek, bufor_sek, bufor_min, bufor_h)
begin
		STAN_NAST <= STAN;
		case STAN is 
			when USTAW_ZEGAR =>
				bufor_1 <= bufor_min;
				bufor_2 <= bufor_h;
				if (clock_set='1') then
					STAN_NAST <= PRACA;				
				end if;
			when PRACA =>
				bufor_1 <= bufor_min;
				bufor_2 <= bufor_h;
				if (cc='1') then
					STAN_NAST <= CZYSC;
				end if;
			when CZYSC =>
				if (start_stop='1') then 
					STAN_NAST <= STOPER;
				end if;
			when STOPER =>
				bufor_1 <= bufor_dsek;
				bufor_2 <= bufor_sek;
				if (cc='1') then
					STAN_NAST <= CZYSC;
				end if;
				if (start_stop='1') then
					STAN_NAST <= PRACA;
				end if;
			end case;
	
end process automat;

licznik : process (clk, reset,p1,p2,STAN, clk_div1)
begin 	
		if (reset = '1' or STAN=CZYSC) then
			counter<=(others=>'0');
			bufor_dsek<=(others=>'0');
			bufor_sek <=(others=>'0');
			bufor_min <=(others=>'0');
			bufor_h <=(others=>'0');
		elsif (clk'Event and clk = '1') then
			clk_div1 <= clk_div1 + '1'; -- preskalery do ustawienia godziny
			if (p1= '1' and STAN=USTAW_ZEGAR and clk_div1 = "0100110001001011010000000" ) then	-- przycisk 1 ( regulacja minut )
						bufor_min <= bufor_min + x"1";
					end if;
			if (p2= '1' and STAN=USTAW_ZEGAR and clk_div1 = "0100110001001011010000000") then	-- przycisk 2 ( reguacja godzin )
						bufor_h <= bufor_h + x"1";
					end if;
			if (counter = "00000001111010000100100000" and (STAN=PRACA or STAN=STOPER)) then  -- zlicza 1/100 sekundy tj 500tyœ cykli
				counter <=(others=>'0');
				bufor_dsek <= bufor_dsek + 1;
				if( bufor_dsek = "01100100" and (STAN=PRACA or STAN = STOPER)) then -- po doliczeniu do jednej sekundy kolejny licznik inkrementuje sie
					bufor_dsek<=(others=>'0');
					bufor_sek <= bufor_sek +1;
					if (bufor_sek = "00111011"and (STAN=PRACA or STAN = STOPER)) then
						bufor_sek<=(others=>'0');
						bufor_min<=bufor_min + 1; 
						if (bufor_min ="00111011"and (STAN=PRACA or STAN = STOPER)) then
							bufor_min<=(others=>'0');
							bufor_h<=bufor_h + 1;
							if (bufor_h = "00010111"and STAN=PRACA) then
								bufor_h<=(others=>'0');
							end if;
						end if;
					end if;
				 end if;
			else
				counter <= counter + 1;
			end if;
		end if;

end process licznik;
end Behavioral;


