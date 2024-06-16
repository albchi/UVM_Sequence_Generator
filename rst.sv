`ifndef _RST_
`define _RST_

class rst extends uvm_sequence_item;

   rand bit rst_;
   rand integer rst_time;

   `uvm_object_utils_begin(rst)
      `uvm_field_int(rst_, UVM_DEFAULT)
      `uvm_field_int(rst_time, UVM_DEFAULT)
   `uvm_object_utils_end


   function new( string n="rst");
      super.new();
   endfunction 

endclass
`endif
