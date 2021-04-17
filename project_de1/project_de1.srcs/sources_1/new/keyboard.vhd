library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is 
port(
	clk			:   in  std_logic;
    reset		:   in  std_logic;
    col_i		:   in  unsigned(2 downto 0);
	row_o		:   out unsigned(3 downto 0);	
    button_o	:   out unsigned(3 downto 0)
);
end keyboard;

architecture Behavioral of keyboard is
   
    signal s_en  : std_logic;
    signal s_row_o : unsigned(3 downto 0); -- for reading from row_o

begin
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 1 -- 100ms with 10kHz signal
        )
        port map(
            clk     =>  clk,
            reset   =>  reset,
            ce_o    =>  s_en
        );

	p_keyboard: process(clk)
	begin
		if rising_edge(clk) then
			if reset = '0' then
                s_row_o <= "0111";
			elsif s_en = '1' then
			
				if (s_row_o = "0111") then
					if (col_i = "011") then
						button_o <= "0001"; -- 1
					elsif (col_i = "101") then
						button_o <= "0010"; -- 2
					elsif (col_i = "110") then
						button_o <= "0011"; -- 3
					else 
					   button_o <= "1111";
					   s_row_o <= "1011";
					end if;
					
				elsif (s_row_o = "1011") then
					if (col_i = "011") then
						button_o <= "0100"; -- 4
					elsif (col_i = "101") then
						button_o <= "0101"; -- 5
					elsif (col_i = "110") then
						button_o <= "0110"; -- 6
					else 
					   button_o <= "1111";
					   s_row_o <= "1101";
					end if;
					
				elsif (s_row_o = "1101") then
					if (col_i = "011") then
						button_o <= "0111"; -- 7
					elsif (col_i = "101") then
						button_o <= "1000"; -- 8
					elsif (col_i = "110") then
						button_o <= "1001"; -- 9
					else 
					   button_o <= "1111";
					   s_row_o <= "1110";
					end if;
					
				elsif (s_row_o = "1110") then
					if (col_i = "011") then
						button_o <= "1010"; -- clear
					elsif (col_i = "101") then
						button_o <= "1011"; -- 0
					elsif (col_i = "110") then
						button_o <= "1100"; -- enter
					else 
					   button_o <= "1111";
					   s_row_o <= "0111";
					end if;
					
				else 
				    s_row_o <= "0111";
				end if;
				
			end if;
		end if;	
	end process p_keyboard;
	
	row_o <= s_row_o;
	
end;