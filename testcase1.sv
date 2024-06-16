`include "seq_pkt.sv"
`include "seq_rst.sv"
`include "env.sv"
`include "virtual_sequencer.sv"
`include "virtual_sequence.sv"

class testcase1 extends uvm_test;

   `uvm_component_utils(testcase1);

   virtual_sequencer v_seqr_0;
   seq_pkt seq_pkt_0;
   seq_rst seq_rst_0;
   env env_0;


   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction 


   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     v_seqr_0 = virtual_sequencer::type_id::create("v_seqr_0", this);
     env_0 = env::type_id::create("env_0", this);

     // turn off RST 
     uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_rst_0.seqr_pkt_0.reset_phase", "default_sequence", null);
     // uvm_config_db #(uvm_object_wrapper)::set(this, "env_0.agent_rst_0.seqr_pkt_0.reset_phase", "default_sequence", virtual_sequence::get_type());

     // turn on PKT
     uvm_config_db #(uvm_object_wrapper)::set(this, "v_seqr_0.reset_phase", "default_sequence", virtual_sequence::get_type());
   endfunction 

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      v_seqr_0.seqr_pkt_0 = env_0.agent_pkt_0.seqr_pkt_0;
      v_seqr_0.seqr_rst_0 = env_0.agent_rst_0.seqr_rst_0;
   endfunction // connect_phase

   virtual task run_phase(uvm_phase phase);
      seq_pkt_0 = seq_pkt::type_id::create("seq_pkt_0", this);
      seq_rst_0 = seq_rst::type_id::create("seq_rst_0", this);
   endtask

  virtual task main_phase(uvm_phase phase) ;
     uvm_objection objection;
     super.main_phase(phase) ;
     phase.raise_objection(this);
     seq_pkt_0.start(env_0.agent_pkt_0.seqr_pkt_0);
     seq_rst_0.start(env_0.agent_rst_0.seqr_rst_0);
     phase.drop_objection(this);
     //objection=phase.get_objection();
     //objection.set_drain_time(this, 5us); // $finish at simulation time 100
     //objection.set_drain_time(this, 3us); // $finish at simulation time 100

  endtask 
endclass


