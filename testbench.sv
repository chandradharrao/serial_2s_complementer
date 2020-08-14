// Code your testbench here
// or browse Examples
module t_serial_2_comp;
  wire [3:0]comp_reg;
  wire carry;
  reg clk, load, rst;
  reg [3:0]num;
  
  
  serial_2_comp M_UUT(comp_reg, num, load, rst, carry, clk);
  
  always
    #5 clk = !clk;
  initial
    begin
      $dumpfile("comp.vcd");
      $dumpvars(0, t_serial_2_comp);
      $monitor($time, " load= %b | rst= %b | num= %b || carry= %b || cmpl=%b",
               load, rst, num, carry, comp_reg);
      rst = 1'b0; load = 1'b0; num = 4'b0000; clk = 1'b0;
      #2 rst = 1'b1; load = 1'b1;num = 4'b0001;
      #8 load=1'b0;
      #42 $finish;
    end
endmodule
      