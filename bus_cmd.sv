`ifndef _bus_cmd_
`define _bus_cmd_

class bus_cmd extends uvm_sequence_item;

   rand bit [15:0] saddr;
   rand bit [15:0] daddr;
   rand bit [3:0] cmd;
   rand bit rst;
   rand integer rst_time;

   `uvm_object_utils_begin(bus_cmd)
      `uvm_field_int(saddr, UVM_DEFAULT)
      `uvm_field_int(daddr, UVM_DEFAULT)
      `uvm_field_int(cmd, UVM_DEFAULT)
   `uvm_object_utils_end


   function new( string n="bus_cmd");
      super.new();
   endfunction 

endclass
`endif
