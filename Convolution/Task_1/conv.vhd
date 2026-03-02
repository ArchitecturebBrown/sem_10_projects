----------------------------------------- old non-working code
-----library IEEE;
------use IEEE.std_logic_1164.all;
------use IEEE.numeric_std.all;

------package my_type is
------    type filter_array is array(0 to 2, 0 to 2) of signed(7 downto 0);
------    type cell_array   is array(0 to 5, 0 to 5) of signed(7 downto 0);
------    type pixel_array is array(0 to 3, 0 to 3) of signed(19 downto 0);
------end package;

------library IEEE;
------use IEEE.std_logic_1164.all;
------use IEEE.numeric_std.all;
------use work.my_type.all;

------entity Full_conv_seq is
------    port(
------        clk           : in  std_logic;
------        reset         : in  std_logic;

------        filter_in     : in  signed(7 downto 0);
--------        load_filter   : in  std_logic;
------        start: in std_logic;
------        cell_in       : in  signed(7 downto 0);
--------        load_cell     : in  std_logic;

------        pixel_out_seq     : out signed(19 downto 0);
------        pixel_valid ,f_d,c_d  : out std_logic
        
------    );
------end Full_conv_seq;

------architecture seq_conv of Full_conv_seq is

------    signal filter_mem : filter_array := (others => (others => (others=>'0')));
------    signal cell_mem   : cell_array   := (others => (others => (others=>'0')));
------    signal pixel_mem : pixel_array := (others => (others => (others=>'0')));    

------    signal filter_cnt : integer range 0 to 8 := 0;
------    signal cell_cnt   : integer range 0 to 35 := 0;

------    type state_type is (IDLE, MAC, NEXT_PIXEL, DONE);
------    signal state : state_type := IDLE;

------    signal r, c : integer range 0 to 3 := 0;
------    signal i, j : integer range 0 to 2 := 0;

------    signal acc : signed(19 downto 0) := (others=>'0');
------    signal c_done,f_done :std_logic:='0';
------begin

------    ----------------------------------------------------------------
------    -- Load Filter Sequentially
------    ----------------------------------------------------------------
------process(clk, reset)
------    variable fr, fc : integer;
------begin
------    if reset='0' then
------        filter_cnt <= 0;
------        filter_mem <= (others => (others => (others=>'0')));
------        f_done <= '0';
------        f_d <='0';
------    elsif rising_edge(clk) then
------        if start='1' and f_done='0' then
------            fr := filter_cnt / 3;
------            fc := filter_cnt mod 3;
------            filter_mem(fr, fc) <= filter_in;

------            if filter_cnt = 8 then
------                f_done <= '1';
------                f_d <='1';
------            else
------                filter_cnt <= filter_cnt + 1;
------            end if;
------        end if;
------    end if;
------end process;

-------- Load Cell Sequentially
------process(clk, reset)
------    variable cr, cc : integer;
------begin
------    if reset='0' then
------        cell_cnt <= 0;
------        cell_mem <= (others => (others => (others=>'0')));
------        c_done <= '0';
------        c_d <='0';
------    elsif rising_edge(clk) then
------        if start='1' and c_done='0' then
------            cr := cell_cnt / 6;
------            cc := cell_cnt mod 6;
------            cell_mem(cr, cc) <= cell_in;

------            if cell_cnt = 35 then
------                c_done <= '1';
------                c_d <='1';
------            else
------                cell_cnt <= cell_cnt + 1;
------            end if;
------        end if;
------    end if;
------end process;

------    ----------------------------------------------------------------
------    -- Sequential Convolution FSM
------    ----------------------------------------------------------------
------    process(clk, reset)
------    begin
------        if reset='0' then
------            state <= IDLE;
------            r <= 0; c <= 0; i <= 0; j <= 0;
------            acc <= (others=>'0');
------            pixel_out_seq <= (others=>'0');
------            pixel_valid <= '0';
------        elsif rising_edge(clk) then

------            case state is

------                when IDLE =>
------                    if f_done = '1' and c_done = '1' then
------                        r <= 0; c <= 0; i <= 0; j <= 0;
------                        acc <= (others=>'0');
------                        state <= MAC;
------                        pixel_valid <= '0';
------                    end if;

------                when MAC =>
------                    acc <= acc + resize(filter_mem(i,j) * cell_mem(r+i,c+j),20);
------                        pixel_valid <= '0';
--------                    if j < 2 then
--------                        j <= j + 1;
--------                    elsif i < 2 then
--------                        j <= 0;
--------                        i <= i + 1;
--------                    else
--------                        -- Finished one pixel
--------                        state <= NEXT_PIXEL;
--------                    end if;
------                    if (i = 2 and j = 2) then
------                        state <= NEXT_PIXEL;
------                    elsif j < 2 then
------                        j <= j + 1;
------                    else
------                        j <= 0;
------                        i <= i + 1;
------                    end if;
                
------                when NEXT_PIXEL =>
------                    pixel_mem(r,c) <= acc;   -- STORE pixel
                    
------                        pixel_valid <= '0';
------                    acc <= (others=>'0');
------                    i <= 0; j <= 0;
                
------                    if c < 3 then
------                        c <= c + 1;
------                        state <= MAC;
------                    elsif r < 3 then
------                        c <= 0;
------                        r <= r + 1;
------                        state <= MAC;
------                    else
------                        state <= DONE;   -- ALL PIXELS DONE
------                    end if;

------                when DONE =>
------                    pixel_out_seq <= pixel_mem(3,3);  -- FINAL PIXEL ONLY
------                    pixel_valid <= '1';
            
--------                    state <= IDLE;

------                when others =>
------                    state <= IDLE;

------            end case;

------        end if;
------    end process;

------end architecture;

-------------------------------------------------task 1 3x3 code
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Full_conv_seq is
    port (
        clk           : in  std_logic;
        reset_n       : in  std_logic; -- active low

        load_index    : in  unsigned(3 downto 0); -- 0 to 8
        load_enable   : in  std_logic;

        activation    : in  signed(7 downto 0);
        weights       : in  signed(7 downto 0);

        start         : in  std_logic;
        clear_done    : in  std_logic;

        done          : out std_logic;
        result        : out signed(31 downto 0)
    );
end Full_conv_seq;

architecture rtl of Full_conv_seq is

    type array9 is array (0 to 8) of signed(7 downto 0);

    signal act_mem   : array9 := (others => (others => '0'));
    signal w_mem     : array9 := (others => (others => '0'));

    signal acc       : signed(31 downto 0) := (others => '0');
    signal counter   : integer range 0 to 9 := 0;

    type state_type is (IDLE, COMPUTE, DONE_STATE);
    signal state : state_type := IDLE;

    signal done_reg : std_logic := '0';

begin

    done <= done_reg;
    result <= acc;

    process(clk, reset_n)
    begin
        if reset_n = '0' then
            act_mem   <= (others => (others => '0'));
            w_mem     <= (others => (others => '0'));
            acc       <= (others => '0');
            counter   <= 0;
            state     <= IDLE;
            done_reg  <= '0';

        elsif rising_edge(clk) then

            -- Load phase
            if load_enable = '1' then
                act_mem(to_integer(load_index)) <= activation;
                w_mem(to_integer(load_index))   <= weights;
            end if;

            case state is

                when IDLE =>
                    acc     <= (others => '0');
                    counter <= 0;

                    if start = '1' then
                        state <= COMPUTE;
                    end if;

                when COMPUTE =>
                    acc <= acc + resize(act_mem(counter) * w_mem(counter), 32);
                    counter <= counter + 1;

                    if counter = 8 then
                        state <= DONE_STATE;
                    end if;

                when DONE_STATE =>
                    done_reg <= '1';

                    if clear_done = '1' then
                        done_reg <= '0';
                        state <= IDLE;
                    end if;

            end case;
        end if;
    end process;

end rtl;

-----------------------------------------------task 2 10x4 code
--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

--entity Full_conv_seq is
--    port (
--        clk           : in  std_logic;
--        reset_n       : in  std_logic; -- active low

--        load_index    : in  unsigned(5 downto 0); -- 0 to 39
--        load_enable   : in  std_logic;

--        activation    : in  signed(7 downto 0);
--        weights       : in  signed(7 downto 0);

--        start         : in  std_logic;
--        clear_done    : in  std_logic;

--        done          : out std_logic;
--        result        : out signed(31 downto 0)
--    );
--end Full_conv_seq;

--architecture rtl of Full_conv_seq is

--    type array40 is array (0 to 39) of signed(7 downto 0);

--    signal act_mem   : array40 := (others => (others => '0'));
--    signal w_mem     : array40 := (others => (others => '0'));

--    signal acc       : signed(31 downto 0) := (others => '0');
--    signal counter   : integer range 0 to 39 := 0;

--    type state_type is (IDLE, COMPUTE, DONE_STATE);
--    signal state : state_type := IDLE;

--    signal done_reg : std_logic := '0';

--begin

--    done <= done_reg;
--    result <= acc;

--    process(clk, reset_n)
--    begin
--        if reset_n = '0' then
--            act_mem   <= (others => (others => '0'));
--            w_mem     <= (others => (others => '0'));
--            acc       <= (others => '0');
--            counter   <= 0;
--            state     <= IDLE;
--            done_reg  <= '0';

--        elsif rising_edge(clk) then

--            -- Load phase
--            if load_enable = '1' then
--                act_mem(to_integer(load_index)) <= activation;
--                w_mem(to_integer(load_index))   <= weights;
--            end if;

--            case state is

--                when IDLE =>
--                    acc     <= (others => '0');
--                    counter <= 0;

--                    if start = '1' then
--                        state <= COMPUTE;
--                    end if;

--                when COMPUTE =>
--                    acc <= acc + resize(act_mem(counter) * w_mem(counter), 32);
--                    counter <= counter + 1;

--                    if counter = 39 then
--                        state <= DONE_STATE;
--                    end if;

--                when DONE_STATE =>
--                    done_reg <= '1';

--                    if clear_done = '1' then
--                        done_reg <= '0';
--                        state <= IDLE;
--                    end if;

--            end case;
--        end if;
--    end process;

--end rtl;

