-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the Full Adder
entity full_adder is
    Port (
        A : in  STD_LOGIC;  -- First input
        B : in  STD_LOGIC;  -- Second input
        C : in  STD_LOGIC;  -- Carry input
        Sum : out  STD_LOGIC;  -- Sum output
        Carry : out  STD_LOGIC  -- Carry output
    );
end full_adder;

-- Architecture declaration using simple signal assignments
architecture Behavior of full_adder is
begin
    -- Sum is calculated using XOR gates
    Sum <= A xor B xor C;

    -- Cout is calculated using AND and OR gates
    Carry <= (A and B) or (A and C) or (B and C);
end Behavior;