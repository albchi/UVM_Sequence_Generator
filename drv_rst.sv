`ifndef _DRIVER_PKT_ 
`define _DRIVER_PKT_
`include "rst.sv"

class drv_rst extends uvm_driver#(rst);

    virtual intf_simple_bus intf_simple_bus_0;

   `uvm_component_utils(drv_rst)

    function new(string n="driver", uvm_component p);
       super.new(n,p);
    endfunction 

    virtual task run_phase(uvm_phase phase);

        `uvm_info("RST Driver", "About to drive", UVM_HIGH);
        forever begin 
            seq_item_port.get_next_item(req);
            
	    `uvm_info("RST Driver", "waiting for clk", UVM_HIGH);
	    @(top.intf_bus_0.clk);
	    `uvm_info("RST Driver", "got clk", UVM_HIGH);
	    top.intf_bus_0.rst_ = req.rst_;
                   repeat(req.rst_time)
   	       @(top.intf_bus_0.clk);
	   top.intf_bus_0.rst_ = ~req.rst_;
	   `uvm_info("RST Driving!", req.sprint(), UVM_HIGH);
	    seq_item_port.item_done();
        end // forever
    endtask // run_phase
endclass
`endif 
