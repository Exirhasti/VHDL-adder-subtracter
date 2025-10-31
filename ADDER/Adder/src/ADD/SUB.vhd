library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Subtracter is
    Port (
        A : in SIGNED(15 downto 0); 
        B : in SIGNED(15 downto 0); 
        Func : in STD_LOGIC_VECTOR(1 downto 0); 
        Cin : in STD_LOGIC;
        R : out SIGNED(15 downto 0); 
        Cout : out STD_LOGIC;
        O_F : out STD_LOGIC
    );
end Adder_Subtracter;

architecture Behavioral of Adder_Subtracter is
    signal B_in : SIGNED(15 downto 0);
    signal sum : SIGNED(16 downto 0); 
begin

    with Func select
        B_in <= B      when "00",
                 B      when "01",
                 NOT B  when "10",
                 NOT B  when "11",
                 (others => '0') when others;

    process(A, B_in, Func, Cin)
    begin
        case Func is
            when "00" => 
                sum <= SIGNED(A(15) & A) + SIGNED(B_in(15) & B_in);
            
            when "01" => 
                sum <= SIGNED(A(15) & A) + SIGNED(B_in(15) & B_in) + SIGNED("0000000000000000" & Cin);
            
            when "10" =>
                sum <= SIGNED(A(15) & A) + SIGNED(B_in(15) & B_in) + 1;
            
            when "11" => 
                sum <= SIGNED(A(15) & A) + SIGNED(B_in(15) & B_in) + SIGNED("0000000000000000" & Cin);
            
            when others =>
                sum <= (others => '0');
        end case;
    end process;

    R <= sum(15 downto 0);
    Cout <= std_logic(sum(16));
    O_F <= sum(15) xor sum(16);

end Behavioral;
