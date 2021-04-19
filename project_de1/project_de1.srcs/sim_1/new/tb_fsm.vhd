library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_fsm is
    -- Entity of testbench is always empty
end entity tb_fsm;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_fsm is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_keyboard   : std_logic_vector(4 - 1 downto 0);
    signal s_disp0      : std_logic_vector(4 - 1 downto 0);
    signal s_disp1      : std_logic_vector(4 - 1 downto 0);
    signal s_disp2      : std_logic_vector(4 - 1 downto 0);
    signal s_disp3      : std_logic_vector(4 - 1 downto 0);
    signal s_disp_en    : std_logic_vector(4 - 1 downto 0);
    signal s_led        : std_logic_vector(2 - 1 downto 0);
    signal s_relay      : std_logic;
    signal s_siren      : std_logic;

begin
    -- Connecting testbench signals with tlc entity (Unit Under Test)
    uut_fsm : entity work.fsm
        port map(
            clk        => s_clk_100MHz,
            reset      => s_reset,
            keyboard_i => s_keyboard, 
            disp0_o    => s_disp0,
            disp1_o    => s_disp1, 
            disp2_o    => s_disp2, 
            disp3_o    => s_disp3, 
            disp_en_o  => s_disp_en,
            led_o      => s_led,    
            relay_o    => s_relay,  
            siren_o    => s_siren
            
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
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
        s_reset <= '0'; wait for 200 ns;
        -- Reset activated
        s_reset <= '1'; wait for 300 ns;
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
        wait for 600 ns;
        s_keyboard <= "0000";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0001";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0010";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0011";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "1011";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 150 ns;
        
        -- try timeout
        
        s_keyboard <= "0000";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0001";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 150 ns;
        
        -- try clear
        s_keyboard <= "0000";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0001";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "1010";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 150 ns;
        
        -- try correct pin
        s_keyboard <= "0100";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0011";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0010";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "0001";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 50 ns;
        s_keyboard <= "1011";
        wait for 10 ns;
        s_keyboard <= "1111";
        wait for 150 ns;

        wait;
    end process p_stimulus;

end architecture testbench;