`ifndef _DRIVER_PKT_ 
`define _DRIVER_PKT_
`include "pkt.sv"

class drv_pkt extends uvm_driver#(pkt);

    virtual intf_simple_bus intf_simple_bus_0;

   `uvm_component_utils(drv_pkt)

    function new(string n="driver", uvm_component p);
       super.new(n,p);
    endfunction 


    virtual task run_phase(uvm_phase phase);

        `uvm_info("CMD Driver", "About to drive", UVM_HIGH);
        forever begin 
            // seq_item_port.get_next_item(req);
            seq_item_port.try_next_item(req);
            if (req == null) begin
               `uvm_info("XAC : CMD Driver", "req is dry!!", UVM_HIGH);
            end
            else begin
		    `uvm_info("CMD Driver", "waiting for clk", UVM_HIGH);
		    @(top.intf_bus_0.clk);
		    `uvm_info("CMD Driver", "got clk", UVM_HIGH);
		    top.intf_bus_0.cmd = req.cmd;
		    @(top.intf_bus_0.clk);

		    `uvm_info("CMD Driving!", req.sprint(), UVM_HIGH);
		    seq_item_port.item_done();
           end // else
        end // forever
    endtask // run_phase
endclass
`endif 
