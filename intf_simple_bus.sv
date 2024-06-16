`ifndef _INTF_SIMPLE_BUS_
`define _INTF_SIMPLE_BUS_
interface intf_simple_bus(input bit clk);

   logic clk; // still need to declare even on port
   logic rst;
   logic [3:0] cmd;
   logic en;
   logic done;
 
   clocking cb_driver @(posedge clk);
      output rst;
      output en;
      output cmd;
      input done;
   endclocking

endinterface

`endif
