--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:11:34 04/11/2016
-- Design Name:   
-- Module Name:   C:/Users/Jacob/Desktop/VLSI/PUL/Liczn/Nosz.vhd
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
 
ENTITY Nosz IS
END Nosz;
 
ARCHITECTURE behavior OF Nosz IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         clk : IN  std_logic;
			clock_set : IN  std_logic;
			p1 : IN  std_logic;
			p2 : IN  std_logic;
			cr : IN  std_logic;
         reset : IN  std_logic;
         a_to_g : OUT  std_logic_vector(6 downto 0);
         anody : OUT  std_logic_vector(3 downto 0)
--         out_min : OUT  std_logic_vector(7 downto 0);
--         out_h : OUT  std_logic_vector(7 downto 0);
--         out_sec : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal clock_set :  std_logic:= '0';
	signal		p1 :   std_logic:= '0';
	signal		p2 :   std_logic:= '0';
	signal		cr :   std_logic:= '0';

 	--Outputs
   signal a_to_g : std_logic_vector(6 downto 0);
   signal anody : std_logic_vector(3 downto 0);
--   signal out_min : std_logic_vector(7 downto 0);
--   signal out_h : std_logic_vector(7 downto 0);
--   signal out_sec : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          clk => clk,
          reset => reset,
          a_to_g => a_to_g,
          anody => anody,
			 clock_set => clock_set,
			 p1 => p1,
			 p2 => p2,
			 cr => cr
--          out_min => out_min,
--          out_h => out_h,
--          out_sec => out_sec
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
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
      wait for 10 us;	


      -- insert stimulus here 

      assert false severity failure;
   end process;

END;
