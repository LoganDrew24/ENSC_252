-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_top is
    Port (
	 --X, Y : in std_logic_vector ( 3 downto 0 );
	 --Cin : in std_logic;
	 SW : in std_logic_vector (8 downto 0);
	 --Sum : out std_logic_vector ( 3 downto 0 );
	 --Cout : out std_logic
	 LEDR : out std_logic_vector (4 downto 0);
	 HEX0 : out std_logic_vector (6 downto 0)
	 );
end ripple_top;

architecture LogicFunction of ripple_top is

--SegDecoder is needed
component SegDecoder is
Port ( D : in std_logic_vector( 3 downto 0 ); -- 4 input vector
 Y : out std_logic_vector( 6 downto 0 ) ); -- 7 output vector
end component;
 
COMPONENT ripple_carry is
Port (
	 X, Y : in std_logic_vector ( 3 downto 0 );
	 Cin : in std_logic_vector (0 downto 0);
	 Sum : out std_logic_vector ( 3 downto 0 );
	 Cout : out std_logic_vector (0 downto 0)
	 );
END COMPONENT;

signal sig : std_logic_vector ( 3 downto 0 );
signal Cin_sig : std_logic_vector (0 downto 0);
signal Cout_sig : std_logic_vector (0 downto 0);

begin

Cin_sig(0) <= SW(8);

Ripple1 : ripple_carry
port map (
			 SW(7 downto 4), SW(3 downto 0), Cin_sig, sig(3 downto 0), Cout_sig
			 );
LEDR(4) <= Cout_sig(0);

LEDR( 3 downto 0 ) <= sig( 3 downto 0 );

inst1 : SegDecoder
port map (
			 sig(3 downto 0), HEX0
			 );

end LogicFunction;
