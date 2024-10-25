-- Logan Drew, 301477251; Birlyne Brown, 301477243; Minhao Zhu, 301541030
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_top_novector is
    Port (
	 --X, Y : in std_logic_vector ( 3 downto 0 );
	 --Cin : in std_logic;
	 SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8 : in std_logic;
	 --Sum : out std_logic_vector ( 3 downto 0 );
	 --Cout : out std_logic
	 LEDR0,LEDR1,LEDR2,LEDR3,LEDR4 : out std_logic;
	 HEX0 : out std_logic_vector (6 downto 0)
	 );
end ripple_top_novector;

architecture LogicFunction of ripple_top_novector is

--SegDecoder is needed
component SegDecoder is
Port ( D : in std_logic_vector( 3 downto 0 ); -- 4 input vector
 Y : out std_logic_vector( 6 downto 0 ) ); -- 7 output vector
end component;
 
COMPONENT ripple_carry_novector is
Port (
	 x0, x1, x2, x3, y0, y1, y2, y3, Cin : in std_logic;
	 s0, s1, s2, s3, Cout : out std_logic
	 );
END COMPONENT;

signal sig0,sig1,sig2,sig3 : std_logic;
signal sig : std_logic_vector;
signal Cout_sig : std_logic;

begin

Ripple1 : ripple_carry_novector
port map (
			 SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8, sig0, sig1, sig2, sig3, Cout_sig
			 );
LEDR4 <= Cout_sig;

sig(0) <= sig0;
sig(1) <= sig1;
sig(2) <= sig2;
sig(3) <= sig3;

inst1 : SegDecoder
port map (
			 sig, HEX0
			 );

end LogicFunction;