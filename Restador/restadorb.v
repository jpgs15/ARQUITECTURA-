module restador_binario (
    input [3:0] A, // Minuendo
    input [3:0] B, // Sustraendo
    output [3:0] Resultado, // Resultado de la resta
    output Borrow // Prestamo (si es necesario)
);
    assign {Borrow, Resultado} = A - B;
endmodule