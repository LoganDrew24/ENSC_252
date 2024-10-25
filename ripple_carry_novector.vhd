-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_novector is
    Port (
	 x0, x1, x2, x3, y0, y1, y2, y3, Cin : in std_logic;
	 s0, s1, s2, s3, Cout : out std_logic
	 );
end ripple_carry_novector;

architecture Behavior of ripple_carry_novector is
COMPONENT full_adder
Port (
        A : in  STD_LOGIC;  -- First input
        B : in  STD_LOGIC;  -- Second input
        C : in  STD_LOGIC;  -- Carry input
        Sum : out  STD_LOGIC;  -- Sum output
        Carry : out  STD_LOGIC  -- Carry output
    );
END COMPONENT;
signal Carry : std_logic_vector ( 3 downto 0 );
begin

inst1: full_adder
port map (x0, y0, Cin, s0, Carry(0));

inst2: full_adder
port map (x1, y1, Carry(0), s1, Carry(1));

inst3: full_adder
port map (x2, y2, Carry(1), s2, Carry(2));

inst4: full_adder
port map (x3, y3, Carry(2), s3, Carry(3));

Cout <= Carry(3);

end Behavior;