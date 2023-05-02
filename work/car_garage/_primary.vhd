library verilog;
use verilog.vl_types.all;
entity car_garage is
    port(
        reset           : in     vl_logic;
        button          : in     vl_logic;
        car_in          : in     vl_logic;
        car_out         : in     vl_logic;
        count           : out    vl_logic_vector(5 downto 0);
        leds1           : out    vl_logic_vector(6 downto 0);
        leds2           : out    vl_logic_vector(6 downto 0)
    );
end car_garage;
