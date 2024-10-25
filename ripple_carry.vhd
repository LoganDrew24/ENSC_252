-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry is
    Port (
	 X, Y : in std_logic_vector ( 3 downto 0 );
	 Cin : in std_logic_vector (0 downto 0);
	 Sum : out std_logic_vector ( 3 downto 0 );
	 Cout : out std_logic
	 );
end ripple_carry;

architecture Behavior of ripple_carry is
COMPONENT full_adder
Port (
        A : in  STD_LOGIC;  -- First input
        B : in  STD_LOGIC;  -- Second input
        C : in  STD_LOGIC;  -- Carry input
        Sum : out  STD_LOGIC;  -- Sum output
        Carry : out  STD_LOGIC  -- Carry output
    );
END COMPONENT;
signal Carry, S : std_logic_vector ( 3 downto 0 );
begin

inst1: full_adder
port map (X(0), Y(0), Cin(0), S(0), Carry(0));

inst2: full_adder
port map (X(1), Y(1), Carry(0), S(1), Carry(1));

inst3: full_adder
port map (X(2), Y(2), Carry(1), S(2), Carry(2));

inst4: full_adder
port map (X(3), Y(3), Carry(2), S(3), Carry(3));

Sum <= S;

Cout <= Carry(3);

end Behavior;