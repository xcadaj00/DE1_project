----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2021 20:30:10
-- Design Name: 
-- Module Name: top - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  Port ( 
     CLK         :   in STD_LOGIC;   -- Main Clock
     BTN         :   in STD_LOGIC;   -- Synchronous reset
     SW          :   in std_logic_vector(16 - 1 downto 0); 
     ja          :   out std_logic_vector(8 - 1 downto 0); -- Cathods + dig_o(3)
     col_1       :   in std_logic; -- jc(7)
     col_2       :   in std_logic; -- jc(8)
     col_3       :   in std_logic; -- jc(9)
     jc          :   out std_logic_vector(5 - 1 downto 0); --row_o + button_o(3)
     jd          :   out std_logic_vector(3 - 1 downto 0);
     jb          :   out std_logic_vector(4 - 1 downto 0)  --jb[10]
  
     
  );
    
end top;

architecture Behavioral of top is

begin
     driver_seg_4 : entity work.driver_7seg_4digits
     port map(
            clk     => CLK,
            reset   => BTN,
        
            data0_i(3) => SW(3),
            data0_i(2) => SW(2),
            data0_i(1) => SW(1),
            data0_i(0) => SW(0),
            
            data1_i(3) => SW(7),
            data1_i(2) => SW(6),
            data1_i(1) => SW(5),
            data1_i(0) => SW(4),
            
            data2_i(3) => SW(11),
            data2_i(2) => SW(10),
            data2_i(1) => SW(9),
            data2_i(0) => SW(8),
            
            data3_i(3) => SW(15),
            data3_i(2) => SW(14),
            data3_i(1) => SW(13),
            data3_i(0) => SW(12),
            
            dp_i => "1111",
            dp_o => jb(10),
            
            seg_o(6) => ja(1), -- Cat_A
            seg_o(5) => ja(2), -- Cat_B
            seg_o(4) => ja(3), -- Cat_C   -- A12 není chyba. Záměna za A11
            seg_o(3) => ja(4), -- Cat_D
            seg_o(2) => ja(7), -- Cat_E
            seg_o(1) => ja(8), -- Cat_F
            seg_o(0) => ja(9), -- Cat_G
            
            dig_o(3) => ja(10),
            dig_o(2) => jb(1), --E16 není
            dig_o(1) => jb(2),
            dig_o(0) => jb(3)
     );

     keyboard : entity work.keyboard
        port map(
          clk           =>  CLK,
          reset	        =>  BTN,
          col_i(2)	    =>  col_1,   -- Col_1 jc(7)
          col_i(1)	    =>  col_2,   -- Col_2 jc(8)
          col_i(0)	    =>  col_3,   -- Col_3 jc(9)
   	      row_o(3)	    =>  jc(1),	-- Row_0
          row_o(2)      =>  jc(2),	-- Row_1
          row_o(1)	    =>  jc(3),	-- Row_2
          row_o(0)	    =>  jc(4),	-- Row_3
          button_o(3)   =>  jc(10),
          button_o(2)   =>  jd(1),
          button_o(1)   =>  jd(2),
          button_o(0)   =>  jd(3)
   
    );
    
  --   fsm : entity work.fsm
    -- port map(
  --      clk         =>  CLK,
  --      reset	       =>  BTN,
  --      keyboard_i   =>    ,
  --      disp0_o      => ,
  --      disp1_o      => ,
  --      disp2_o      => ,
  --      disp3_o      => ,
  --      disp_en_o    => ,
  --      led_o(1)     => jb(7),
  --      led_o(0)     => jb(4),
  --      relay_o      => jb(8) ,
  --      siren_o      => jb(9)
  
  
 --   );

end Behavioral;
