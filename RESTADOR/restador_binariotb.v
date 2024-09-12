module restador_binariotb();
    reg [3:0] A;         // Minuendo de 4 bits (registro)
    reg [3:0] B;         // Sustraendo de 4 bits (registro)
    wire [3:0] Resultado;  // Resultado de la resta (cable)
    wire Borrow;          // Préstamo (cable)

    // Instanciar el módulo restador_binario
    restador_binario uut (
        .A(A), 
        .B(B), 
        .Resultado(Resultado), 
        .Borrow(Borrow)
    );

    // Bloque de simulación
    initial begin
        // Prueba 1: A = 9, B = 5 (sin préstamo)
        A = 4'b1001; // 9
        B = 4'b0101; // 5
        #10; // Esperar 10 unidades de tiempo
        
        // Prueba 2: A = 3, B = 6 (con préstamo)
        A = 4'b0011; // 3
        B = 4'b0110; // 6
        #10;

        // Prueba 3: A = 15, B = 1 (sin préstamo)
        A = 4'b1111; // 15
        B = 4'b0001; // 1
        #10;

        // Prueba 4: A = 0, B = 0 (sin préstamo)
        A = 4'b0000; // 0
        B = 4'b0000; // 0
        #10;

        // Finalizar la simulación
        $finish;
    end
endmodule