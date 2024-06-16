`ifndef _INTF_SIMPLE_BUS_
`define _INTF_SIMPLE_BUS_
interface intf_simple_bus(input bit clk);

   // logic clk; // still need to declare even on port
   logic rst_;
   logic [3:0] cmd;
   logic [15:0] saddr;
   logic en;
   logic done;
 
   clocking cb_driver @(posedge clk);
      output rst_;
      output en;
      output cmd;
      output saddr;
      input done;
   endclocking

endinterface

`endif
