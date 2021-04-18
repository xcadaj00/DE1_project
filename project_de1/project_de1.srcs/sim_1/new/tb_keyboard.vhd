----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 03:52:26 PM
-- Design Name: 
-- Module Name: tb_keyboard - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_keyboard is
--  Port ( );
end tb_keyboard;

architecture testbench of tb_keyboard is
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_col		: unsigned(2 downto 0);
	signal s_row		: unsigned(3 downto 0);
	signal s_button     : unsigned(3 downto 0);	
begin
    uut_keyboard : entity work.keyboard
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            col_i   => s_col,
            row_o   => s_row,
            button_o => s_button 
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        report "running keyboard tests" severity note;
        
        s_reset <= '0';
        wait until rising_edge(s_clk_100MHz);
        s_reset <= '1';
        wait until rising_edge(s_clk_100MHz);
        s_reset <= '0'; 
        
        s_col <= "111"; wait for 60 ns;
        
        s_col <= "011"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "101"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "110"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "011"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "101"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "110"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "011"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "101"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "110"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "011"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "101"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        s_col <= "110"; wait for 50 ns;
        s_col <= "111"; wait for 10 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end testbench;
