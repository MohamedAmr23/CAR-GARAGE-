library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        count           : out    vl_logic_vector(2 downto 0);
        reset           : in     vl_logic
    );
end counter;
