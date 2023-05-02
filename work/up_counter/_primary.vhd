library verilog;
use verilog.vl_types.all;
entity up_counter is
    port(
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        car_in          : in     vl_logic;
        car_out         : in     vl_logic;
        count           : out    vl_logic_vector(5 downto 0)
    );
end up_counter;
