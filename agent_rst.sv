`include "simple_bus_cmd.v"
`include "driver_simple_bus.v"

// already did in Agent_simple_bus, will reuse
// typedef uvm_sequencer#(Simple_bus_cmd) Sequencer_cmd;
typedef uvm_sequencer#(Simple_bus_cmd) Sequencer_rst;

class Agent_rst extends uvm_agent;

   `uvm_component_utils(Agent_rst);


   Driver_simple_bus driver_simple_bus_0;
   Sequencer_cmd sequencer_cmd_0;

   function new(string n, uvm_component p);
      super.new(n,p);
   endfunction


   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      sequencer_cmd_0 = Sequencer_cmd::type_id::create("sequencer_cmd_0", this);
      driver_simple_bus_0 = Driver_simple_bus::type_id::create("driver_simple_bus_0", this);
   endfunction 


   virtual function void connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       driver_simple_bus_0.seq_item_port.connect(sequencer_cmd_0.seq_item_export);
   endfunction
endclass
