library verilog;
use verilog.vl_types.all;
entity BIN5_TO_2HEX is
    port(
        F               : in     vl_logic_vector(4 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0)
    );
end BIN5_TO_2HEX;
