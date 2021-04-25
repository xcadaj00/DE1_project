library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dls is
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        --keyboard_i : in  std_logic_vector (4 - 1 downto 0);
        col_i	   :   in  unsigned(2 downto 0);
        row_o	   :   out unsigned(3 downto 0);
        --data0_o    : out std_logic_vector (4 - 1 downto 0);
        --data1_o    : out std_logic_vector (4 - 1 downto 0);
        --data2_o    : out std_logic_vector (4 - 1 downto 0);
        --data3_o    : out std_logic_vector (4 - 1 downto 0);
        --led_o      : out std_logic_vector (2 - 1 downto 0);
        relay_o    : out std_logic;
        siren_o    : out std_logic
     
     
     );
end dls;

architecture Behavioral of dls is

begin


end Behavioral;
