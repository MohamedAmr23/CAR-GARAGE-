library verilog;
use verilog.vl_types.all;
entity car_garage_FSM is
    generic(
        Empty           : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        Car_input       : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Car_output      : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Full            : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        reset           : in     vl_logic;
        button          : in     vl_logic;
        car_in          : in     vl_logic;
        car_out         : in     vl_logic;
        count           : out    vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Empty : constant is 1;
    attribute mti_svvh_generic_type of Car_input : constant is 1;
    attribute mti_svvh_generic_type of Car_output : constant is 1;
    attribute mti_svvh_generic_type of Full : constant is 1;
end car_garage_FSM;
