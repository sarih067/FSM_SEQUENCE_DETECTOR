`timescale 1ns / 1ps

module fsm_tb;

  reg  x;
  reg  clk;
  reg  rst;

  wire y;

  fsm uut (
      .x  (x),
      .clk(clk),
      .rst(rst),
      .y  (y)
  );

  always #5 clk = ~clk;


  initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, fsm_tb);
  end


  initial begin
    clk = 0;
    x   = 0;
    rst = 1;


    #10 rst = 0;


    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;

    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;

    #20;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | rst=%b | x=%b | state=%b | y=%b", $time, rst, x, uut.state, y);
  end

endmodule
