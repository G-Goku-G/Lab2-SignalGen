#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env){
    int i;
    int clk;

    Verilated::commandArgs(argc,argv);
    //init top verilog instance
    Vsinegen* top = new Vsinegen;
    //init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    top->open('sinegen.vcd');

    if (vbdOpen()!=1) return(-1);
    vbdHeader('Lab 2: Sinegen')

    //initilise simulation inputs
    top->clk = 1;
    top->rst = 1;
    top->en = 0;
    top->incr = 1;

    //the simulation loop
    for (i = 0; i < 300; i++){
        //dump the variables into VCD file and toggle clock
        for (clk = 0; clk < 2; clk++){
            tfp->dump(2*i + clk);
            top->clk = !top->clk;
            top->eval();
        }

        vbdPlot(int(top->dout),0,255)

        top->en = (i > 2)
        if (Verilated::gotFinish()) exit(0);

    }
    tfp->close();
    exit(0);
}