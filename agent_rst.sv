`include "rst.sv"
`include "drv_rst.sv"

typedef uvm_sequencer#(rst) seqr_rst;

class agent_rst extends uvm_agent;

   `uvm_component_utils(agent_rst);


   drv_rst drv_rst_0;
   seqr_rst seqr_rst_0;

   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction


   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      seqr_rst_0 = seqr_rst::type_id::create("seqr_rst_0", this);
      drv_rst_0 = drv_rst::type_id::create("drv_rst_0", this);
   endfunction 


   virtual function void connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       drv_rst_0.seq_item_port.connect(seqr_rst_0.seq_item_export);
   endfunction
endclass
