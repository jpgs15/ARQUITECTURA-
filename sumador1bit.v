module sumador1bit (
    input a,b,ci,
    output cout,s);

wire a_ab;
wire x_ab;
wire cout_t;

and(a_ab,a,b);
xor(x_ab,a,b);

xor(s,x_ab,ci);
and(cout_t,x_ab,ci);

or(cout,cout_t,a_ab);

endmodule

