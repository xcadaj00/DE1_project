library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture testbench of tb_top is

-- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_keyboard   : std_logic_vector(4 - 1 downto 0);
    signal s_cathodes   : std_logic_vector(8 - 1 downto 0);
    signal s_anodes     : std_logic_vector(4 - 1 downto 0);
    
    signal s_led        : std_logic_vector(2 - 1 downto 0);
    signal s_relay      : std_logic;
    signal s_siren      : std_logic;

begin
    -- Connecting testbench signals with tlc entity (Unit Under Test)
    uut_top : entity work.top
        port map(
            CLK100MHZ  => s_clk_100MHz,
            BTN0       => s_reset,
            KEYBOARD   => s_keyboard,    
            IO7        => s_cathodes(0), -- A
            IO8        => s_cathodes(1), -- B
            IO10       => s_cathodes(2), -- C
            IO12       => s_cathodes(3), -- D
            IO13       => s_cathodes(4), -- E
            IO34       => s_cathodes(5), -- F
            IO9        => s_cathodes(6), -- G
            IO11       => s_cathodes(7), -- DP
            IO6        => s_anodes(0),   -- A1
            IO33       => s_anodes(1),   -- A2
            IO32       => s_anodes(2),   -- A3
            IO5        => s_anodes(3),   -- A4
            IO3        => s_led(0),      -- red
            IO30       => s_led(1),      -- green
            IO31       => s_relay,  
            IO4        => s_siren
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 600 us loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 10 us;
        -- Reset activated
        s_reset <= '1'; wait for 10 us;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- try bad pin
        s_keyboard <= "1111";
        wait for 30 us;
        s_keyboard <= "0000";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0001";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0010";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0011";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "1011";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 30 us;
        
        -- try timeout
        s_keyboard <= "0000";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0001";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 30 us;
        
        -- try clear
        s_keyboard <= "0000";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0001";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "1010";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        
        -- try correct pin
        s_keyboard <= "0100";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0011";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0010";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "0001";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 10 us;
        s_keyboard <= "1011";
        wait for 5 us;
        s_keyboard <= "1111";
        wait for 30 us;

        wait;
    end process p_stimulus;

end architecture testbench;
