--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:55:16 05/08/2016
-- Design Name:   
-- Module Name:   C:/Users/Jacob/Desktop/PUL/Liczn/Main_TB.vhd
-- Project Name:  Liczn
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Main_TB IS
END Main_TB;
 
ARCHITECTURE behavior OF Main_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         p1 : IN  std_logic;
         p2 : IN  std_logic;
         clock_set : IN  std_logic;
         cc : IN  std_logic;
         start_stop : IN  std_logic;
         dot : OUT  std_logic;
         a_to_g : OUT  std_logic_vector(6 downto 0);
         anody : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal p1 : std_logic := '0';
   signal p2 : std_logic := '0';
   signal clock_set : std_logic := '0';
   signal cc : std_logic := '0';
   signal start_stop : std_logic := '0';

 	--Outputs
   signal dot : std_logic;
   signal a_to_g : std_logic_vector(6 downto 0);
   signal anody : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          clk => clk,
          reset => reset,
          p1 => p1,
          p2 => p2,
          clock_set => clock_set,
          cc => cc,
          start_stop => start_stop,
          dot => dot,
          a_to_g => a_to_g,
          anody => anody
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
			reset <= '1';
		wait for 50 ns;
			reset <= '0';
			p1 <= '1';
			p2 <= '1';
		wait for 1 ns; 
			clock_set <= '1';
		wait for 5 us;
			cc <= '1';
		wait for 1 ns;
			cc <= '0';
			start_stop <='1';
		wait for 1 ns;
			start_stop <='0';
		wait for 1 us;
			start_stop <='1';
		wait for 1 ns;
			start_stop <='0';
		wait for 10 us;
      assert false severity failure;
   end process;

END;
