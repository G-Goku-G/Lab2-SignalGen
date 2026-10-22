module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    //interface signals
    input logic clk,
    input logic rst,
    input logic en,
    input logic [A_WIDTH-1:0] incr, //increment addr input
    output logic [D_WIDTH-1:0] dout //data out
);

    logic [A_WIDTH-1:0] address;

counter #(.WIDTH(A_WIDTH)) addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

rom #(.ADDRESS_WIDTH(A_WIDTH), .DATA_WIDTH(D_WIDTH)) sineRom (
    .clk (clk),
    .addr (address),
    .dout (dout)
);

endmodule
