library verilog;
use verilog.vl_types.all;
entity BCD7Seg is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        led_a           : out    vl_logic;
        led_b           : out    vl_logic;
        led_c           : out    vl_logic;
        led_d           : out    vl_logic;
        led_e           : out    vl_logic;
        led_f           : out    vl_logic;
        led_g           : out    vl_logic
    );
end BCD7Seg;
