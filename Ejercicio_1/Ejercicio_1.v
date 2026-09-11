// Descripción a nivel de compuertas
// Circuito combinacional: Y = (SW0 AND SW1) OR SW2

module Ejercicio_1(
    input  SW0,
    input  SW1,
    input  SW2,
    output LEDR0
);

wire X;

// Compuerta AND
and g1(X, SW0, SW1);

// Compuerta OR
or g2(LEDR0, X, SW2);

endmodule
