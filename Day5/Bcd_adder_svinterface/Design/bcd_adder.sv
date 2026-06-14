module bcd_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);

wire [3:0] s1;
wire temp_cout;
wire [3:0] correction;
wire dummy_cout;
wire k;

ripple_carry_adder RCA1(
    a,
    b,
    cin,
    s1,
    temp_cout
);

assign k = temp_cout | (s1[3] & s1[2]) | (s1[3] & s1[1]);

assign correction = {1'b0, k, k, 1'b0};

ripple_carry_adder RCA2(
    s1,
    correction,
    1'b0,
    s,
    dummy_cout
);

assign cout = k;

endmodule
module ripple_carry_adder(input [3:0]a_rca,[3:0]b_rca,input cin_rca, output [3:0]sum_rca,output cout

    );
    wire w1,w2,w3;
    fulladder FA1(a_rca[0],b_rca[0],cin_rca,sum_rca[0],w1);
    fulladder FA2(a_rca[1],b_rca[1],w1,sum_rca[1],w2);
    fulladder FA3(a_rca[2],b_rca[2],w2,sum_rca[2],w3);
    fulladder FA4(a_rca[3],b_rca[3],w3,sum_rca[3],cout);
endmodule
module fulladder(input a,b,cin,output sum,carry

    );
    wire w1,w2,w3;
    xor(w1,a,b);
    xor(sum,w1,cin);
    and(w3,w1,cin);
    and(w2,a,b);
    or(carry,w2,w3);
endmodule
