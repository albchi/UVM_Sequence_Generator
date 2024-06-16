interface intf_simple_bus(input clk);

   logic rst;
   logic [3:0] cmd;
   logic en;
   logic err;
 
   clocking cb_driver @(posedge clk);
      output rst;
      output en;
      output cmd;
      input err;
   endclocking

endinterface

module simple_bus(clk, rst, en, cmd, err);
   input clk;
   input rst;
   input en;
   input [3:0] cmd;
   output err;

   reg [3:0] cmd_ff;

   always @(posedge clk) begin
      if (rst == 1'b1) 
         cmd_ff <= 8'h0;
      else begin
         cmd_ff <= cmd;
      end
   
   end

endmodule

program main;

initial begin
end

endprogram


module top;
   reg clk;
   intf_simple_bus intf_bus_0(clk);
   simple_bus slave0 (
      .clk(clk),
      .rst(intf_bus_0.rst),
      .en(intf_bus_0.en),
      .cmd(intf_bus_0.cmd),
      .err(intf_bus_0.err)

   );

   initial 
      clk = 0;
   always
      #5 clk = ~clk;
endmodule 

