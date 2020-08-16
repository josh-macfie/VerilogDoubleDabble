`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2020 11:40:57 AM
// Design Name: 
// Module Name: BDC_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_tb(

    );

//Drivable inputs are registers
reg         clk         = 0;
reg         en          = 0;
reg [11:0]  bin_d_in    = 0;

//Readable outputs are wires
wire [15:0] bcd_d_out;
wire rdy;

//Instantiate in the same order as your module decleration.
//I personally copy straight from the module that will be instantiated and just edit it.
bcd BCD_uut(
    .clk(clk),
    .en(en),
    .bin_d_in(bin_d_in),
    .bcd_d_out(bcd_d_out),
    .rdy(rdy)
    );
    
//For this test we will need:
//  a running clock             (clk)
//  a changing enable signal    (en)
//  a changing binary input     (bin_d_in)
initial
    begin
    forever
        begin
        #10 clk = !clk; //10*2 for full wave
        end
    end

initial
    begin
    forever
        begin
        bin_d_in    = 0;
        en          = 1;
        #20 //en must catch rising edge of clk
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = 12'b111111111111;//   2^(12)-1 = 4095 = 0xfff
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = 0;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 1;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 10;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 10;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 100;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 100;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 1000;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 1000;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 1;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 2;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 2;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 

        bin_d_in    = bin_d_in + 5;
        en          = 1;
        #20
        en          = 0;
        #1340; //IDEL (+1); SETUP (+1); ADD (+12*4); SHIFT (+12); DONE (+1); extra for edge case (+4); enable back to zero (-1) ~~> ((1+1+(12*4)+12+1+1+4-1)*10*2) = 1340 
        end
    end

endmodule