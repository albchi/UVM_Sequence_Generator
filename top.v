module top;

   reg clk;

   intf_simple_bus intf_bus_0(clk);

   simple_bus slave0 (
      .clk(clk),
      .rst_(intf_bus_0.rst_),
      .en(intf_bus_0.en),
      .cmd(intf_bus_0.cmd),
      .done(intf_bus_0.done)

   );


   initial 
      $fsdbDumpvars;

   initial 
      clk = 0;

   always
      #5 clk = ~clk;

endmodule 

