library verilog;
use verilog.vl_types.all;
entity Ejercicio_13 is
    port(
        SW0             : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        SW4             : in     vl_logic;
        SW5             : in     vl_logic;
        SW6             : in     vl_logic;
        SW7             : in     vl_logic;
        SW8             : in     vl_logic;
        SW9             : in     vl_logic;
        KEY0            : in     vl_logic;
        KEY1            : in     vl_logic;
        KEY2            : in     vl_logic;
        KEY3            : in     vl_logic;
        LED0            : out    vl_logic;
        LED1            : out    vl_logic;
        LED2            : out    vl_logic;
        LED3            : out    vl_logic;
        LED4            : out    vl_logic;
        LED5            : out    vl_logic;
        LED6            : out    vl_logic;
        LED7            : out    vl_logic;
        LED8            : out    vl_logic;
        LED9            : out    vl_logic;
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0)
    );
end Ejercicio_13;
