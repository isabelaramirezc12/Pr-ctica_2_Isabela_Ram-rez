library verilog;
use verilog.vl_types.all;
entity ALU5_RTL is
    port(
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        S               : in     vl_logic_vector(3 downto 0);
        F               : out    vl_logic_vector(4 downto 0);
        Cout            : out    vl_logic
    );
end ALU5_RTL;
