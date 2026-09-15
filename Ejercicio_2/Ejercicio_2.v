// Descripción a nivel de compuertas
// Decodificador 2 a 4

module Ejercicio_2(
    input SW0,
    input SW1,
    input SW2,
    output LEDR0,
    output LEDR1,
    output LEDR2,
    output LEDR3
);

wire Anot, Bnot, Enot;

// Inversores
not g1(Anot, SW0);
not g2(Bnot, SW1);
not g3(Enot, SW2);

// Decodificador
nand g4(LEDR0, Anot, Bnot, Enot);
nand g5(LEDR1, Anot, SW1, Enot);
nand g6(LEDR2, SW0, Bnot, Enot);
nand g7(LEDR3, SW0, SW1, Enot);

endmodule
