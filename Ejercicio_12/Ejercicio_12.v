
//Aplicación combinacionales
//
// ID 1 - 2:
// Codigo Gray
// Display BCD -> HEX4
// Display Error -> HEX5

module Ejercicio_12(
    SW0,
    SW1,
    SW2,
    SW3,

    LED0,
    LED1,
    LED2,
    LED3,

    HEX4,
    HEX5
);


input SW0;
input SW1;
input SW2;
input SW3;

output LED0;
output LED1;
output LED2;
output LED3;

output [6:0] HEX4;
output [6:0] HEX5;

wire [3:0] D;

assign D[0] = SW0;
assign D[1] = SW1;
assign D[2] = SW2;
assign D[3] = SW3;


// De binario a gray

// G3 = D3
// G2 = D3 XOR D2
// G1 = D2 XOR D1
// G0 = D1 XOR D0

wire [3:0] Gray;

assign Gray[3] = D[3];
assign Gray[2] = D[3] ^ D[2];
assign Gray[1] = D[2] ^ D[1];
assign Gray[0] = D[1] ^ D[0];

// Salida del codigo gray en los leds del 7 segmentos 

assign LED0 = Gray[0];
assign LED1 = Gray[1];
assign LED2 = Gray[2];
assign LED3 = Gray[3];


// Detector de los valores validos

// Valores validos:
// 0 - 9
//
// Valores invalidos:
// 10 - 15
//
// valid = 1 -> numero valido
// valid = 0 -> error

wire valid;

assign valid = (~D[3]) | ((~D[2]) & (~D[1]));

// De BCD A 7 segmentos
//
// HEX4 muestra el numero cuando D = 0...9.
//
// HEX4[6] = a
// HEX4[5] = b
// HEX4[4] = c
// HEX4[3] = d
// HEX4[2] = e
// HEX4[1] = f
// HEX4[0] = g

assign HEX4 =

    (D == 4'b0000 && valid) ? 7'b1000000 :   // 0
    (D == 4'b0001 && valid) ? 7'b1111001 :   // 1
    (D == 4'b0010 && valid) ? 7'b0100100 :   // 2
    (D == 4'b0011 && valid) ? 7'b0110000 :   // 3
    (D == 4'b0100 && valid) ? 7'b0011001 :   // 4
    (D == 4'b0101 && valid) ? 7'b0010010 :   // 5
    (D == 4'b0110 && valid) ? 7'b0000010 :   // 6
    (D == 4'b0111 && valid) ? 7'b1111000 :   // 7
    (D == 4'b1000 && valid) ? 7'b0000000 :   // 8
    (D == 4'b1001 && valid) ? 7'b0011000 :   // 9
                                      7'b1111111; // Apagado
//
// Si D = 10,11,12,13,14 o 15:
// HEX5 muestra E.
//
// Si D = 0...9:
// HEX5 permanece apagado.
//
// E en display activo en bajo:
// a = 0
// b = 1
// c = 1
// d = 0
// e = 0
// f = 0
// g = 0
//
// HEX5 = 0110000

assign HEX5 = valid ? 7'b1111111 : 7'b0110000;

endmodule