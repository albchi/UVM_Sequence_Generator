`ifndef _DRIVER_RST_ 
`define _DRIVER_RST_
`include "simple_bus_cmd.v"

class Driver_rst extends uvm_driver#(Simple_bus_cmd);

    virtual intf_simple_bus intf_simple_bus_0;

   `uvm_component_utils(Driver_rst)

    function new(string n="driver", uvm_component p);
       super.new(n,p);
    endfunction 


    virtual task run_phase(uvm_phase phase);

        `uvm_info("Driver", "About to drive", UVM_HIGH);
        forever begin 
            seq_item_port.get_next_item(req);
            `uvm_info("XAC Driving RST!", req.sprint(), UVM_HIGH);
            top.intf_bus_0.rst = req.rst;
            repeat(req.rst_time)
               @(top.intf_bus_0.clk);
            seq_item_port.item_done();
        end // forever
    endtask // run_phase
endclass
`endif // _DRIVER_RST_
