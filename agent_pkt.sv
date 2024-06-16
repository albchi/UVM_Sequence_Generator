`include "pkt.sv"
`include "drv_pkt.sv"

typedef uvm_sequencer#(pkt) seqr_pkt;

class agent_pkt extends uvm_agent;

   `uvm_component_utils(agent_pkt);


   drv_pkt drv_pkt_0;
   seqr_pkt seqr_pkt_0;

   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction


   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      seqr_pkt_0 = seqr_pkt::type_id::create("seqr_pkt_0", this);
      drv_pkt_0 = drv_pkt::type_id::create("drv_pkt_0", this);
   endfunction 


   virtual function void connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       // driver_simple_bus_0.seq_item_port.connect(sequencer_cmd_0.seq_item_export);
       drv_pkt_0.seq_item_port.connect(seqr_pkt_0.seq_item_export);
   endfunction
endclass
