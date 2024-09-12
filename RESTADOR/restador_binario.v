module restador_binario(
    input [3:0] A,       // Entrada: Minuendo de 4 bits
    input [3:0] B,       // Entrada: Sustraendo de 4 bits
    output [3:0] Resultado, // Salida: Resultado de la resta
    output Borrow         // Salida: Indica si hay préstamo
);

    assign {Borrow, Resultado} = A - B; // Realizar la resta y manejar el préstamo

endmodule