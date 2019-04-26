<%!
import math
%>
  ctrlport_endpoint #(
    .THIS_PORTID(THIS_PORTID),
    .SYNC_CLKS(${1 if config['control']['clk_domain'] == "rfnoc_ctrl" else 0}),
    .AXIS_CTRL_MST_EN(${int(config['control']['interface_direction'] != "slave")}),
    .AXIS_CTRL_SLV_EN(1),       
    .SLAVE_FIFO_SIZE(${math.ceil(math.log2(config['control']['fifo_depth']))})         
  ) ctrlport_endpoint_i (
    .rfnoc_ctrl_clk(rfnoc_ctrl_clk),
    .rfnoc_ctrl_rst(rfnoc_ctrl_rst),
    .ctrlport_clk(ctrlport_clk),
    .ctrlport_rst(ctrlport_rst),
    .s_rfnoc_ctrl_tdata(s_rfnoc_ctrl_tdata),
    .s_rfnoc_ctrl_tlast(s_rfnoc_ctrl_tlast),
    .s_rfnoc_ctrl_tvalid(s_rfnoc_ctrl_tvalid),
    .s_rfnoc_ctrl_tready(s_rfnoc_ctrl_tready),
    .m_rfnoc_ctrl_tdata(m_rfnoc_ctrl_tdata),
    .m_rfnoc_ctrl_tlast(m_rfnoc_ctrl_tlast),
    .m_rfnoc_ctrl_tvalid(m_rfnoc_ctrl_tvalid),
    .m_rfnoc_ctrl_tready(m_rfnoc_ctrl_tready),
    .m_ctrlport_req_wr(m_ctrlport_req_wr),
    .m_ctrlport_req_rd(m_ctrlport_req_rd),
    .m_ctrlport_req_addr(m_ctrlport_req_addr),
    .m_ctrlport_req_data(m_ctrlport_req_data),
    .m_ctrlport_req_byte_en(${"m_ctrlport_req_byte_en" if config['control']['ctrlport']['byte_mode'] else ""}),        
    .m_ctrlport_req_has_time(${"m_ctrlport_req_has_time" if config['control']['ctrlport']['timed'] else ""}),      
    .m_ctrlport_req_time(${"m_ctrlport_req_time" if config['control']['ctrlport']['timed'] else ""}),              
    .m_ctrlport_resp_ack(m_ctrlport_resp_ack),
    .m_ctrlport_resp_status(${"m_ctrlport_resp_status" if config['control']['ctrlport']['has_status'] else "'h0"}),        
    .m_ctrlport_resp_data(m_ctrlport_resp_data),
    .s_ctrlport_req_wr(${"s_ctrlport_req_wr" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_rd(${"s_ctrlport_req_rd" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_addr(${"s_ctrlport_req_addr" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_portid(${"s_ctrlport_req_portid" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_rem_epid(${"s_ctrlport_req_rem_epid" if config['control']['interface_direction'] == "remote_master_slave" else "'h0"}),
    .s_ctrlport_req_rem_portid(${"s_ctrlport_req_rem_portid" if config['control']['interface_direction'] == "remote_master_slave" else "'h0"}),
    .s_ctrlport_req_data(${"s_ctrlport_req_data" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_byte_en(${"s_ctrlport_req_byte_en" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_has_time(${"s_ctrlport_req_has_time" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_req_time(${"s_ctrlport_req_time" if config['control']['interface_direction'] != "slave" else "'h0"}),
    .s_ctrlport_resp_ack(${"s_ctrlport_resp_ack" if config['control']['interface_direction'] != "slave" else ""}),
    .s_ctrlport_resp_status(${"s_ctrlport_resp_status" if config['control']['interface_direction'] != "slave" else ""}),
    .s_ctrlport_resp_data(${"s_ctrlport_resp_data" if config['control']['interface_direction'] != "slave" else ""})
    );
  