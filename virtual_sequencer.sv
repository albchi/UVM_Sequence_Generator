`ifndef _VIRTUAL_SEQUENCER_
`define _VIRTUAL_SEQUENCER_
class virtual_sequencer extends uvm_sequencer;

   `uvm_component_utils(virtual_sequencer)

    seqr_pkt seqr_pkt_0;
 
    function new(input string name, input uvm_component parent);
       super.new(name,parent);
    endfunction 

endclass 
`endif // _VIRTUAL_SEQUENCER_
