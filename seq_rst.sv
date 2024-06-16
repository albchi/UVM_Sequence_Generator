`ifndef _SEQ_RST_
`define _SEQ_RST_

`include "rst.sv"

class seq_rst extends uvm_sequence#(rst);

   `uvm_object_utils(seq_rst)

    virtual task body();

          `uvm_info("XAC", "in rst sequence sequence body", UVM_HIGH);
          `uvm_do_with(req, {rst_== 1'b0; rst_time == 3;})
          // `uvm_do_with(req, {rst_== 1'b1; rst_time == 1;})

          // `uvm_do_with(req, {saddr == 16'h2222; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h3333; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h4444; daddr == 888;})
          // `uvm_do_with(req, {saddr == 16'h5555; daddr == 888;})

           // req = rst::type_id::create("req");
           // start_item(req);
           // req.cmd = 4;
           // req.daddr = 16'haaaa;
           // req.saddr = 4;
           // finish_item(req);

    endtask

    virtual task pre_start();
        if ( starting_phase != null )
            starting_phase.raise_objection( this );                               
    endtask : pre_start


    virtual task post_start();
        if  ( starting_phase != null )
            starting_phase.drop_objection( this );
    endtask : post_start


endclass

`endif 
