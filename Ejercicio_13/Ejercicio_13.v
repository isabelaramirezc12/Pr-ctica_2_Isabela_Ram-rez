// Aplicacion Combinacionales(II)
//
// ALU de 5 BITS
//
// ID número Final = 2
//
// Operaciones asignadas según el número final de ID:
//
// ITEM 2 -> F = A + B
// ITEM 6 -> F = A - 1
// ITEM 1 -> F = A + 1
// ITEM C -> F = A AND B
// ITEM E -> F = (A < B)

module ALU5_RTL(
    A,
    B,
    S,
    F,
    Cout
);

input [4:0] A;
input [4:0] B;
input [3:0] S;

output [4:0] F;
output Cout;

// ITEM 2
wire [5:0] SUMA;

assign SUMA = {1'b0, A} + {1'b0, B};

// ITEM 6
// Se utiliza:
// A - 1 = A + 31
// El resultado queda limitado a los 5 bits menos significativos.

wire [5:0] RESTA1;

assign RESTA1 = {1'b0, A} + 6'b011111;

// ITEM 1

wire [5:0] SUMA1;

assign SUMA1 = {1'b0, A} + 6'b000001;

// ITEM C

wire [4:0] AND_AB;

assign AND_AB = A & B;

// ITEM E
// Si A es menor que B:
// F = 00001
//
// Si A no es menor que B:
// F = 00000

wire [4:0] MENOR;

assign MENOR = (A < B) ? 5'b00001 : 5'b00000;

// Seleccion de la operacion
// S = 0010 -> A + B
// S = 0110 -> A - 1
// S = 0001 -> A + 1
// S = 1100 -> A AND B
// S = 1110 -> A < B
//
// Para cualquier otra combinacion:
// F = 00000

assign F =
       (S == 4'b0010) ? SUMA[4:0]   :
       (S == 4'b0110) ? RESTA1[4:0] :
       (S == 4'b0001) ? SUMA1[4:0]  :
       (S == 4'b1100) ? AND_AB      :
       (S == 4'b1110) ? MENOR       :
                        5'b00000;
// Acarreo

assign Cout =
       (S == 4'b0010) ? SUMA[5]   :
       (S == 4'b0110) ? RESTA1[5] :
       (S == 4'b0001) ? SUMA1[5]  :
                        1'b0;

endmodule

// Conversor del resultado de 5 bits a dos display

// HEX5 -> DECENAS
// HEX4 -> UNIDADES

module BIN5_TO_2HEX(
    F,
    HEX4,
    HEX5
);

input [4:0] F;

output [6:0] HEX4;
output [6:0] HEX5;

wire [4:0] DECENAS;
wire [4:0] UNIDADES;

//Decenas

assign DECENAS =
       (F >= 5'd30) ? 5'd3 :
       (F >= 5'd20) ? 5'd2 :
       (F >= 5'd10) ? 5'd1 :
                       5'd0;
//Unidades

assign UNIDADES =
       (F >= 5'd30) ? F - 5'd30 :
       (F >= 5'd20) ? F - 5'd20 :
       (F >= 5'd10) ? F - 5'd10 :
                       F;
//7 segmentos
//
// HEX[0] = a
// HEX[1] = b
// HEX[2] = c
// HEX[3] = d
// HEX[4] = e
// HEX[5] = f
// HEX[6] = g

// HEX4

assign HEX4 =
       (UNIDADES == 5'd0) ? 7'b1000000 :
       (UNIDADES == 5'd1) ? 7'b1111001 :
       (UNIDADES == 5'd2) ? 7'b0100100 :
       (UNIDADES == 5'd3) ? 7'b0110000 :
       (UNIDADES == 5'd4) ? 7'b0011001 :
       (UNIDADES == 5'd5) ? 7'b0010010 :
       (UNIDADES == 5'd6) ? 7'b0000010 :
       (UNIDADES == 5'd7) ? 7'b1111000 :
       (UNIDADES == 5'd8) ? 7'b0000000 :
       (UNIDADES == 5'd9) ? 7'b0010000 :
                            7'b1111111;

// HEX5

assign HEX5 =
       (DECENAS == 5'd0) ? 7'b1000000 :
       (DECENAS == 5'd1) ? 7'b1111001 :
       (DECENAS == 5'd2) ? 7'b0100100 :
       (DECENAS == 5'd3) ? 7'b0110000 :
                            7'b1111111;

endmodule

//
// SW0-SW4 -> Operando A
// SW5-SW9 -> Operando B
//
// KEY0-KEY3 -> Seleccion de operacion
//
// LED0-LED4 -> Resultado F
// LED5      -> Carry out
//
// HEX4      -> Unidades
// HEX5      -> Decenas


// Modulo principal 
module Ejercicio_13(

    SW0,
    SW1,
    SW2,
    SW3,
    SW4,
    SW5,
    SW6,
    SW7,
    SW8,
    SW9,

    KEY0,
    KEY1,
    KEY2,
    KEY3,

    LED0,
    LED1,
    LED2,
    LED3,
    LED4,
    LED5,
    LED6,
    LED7,
    LED8,
    LED9,

    HEX4,
    HEX5

);


input SW0;
input SW1;
input SW2;
input SW3;
input SW4;

input SW5;
input SW6;
input SW7;
input SW8;
input SW9;

input KEY0;
input KEY1;
input KEY2;
input KEY3;


output LED0;
output LED1;
output LED2;
output LED3;
output LED4;
output LED5;
output LED6;
output LED7;
output LED8;
output LED9;

output [6:0] HEX4;
output [6:0] HEX5;


wire [4:0] A;
wire [4:0] B;

wire [3:0] S;

wire [4:0] F;

wire Cout;

// Operando A

assign A[0] = SW0;
assign A[1] = SW1;
assign A[2] = SW2;
assign A[3] = SW3;
assign A[4] = SW4;


// Operando B

assign B[0] = SW5;
assign B[1] = SW6;
assign B[2] = SW7;
assign B[3] = SW8;
assign B[4] = SW9;


// Seleccion de la operacion

// Se utiliza:
// S0 = ~KEY0
// S1 = ~KEY1
// S2 = ~KEY2
// S3 = ~KEY3
//Porque son activos en bajo

assign S[0] = ~KEY0;
assign S[1] = ~KEY1;
assign S[2] = ~KEY2;
assign S[3] = ~KEY3;


// INSTANCIA DE LA ALU


ALU5_RTL ALU(
    .A(A),
    .B(B),
    .S(S),
    .F(F),
    .Cout(Cout)
);


assign LED0 = F[0];
assign LED1 = F[1];
assign LED2 = F[2];
assign LED3 = F[3];
assign LED4 = F[4];

assign LED5 = Cout;

//Leds que no se utilizan 

assign LED6 = 1'b0;
assign LED7 = 1'b0;
assign LED8 = 1'b0;
assign LED9 = 1'b0;

//Display

BIN5_TO_2HEX DISPLAY(
    .F(F),
    .HEX4(HEX4),
    .HEX5(HEX5)
);


endmodule
