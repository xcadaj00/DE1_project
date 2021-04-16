----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2021 20:09:49
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
    Port ( 
        clk     : in  std_logic;
        reset   : in  std_logic;
        south_i : in  std_logic; -- South sensor
        west_i  : in  std_logic; -- West sensor
        -- Traffic lights (RGB LEDs) for two directions
        south_o : out std_logic_vector(3 - 1 downto 0);
        west_o  : out std_logic_vector(3 - 1 downto 0)
    );
end fsm;

architecture Behavioral of fsm is

-- Define the states
    type t_state is (S_WAIT,
                     S_FIRST,
                     S_SECOND,
                     S_THIRD,
                     S_FORTH,
                     S_CORRECT,
                     S_WRONG
                     );
    -- Define the signal that uses different states
    signal s_state  : t_state;

    -- Internal clock enable
    signal s_en     : std_logic;
    -- Local delay counter
    signal   s_cnt  : unsigned(5 - 1 downto 0);

    -- Specific values for local counter
    constant c_DELAY_2SEC   : unsigned(5 - 1 downto 0) := b"0_1000";
    constant c_DELAY_5SEC   : unsigned(5 - 1 downto 0) := b"1_0100";
    constant c_ZERO         : unsigned(5 - 1 downto 0) := b"0_0000";

begin

--------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 250 ms (4 Hz). Remember that the frequency of the clock 
    -- signal is 100 MHz.
    
    -- JUST FOR SHORTER/FASTER SIMULATION
    s_en <= '1';
--    clk_en0 : entity work.clock_enable
--        generic map(
--            g_MAX =>        -- g_MAX = 250 ms / (1/100 MHz)
--        )
--        port map(
--            clk   => clk,
--            reset => reset,
--            ce_o  => s_en
--        );

    --------------------------------------------------------------------
    -- p_doorlock_fsm:
    -- The sequential process with synchronous reset and clock_enable 
    -- entirely controls the s_state signal by CASE statement.
    --------------------------------------------------------------------
    p_doorlock_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= S_WAIT ;     -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    when goS =>
                        if (s_cnt < c_DELAY_3SEC) then
                            s_cnt <= s_cnt + 1;
                        elsif (west_i = '1') then
                            -- Move to the next state
                            s_state <= waitS;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when waitS =>
                        -- WRITE YOUR CODE HERE
                        if (s_cnt < c_DELAY_0p5SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= goW;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when goW =>
                        if (s_cnt < c_DELAY_3SEC) then
                            s_cnt <= s_cnt + 1;
                        elsif (south_i = '1') then
                            -- Move to the next state
                            s_state <= waitW;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                        
                    when waitW =>
                        -- WRITE YOUR CODE HERE
                        if (s_cnt < c_DELAY_0p5SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= goS;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                        
                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= goS;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_doorlock_fsm;

    --------------------------------------------------------------------
    -- p_output_fsm:
    -- The combinatorial process is sensitive to state changes, and sets
    -- the output signals accordingly. This is an example of a Moore 
    -- state machine because the output is set based on the active state.
    --------------------------------------------------------------------
    p_output_fsm : process(s_state)
    begin
        case s_state is
                -- WRITE YOUR CODE HERE
            when goW =>
                south_o <= "100";  -- Red
                west_o  <= "010";  -- Green
            when waitW =>
                south_o <= "100";  -- Red
                west_o  <= "110";  -- Yellow
            when goS =>
                south_o <= "010";  -- Green
                west_o  <= "100";  -- Red
            when waitS =>
                south_o <= "110";  -- Yellow
                west_o  <= "100";  -- Red

            when others =>
                south_o <= "100";  -- Red
                west_o  <= "100";  -- Red
        end case;
    end process p_output_fsm;

end Behavioral;
