`ifndef _ENV_
`define _ENV_
`include "agent_pkt.sv"
`include "agent_rst.sv"

class env extends uvm_env;

   `uvm_component_utils(env)

    agent_pkt agent_pkt_0;
    agent_rst agent_rst_0;

    function new(string n, uvm_component p);
       super.new(n,p);
    endfunction 
 
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      agent_pkt_0=agent_pkt::type_id::create("agent_pkt_0", this);
      agent_rst_0=agent_rst::type_id::create("agent_rst_0", this);
   endfunction 
endclass
`endif //  _ENV_
