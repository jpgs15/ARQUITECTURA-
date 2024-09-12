module restador(
    input [3:0] a,       // entrada 1 de 4 bits
    input [3:0] b,       // entrada 2 de 4 bits
    output [3:0] diff,   // resta salida
    output carri_out    //  acarreo salida de cada bit.
);

    // Señal interna para el acarreo de salida de cada bit
    wire [3:0] carri;
    
    // Restador de 1 bit  
    assign {carri[0], diff[0]} = a[0] - b[0];
    assign {carri[1], diff[1]} = a[1] - b[1] - carri[0];
    assign {carri[2], diff[2]} = a[2] - b[2] - carri[1];
    assign {carri_out, diff[3]} = a[3] - b[3] - carri[2];

endmodule