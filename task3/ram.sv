module ram #(
    parameter   ADDRESS_WIDTH = 9,
                DATA_WIDTH = 8
)(
    input logic clk, //the clock
    input logic wr_en, //write enable
    input logic rd_en, //read enable
    input logic [ADDRESS_WIDTH-1:0] wr_addr, //write address
    input logic [ADDRESS_WIDTH-1:0] rd_addr, //read address
    input logic [DATA_WIDTH-1:0] din, //write data input
    output logic [DATA_WIDTH-1:0] dout //read data output
);

//create the array
logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];

always_ff @(posedge clk) begin
    //write port: store din at wr_addr
    if (wr_en)
        ram_array[wr_addr] <= din;
    //read port: output the word at rd_addr
    if (rd_en)
        dout <= ram_array[rd_addr];
end

endmodule
