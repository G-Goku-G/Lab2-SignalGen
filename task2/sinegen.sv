module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    //interface signals
    input logic clk,
    input logic rst,
    input logic en,
    input logic [A_WIDTH-1:0] phase, //the phase difference
    input logic [A_WIDTH-1:0] incr, //increment addr input
    output logic [D_WIDTH-1:0] dout1, //data out from ROM addr1
    output logic [D_WIDTH-1:0] dout2 //data out from ROM addr2
);

    logic [A_WIDTH-1:0] address1;
    logic [A_WIDTH-1:0] address2;
    assign address2 = address1 + phase;

counter #(.WIDTH(A_WIDTH)) addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address1)
);

rom #(.ADDRESS_WIDTH(A_WIDTH), .DATA_WIDTH(D_WIDTH)) sineRom (
    .clk (clk),
    .addr1 (address1),
    .addr2 (address2),
    .dout1 (dout1),
    .dout2 (dout2)
);

endmodule
