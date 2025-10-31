library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity adder_subtracter_tb is
end adder_subtracter_tb;

architecture TB_ARCHITECTURE of adder_subtracter_tb is
	-- Component declaration of the tested unit
	component adder_subtracter
	port(
		A : in SIGNED(15 downto 0);
		B : in SIGNED(15 downto 0);
		Func : in STD_LOGIC_VECTOR(1 downto 0);
		Cin : in STD_LOGIC;
		R : out SIGNED(15 downto 0);
		Cout : out STD_LOGIC;
		O_F : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	 signal A : SIGNED(15 downto 0) := (others => '0');
    signal B : SIGNED(15 downto 0) := (others => '0');
    signal Func : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Cin : STD_LOGIC := '0';
	-- Observed signals - signals mapped to the output ports of tested entity
	signal R : SIGNED(15 downto 0);
	signal Cout : STD_LOGIC;
	signal O_F : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : adder_subtracter
		port map (
			A => A,
			B => B,
			Func => Func,
			Cin => Cin,
			R => R,
			Cout => Cout,
			O_F => O_F
		);	   
		
		Stim: process
    begin

        A <= to_signed(15, 16);
        B <= to_signed(10, 16);
        Func <= "00";
        Cin <= '0';
        wait for 10 ns;
		
		 A <= to_signed(16#7FFF#, 16); -- 0111111111111111
        B <= to_signed(1, 16);         -- 0000000000000001
        Func <= "00";                  
        Cin <= '0';
        wait for 10 ns;


        A <= to_signed(16#7FFF#, 16);  -- 0111111111111111
        B <= to_signed(16#7FFF#, 16);  -- 0111111111111111
        Func <= "00";                  
        Cin <= '0';
        wait for 10 ns;


        A <= to_signed(0, 16);         -- 0000000000000000
        B <= to_signed(-1, 16);        -- 1111111111111111
        Func <= "10";                  
        Cin <= '0';
        wait for 10 ns;


        A <= to_signed(16#8000#, 16);  -- 1000000000000000 
        B <= to_signed(1, 16);         -- 0000000000000001
        Func <= "10";                 
        Cin <= '0';
        wait for 10 ns;


        A <= to_signed(16#7FFF#, 16);  -- 0111111111111111
        B <= to_signed(16#7FFF#, 16);  -- 0111111111111111
        Func <= "01";                  
        Cin <= '1';
        wait for 10 ns;

        wait;
    end process;

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder_subtracter of adder_subtracter_tb is
	for TB_ARCHITECTURE
		for UUT : adder_subtracter
			use entity work.adder_subtracter(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_adder_subtracter;

