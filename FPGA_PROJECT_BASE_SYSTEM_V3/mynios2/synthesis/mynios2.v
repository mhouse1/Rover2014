// mynios2.v


`timescale 1 ps / 1 ps
module mynios2 (
		output wire [12:0] sdram_addr,             //       sdram.addr
		output wire [1:0]  sdram_ba,               //            .ba
		output wire        sdram_cas_n,            //            .cas_n
		output wire        sdram_cke,              //            .cke
		output wire        sdram_cs_n,             //            .cs_n
		inout  wire [15:0] sdram_dq,               //            .dq
		output wire [1:0]  sdram_dqm,              //            .dqm
		output wire        sdram_ras_n,            //            .ras_n
		output wire        sdram_we_n,             //            .we_n
		output wire [15:0] pio_led_export,         //     pio_led.export
		input  wire        uart_export_rxd,        // uart_export.rxd
		output wire        uart_export_txd,        //            .txd
		output wire [31:0] multi_reg_dataout_0,    //   multi_reg.dataout_0
		output wire [31:0] multi_reg_dataout_1,    //            .dataout_1
		output wire [31:0] multi_reg_dataout_2,    //            .dataout_2
		output wire [31:0] multi_reg_dataout_3,    //            .dataout_3
		output wire [31:0] multi_reg_dataout_4,    //            .dataout_4
		output wire [31:0] multi_reg_dataout_5,    //            .dataout_5
		output wire [31:0] multi_reg_dataout_6,    //            .dataout_6
		output wire [31:0] multi_reg_dataout_7,    //            .dataout_7
		output wire [31:0] multi_reg_dataout_8,    //            .dataout_8
		output wire [31:0] multi_reg_dataout_9,    //            .dataout_9
		output wire [31:0] multi_reg_dataout_10,   //            .dataout_10
		output wire [31:0] multi_reg_dataout_11,   //            .dataout_11
		output wire [31:0] multi_reg_dataout_12,   //            .dataout_12
		output wire [31:0] multi_reg_dataout_13,   //            .dataout_13
		output wire [31:0] multi_reg_dataout_14,   //            .dataout_14
		output wire [31:0] multi_reg_dataout_15,   //            .dataout_15
		input  wire [31:0] multi_reg_datain_0,     //            .datain_0
		input  wire [31:0] multi_reg_datain_1,     //            .datain_1
		input  wire [31:0] multi_reg_datain_2,     //            .datain_2
		input  wire [31:0] multi_reg_datain_3,     //            .datain_3
		input  wire [31:0] multi_reg_datain_4,     //            .datain_4
		input  wire [31:0] multi_reg_datain_5,     //            .datain_5
		input  wire [31:0] multi_reg_datain_6,     //            .datain_6
		input  wire [31:0] multi_reg_datain_7,     //            .datain_7
		input  wire [31:0] multi_reg_datain_8,     //            .datain_8
		input  wire [31:0] multi_reg_datain_9,     //            .datain_9
		input  wire [31:0] multi_reg_datain_10,    //            .datain_10
		input  wire [31:0] multi_reg_datain_11,    //            .datain_11
		input  wire [31:0] multi_reg_datain_12,    //            .datain_12
		input  wire [31:0] multi_reg_datain_13,    //            .datain_13
		input  wire [31:0] multi_reg_datain_14,    //            .datain_14
		input  wire [31:0] multi_reg_datain_15,    //            .datain_15
		input  wire        reset_reset_n,          //       reset.reset_n
		input  wire        clk_clk,                //         clk.clk
		output wire        epcs_dclk,              //        epcs.dclk
		output wire        epcs_sce,               //            .sce
		output wire        epcs_sdo,               //            .sdo
		input  wire        epcs_data0,             //            .data0
		output wire [31:0] multi_reg_1_dataout_0,  // multi_reg_1.dataout_0
		output wire [31:0] multi_reg_1_dataout_1,  //            .dataout_1
		output wire [31:0] multi_reg_1_dataout_2,  //            .dataout_2
		output wire [31:0] multi_reg_1_dataout_3,  //            .dataout_3
		output wire [31:0] multi_reg_1_dataout_4,  //            .dataout_4
		output wire [31:0] multi_reg_1_dataout_5,  //            .dataout_5
		output wire [31:0] multi_reg_1_dataout_6,  //            .dataout_6
		output wire [31:0] multi_reg_1_dataout_7,  //            .dataout_7
		output wire [31:0] multi_reg_1_dataout_8,  //            .dataout_8
		output wire [31:0] multi_reg_1_dataout_9,  //            .dataout_9
		output wire [31:0] multi_reg_1_dataout_10, //            .dataout_10
		output wire [31:0] multi_reg_1_dataout_11, //            .dataout_11
		output wire [31:0] multi_reg_1_dataout_12, //            .dataout_12
		output wire [31:0] multi_reg_1_dataout_13, //            .dataout_13
		output wire [31:0] multi_reg_1_dataout_14, //            .dataout_14
		output wire [31:0] multi_reg_1_dataout_15, //            .dataout_15
		input  wire [31:0] multi_reg_1_datain_0,   //            .datain_0
		input  wire [31:0] multi_reg_1_datain_1,   //            .datain_1
		input  wire [31:0] multi_reg_1_datain_2,   //            .datain_2
		input  wire [31:0] multi_reg_1_datain_3,   //            .datain_3
		input  wire [31:0] multi_reg_1_datain_4,   //            .datain_4
		input  wire [31:0] multi_reg_1_datain_5,   //            .datain_5
		input  wire [31:0] multi_reg_1_datain_6,   //            .datain_6
		input  wire [31:0] multi_reg_1_datain_7,   //            .datain_7
		input  wire [31:0] multi_reg_1_datain_8,   //            .datain_8
		input  wire [31:0] multi_reg_1_datain_9,   //            .datain_9
		input  wire [31:0] multi_reg_1_datain_10,  //            .datain_10
		input  wire [31:0] multi_reg_1_datain_11,  //            .datain_11
		input  wire [31:0] multi_reg_1_datain_12,  //            .datain_12
		input  wire [31:0] multi_reg_1_datain_13,  //            .datain_13
		input  wire [31:0] multi_reg_1_datain_14,  //            .datain_14
		input  wire [31:0] multi_reg_1_datain_15,  //            .datain_15
		output wire        sdram_clk_clk           //   sdram_clk.clk
	);

	wire         up_clock_sys_clk_clk;                                                                                         // up_clock:sys_clk -> [addr_router:clk, addr_router_001:clk, addr_router_002:clk, burst_adapter:clk, cmd_xbar_demux:clk, cmd_xbar_demux_001:clk, cmd_xbar_demux_002:clk, cmd_xbar_mux:clk, cmd_xbar_mux_001:clk, cmd_xbar_mux_002:clk, cmd_xbar_mux_003:clk, cmd_xbar_mux_011:clk, cpu:clk, cpu_data_master_translator:clk, cpu_data_master_translator_avalon_universal_master_0_agent:clk, cpu_instruction_master_translator:clk, cpu_instruction_master_translator_avalon_universal_master_0_agent:clk, cpu_jtag_debug_module_translator:clk, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:clk, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, epcs_flash_controller:clk, epcs_flash_controller_epcs_control_port_translator:clk, epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:clk, epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, id_router:clk, id_router_001:clk, id_router_002:clk, id_router_003:clk, id_router_004:clk, id_router_005:clk, id_router_006:clk, id_router_007:clk, id_router_008:clk, id_router_009:clk, id_router_010:clk, id_router_011:clk, id_router_012:clk, irq_mapper:clk, jtag_uart:clk, jtag_uart_avalon_jtag_slave_translator:clk, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:clk, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, limiter:clk, limiter_001:clk, limiter_002:clk, onchip_memory2:clk, onchip_memory2_s1_translator:clk, onchip_memory2_s1_translator_avalon_universal_slave_0_agent:clk, onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, pio_0:clk, pio_0_s1_translator:clk, pio_0_s1_translator_avalon_universal_slave_0_agent:clk, pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, rsp_xbar_demux:clk, rsp_xbar_demux_001:clk, rsp_xbar_demux_002:clk, rsp_xbar_demux_003:clk, rsp_xbar_demux_004:clk, rsp_xbar_demux_005:clk, rsp_xbar_demux_006:clk, rsp_xbar_demux_007:clk, rsp_xbar_demux_008:clk, rsp_xbar_demux_009:clk, rsp_xbar_demux_010:clk, rsp_xbar_demux_011:clk, rsp_xbar_demux_012:clk, rsp_xbar_mux:clk, rsp_xbar_mux_001:clk, rst_controller:clk, rst_controller_002:clk, sdram_0:clk, sdram_0_s1_translator:clk, sdram_0_s1_translator_avalon_universal_slave_0_agent:clk, sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, slave_template_0:clk, slave_template_0_s0_translator:clk, slave_template_0_s0_translator_avalon_universal_slave_0_agent:clk, slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, slave_template_1:clk, slave_template_1_s0_translator:clk, slave_template_1_s0_translator_avalon_universal_slave_0_agent:clk, slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, sys_clk_timer:clk, sys_clk_timer_s1_translator:clk, sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:clk, sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, sysid_qsys_0:clock, sysid_qsys_0_control_slave_translator:clk, sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:clk, sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, timer_0:clk, timer_0_s1_translator:clk, timer_0_s1_translator_avalon_universal_slave_0_agent:clk, timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, uart:clk, uart_s1_translator:clk, uart_s1_translator_avalon_universal_slave_0_agent:clk, uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, vic_0:clk_clk, vic_0_csr_access_translator:clk, vic_0_csr_access_translator_avalon_universal_slave_0_agent:clk, vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:clk, vic_0_dummy_master_translator:clk, vic_0_dummy_master_translator_avalon_universal_master_0_agent:clk, width_adapter:clk, width_adapter_001:clk]
	wire         vic_0_interrupt_controller_out_valid;                                                                         // vic_0:interrupt_controller_out_valid -> cpu:eic_port_valid
	wire  [44:0] vic_0_interrupt_controller_out_data;                                                                          // vic_0:interrupt_controller_out_data -> cpu:eic_port_data
	wire         cpu_instruction_master_waitrequest;                                                                           // cpu_instruction_master_translator:av_waitrequest -> cpu:i_waitrequest
	wire  [26:0] cpu_instruction_master_address;                                                                               // cpu:i_address -> cpu_instruction_master_translator:av_address
	wire         cpu_instruction_master_read;                                                                                  // cpu:i_read -> cpu_instruction_master_translator:av_read
	wire  [31:0] cpu_instruction_master_readdata;                                                                              // cpu_instruction_master_translator:av_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_readdatavalid;                                                                         // cpu_instruction_master_translator:av_readdatavalid -> cpu:i_readdatavalid
	wire         cpu_data_master_waitrequest;                                                                                  // cpu_data_master_translator:av_waitrequest -> cpu:d_waitrequest
	wire  [31:0] cpu_data_master_writedata;                                                                                    // cpu:d_writedata -> cpu_data_master_translator:av_writedata
	wire  [26:0] cpu_data_master_address;                                                                                      // cpu:d_address -> cpu_data_master_translator:av_address
	wire         cpu_data_master_write;                                                                                        // cpu:d_write -> cpu_data_master_translator:av_write
	wire         cpu_data_master_read;                                                                                         // cpu:d_read -> cpu_data_master_translator:av_read
	wire  [31:0] cpu_data_master_readdata;                                                                                     // cpu_data_master_translator:av_readdata -> cpu:d_readdata
	wire         cpu_data_master_debugaccess;                                                                                  // cpu:jtag_debug_module_debugaccess_to_roms -> cpu_data_master_translator:av_debugaccess
	wire         cpu_data_master_readdatavalid;                                                                                // cpu_data_master_translator:av_readdatavalid -> cpu:d_readdatavalid
	wire   [3:0] cpu_data_master_byteenable;                                                                                   // cpu:d_byteenable -> cpu_data_master_translator:av_byteenable
	wire         vic_0_dummy_master_waitrequest;                                                                               // vic_0_dummy_master_translator:av_waitrequest -> vic_0:dummy_master_waitrequest
	wire  [31:0] vic_0_dummy_master_writedata;                                                                                 // vic_0:dummy_master_writedata -> vic_0_dummy_master_translator:av_writedata
	wire  [31:0] vic_0_dummy_master_address;                                                                                   // vic_0:dummy_master_address -> vic_0_dummy_master_translator:av_address
	wire         vic_0_dummy_master_write;                                                                                     // vic_0:dummy_master_write -> vic_0_dummy_master_translator:av_write
	wire         vic_0_dummy_master_read;                                                                                      // vic_0:dummy_master_read -> vic_0_dummy_master_translator:av_read
	wire  [31:0] vic_0_dummy_master_readdata;                                                                                  // vic_0_dummy_master_translator:av_readdata -> vic_0:dummy_master_readdata
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata;                                               // cpu_jtag_debug_module_translator:av_writedata -> cpu:jtag_debug_module_writedata
	wire   [8:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_address;                                                 // cpu_jtag_debug_module_translator:av_address -> cpu:jtag_debug_module_address
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect;                                              // cpu_jtag_debug_module_translator:av_chipselect -> cpu:jtag_debug_module_select
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_write;                                                   // cpu_jtag_debug_module_translator:av_write -> cpu:jtag_debug_module_write
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata;                                                // cpu:jtag_debug_module_readdata -> cpu_jtag_debug_module_translator:av_readdata
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer;                                           // cpu_jtag_debug_module_translator:av_begintransfer -> cpu:jtag_debug_module_begintransfer
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess;                                             // cpu_jtag_debug_module_translator:av_debugaccess -> cpu:jtag_debug_module_debugaccess
	wire   [3:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable;                                              // cpu_jtag_debug_module_translator:av_byteenable -> cpu:jtag_debug_module_byteenable
	wire  [31:0] onchip_memory2_s1_translator_avalon_anti_slave_0_writedata;                                                   // onchip_memory2_s1_translator:av_writedata -> onchip_memory2:writedata
	wire   [9:0] onchip_memory2_s1_translator_avalon_anti_slave_0_address;                                                     // onchip_memory2_s1_translator:av_address -> onchip_memory2:address
	wire         onchip_memory2_s1_translator_avalon_anti_slave_0_chipselect;                                                  // onchip_memory2_s1_translator:av_chipselect -> onchip_memory2:chipselect
	wire         onchip_memory2_s1_translator_avalon_anti_slave_0_clken;                                                       // onchip_memory2_s1_translator:av_clken -> onchip_memory2:clken
	wire         onchip_memory2_s1_translator_avalon_anti_slave_0_write;                                                       // onchip_memory2_s1_translator:av_write -> onchip_memory2:write
	wire  [31:0] onchip_memory2_s1_translator_avalon_anti_slave_0_readdata;                                                    // onchip_memory2:readdata -> onchip_memory2_s1_translator:av_readdata
	wire   [3:0] onchip_memory2_s1_translator_avalon_anti_slave_0_byteenable;                                                  // onchip_memory2_s1_translator:av_byteenable -> onchip_memory2:byteenable
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_writedata;                             // epcs_flash_controller_epcs_control_port_translator:av_writedata -> epcs_flash_controller:writedata
	wire   [8:0] epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_address;                               // epcs_flash_controller_epcs_control_port_translator:av_address -> epcs_flash_controller:address
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_chipselect;                            // epcs_flash_controller_epcs_control_port_translator:av_chipselect -> epcs_flash_controller:chipselect
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_write;                                 // epcs_flash_controller_epcs_control_port_translator:av_write -> epcs_flash_controller:write_n
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_read;                                  // epcs_flash_controller_epcs_control_port_translator:av_read -> epcs_flash_controller:read_n
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_readdata;                              // epcs_flash_controller:readdata -> epcs_flash_controller_epcs_control_port_translator:av_readdata
	wire         sdram_0_s1_translator_avalon_anti_slave_0_waitrequest;                                                        // sdram_0:za_waitrequest -> sdram_0_s1_translator:av_waitrequest
	wire  [15:0] sdram_0_s1_translator_avalon_anti_slave_0_writedata;                                                          // sdram_0_s1_translator:av_writedata -> sdram_0:az_data
	wire  [23:0] sdram_0_s1_translator_avalon_anti_slave_0_address;                                                            // sdram_0_s1_translator:av_address -> sdram_0:az_addr
	wire         sdram_0_s1_translator_avalon_anti_slave_0_chipselect;                                                         // sdram_0_s1_translator:av_chipselect -> sdram_0:az_cs
	wire         sdram_0_s1_translator_avalon_anti_slave_0_write;                                                              // sdram_0_s1_translator:av_write -> sdram_0:az_wr_n
	wire         sdram_0_s1_translator_avalon_anti_slave_0_read;                                                               // sdram_0_s1_translator:av_read -> sdram_0:az_rd_n
	wire  [15:0] sdram_0_s1_translator_avalon_anti_slave_0_readdata;                                                           // sdram_0:za_data -> sdram_0_s1_translator:av_readdata
	wire         sdram_0_s1_translator_avalon_anti_slave_0_readdatavalid;                                                      // sdram_0:za_valid -> sdram_0_s1_translator:av_readdatavalid
	wire   [1:0] sdram_0_s1_translator_avalon_anti_slave_0_byteenable;                                                         // sdram_0_s1_translator:av_byteenable -> sdram_0:az_be_n
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest;                                       // jtag_uart:av_waitrequest -> jtag_uart_avalon_jtag_slave_translator:av_waitrequest
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata;                                         // jtag_uart_avalon_jtag_slave_translator:av_writedata -> jtag_uart:av_writedata
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address;                                           // jtag_uart_avalon_jtag_slave_translator:av_address -> jtag_uart:av_address
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect;                                        // jtag_uart_avalon_jtag_slave_translator:av_chipselect -> jtag_uart:av_chipselect
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write;                                             // jtag_uart_avalon_jtag_slave_translator:av_write -> jtag_uart:av_write_n
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read;                                              // jtag_uart_avalon_jtag_slave_translator:av_read -> jtag_uart:av_read_n
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata;                                          // jtag_uart:av_readdata -> jtag_uart_avalon_jtag_slave_translator:av_readdata
	wire  [31:0] pio_0_s1_translator_avalon_anti_slave_0_writedata;                                                            // pio_0_s1_translator:av_writedata -> pio_0:writedata
	wire   [2:0] pio_0_s1_translator_avalon_anti_slave_0_address;                                                              // pio_0_s1_translator:av_address -> pio_0:address
	wire         pio_0_s1_translator_avalon_anti_slave_0_chipselect;                                                           // pio_0_s1_translator:av_chipselect -> pio_0:chipselect
	wire         pio_0_s1_translator_avalon_anti_slave_0_write;                                                                // pio_0_s1_translator:av_write -> pio_0:write_n
	wire  [31:0] pio_0_s1_translator_avalon_anti_slave_0_readdata;                                                             // pio_0:readdata -> pio_0_s1_translator:av_readdata
	wire  [31:0] slave_template_0_s0_translator_avalon_anti_slave_0_writedata;                                                 // slave_template_0_s0_translator:av_writedata -> slave_template_0:slave_writedata
	wire   [8:0] slave_template_0_s0_translator_avalon_anti_slave_0_address;                                                   // slave_template_0_s0_translator:av_address -> slave_template_0:slave_address
	wire         slave_template_0_s0_translator_avalon_anti_slave_0_write;                                                     // slave_template_0_s0_translator:av_write -> slave_template_0:slave_write
	wire         slave_template_0_s0_translator_avalon_anti_slave_0_read;                                                      // slave_template_0_s0_translator:av_read -> slave_template_0:slave_read
	wire  [31:0] slave_template_0_s0_translator_avalon_anti_slave_0_readdata;                                                  // slave_template_0:slave_readdata -> slave_template_0_s0_translator:av_readdata
	wire   [3:0] slave_template_0_s0_translator_avalon_anti_slave_0_byteenable;                                                // slave_template_0_s0_translator:av_byteenable -> slave_template_0:slave_byteenable
	wire  [15:0] uart_s1_translator_avalon_anti_slave_0_writedata;                                                             // uart_s1_translator:av_writedata -> uart:writedata
	wire   [2:0] uart_s1_translator_avalon_anti_slave_0_address;                                                               // uart_s1_translator:av_address -> uart:address
	wire         uart_s1_translator_avalon_anti_slave_0_chipselect;                                                            // uart_s1_translator:av_chipselect -> uart:chipselect
	wire         uart_s1_translator_avalon_anti_slave_0_write;                                                                 // uart_s1_translator:av_write -> uart:write_n
	wire         uart_s1_translator_avalon_anti_slave_0_read;                                                                  // uart_s1_translator:av_read -> uart:read_n
	wire  [15:0] uart_s1_translator_avalon_anti_slave_0_readdata;                                                              // uart:readdata -> uart_s1_translator:av_readdata
	wire         uart_s1_translator_avalon_anti_slave_0_begintransfer;                                                         // uart_s1_translator:av_begintransfer -> uart:begintransfer
	wire         sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_address;                                            // sysid_qsys_0_control_slave_translator:av_address -> sysid_qsys_0:address
	wire  [31:0] sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_readdata;                                           // sysid_qsys_0:readdata -> sysid_qsys_0_control_slave_translator:av_readdata
	wire  [31:0] slave_template_1_s0_translator_avalon_anti_slave_0_writedata;                                                 // slave_template_1_s0_translator:av_writedata -> slave_template_1:slave_writedata
	wire   [8:0] slave_template_1_s0_translator_avalon_anti_slave_0_address;                                                   // slave_template_1_s0_translator:av_address -> slave_template_1:slave_address
	wire         slave_template_1_s0_translator_avalon_anti_slave_0_write;                                                     // slave_template_1_s0_translator:av_write -> slave_template_1:slave_write
	wire         slave_template_1_s0_translator_avalon_anti_slave_0_read;                                                      // slave_template_1_s0_translator:av_read -> slave_template_1:slave_read
	wire  [31:0] slave_template_1_s0_translator_avalon_anti_slave_0_readdata;                                                  // slave_template_1:slave_readdata -> slave_template_1_s0_translator:av_readdata
	wire   [3:0] slave_template_1_s0_translator_avalon_anti_slave_0_byteenable;                                                // slave_template_1_s0_translator:av_byteenable -> slave_template_1:slave_byteenable
	wire  [15:0] sys_clk_timer_s1_translator_avalon_anti_slave_0_writedata;                                                    // sys_clk_timer_s1_translator:av_writedata -> sys_clk_timer:writedata
	wire   [2:0] sys_clk_timer_s1_translator_avalon_anti_slave_0_address;                                                      // sys_clk_timer_s1_translator:av_address -> sys_clk_timer:address
	wire         sys_clk_timer_s1_translator_avalon_anti_slave_0_chipselect;                                                   // sys_clk_timer_s1_translator:av_chipselect -> sys_clk_timer:chipselect
	wire         sys_clk_timer_s1_translator_avalon_anti_slave_0_write;                                                        // sys_clk_timer_s1_translator:av_write -> sys_clk_timer:write_n
	wire  [15:0] sys_clk_timer_s1_translator_avalon_anti_slave_0_readdata;                                                     // sys_clk_timer:readdata -> sys_clk_timer_s1_translator:av_readdata
	wire  [31:0] vic_0_csr_access_translator_avalon_anti_slave_0_writedata;                                                    // vic_0_csr_access_translator:av_writedata -> vic_0:csr_access_writedata
	wire   [7:0] vic_0_csr_access_translator_avalon_anti_slave_0_address;                                                      // vic_0_csr_access_translator:av_address -> vic_0:csr_access_address
	wire         vic_0_csr_access_translator_avalon_anti_slave_0_write;                                                        // vic_0_csr_access_translator:av_write -> vic_0:csr_access_write
	wire         vic_0_csr_access_translator_avalon_anti_slave_0_read;                                                         // vic_0_csr_access_translator:av_read -> vic_0:csr_access_read
	wire  [31:0] vic_0_csr_access_translator_avalon_anti_slave_0_readdata;                                                     // vic_0:csr_access_readdata -> vic_0_csr_access_translator:av_readdata
	wire  [15:0] timer_0_s1_translator_avalon_anti_slave_0_writedata;                                                          // timer_0_s1_translator:av_writedata -> timer_0:writedata
	wire   [2:0] timer_0_s1_translator_avalon_anti_slave_0_address;                                                            // timer_0_s1_translator:av_address -> timer_0:address
	wire         timer_0_s1_translator_avalon_anti_slave_0_chipselect;                                                         // timer_0_s1_translator:av_chipselect -> timer_0:chipselect
	wire         timer_0_s1_translator_avalon_anti_slave_0_write;                                                              // timer_0_s1_translator:av_write -> timer_0:write_n
	wire  [15:0] timer_0_s1_translator_avalon_anti_slave_0_readdata;                                                           // timer_0:readdata -> timer_0_s1_translator:av_readdata
	wire         cpu_instruction_master_translator_avalon_universal_master_0_waitrequest;                                      // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_instruction_master_translator:uav_waitrequest
	wire   [2:0] cpu_instruction_master_translator_avalon_universal_master_0_burstcount;                                       // cpu_instruction_master_translator:uav_burstcount -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_instruction_master_translator_avalon_universal_master_0_writedata;                                        // cpu_instruction_master_translator:uav_writedata -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [31:0] cpu_instruction_master_translator_avalon_universal_master_0_address;                                          // cpu_instruction_master_translator:uav_address -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_instruction_master_translator_avalon_universal_master_0_lock;                                             // cpu_instruction_master_translator:uav_lock -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_instruction_master_translator_avalon_universal_master_0_write;                                            // cpu_instruction_master_translator:uav_write -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_instruction_master_translator_avalon_universal_master_0_read;                                             // cpu_instruction_master_translator:uav_read -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_instruction_master_translator_avalon_universal_master_0_readdata;                                         // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_instruction_master_translator:uav_readdata
	wire         cpu_instruction_master_translator_avalon_universal_master_0_debugaccess;                                      // cpu_instruction_master_translator:uav_debugaccess -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_instruction_master_translator_avalon_universal_master_0_byteenable;                                       // cpu_instruction_master_translator:uav_byteenable -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid;                                    // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_instruction_master_translator:uav_readdatavalid
	wire         cpu_data_master_translator_avalon_universal_master_0_waitrequest;                                             // cpu_data_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_data_master_translator:uav_waitrequest
	wire   [2:0] cpu_data_master_translator_avalon_universal_master_0_burstcount;                                              // cpu_data_master_translator:uav_burstcount -> cpu_data_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_data_master_translator_avalon_universal_master_0_writedata;                                               // cpu_data_master_translator:uav_writedata -> cpu_data_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [31:0] cpu_data_master_translator_avalon_universal_master_0_address;                                                 // cpu_data_master_translator:uav_address -> cpu_data_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_data_master_translator_avalon_universal_master_0_lock;                                                    // cpu_data_master_translator:uav_lock -> cpu_data_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_data_master_translator_avalon_universal_master_0_write;                                                   // cpu_data_master_translator:uav_write -> cpu_data_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_data_master_translator_avalon_universal_master_0_read;                                                    // cpu_data_master_translator:uav_read -> cpu_data_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_data_master_translator_avalon_universal_master_0_readdata;                                                // cpu_data_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_data_master_translator:uav_readdata
	wire         cpu_data_master_translator_avalon_universal_master_0_debugaccess;                                             // cpu_data_master_translator:uav_debugaccess -> cpu_data_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_data_master_translator_avalon_universal_master_0_byteenable;                                              // cpu_data_master_translator:uav_byteenable -> cpu_data_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_data_master_translator_avalon_universal_master_0_readdatavalid;                                           // cpu_data_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_data_master_translator:uav_readdatavalid
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_waitrequest;                                          // vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_waitrequest -> vic_0_dummy_master_translator:uav_waitrequest
	wire   [2:0] vic_0_dummy_master_translator_avalon_universal_master_0_burstcount;                                           // vic_0_dummy_master_translator:uav_burstcount -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] vic_0_dummy_master_translator_avalon_universal_master_0_writedata;                                            // vic_0_dummy_master_translator:uav_writedata -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [31:0] vic_0_dummy_master_translator_avalon_universal_master_0_address;                                              // vic_0_dummy_master_translator:uav_address -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_address
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_lock;                                                 // vic_0_dummy_master_translator:uav_lock -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_lock
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_write;                                                // vic_0_dummy_master_translator:uav_write -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_write
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_read;                                                 // vic_0_dummy_master_translator:uav_read -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] vic_0_dummy_master_translator_avalon_universal_master_0_readdata;                                             // vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_readdata -> vic_0_dummy_master_translator:uav_readdata
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_debugaccess;                                          // vic_0_dummy_master_translator:uav_debugaccess -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] vic_0_dummy_master_translator_avalon_universal_master_0_byteenable;                                           // vic_0_dummy_master_translator:uav_byteenable -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_readdatavalid;                                        // vic_0_dummy_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> vic_0_dummy_master_translator:uav_readdatavalid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest;                               // cpu_jtag_debug_module_translator:uav_waitrequest -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount;                                // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_burstcount -> cpu_jtag_debug_module_translator:uav_burstcount
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata;                                 // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_writedata -> cpu_jtag_debug_module_translator:uav_writedata
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address;                                   // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_address -> cpu_jtag_debug_module_translator:uav_address
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write;                                     // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_write -> cpu_jtag_debug_module_translator:uav_write
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock;                                      // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_lock -> cpu_jtag_debug_module_translator:uav_lock
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read;                                      // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_read -> cpu_jtag_debug_module_translator:uav_read
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata;                                  // cpu_jtag_debug_module_translator:uav_readdata -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                             // cpu_jtag_debug_module_translator:uav_readdatavalid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess;                               // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_debugaccess -> cpu_jtag_debug_module_translator:uav_debugaccess
	wire   [3:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable;                                // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_byteenable -> cpu_jtag_debug_module_translator:uav_byteenable
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                        // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid;                              // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                      // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data;                               // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready;                              // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                     // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                           // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                   // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                            // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                           // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                         // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                          // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                         // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                   // onchip_memory2_s1_translator:uav_waitrequest -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                    // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> onchip_memory2_s1_translator:uav_burstcount
	wire  [31:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                     // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> onchip_memory2_s1_translator:uav_writedata
	wire  [31:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_address;                                       // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_address -> onchip_memory2_s1_translator:uav_address
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_write;                                         // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_write -> onchip_memory2_s1_translator:uav_write
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                          // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_lock -> onchip_memory2_s1_translator:uav_lock
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_read;                                          // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_read -> onchip_memory2_s1_translator:uav_read
	wire  [31:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                      // onchip_memory2_s1_translator:uav_readdata -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                 // onchip_memory2_s1_translator:uav_readdatavalid -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                   // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> onchip_memory2_s1_translator:uav_debugaccess
	wire   [3:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                    // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> onchip_memory2_s1_translator:uav_byteenable
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                            // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                  // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                          // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                   // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                  // onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                         // onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                               // onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                       // onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                // onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                               // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                             // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                              // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                             // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_waitrequest;             // epcs_flash_controller_epcs_control_port_translator:uav_waitrequest -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_burstcount;              // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_burstcount -> epcs_flash_controller_epcs_control_port_translator:uav_burstcount
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_writedata;               // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_writedata -> epcs_flash_controller_epcs_control_port_translator:uav_writedata
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_address;                 // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_address -> epcs_flash_controller_epcs_control_port_translator:uav_address
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_write;                   // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_write -> epcs_flash_controller_epcs_control_port_translator:uav_write
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_lock;                    // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_lock -> epcs_flash_controller_epcs_control_port_translator:uav_lock
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_read;                    // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_read -> epcs_flash_controller_epcs_control_port_translator:uav_read
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdata;                // epcs_flash_controller_epcs_control_port_translator:uav_readdata -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdatavalid;           // epcs_flash_controller_epcs_control_port_translator:uav_readdatavalid -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_debugaccess;             // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_debugaccess -> epcs_flash_controller_epcs_control_port_translator:uav_debugaccess
	wire   [3:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_byteenable;              // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:m0_byteenable -> epcs_flash_controller_epcs_control_port_translator:uav_byteenable
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;      // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_valid;            // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_source_valid -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;    // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_data;             // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_source_data -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_ready;            // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;   // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;         // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket; // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;          // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;         // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rf_sink_ready -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;       // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;        // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;       // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                          // sdram_0_s1_translator:uav_waitrequest -> sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [1:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                           // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> sdram_0_s1_translator:uav_burstcount
	wire  [15:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                            // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> sdram_0_s1_translator:uav_writedata
	wire  [31:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                                              // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> sdram_0_s1_translator:uav_address
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                                                // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> sdram_0_s1_translator:uav_write
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                                 // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> sdram_0_s1_translator:uav_lock
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                                                 // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> sdram_0_s1_translator:uav_read
	wire  [15:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                             // sdram_0_s1_translator:uav_readdata -> sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                        // sdram_0_s1_translator:uav_readdatavalid -> sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                          // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> sdram_0_s1_translator:uav_debugaccess
	wire   [1:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                           // sdram_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> sdram_0_s1_translator:uav_byteenable
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                                   // sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                         // sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                                 // sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [71:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                          // sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                         // sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                                // sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                      // sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                              // sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [71:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                       // sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                      // sdram_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                                    // sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [15:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                                     // sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                                    // sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;                         // jtag_uart_avalon_jtag_slave_translator:uav_waitrequest -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;                          // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> jtag_uart_avalon_jtag_slave_translator:uav_burstcount
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata;                           // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> jtag_uart_avalon_jtag_slave_translator:uav_writedata
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address;                             // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_address -> jtag_uart_avalon_jtag_slave_translator:uav_address
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write;                               // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_write -> jtag_uart_avalon_jtag_slave_translator:uav_write
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock;                                // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_lock -> jtag_uart_avalon_jtag_slave_translator:uav_lock
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read;                                // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_read -> jtag_uart_avalon_jtag_slave_translator:uav_read
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                            // jtag_uart_avalon_jtag_slave_translator:uav_readdata -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                       // jtag_uart_avalon_jtag_slave_translator:uav_readdatavalid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;                         // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> jtag_uart_avalon_jtag_slave_translator:uav_debugaccess
	wire   [3:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;                          // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> jtag_uart_avalon_jtag_slave_translator:uav_byteenable
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                  // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;                        // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data;                         // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;                        // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;               // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                     // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;             // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                      // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                     // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                   // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                   // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                            // pio_0_s1_translator:uav_waitrequest -> pio_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] pio_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                             // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> pio_0_s1_translator:uav_burstcount
	wire  [31:0] pio_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                              // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> pio_0_s1_translator:uav_writedata
	wire  [31:0] pio_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                                                // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> pio_0_s1_translator:uav_address
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                                                  // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> pio_0_s1_translator:uav_write
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                                   // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> pio_0_s1_translator:uav_lock
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                                                   // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> pio_0_s1_translator:uav_read
	wire  [31:0] pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                               // pio_0_s1_translator:uav_readdata -> pio_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                          // pio_0_s1_translator:uav_readdatavalid -> pio_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                            // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> pio_0_s1_translator:uav_debugaccess
	wire   [3:0] pio_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                             // pio_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> pio_0_s1_translator:uav_byteenable
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                                     // pio_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                           // pio_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                                   // pio_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                            // pio_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                           // pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> pio_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                                  // pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                        // pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> pio_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                                // pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                         // pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> pio_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                        // pio_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                                      // pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                                       // pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                                      // pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> pio_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                 // slave_template_0_s0_translator:uav_waitrequest -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_burstcount;                                  // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_burstcount -> slave_template_0_s0_translator:uav_burstcount
	wire  [31:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_writedata;                                   // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_writedata -> slave_template_0_s0_translator:uav_writedata
	wire  [31:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_address;                                     // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_address -> slave_template_0_s0_translator:uav_address
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_write;                                       // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_write -> slave_template_0_s0_translator:uav_write
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_lock;                                        // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_lock -> slave_template_0_s0_translator:uav_lock
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_read;                                        // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_read -> slave_template_0_s0_translator:uav_read
	wire  [31:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdata;                                    // slave_template_0_s0_translator:uav_readdata -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                               // slave_template_0_s0_translator:uav_readdatavalid -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                 // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_debugaccess -> slave_template_0_s0_translator:uav_debugaccess
	wire   [3:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_byteenable;                                  // slave_template_0_s0_translator_avalon_universal_slave_0_agent:m0_byteenable -> slave_template_0_s0_translator:uav_byteenable
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                          // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_valid;                                // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_source_valid -> slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                        // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_data;                                 // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_source_data -> slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_ready;                                // slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                       // slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                             // slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                     // slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                              // slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                             // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rf_sink_ready -> slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                           // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                            // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                           // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                             // uart_s1_translator:uav_waitrequest -> uart_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] uart_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                              // uart_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> uart_s1_translator:uav_burstcount
	wire  [31:0] uart_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                               // uart_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> uart_s1_translator:uav_writedata
	wire  [31:0] uart_s1_translator_avalon_universal_slave_0_agent_m0_address;                                                 // uart_s1_translator_avalon_universal_slave_0_agent:m0_address -> uart_s1_translator:uav_address
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_write;                                                   // uart_s1_translator_avalon_universal_slave_0_agent:m0_write -> uart_s1_translator:uav_write
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                                    // uart_s1_translator_avalon_universal_slave_0_agent:m0_lock -> uart_s1_translator:uav_lock
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_read;                                                    // uart_s1_translator_avalon_universal_slave_0_agent:m0_read -> uart_s1_translator:uav_read
	wire  [31:0] uart_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                                // uart_s1_translator:uav_readdata -> uart_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                           // uart_s1_translator:uav_readdatavalid -> uart_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         uart_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                             // uart_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> uart_s1_translator:uav_debugaccess
	wire   [3:0] uart_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                              // uart_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> uart_s1_translator:uav_byteenable
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                                      // uart_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                            // uart_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                                    // uart_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] uart_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                             // uart_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                            // uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> uart_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                                   // uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> uart_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                         // uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> uart_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                                 // uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> uart_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                          // uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> uart_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                         // uart_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                                       // uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                                        // uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                                       // uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> uart_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;                          // sysid_qsys_0_control_slave_translator:uav_waitrequest -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;                           // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> sysid_qsys_0_control_slave_translator:uav_burstcount
	wire  [31:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata;                            // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> sysid_qsys_0_control_slave_translator:uav_writedata
	wire  [31:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address;                              // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_address -> sysid_qsys_0_control_slave_translator:uav_address
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write;                                // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_write -> sysid_qsys_0_control_slave_translator:uav_write
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock;                                 // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_lock -> sysid_qsys_0_control_slave_translator:uav_lock
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read;                                 // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_read -> sysid_qsys_0_control_slave_translator:uav_read
	wire  [31:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                             // sysid_qsys_0_control_slave_translator:uav_readdata -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                        // sysid_qsys_0_control_slave_translator:uav_readdatavalid -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;                          // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> sysid_qsys_0_control_slave_translator:uav_debugaccess
	wire   [3:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;                           // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> sysid_qsys_0_control_slave_translator:uav_byteenable
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                   // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;                         // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                 // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data;                          // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;                         // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                      // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;              // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                       // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                      // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                    // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                     // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                    // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                 // slave_template_1_s0_translator:uav_waitrequest -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_burstcount;                                  // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_burstcount -> slave_template_1_s0_translator:uav_burstcount
	wire  [31:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_writedata;                                   // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_writedata -> slave_template_1_s0_translator:uav_writedata
	wire  [31:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_address;                                     // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_address -> slave_template_1_s0_translator:uav_address
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_write;                                       // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_write -> slave_template_1_s0_translator:uav_write
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_lock;                                        // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_lock -> slave_template_1_s0_translator:uav_lock
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_read;                                        // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_read -> slave_template_1_s0_translator:uav_read
	wire  [31:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdata;                                    // slave_template_1_s0_translator:uav_readdata -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                               // slave_template_1_s0_translator:uav_readdatavalid -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                 // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_debugaccess -> slave_template_1_s0_translator:uav_debugaccess
	wire   [3:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_byteenable;                                  // slave_template_1_s0_translator_avalon_universal_slave_0_agent:m0_byteenable -> slave_template_1_s0_translator:uav_byteenable
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                          // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_valid;                                // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_source_valid -> slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                        // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_data;                                 // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_source_data -> slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_ready;                                // slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                       // slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                             // slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                     // slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                              // slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                             // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rf_sink_ready -> slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                           // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                            // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                           // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                    // sys_clk_timer_s1_translator:uav_waitrequest -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                     // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> sys_clk_timer_s1_translator:uav_burstcount
	wire  [31:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                      // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> sys_clk_timer_s1_translator:uav_writedata
	wire  [31:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_address;                                        // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_address -> sys_clk_timer_s1_translator:uav_address
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_write;                                          // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_write -> sys_clk_timer_s1_translator:uav_write
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                           // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_lock -> sys_clk_timer_s1_translator:uav_lock
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_read;                                           // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_read -> sys_clk_timer_s1_translator:uav_read
	wire  [31:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                       // sys_clk_timer_s1_translator:uav_readdata -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                  // sys_clk_timer_s1_translator:uav_readdatavalid -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                    // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> sys_clk_timer_s1_translator:uav_debugaccess
	wire   [3:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                     // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> sys_clk_timer_s1_translator:uav_byteenable
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                             // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                   // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                           // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                    // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                   // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                          // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                        // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                 // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                              // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                               // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                              // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                    // vic_0_csr_access_translator:uav_waitrequest -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_burstcount;                                     // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_burstcount -> vic_0_csr_access_translator:uav_burstcount
	wire  [31:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_writedata;                                      // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_writedata -> vic_0_csr_access_translator:uav_writedata
	wire  [31:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_address;                                        // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_address -> vic_0_csr_access_translator:uav_address
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_write;                                          // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_write -> vic_0_csr_access_translator:uav_write
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_lock;                                           // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_lock -> vic_0_csr_access_translator:uav_lock
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_read;                                           // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_read -> vic_0_csr_access_translator:uav_read
	wire  [31:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdata;                                       // vic_0_csr_access_translator:uav_readdata -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                  // vic_0_csr_access_translator:uav_readdatavalid -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                    // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_debugaccess -> vic_0_csr_access_translator:uav_debugaccess
	wire   [3:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_byteenable;                                     // vic_0_csr_access_translator_avalon_universal_slave_0_agent:m0_byteenable -> vic_0_csr_access_translator:uav_byteenable
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                             // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_valid;                                   // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_source_valid -> vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                           // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_data;                                    // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_source_data -> vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_ready;                                   // vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                          // vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                // vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                        // vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                 // vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rf_sink_ready -> vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                              // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                               // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                              // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                          // timer_0_s1_translator:uav_waitrequest -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                           // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> timer_0_s1_translator:uav_burstcount
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                            // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> timer_0_s1_translator:uav_writedata
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                                              // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> timer_0_s1_translator:uav_address
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                                                // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> timer_0_s1_translator:uav_write
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> timer_0_s1_translator:uav_lock
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> timer_0_s1_translator:uav_read
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                             // timer_0_s1_translator:uav_readdata -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                        // timer_0_s1_translator:uav_readdatavalid -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                          // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> timer_0_s1_translator:uav_debugaccess
	wire   [3:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                           // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> timer_0_s1_translator:uav_byteenable
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                                   // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                         // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [89:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                          // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                         // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                                // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                      // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                              // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [89:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                       // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                      // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                                    // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                                     // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                                    // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                             // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router:sink_endofpacket
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid;                                   // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router:sink_valid
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                           // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router:sink_startofpacket
	wire  [88:0] cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data;                                    // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router:sink_data
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready;                                   // addr_router:sink_ready -> cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                                    // cpu_data_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router_001:sink_endofpacket
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid;                                          // cpu_data_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router_001:sink_valid
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                                  // cpu_data_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router_001:sink_startofpacket
	wire  [88:0] cpu_data_master_translator_avalon_universal_master_0_agent_cp_data;                                           // cpu_data_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router_001:sink_data
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready;                                          // addr_router_001:sink_ready -> cpu_data_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                                 // vic_0_dummy_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router_002:sink_endofpacket
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_valid;                                       // vic_0_dummy_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router_002:sink_valid
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                               // vic_0_dummy_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router_002:sink_startofpacket
	wire  [88:0] vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_data;                                        // vic_0_dummy_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router_002:sink_data
	wire         vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_ready;                                       // addr_router_002:sink_ready -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket;                               // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router:sink_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid;                                     // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_valid -> id_router:sink_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket;                             // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router:sink_startofpacket
	wire  [88:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data;                                      // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_data -> id_router:sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready;                                     // id_router:sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_ready
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                   // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_001:sink_endofpacket
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                         // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_001:sink_valid
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                 // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_001:sink_startofpacket
	wire  [88:0] onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_data;                                          // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_001:sink_data
	wire         onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                         // id_router_001:sink_ready -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_endofpacket;             // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_002:sink_endofpacket
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_valid;                   // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_002:sink_valid
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_startofpacket;           // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_002:sink_startofpacket
	wire  [88:0] epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_data;                    // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rp_data -> id_router_002:sink_data
	wire         epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_ready;                   // id_router_002:sink_ready -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:rp_ready
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                          // sdram_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_003:sink_endofpacket
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                                // sdram_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_003:sink_valid
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                        // sdram_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_003:sink_startofpacket
	wire  [70:0] sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                                                 // sdram_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_003:sink_data
	wire         sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                                // id_router_003:sink_ready -> sdram_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;                         // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_004:sink_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid;                               // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_004:sink_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;                       // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_004:sink_startofpacket
	wire  [88:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data;                                // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_004:sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready;                               // id_router_004:sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                            // pio_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_005:sink_endofpacket
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                                  // pio_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_005:sink_valid
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                          // pio_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_005:sink_startofpacket
	wire  [88:0] pio_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                                                   // pio_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_005:sink_data
	wire         pio_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                                  // id_router_005:sink_ready -> pio_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                 // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_006:sink_endofpacket
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_valid;                                       // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_006:sink_valid
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket;                               // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_006:sink_startofpacket
	wire  [88:0] slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_data;                                        // slave_template_0_s0_translator_avalon_universal_slave_0_agent:rp_data -> id_router_006:sink_data
	wire         slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_ready;                                       // id_router_006:sink_ready -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:rp_ready
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                             // uart_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_007:sink_endofpacket
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                                   // uart_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_007:sink_valid
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                           // uart_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_007:sink_startofpacket
	wire  [88:0] uart_s1_translator_avalon_universal_slave_0_agent_rp_data;                                                    // uart_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_007:sink_data
	wire         uart_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                                   // id_router_007:sink_ready -> uart_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;                          // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_008:sink_endofpacket
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid;                                // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_008:sink_valid
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;                        // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_008:sink_startofpacket
	wire  [88:0] sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data;                                 // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_008:sink_data
	wire         sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready;                                // id_router_008:sink_ready -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                 // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_009:sink_endofpacket
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_valid;                                       // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_009:sink_valid
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket;                               // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_009:sink_startofpacket
	wire  [88:0] slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_data;                                        // slave_template_1_s0_translator_avalon_universal_slave_0_agent:rp_data -> id_router_009:sink_data
	wire         slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_ready;                                       // id_router_009:sink_ready -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:rp_ready
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                    // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_010:sink_endofpacket
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                          // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_010:sink_valid
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                  // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_010:sink_startofpacket
	wire  [88:0] sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_data;                                           // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_010:sink_data
	wire         sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                          // id_router_010:sink_ready -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                    // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_011:sink_endofpacket
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_valid;                                          // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_011:sink_valid
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                  // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_011:sink_startofpacket
	wire  [88:0] vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_data;                                           // vic_0_csr_access_translator_avalon_universal_slave_0_agent:rp_data -> id_router_011:sink_data
	wire         vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_ready;                                          // id_router_011:sink_ready -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:rp_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                          // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_012:sink_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                                // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_012:sink_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                        // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_012:sink_startofpacket
	wire  [88:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_012:sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                                // id_router_012:sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         addr_router_src_endofpacket;                                                                                  // addr_router:src_endofpacket -> limiter:cmd_sink_endofpacket
	wire         addr_router_src_valid;                                                                                        // addr_router:src_valid -> limiter:cmd_sink_valid
	wire         addr_router_src_startofpacket;                                                                                // addr_router:src_startofpacket -> limiter:cmd_sink_startofpacket
	wire  [88:0] addr_router_src_data;                                                                                         // addr_router:src_data -> limiter:cmd_sink_data
	wire  [12:0] addr_router_src_channel;                                                                                      // addr_router:src_channel -> limiter:cmd_sink_channel
	wire         addr_router_src_ready;                                                                                        // limiter:cmd_sink_ready -> addr_router:src_ready
	wire         limiter_rsp_src_endofpacket;                                                                                  // limiter:rsp_src_endofpacket -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_rsp_src_valid;                                                                                        // limiter:rsp_src_valid -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_rsp_src_startofpacket;                                                                                // limiter:rsp_src_startofpacket -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [88:0] limiter_rsp_src_data;                                                                                         // limiter:rsp_src_data -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_data
	wire  [12:0] limiter_rsp_src_channel;                                                                                      // limiter:rsp_src_channel -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_rsp_src_ready;                                                                                        // cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter:rsp_src_ready
	wire         addr_router_001_src_endofpacket;                                                                              // addr_router_001:src_endofpacket -> limiter_001:cmd_sink_endofpacket
	wire         addr_router_001_src_valid;                                                                                    // addr_router_001:src_valid -> limiter_001:cmd_sink_valid
	wire         addr_router_001_src_startofpacket;                                                                            // addr_router_001:src_startofpacket -> limiter_001:cmd_sink_startofpacket
	wire  [88:0] addr_router_001_src_data;                                                                                     // addr_router_001:src_data -> limiter_001:cmd_sink_data
	wire  [12:0] addr_router_001_src_channel;                                                                                  // addr_router_001:src_channel -> limiter_001:cmd_sink_channel
	wire         addr_router_001_src_ready;                                                                                    // limiter_001:cmd_sink_ready -> addr_router_001:src_ready
	wire         limiter_001_rsp_src_endofpacket;                                                                              // limiter_001:rsp_src_endofpacket -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_001_rsp_src_valid;                                                                                    // limiter_001:rsp_src_valid -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_001_rsp_src_startofpacket;                                                                            // limiter_001:rsp_src_startofpacket -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [88:0] limiter_001_rsp_src_data;                                                                                     // limiter_001:rsp_src_data -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_data
	wire  [12:0] limiter_001_rsp_src_channel;                                                                                  // limiter_001:rsp_src_channel -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_001_rsp_src_ready;                                                                                    // cpu_data_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter_001:rsp_src_ready
	wire         addr_router_002_src_endofpacket;                                                                              // addr_router_002:src_endofpacket -> limiter_002:cmd_sink_endofpacket
	wire         addr_router_002_src_valid;                                                                                    // addr_router_002:src_valid -> limiter_002:cmd_sink_valid
	wire         addr_router_002_src_startofpacket;                                                                            // addr_router_002:src_startofpacket -> limiter_002:cmd_sink_startofpacket
	wire  [88:0] addr_router_002_src_data;                                                                                     // addr_router_002:src_data -> limiter_002:cmd_sink_data
	wire  [12:0] addr_router_002_src_channel;                                                                                  // addr_router_002:src_channel -> limiter_002:cmd_sink_channel
	wire         addr_router_002_src_ready;                                                                                    // limiter_002:cmd_sink_ready -> addr_router_002:src_ready
	wire         limiter_002_rsp_src_endofpacket;                                                                              // limiter_002:rsp_src_endofpacket -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_002_rsp_src_valid;                                                                                    // limiter_002:rsp_src_valid -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_002_rsp_src_startofpacket;                                                                            // limiter_002:rsp_src_startofpacket -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [88:0] limiter_002_rsp_src_data;                                                                                     // limiter_002:rsp_src_data -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_data
	wire  [12:0] limiter_002_rsp_src_channel;                                                                                  // limiter_002:rsp_src_channel -> vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_002_rsp_src_ready;                                                                                    // vic_0_dummy_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter_002:rsp_src_ready
	wire         burst_adapter_source0_endofpacket;                                                                            // burst_adapter:source0_endofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         burst_adapter_source0_valid;                                                                                  // burst_adapter:source0_valid -> sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         burst_adapter_source0_startofpacket;                                                                          // burst_adapter:source0_startofpacket -> sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [70:0] burst_adapter_source0_data;                                                                                   // burst_adapter:source0_data -> sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire         burst_adapter_source0_ready;                                                                                  // sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> burst_adapter:source0_ready
	wire  [12:0] burst_adapter_source0_channel;                                                                                // burst_adapter:source0_channel -> sdram_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         rst_controller_reset_out_reset;                                                                               // rst_controller:reset_out -> [addr_router:reset, addr_router_001:reset, addr_router_002:reset, cmd_xbar_demux:reset, cmd_xbar_demux_001:reset, cmd_xbar_demux_002:reset, cmd_xbar_mux:reset, cmd_xbar_mux_001:reset, cmd_xbar_mux_002:reset, cmd_xbar_mux_011:reset, cpu:reset_n, cpu_data_master_translator:reset, cpu_data_master_translator_avalon_universal_master_0_agent:reset, cpu_instruction_master_translator:reset, cpu_instruction_master_translator_avalon_universal_master_0_agent:reset, cpu_jtag_debug_module_translator:reset, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:reset, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, epcs_flash_controller:reset_n, epcs_flash_controller_epcs_control_port_translator:reset, epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:reset, epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, id_router:reset, id_router_001:reset, id_router_002:reset, id_router_004:reset, id_router_005:reset, id_router_006:reset, id_router_007:reset, id_router_008:reset, id_router_009:reset, id_router_010:reset, id_router_011:reset, id_router_012:reset, irq_mapper:reset, jtag_uart:rst_n, jtag_uart_avalon_jtag_slave_translator:reset, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:reset, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, limiter:reset, limiter_001:reset, limiter_002:reset, onchip_memory2:reset, onchip_memory2_s1_translator:reset, onchip_memory2_s1_translator_avalon_universal_slave_0_agent:reset, onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, pio_0:reset_n, pio_0_s1_translator:reset, pio_0_s1_translator_avalon_universal_slave_0_agent:reset, pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, rsp_xbar_demux:reset, rsp_xbar_demux_001:reset, rsp_xbar_demux_002:reset, rsp_xbar_demux_004:reset, rsp_xbar_demux_005:reset, rsp_xbar_demux_006:reset, rsp_xbar_demux_007:reset, rsp_xbar_demux_008:reset, rsp_xbar_demux_009:reset, rsp_xbar_demux_010:reset, rsp_xbar_demux_011:reset, rsp_xbar_demux_012:reset, rsp_xbar_mux:reset, rsp_xbar_mux_001:reset, slave_template_0:reset, slave_template_0_s0_translator:reset, slave_template_0_s0_translator_avalon_universal_slave_0_agent:reset, slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, slave_template_1:reset, slave_template_1_s0_translator:reset, slave_template_1_s0_translator_avalon_universal_slave_0_agent:reset, slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, sys_clk_timer:reset_n, sys_clk_timer_s1_translator:reset, sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:reset, sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, sysid_qsys_0:reset_n, sysid_qsys_0_control_slave_translator:reset, sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:reset, sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, timer_0:reset_n, timer_0_s1_translator:reset, timer_0_s1_translator_avalon_universal_slave_0_agent:reset, timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, uart:reset_n, uart_s1_translator:reset, uart_s1_translator_avalon_universal_slave_0_agent:reset, uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, vic_0:clk_reset_reset, vic_0_csr_access_translator:reset, vic_0_csr_access_translator_avalon_universal_slave_0_agent:reset, vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, vic_0_dummy_master_translator:reset, vic_0_dummy_master_translator_avalon_universal_master_0_agent:reset]
	wire         cpu_jtag_debug_module_reset_reset;                                                                            // cpu:jtag_debug_module_resetrequest -> [rst_controller:reset_in0, rst_controller_001:reset_in1, rst_controller_002:reset_in0]
	wire         up_clock_sys_clk_reset_reset;                                                                                 // up_clock:sys_reset_n -> [rst_controller:reset_in1, rst_controller_001:reset_in2]
	wire         rst_controller_001_reset_out_reset;                                                                           // rst_controller_001:reset_out -> up_clock:reset
	wire         rst_controller_002_reset_out_reset;                                                                           // rst_controller_002:reset_out -> [burst_adapter:reset, cmd_xbar_mux_003:reset, id_router_003:reset, rsp_xbar_demux_003:reset, sdram_0:reset_n, sdram_0_s1_translator:reset, sdram_0_s1_translator_avalon_universal_slave_0_agent:reset, sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, width_adapter:reset, width_adapter_001:reset]
	wire         cmd_xbar_demux_src0_endofpacket;                                                                              // cmd_xbar_demux:src0_endofpacket -> cmd_xbar_mux:sink0_endofpacket
	wire         cmd_xbar_demux_src0_valid;                                                                                    // cmd_xbar_demux:src0_valid -> cmd_xbar_mux:sink0_valid
	wire         cmd_xbar_demux_src0_startofpacket;                                                                            // cmd_xbar_demux:src0_startofpacket -> cmd_xbar_mux:sink0_startofpacket
	wire  [88:0] cmd_xbar_demux_src0_data;                                                                                     // cmd_xbar_demux:src0_data -> cmd_xbar_mux:sink0_data
	wire  [12:0] cmd_xbar_demux_src0_channel;                                                                                  // cmd_xbar_demux:src0_channel -> cmd_xbar_mux:sink0_channel
	wire         cmd_xbar_demux_src0_ready;                                                                                    // cmd_xbar_mux:sink0_ready -> cmd_xbar_demux:src0_ready
	wire         cmd_xbar_demux_src1_endofpacket;                                                                              // cmd_xbar_demux:src1_endofpacket -> cmd_xbar_mux_001:sink0_endofpacket
	wire         cmd_xbar_demux_src1_valid;                                                                                    // cmd_xbar_demux:src1_valid -> cmd_xbar_mux_001:sink0_valid
	wire         cmd_xbar_demux_src1_startofpacket;                                                                            // cmd_xbar_demux:src1_startofpacket -> cmd_xbar_mux_001:sink0_startofpacket
	wire  [88:0] cmd_xbar_demux_src1_data;                                                                                     // cmd_xbar_demux:src1_data -> cmd_xbar_mux_001:sink0_data
	wire  [12:0] cmd_xbar_demux_src1_channel;                                                                                  // cmd_xbar_demux:src1_channel -> cmd_xbar_mux_001:sink0_channel
	wire         cmd_xbar_demux_src1_ready;                                                                                    // cmd_xbar_mux_001:sink0_ready -> cmd_xbar_demux:src1_ready
	wire         cmd_xbar_demux_src2_endofpacket;                                                                              // cmd_xbar_demux:src2_endofpacket -> cmd_xbar_mux_002:sink0_endofpacket
	wire         cmd_xbar_demux_src2_valid;                                                                                    // cmd_xbar_demux:src2_valid -> cmd_xbar_mux_002:sink0_valid
	wire         cmd_xbar_demux_src2_startofpacket;                                                                            // cmd_xbar_demux:src2_startofpacket -> cmd_xbar_mux_002:sink0_startofpacket
	wire  [88:0] cmd_xbar_demux_src2_data;                                                                                     // cmd_xbar_demux:src2_data -> cmd_xbar_mux_002:sink0_data
	wire  [12:0] cmd_xbar_demux_src2_channel;                                                                                  // cmd_xbar_demux:src2_channel -> cmd_xbar_mux_002:sink0_channel
	wire         cmd_xbar_demux_src2_ready;                                                                                    // cmd_xbar_mux_002:sink0_ready -> cmd_xbar_demux:src2_ready
	wire         cmd_xbar_demux_src3_endofpacket;                                                                              // cmd_xbar_demux:src3_endofpacket -> cmd_xbar_mux_003:sink0_endofpacket
	wire         cmd_xbar_demux_src3_valid;                                                                                    // cmd_xbar_demux:src3_valid -> cmd_xbar_mux_003:sink0_valid
	wire         cmd_xbar_demux_src3_startofpacket;                                                                            // cmd_xbar_demux:src3_startofpacket -> cmd_xbar_mux_003:sink0_startofpacket
	wire  [88:0] cmd_xbar_demux_src3_data;                                                                                     // cmd_xbar_demux:src3_data -> cmd_xbar_mux_003:sink0_data
	wire  [12:0] cmd_xbar_demux_src3_channel;                                                                                  // cmd_xbar_demux:src3_channel -> cmd_xbar_mux_003:sink0_channel
	wire         cmd_xbar_demux_src3_ready;                                                                                    // cmd_xbar_mux_003:sink0_ready -> cmd_xbar_demux:src3_ready
	wire         cmd_xbar_demux_001_src0_endofpacket;                                                                          // cmd_xbar_demux_001:src0_endofpacket -> cmd_xbar_mux:sink1_endofpacket
	wire         cmd_xbar_demux_001_src0_valid;                                                                                // cmd_xbar_demux_001:src0_valid -> cmd_xbar_mux:sink1_valid
	wire         cmd_xbar_demux_001_src0_startofpacket;                                                                        // cmd_xbar_demux_001:src0_startofpacket -> cmd_xbar_mux:sink1_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src0_data;                                                                                 // cmd_xbar_demux_001:src0_data -> cmd_xbar_mux:sink1_data
	wire  [12:0] cmd_xbar_demux_001_src0_channel;                                                                              // cmd_xbar_demux_001:src0_channel -> cmd_xbar_mux:sink1_channel
	wire         cmd_xbar_demux_001_src0_ready;                                                                                // cmd_xbar_mux:sink1_ready -> cmd_xbar_demux_001:src0_ready
	wire         cmd_xbar_demux_001_src1_endofpacket;                                                                          // cmd_xbar_demux_001:src1_endofpacket -> cmd_xbar_mux_001:sink1_endofpacket
	wire         cmd_xbar_demux_001_src1_valid;                                                                                // cmd_xbar_demux_001:src1_valid -> cmd_xbar_mux_001:sink1_valid
	wire         cmd_xbar_demux_001_src1_startofpacket;                                                                        // cmd_xbar_demux_001:src1_startofpacket -> cmd_xbar_mux_001:sink1_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src1_data;                                                                                 // cmd_xbar_demux_001:src1_data -> cmd_xbar_mux_001:sink1_data
	wire  [12:0] cmd_xbar_demux_001_src1_channel;                                                                              // cmd_xbar_demux_001:src1_channel -> cmd_xbar_mux_001:sink1_channel
	wire         cmd_xbar_demux_001_src1_ready;                                                                                // cmd_xbar_mux_001:sink1_ready -> cmd_xbar_demux_001:src1_ready
	wire         cmd_xbar_demux_001_src2_endofpacket;                                                                          // cmd_xbar_demux_001:src2_endofpacket -> cmd_xbar_mux_002:sink1_endofpacket
	wire         cmd_xbar_demux_001_src2_valid;                                                                                // cmd_xbar_demux_001:src2_valid -> cmd_xbar_mux_002:sink1_valid
	wire         cmd_xbar_demux_001_src2_startofpacket;                                                                        // cmd_xbar_demux_001:src2_startofpacket -> cmd_xbar_mux_002:sink1_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src2_data;                                                                                 // cmd_xbar_demux_001:src2_data -> cmd_xbar_mux_002:sink1_data
	wire  [12:0] cmd_xbar_demux_001_src2_channel;                                                                              // cmd_xbar_demux_001:src2_channel -> cmd_xbar_mux_002:sink1_channel
	wire         cmd_xbar_demux_001_src2_ready;                                                                                // cmd_xbar_mux_002:sink1_ready -> cmd_xbar_demux_001:src2_ready
	wire         cmd_xbar_demux_001_src3_endofpacket;                                                                          // cmd_xbar_demux_001:src3_endofpacket -> cmd_xbar_mux_003:sink1_endofpacket
	wire         cmd_xbar_demux_001_src3_valid;                                                                                // cmd_xbar_demux_001:src3_valid -> cmd_xbar_mux_003:sink1_valid
	wire         cmd_xbar_demux_001_src3_startofpacket;                                                                        // cmd_xbar_demux_001:src3_startofpacket -> cmd_xbar_mux_003:sink1_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src3_data;                                                                                 // cmd_xbar_demux_001:src3_data -> cmd_xbar_mux_003:sink1_data
	wire  [12:0] cmd_xbar_demux_001_src3_channel;                                                                              // cmd_xbar_demux_001:src3_channel -> cmd_xbar_mux_003:sink1_channel
	wire         cmd_xbar_demux_001_src3_ready;                                                                                // cmd_xbar_mux_003:sink1_ready -> cmd_xbar_demux_001:src3_ready
	wire         cmd_xbar_demux_001_src4_endofpacket;                                                                          // cmd_xbar_demux_001:src4_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src4_valid;                                                                                // cmd_xbar_demux_001:src4_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src4_startofpacket;                                                                        // cmd_xbar_demux_001:src4_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src4_data;                                                                                 // cmd_xbar_demux_001:src4_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src4_channel;                                                                              // cmd_xbar_demux_001:src4_channel -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src5_endofpacket;                                                                          // cmd_xbar_demux_001:src5_endofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src5_valid;                                                                                // cmd_xbar_demux_001:src5_valid -> pio_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src5_startofpacket;                                                                        // cmd_xbar_demux_001:src5_startofpacket -> pio_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src5_data;                                                                                 // cmd_xbar_demux_001:src5_data -> pio_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src5_channel;                                                                              // cmd_xbar_demux_001:src5_channel -> pio_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src6_endofpacket;                                                                          // cmd_xbar_demux_001:src6_endofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src6_valid;                                                                                // cmd_xbar_demux_001:src6_valid -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src6_startofpacket;                                                                        // cmd_xbar_demux_001:src6_startofpacket -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src6_data;                                                                                 // cmd_xbar_demux_001:src6_data -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src6_channel;                                                                              // cmd_xbar_demux_001:src6_channel -> slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src7_endofpacket;                                                                          // cmd_xbar_demux_001:src7_endofpacket -> uart_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src7_valid;                                                                                // cmd_xbar_demux_001:src7_valid -> uart_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src7_startofpacket;                                                                        // cmd_xbar_demux_001:src7_startofpacket -> uart_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src7_data;                                                                                 // cmd_xbar_demux_001:src7_data -> uart_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src7_channel;                                                                              // cmd_xbar_demux_001:src7_channel -> uart_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src8_endofpacket;                                                                          // cmd_xbar_demux_001:src8_endofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src8_valid;                                                                                // cmd_xbar_demux_001:src8_valid -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src8_startofpacket;                                                                        // cmd_xbar_demux_001:src8_startofpacket -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src8_data;                                                                                 // cmd_xbar_demux_001:src8_data -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src8_channel;                                                                              // cmd_xbar_demux_001:src8_channel -> sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src9_endofpacket;                                                                          // cmd_xbar_demux_001:src9_endofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src9_valid;                                                                                // cmd_xbar_demux_001:src9_valid -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src9_startofpacket;                                                                        // cmd_xbar_demux_001:src9_startofpacket -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src9_data;                                                                                 // cmd_xbar_demux_001:src9_data -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src9_channel;                                                                              // cmd_xbar_demux_001:src9_channel -> slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src10_endofpacket;                                                                         // cmd_xbar_demux_001:src10_endofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src10_valid;                                                                               // cmd_xbar_demux_001:src10_valid -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src10_startofpacket;                                                                       // cmd_xbar_demux_001:src10_startofpacket -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src10_data;                                                                                // cmd_xbar_demux_001:src10_data -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src10_channel;                                                                             // cmd_xbar_demux_001:src10_channel -> sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src11_endofpacket;                                                                         // cmd_xbar_demux_001:src11_endofpacket -> cmd_xbar_mux_011:sink0_endofpacket
	wire         cmd_xbar_demux_001_src11_valid;                                                                               // cmd_xbar_demux_001:src11_valid -> cmd_xbar_mux_011:sink0_valid
	wire         cmd_xbar_demux_001_src11_startofpacket;                                                                       // cmd_xbar_demux_001:src11_startofpacket -> cmd_xbar_mux_011:sink0_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src11_data;                                                                                // cmd_xbar_demux_001:src11_data -> cmd_xbar_mux_011:sink0_data
	wire  [12:0] cmd_xbar_demux_001_src11_channel;                                                                             // cmd_xbar_demux_001:src11_channel -> cmd_xbar_mux_011:sink0_channel
	wire         cmd_xbar_demux_001_src11_ready;                                                                               // cmd_xbar_mux_011:sink0_ready -> cmd_xbar_demux_001:src11_ready
	wire         cmd_xbar_demux_001_src12_endofpacket;                                                                         // cmd_xbar_demux_001:src12_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src12_valid;                                                                               // cmd_xbar_demux_001:src12_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src12_startofpacket;                                                                       // cmd_xbar_demux_001:src12_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_demux_001_src12_data;                                                                                // cmd_xbar_demux_001:src12_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_demux_001_src12_channel;                                                                             // cmd_xbar_demux_001:src12_channel -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_002_src0_endofpacket;                                                                          // cmd_xbar_demux_002:src0_endofpacket -> cmd_xbar_mux_011:sink1_endofpacket
	wire         cmd_xbar_demux_002_src0_valid;                                                                                // cmd_xbar_demux_002:src0_valid -> cmd_xbar_mux_011:sink1_valid
	wire         cmd_xbar_demux_002_src0_startofpacket;                                                                        // cmd_xbar_demux_002:src0_startofpacket -> cmd_xbar_mux_011:sink1_startofpacket
	wire  [88:0] cmd_xbar_demux_002_src0_data;                                                                                 // cmd_xbar_demux_002:src0_data -> cmd_xbar_mux_011:sink1_data
	wire  [12:0] cmd_xbar_demux_002_src0_channel;                                                                              // cmd_xbar_demux_002:src0_channel -> cmd_xbar_mux_011:sink1_channel
	wire         cmd_xbar_demux_002_src0_ready;                                                                                // cmd_xbar_mux_011:sink1_ready -> cmd_xbar_demux_002:src0_ready
	wire         rsp_xbar_demux_src0_endofpacket;                                                                              // rsp_xbar_demux:src0_endofpacket -> rsp_xbar_mux:sink0_endofpacket
	wire         rsp_xbar_demux_src0_valid;                                                                                    // rsp_xbar_demux:src0_valid -> rsp_xbar_mux:sink0_valid
	wire         rsp_xbar_demux_src0_startofpacket;                                                                            // rsp_xbar_demux:src0_startofpacket -> rsp_xbar_mux:sink0_startofpacket
	wire  [88:0] rsp_xbar_demux_src0_data;                                                                                     // rsp_xbar_demux:src0_data -> rsp_xbar_mux:sink0_data
	wire  [12:0] rsp_xbar_demux_src0_channel;                                                                                  // rsp_xbar_demux:src0_channel -> rsp_xbar_mux:sink0_channel
	wire         rsp_xbar_demux_src0_ready;                                                                                    // rsp_xbar_mux:sink0_ready -> rsp_xbar_demux:src0_ready
	wire         rsp_xbar_demux_src1_endofpacket;                                                                              // rsp_xbar_demux:src1_endofpacket -> rsp_xbar_mux_001:sink0_endofpacket
	wire         rsp_xbar_demux_src1_valid;                                                                                    // rsp_xbar_demux:src1_valid -> rsp_xbar_mux_001:sink0_valid
	wire         rsp_xbar_demux_src1_startofpacket;                                                                            // rsp_xbar_demux:src1_startofpacket -> rsp_xbar_mux_001:sink0_startofpacket
	wire  [88:0] rsp_xbar_demux_src1_data;                                                                                     // rsp_xbar_demux:src1_data -> rsp_xbar_mux_001:sink0_data
	wire  [12:0] rsp_xbar_demux_src1_channel;                                                                                  // rsp_xbar_demux:src1_channel -> rsp_xbar_mux_001:sink0_channel
	wire         rsp_xbar_demux_src1_ready;                                                                                    // rsp_xbar_mux_001:sink0_ready -> rsp_xbar_demux:src1_ready
	wire         rsp_xbar_demux_001_src0_endofpacket;                                                                          // rsp_xbar_demux_001:src0_endofpacket -> rsp_xbar_mux:sink1_endofpacket
	wire         rsp_xbar_demux_001_src0_valid;                                                                                // rsp_xbar_demux_001:src0_valid -> rsp_xbar_mux:sink1_valid
	wire         rsp_xbar_demux_001_src0_startofpacket;                                                                        // rsp_xbar_demux_001:src0_startofpacket -> rsp_xbar_mux:sink1_startofpacket
	wire  [88:0] rsp_xbar_demux_001_src0_data;                                                                                 // rsp_xbar_demux_001:src0_data -> rsp_xbar_mux:sink1_data
	wire  [12:0] rsp_xbar_demux_001_src0_channel;                                                                              // rsp_xbar_demux_001:src0_channel -> rsp_xbar_mux:sink1_channel
	wire         rsp_xbar_demux_001_src0_ready;                                                                                // rsp_xbar_mux:sink1_ready -> rsp_xbar_demux_001:src0_ready
	wire         rsp_xbar_demux_001_src1_endofpacket;                                                                          // rsp_xbar_demux_001:src1_endofpacket -> rsp_xbar_mux_001:sink1_endofpacket
	wire         rsp_xbar_demux_001_src1_valid;                                                                                // rsp_xbar_demux_001:src1_valid -> rsp_xbar_mux_001:sink1_valid
	wire         rsp_xbar_demux_001_src1_startofpacket;                                                                        // rsp_xbar_demux_001:src1_startofpacket -> rsp_xbar_mux_001:sink1_startofpacket
	wire  [88:0] rsp_xbar_demux_001_src1_data;                                                                                 // rsp_xbar_demux_001:src1_data -> rsp_xbar_mux_001:sink1_data
	wire  [12:0] rsp_xbar_demux_001_src1_channel;                                                                              // rsp_xbar_demux_001:src1_channel -> rsp_xbar_mux_001:sink1_channel
	wire         rsp_xbar_demux_001_src1_ready;                                                                                // rsp_xbar_mux_001:sink1_ready -> rsp_xbar_demux_001:src1_ready
	wire         rsp_xbar_demux_002_src0_endofpacket;                                                                          // rsp_xbar_demux_002:src0_endofpacket -> rsp_xbar_mux:sink2_endofpacket
	wire         rsp_xbar_demux_002_src0_valid;                                                                                // rsp_xbar_demux_002:src0_valid -> rsp_xbar_mux:sink2_valid
	wire         rsp_xbar_demux_002_src0_startofpacket;                                                                        // rsp_xbar_demux_002:src0_startofpacket -> rsp_xbar_mux:sink2_startofpacket
	wire  [88:0] rsp_xbar_demux_002_src0_data;                                                                                 // rsp_xbar_demux_002:src0_data -> rsp_xbar_mux:sink2_data
	wire  [12:0] rsp_xbar_demux_002_src0_channel;                                                                              // rsp_xbar_demux_002:src0_channel -> rsp_xbar_mux:sink2_channel
	wire         rsp_xbar_demux_002_src0_ready;                                                                                // rsp_xbar_mux:sink2_ready -> rsp_xbar_demux_002:src0_ready
	wire         rsp_xbar_demux_002_src1_endofpacket;                                                                          // rsp_xbar_demux_002:src1_endofpacket -> rsp_xbar_mux_001:sink2_endofpacket
	wire         rsp_xbar_demux_002_src1_valid;                                                                                // rsp_xbar_demux_002:src1_valid -> rsp_xbar_mux_001:sink2_valid
	wire         rsp_xbar_demux_002_src1_startofpacket;                                                                        // rsp_xbar_demux_002:src1_startofpacket -> rsp_xbar_mux_001:sink2_startofpacket
	wire  [88:0] rsp_xbar_demux_002_src1_data;                                                                                 // rsp_xbar_demux_002:src1_data -> rsp_xbar_mux_001:sink2_data
	wire  [12:0] rsp_xbar_demux_002_src1_channel;                                                                              // rsp_xbar_demux_002:src1_channel -> rsp_xbar_mux_001:sink2_channel
	wire         rsp_xbar_demux_002_src1_ready;                                                                                // rsp_xbar_mux_001:sink2_ready -> rsp_xbar_demux_002:src1_ready
	wire         rsp_xbar_demux_003_src0_endofpacket;                                                                          // rsp_xbar_demux_003:src0_endofpacket -> rsp_xbar_mux:sink3_endofpacket
	wire         rsp_xbar_demux_003_src0_valid;                                                                                // rsp_xbar_demux_003:src0_valid -> rsp_xbar_mux:sink3_valid
	wire         rsp_xbar_demux_003_src0_startofpacket;                                                                        // rsp_xbar_demux_003:src0_startofpacket -> rsp_xbar_mux:sink3_startofpacket
	wire  [88:0] rsp_xbar_demux_003_src0_data;                                                                                 // rsp_xbar_demux_003:src0_data -> rsp_xbar_mux:sink3_data
	wire  [12:0] rsp_xbar_demux_003_src0_channel;                                                                              // rsp_xbar_demux_003:src0_channel -> rsp_xbar_mux:sink3_channel
	wire         rsp_xbar_demux_003_src0_ready;                                                                                // rsp_xbar_mux:sink3_ready -> rsp_xbar_demux_003:src0_ready
	wire         rsp_xbar_demux_003_src1_endofpacket;                                                                          // rsp_xbar_demux_003:src1_endofpacket -> rsp_xbar_mux_001:sink3_endofpacket
	wire         rsp_xbar_demux_003_src1_valid;                                                                                // rsp_xbar_demux_003:src1_valid -> rsp_xbar_mux_001:sink3_valid
	wire         rsp_xbar_demux_003_src1_startofpacket;                                                                        // rsp_xbar_demux_003:src1_startofpacket -> rsp_xbar_mux_001:sink3_startofpacket
	wire  [88:0] rsp_xbar_demux_003_src1_data;                                                                                 // rsp_xbar_demux_003:src1_data -> rsp_xbar_mux_001:sink3_data
	wire  [12:0] rsp_xbar_demux_003_src1_channel;                                                                              // rsp_xbar_demux_003:src1_channel -> rsp_xbar_mux_001:sink3_channel
	wire         rsp_xbar_demux_003_src1_ready;                                                                                // rsp_xbar_mux_001:sink3_ready -> rsp_xbar_demux_003:src1_ready
	wire         rsp_xbar_demux_004_src0_endofpacket;                                                                          // rsp_xbar_demux_004:src0_endofpacket -> rsp_xbar_mux_001:sink4_endofpacket
	wire         rsp_xbar_demux_004_src0_valid;                                                                                // rsp_xbar_demux_004:src0_valid -> rsp_xbar_mux_001:sink4_valid
	wire         rsp_xbar_demux_004_src0_startofpacket;                                                                        // rsp_xbar_demux_004:src0_startofpacket -> rsp_xbar_mux_001:sink4_startofpacket
	wire  [88:0] rsp_xbar_demux_004_src0_data;                                                                                 // rsp_xbar_demux_004:src0_data -> rsp_xbar_mux_001:sink4_data
	wire  [12:0] rsp_xbar_demux_004_src0_channel;                                                                              // rsp_xbar_demux_004:src0_channel -> rsp_xbar_mux_001:sink4_channel
	wire         rsp_xbar_demux_004_src0_ready;                                                                                // rsp_xbar_mux_001:sink4_ready -> rsp_xbar_demux_004:src0_ready
	wire         rsp_xbar_demux_005_src0_endofpacket;                                                                          // rsp_xbar_demux_005:src0_endofpacket -> rsp_xbar_mux_001:sink5_endofpacket
	wire         rsp_xbar_demux_005_src0_valid;                                                                                // rsp_xbar_demux_005:src0_valid -> rsp_xbar_mux_001:sink5_valid
	wire         rsp_xbar_demux_005_src0_startofpacket;                                                                        // rsp_xbar_demux_005:src0_startofpacket -> rsp_xbar_mux_001:sink5_startofpacket
	wire  [88:0] rsp_xbar_demux_005_src0_data;                                                                                 // rsp_xbar_demux_005:src0_data -> rsp_xbar_mux_001:sink5_data
	wire  [12:0] rsp_xbar_demux_005_src0_channel;                                                                              // rsp_xbar_demux_005:src0_channel -> rsp_xbar_mux_001:sink5_channel
	wire         rsp_xbar_demux_005_src0_ready;                                                                                // rsp_xbar_mux_001:sink5_ready -> rsp_xbar_demux_005:src0_ready
	wire         rsp_xbar_demux_006_src0_endofpacket;                                                                          // rsp_xbar_demux_006:src0_endofpacket -> rsp_xbar_mux_001:sink6_endofpacket
	wire         rsp_xbar_demux_006_src0_valid;                                                                                // rsp_xbar_demux_006:src0_valid -> rsp_xbar_mux_001:sink6_valid
	wire         rsp_xbar_demux_006_src0_startofpacket;                                                                        // rsp_xbar_demux_006:src0_startofpacket -> rsp_xbar_mux_001:sink6_startofpacket
	wire  [88:0] rsp_xbar_demux_006_src0_data;                                                                                 // rsp_xbar_demux_006:src0_data -> rsp_xbar_mux_001:sink6_data
	wire  [12:0] rsp_xbar_demux_006_src0_channel;                                                                              // rsp_xbar_demux_006:src0_channel -> rsp_xbar_mux_001:sink6_channel
	wire         rsp_xbar_demux_006_src0_ready;                                                                                // rsp_xbar_mux_001:sink6_ready -> rsp_xbar_demux_006:src0_ready
	wire         rsp_xbar_demux_007_src0_endofpacket;                                                                          // rsp_xbar_demux_007:src0_endofpacket -> rsp_xbar_mux_001:sink7_endofpacket
	wire         rsp_xbar_demux_007_src0_valid;                                                                                // rsp_xbar_demux_007:src0_valid -> rsp_xbar_mux_001:sink7_valid
	wire         rsp_xbar_demux_007_src0_startofpacket;                                                                        // rsp_xbar_demux_007:src0_startofpacket -> rsp_xbar_mux_001:sink7_startofpacket
	wire  [88:0] rsp_xbar_demux_007_src0_data;                                                                                 // rsp_xbar_demux_007:src0_data -> rsp_xbar_mux_001:sink7_data
	wire  [12:0] rsp_xbar_demux_007_src0_channel;                                                                              // rsp_xbar_demux_007:src0_channel -> rsp_xbar_mux_001:sink7_channel
	wire         rsp_xbar_demux_007_src0_ready;                                                                                // rsp_xbar_mux_001:sink7_ready -> rsp_xbar_demux_007:src0_ready
	wire         rsp_xbar_demux_008_src0_endofpacket;                                                                          // rsp_xbar_demux_008:src0_endofpacket -> rsp_xbar_mux_001:sink8_endofpacket
	wire         rsp_xbar_demux_008_src0_valid;                                                                                // rsp_xbar_demux_008:src0_valid -> rsp_xbar_mux_001:sink8_valid
	wire         rsp_xbar_demux_008_src0_startofpacket;                                                                        // rsp_xbar_demux_008:src0_startofpacket -> rsp_xbar_mux_001:sink8_startofpacket
	wire  [88:0] rsp_xbar_demux_008_src0_data;                                                                                 // rsp_xbar_demux_008:src0_data -> rsp_xbar_mux_001:sink8_data
	wire  [12:0] rsp_xbar_demux_008_src0_channel;                                                                              // rsp_xbar_demux_008:src0_channel -> rsp_xbar_mux_001:sink8_channel
	wire         rsp_xbar_demux_008_src0_ready;                                                                                // rsp_xbar_mux_001:sink8_ready -> rsp_xbar_demux_008:src0_ready
	wire         rsp_xbar_demux_009_src0_endofpacket;                                                                          // rsp_xbar_demux_009:src0_endofpacket -> rsp_xbar_mux_001:sink9_endofpacket
	wire         rsp_xbar_demux_009_src0_valid;                                                                                // rsp_xbar_demux_009:src0_valid -> rsp_xbar_mux_001:sink9_valid
	wire         rsp_xbar_demux_009_src0_startofpacket;                                                                        // rsp_xbar_demux_009:src0_startofpacket -> rsp_xbar_mux_001:sink9_startofpacket
	wire  [88:0] rsp_xbar_demux_009_src0_data;                                                                                 // rsp_xbar_demux_009:src0_data -> rsp_xbar_mux_001:sink9_data
	wire  [12:0] rsp_xbar_demux_009_src0_channel;                                                                              // rsp_xbar_demux_009:src0_channel -> rsp_xbar_mux_001:sink9_channel
	wire         rsp_xbar_demux_009_src0_ready;                                                                                // rsp_xbar_mux_001:sink9_ready -> rsp_xbar_demux_009:src0_ready
	wire         rsp_xbar_demux_010_src0_endofpacket;                                                                          // rsp_xbar_demux_010:src0_endofpacket -> rsp_xbar_mux_001:sink10_endofpacket
	wire         rsp_xbar_demux_010_src0_valid;                                                                                // rsp_xbar_demux_010:src0_valid -> rsp_xbar_mux_001:sink10_valid
	wire         rsp_xbar_demux_010_src0_startofpacket;                                                                        // rsp_xbar_demux_010:src0_startofpacket -> rsp_xbar_mux_001:sink10_startofpacket
	wire  [88:0] rsp_xbar_demux_010_src0_data;                                                                                 // rsp_xbar_demux_010:src0_data -> rsp_xbar_mux_001:sink10_data
	wire  [12:0] rsp_xbar_demux_010_src0_channel;                                                                              // rsp_xbar_demux_010:src0_channel -> rsp_xbar_mux_001:sink10_channel
	wire         rsp_xbar_demux_010_src0_ready;                                                                                // rsp_xbar_mux_001:sink10_ready -> rsp_xbar_demux_010:src0_ready
	wire         rsp_xbar_demux_011_src0_endofpacket;                                                                          // rsp_xbar_demux_011:src0_endofpacket -> rsp_xbar_mux_001:sink11_endofpacket
	wire         rsp_xbar_demux_011_src0_valid;                                                                                // rsp_xbar_demux_011:src0_valid -> rsp_xbar_mux_001:sink11_valid
	wire         rsp_xbar_demux_011_src0_startofpacket;                                                                        // rsp_xbar_demux_011:src0_startofpacket -> rsp_xbar_mux_001:sink11_startofpacket
	wire  [88:0] rsp_xbar_demux_011_src0_data;                                                                                 // rsp_xbar_demux_011:src0_data -> rsp_xbar_mux_001:sink11_data
	wire  [12:0] rsp_xbar_demux_011_src0_channel;                                                                              // rsp_xbar_demux_011:src0_channel -> rsp_xbar_mux_001:sink11_channel
	wire         rsp_xbar_demux_011_src0_ready;                                                                                // rsp_xbar_mux_001:sink11_ready -> rsp_xbar_demux_011:src0_ready
	wire         rsp_xbar_demux_011_src1_endofpacket;                                                                          // rsp_xbar_demux_011:src1_endofpacket -> limiter_002:rsp_sink_endofpacket
	wire         rsp_xbar_demux_011_src1_valid;                                                                                // rsp_xbar_demux_011:src1_valid -> limiter_002:rsp_sink_valid
	wire         rsp_xbar_demux_011_src1_startofpacket;                                                                        // rsp_xbar_demux_011:src1_startofpacket -> limiter_002:rsp_sink_startofpacket
	wire  [88:0] rsp_xbar_demux_011_src1_data;                                                                                 // rsp_xbar_demux_011:src1_data -> limiter_002:rsp_sink_data
	wire  [12:0] rsp_xbar_demux_011_src1_channel;                                                                              // rsp_xbar_demux_011:src1_channel -> limiter_002:rsp_sink_channel
	wire         rsp_xbar_demux_012_src0_endofpacket;                                                                          // rsp_xbar_demux_012:src0_endofpacket -> rsp_xbar_mux_001:sink12_endofpacket
	wire         rsp_xbar_demux_012_src0_valid;                                                                                // rsp_xbar_demux_012:src0_valid -> rsp_xbar_mux_001:sink12_valid
	wire         rsp_xbar_demux_012_src0_startofpacket;                                                                        // rsp_xbar_demux_012:src0_startofpacket -> rsp_xbar_mux_001:sink12_startofpacket
	wire  [88:0] rsp_xbar_demux_012_src0_data;                                                                                 // rsp_xbar_demux_012:src0_data -> rsp_xbar_mux_001:sink12_data
	wire  [12:0] rsp_xbar_demux_012_src0_channel;                                                                              // rsp_xbar_demux_012:src0_channel -> rsp_xbar_mux_001:sink12_channel
	wire         rsp_xbar_demux_012_src0_ready;                                                                                // rsp_xbar_mux_001:sink12_ready -> rsp_xbar_demux_012:src0_ready
	wire         limiter_cmd_src_endofpacket;                                                                                  // limiter:cmd_src_endofpacket -> cmd_xbar_demux:sink_endofpacket
	wire         limiter_cmd_src_startofpacket;                                                                                // limiter:cmd_src_startofpacket -> cmd_xbar_demux:sink_startofpacket
	wire  [88:0] limiter_cmd_src_data;                                                                                         // limiter:cmd_src_data -> cmd_xbar_demux:sink_data
	wire  [12:0] limiter_cmd_src_channel;                                                                                      // limiter:cmd_src_channel -> cmd_xbar_demux:sink_channel
	wire         limiter_cmd_src_ready;                                                                                        // cmd_xbar_demux:sink_ready -> limiter:cmd_src_ready
	wire         rsp_xbar_mux_src_endofpacket;                                                                                 // rsp_xbar_mux:src_endofpacket -> limiter:rsp_sink_endofpacket
	wire         rsp_xbar_mux_src_valid;                                                                                       // rsp_xbar_mux:src_valid -> limiter:rsp_sink_valid
	wire         rsp_xbar_mux_src_startofpacket;                                                                               // rsp_xbar_mux:src_startofpacket -> limiter:rsp_sink_startofpacket
	wire  [88:0] rsp_xbar_mux_src_data;                                                                                        // rsp_xbar_mux:src_data -> limiter:rsp_sink_data
	wire  [12:0] rsp_xbar_mux_src_channel;                                                                                     // rsp_xbar_mux:src_channel -> limiter:rsp_sink_channel
	wire         rsp_xbar_mux_src_ready;                                                                                       // limiter:rsp_sink_ready -> rsp_xbar_mux:src_ready
	wire         limiter_001_cmd_src_endofpacket;                                                                              // limiter_001:cmd_src_endofpacket -> cmd_xbar_demux_001:sink_endofpacket
	wire         limiter_001_cmd_src_startofpacket;                                                                            // limiter_001:cmd_src_startofpacket -> cmd_xbar_demux_001:sink_startofpacket
	wire  [88:0] limiter_001_cmd_src_data;                                                                                     // limiter_001:cmd_src_data -> cmd_xbar_demux_001:sink_data
	wire  [12:0] limiter_001_cmd_src_channel;                                                                                  // limiter_001:cmd_src_channel -> cmd_xbar_demux_001:sink_channel
	wire         limiter_001_cmd_src_ready;                                                                                    // cmd_xbar_demux_001:sink_ready -> limiter_001:cmd_src_ready
	wire         rsp_xbar_mux_001_src_endofpacket;                                                                             // rsp_xbar_mux_001:src_endofpacket -> limiter_001:rsp_sink_endofpacket
	wire         rsp_xbar_mux_001_src_valid;                                                                                   // rsp_xbar_mux_001:src_valid -> limiter_001:rsp_sink_valid
	wire         rsp_xbar_mux_001_src_startofpacket;                                                                           // rsp_xbar_mux_001:src_startofpacket -> limiter_001:rsp_sink_startofpacket
	wire  [88:0] rsp_xbar_mux_001_src_data;                                                                                    // rsp_xbar_mux_001:src_data -> limiter_001:rsp_sink_data
	wire  [12:0] rsp_xbar_mux_001_src_channel;                                                                                 // rsp_xbar_mux_001:src_channel -> limiter_001:rsp_sink_channel
	wire         rsp_xbar_mux_001_src_ready;                                                                                   // limiter_001:rsp_sink_ready -> rsp_xbar_mux_001:src_ready
	wire         limiter_002_cmd_src_endofpacket;                                                                              // limiter_002:cmd_src_endofpacket -> cmd_xbar_demux_002:sink_endofpacket
	wire         limiter_002_cmd_src_startofpacket;                                                                            // limiter_002:cmd_src_startofpacket -> cmd_xbar_demux_002:sink_startofpacket
	wire  [88:0] limiter_002_cmd_src_data;                                                                                     // limiter_002:cmd_src_data -> cmd_xbar_demux_002:sink_data
	wire  [12:0] limiter_002_cmd_src_channel;                                                                                  // limiter_002:cmd_src_channel -> cmd_xbar_demux_002:sink_channel
	wire         limiter_002_cmd_src_ready;                                                                                    // cmd_xbar_demux_002:sink_ready -> limiter_002:cmd_src_ready
	wire         rsp_xbar_demux_011_src1_ready;                                                                                // limiter_002:rsp_sink_ready -> rsp_xbar_demux_011:src1_ready
	wire         cmd_xbar_mux_src_endofpacket;                                                                                 // cmd_xbar_mux:src_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_src_valid;                                                                                       // cmd_xbar_mux:src_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_src_startofpacket;                                                                               // cmd_xbar_mux:src_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_mux_src_data;                                                                                        // cmd_xbar_mux:src_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_mux_src_channel;                                                                                     // cmd_xbar_mux:src_channel -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_src_ready;                                                                                       // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux:src_ready
	wire         id_router_src_endofpacket;                                                                                    // id_router:src_endofpacket -> rsp_xbar_demux:sink_endofpacket
	wire         id_router_src_valid;                                                                                          // id_router:src_valid -> rsp_xbar_demux:sink_valid
	wire         id_router_src_startofpacket;                                                                                  // id_router:src_startofpacket -> rsp_xbar_demux:sink_startofpacket
	wire  [88:0] id_router_src_data;                                                                                           // id_router:src_data -> rsp_xbar_demux:sink_data
	wire  [12:0] id_router_src_channel;                                                                                        // id_router:src_channel -> rsp_xbar_demux:sink_channel
	wire         id_router_src_ready;                                                                                          // rsp_xbar_demux:sink_ready -> id_router:src_ready
	wire         cmd_xbar_mux_001_src_endofpacket;                                                                             // cmd_xbar_mux_001:src_endofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_001_src_valid;                                                                                   // cmd_xbar_mux_001:src_valid -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_001_src_startofpacket;                                                                           // cmd_xbar_mux_001:src_startofpacket -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_mux_001_src_data;                                                                                    // cmd_xbar_mux_001:src_data -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_mux_001_src_channel;                                                                                 // cmd_xbar_mux_001:src_channel -> onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_001_src_ready;                                                                                   // onchip_memory2_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_001:src_ready
	wire         id_router_001_src_endofpacket;                                                                                // id_router_001:src_endofpacket -> rsp_xbar_demux_001:sink_endofpacket
	wire         id_router_001_src_valid;                                                                                      // id_router_001:src_valid -> rsp_xbar_demux_001:sink_valid
	wire         id_router_001_src_startofpacket;                                                                              // id_router_001:src_startofpacket -> rsp_xbar_demux_001:sink_startofpacket
	wire  [88:0] id_router_001_src_data;                                                                                       // id_router_001:src_data -> rsp_xbar_demux_001:sink_data
	wire  [12:0] id_router_001_src_channel;                                                                                    // id_router_001:src_channel -> rsp_xbar_demux_001:sink_channel
	wire         id_router_001_src_ready;                                                                                      // rsp_xbar_demux_001:sink_ready -> id_router_001:src_ready
	wire         cmd_xbar_mux_002_src_endofpacket;                                                                             // cmd_xbar_mux_002:src_endofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_002_src_valid;                                                                                   // cmd_xbar_mux_002:src_valid -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_002_src_startofpacket;                                                                           // cmd_xbar_mux_002:src_startofpacket -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_mux_002_src_data;                                                                                    // cmd_xbar_mux_002:src_data -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_mux_002_src_channel;                                                                                 // cmd_xbar_mux_002:src_channel -> epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_002_src_ready;                                                                                   // epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_002:src_ready
	wire         id_router_002_src_endofpacket;                                                                                // id_router_002:src_endofpacket -> rsp_xbar_demux_002:sink_endofpacket
	wire         id_router_002_src_valid;                                                                                      // id_router_002:src_valid -> rsp_xbar_demux_002:sink_valid
	wire         id_router_002_src_startofpacket;                                                                              // id_router_002:src_startofpacket -> rsp_xbar_demux_002:sink_startofpacket
	wire  [88:0] id_router_002_src_data;                                                                                       // id_router_002:src_data -> rsp_xbar_demux_002:sink_data
	wire  [12:0] id_router_002_src_channel;                                                                                    // id_router_002:src_channel -> rsp_xbar_demux_002:sink_channel
	wire         id_router_002_src_ready;                                                                                      // rsp_xbar_demux_002:sink_ready -> id_router_002:src_ready
	wire         cmd_xbar_demux_001_src4_ready;                                                                                // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src4_ready
	wire         id_router_004_src_endofpacket;                                                                                // id_router_004:src_endofpacket -> rsp_xbar_demux_004:sink_endofpacket
	wire         id_router_004_src_valid;                                                                                      // id_router_004:src_valid -> rsp_xbar_demux_004:sink_valid
	wire         id_router_004_src_startofpacket;                                                                              // id_router_004:src_startofpacket -> rsp_xbar_demux_004:sink_startofpacket
	wire  [88:0] id_router_004_src_data;                                                                                       // id_router_004:src_data -> rsp_xbar_demux_004:sink_data
	wire  [12:0] id_router_004_src_channel;                                                                                    // id_router_004:src_channel -> rsp_xbar_demux_004:sink_channel
	wire         id_router_004_src_ready;                                                                                      // rsp_xbar_demux_004:sink_ready -> id_router_004:src_ready
	wire         cmd_xbar_demux_001_src5_ready;                                                                                // pio_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src5_ready
	wire         id_router_005_src_endofpacket;                                                                                // id_router_005:src_endofpacket -> rsp_xbar_demux_005:sink_endofpacket
	wire         id_router_005_src_valid;                                                                                      // id_router_005:src_valid -> rsp_xbar_demux_005:sink_valid
	wire         id_router_005_src_startofpacket;                                                                              // id_router_005:src_startofpacket -> rsp_xbar_demux_005:sink_startofpacket
	wire  [88:0] id_router_005_src_data;                                                                                       // id_router_005:src_data -> rsp_xbar_demux_005:sink_data
	wire  [12:0] id_router_005_src_channel;                                                                                    // id_router_005:src_channel -> rsp_xbar_demux_005:sink_channel
	wire         id_router_005_src_ready;                                                                                      // rsp_xbar_demux_005:sink_ready -> id_router_005:src_ready
	wire         cmd_xbar_demux_001_src6_ready;                                                                                // slave_template_0_s0_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src6_ready
	wire         id_router_006_src_endofpacket;                                                                                // id_router_006:src_endofpacket -> rsp_xbar_demux_006:sink_endofpacket
	wire         id_router_006_src_valid;                                                                                      // id_router_006:src_valid -> rsp_xbar_demux_006:sink_valid
	wire         id_router_006_src_startofpacket;                                                                              // id_router_006:src_startofpacket -> rsp_xbar_demux_006:sink_startofpacket
	wire  [88:0] id_router_006_src_data;                                                                                       // id_router_006:src_data -> rsp_xbar_demux_006:sink_data
	wire  [12:0] id_router_006_src_channel;                                                                                    // id_router_006:src_channel -> rsp_xbar_demux_006:sink_channel
	wire         id_router_006_src_ready;                                                                                      // rsp_xbar_demux_006:sink_ready -> id_router_006:src_ready
	wire         cmd_xbar_demux_001_src7_ready;                                                                                // uart_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src7_ready
	wire         id_router_007_src_endofpacket;                                                                                // id_router_007:src_endofpacket -> rsp_xbar_demux_007:sink_endofpacket
	wire         id_router_007_src_valid;                                                                                      // id_router_007:src_valid -> rsp_xbar_demux_007:sink_valid
	wire         id_router_007_src_startofpacket;                                                                              // id_router_007:src_startofpacket -> rsp_xbar_demux_007:sink_startofpacket
	wire  [88:0] id_router_007_src_data;                                                                                       // id_router_007:src_data -> rsp_xbar_demux_007:sink_data
	wire  [12:0] id_router_007_src_channel;                                                                                    // id_router_007:src_channel -> rsp_xbar_demux_007:sink_channel
	wire         id_router_007_src_ready;                                                                                      // rsp_xbar_demux_007:sink_ready -> id_router_007:src_ready
	wire         cmd_xbar_demux_001_src8_ready;                                                                                // sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src8_ready
	wire         id_router_008_src_endofpacket;                                                                                // id_router_008:src_endofpacket -> rsp_xbar_demux_008:sink_endofpacket
	wire         id_router_008_src_valid;                                                                                      // id_router_008:src_valid -> rsp_xbar_demux_008:sink_valid
	wire         id_router_008_src_startofpacket;                                                                              // id_router_008:src_startofpacket -> rsp_xbar_demux_008:sink_startofpacket
	wire  [88:0] id_router_008_src_data;                                                                                       // id_router_008:src_data -> rsp_xbar_demux_008:sink_data
	wire  [12:0] id_router_008_src_channel;                                                                                    // id_router_008:src_channel -> rsp_xbar_demux_008:sink_channel
	wire         id_router_008_src_ready;                                                                                      // rsp_xbar_demux_008:sink_ready -> id_router_008:src_ready
	wire         cmd_xbar_demux_001_src9_ready;                                                                                // slave_template_1_s0_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src9_ready
	wire         id_router_009_src_endofpacket;                                                                                // id_router_009:src_endofpacket -> rsp_xbar_demux_009:sink_endofpacket
	wire         id_router_009_src_valid;                                                                                      // id_router_009:src_valid -> rsp_xbar_demux_009:sink_valid
	wire         id_router_009_src_startofpacket;                                                                              // id_router_009:src_startofpacket -> rsp_xbar_demux_009:sink_startofpacket
	wire  [88:0] id_router_009_src_data;                                                                                       // id_router_009:src_data -> rsp_xbar_demux_009:sink_data
	wire  [12:0] id_router_009_src_channel;                                                                                    // id_router_009:src_channel -> rsp_xbar_demux_009:sink_channel
	wire         id_router_009_src_ready;                                                                                      // rsp_xbar_demux_009:sink_ready -> id_router_009:src_ready
	wire         cmd_xbar_demux_001_src10_ready;                                                                               // sys_clk_timer_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src10_ready
	wire         id_router_010_src_endofpacket;                                                                                // id_router_010:src_endofpacket -> rsp_xbar_demux_010:sink_endofpacket
	wire         id_router_010_src_valid;                                                                                      // id_router_010:src_valid -> rsp_xbar_demux_010:sink_valid
	wire         id_router_010_src_startofpacket;                                                                              // id_router_010:src_startofpacket -> rsp_xbar_demux_010:sink_startofpacket
	wire  [88:0] id_router_010_src_data;                                                                                       // id_router_010:src_data -> rsp_xbar_demux_010:sink_data
	wire  [12:0] id_router_010_src_channel;                                                                                    // id_router_010:src_channel -> rsp_xbar_demux_010:sink_channel
	wire         id_router_010_src_ready;                                                                                      // rsp_xbar_demux_010:sink_ready -> id_router_010:src_ready
	wire         cmd_xbar_mux_011_src_endofpacket;                                                                             // cmd_xbar_mux_011:src_endofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_011_src_valid;                                                                                   // cmd_xbar_mux_011:src_valid -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_011_src_startofpacket;                                                                           // cmd_xbar_mux_011:src_startofpacket -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [88:0] cmd_xbar_mux_011_src_data;                                                                                    // cmd_xbar_mux_011:src_data -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_data
	wire  [12:0] cmd_xbar_mux_011_src_channel;                                                                                 // cmd_xbar_mux_011:src_channel -> vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_011_src_ready;                                                                                   // vic_0_csr_access_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_011:src_ready
	wire         id_router_011_src_endofpacket;                                                                                // id_router_011:src_endofpacket -> rsp_xbar_demux_011:sink_endofpacket
	wire         id_router_011_src_valid;                                                                                      // id_router_011:src_valid -> rsp_xbar_demux_011:sink_valid
	wire         id_router_011_src_startofpacket;                                                                              // id_router_011:src_startofpacket -> rsp_xbar_demux_011:sink_startofpacket
	wire  [88:0] id_router_011_src_data;                                                                                       // id_router_011:src_data -> rsp_xbar_demux_011:sink_data
	wire  [12:0] id_router_011_src_channel;                                                                                    // id_router_011:src_channel -> rsp_xbar_demux_011:sink_channel
	wire         id_router_011_src_ready;                                                                                      // rsp_xbar_demux_011:sink_ready -> id_router_011:src_ready
	wire         cmd_xbar_demux_001_src12_ready;                                                                               // timer_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src12_ready
	wire         id_router_012_src_endofpacket;                                                                                // id_router_012:src_endofpacket -> rsp_xbar_demux_012:sink_endofpacket
	wire         id_router_012_src_valid;                                                                                      // id_router_012:src_valid -> rsp_xbar_demux_012:sink_valid
	wire         id_router_012_src_startofpacket;                                                                              // id_router_012:src_startofpacket -> rsp_xbar_demux_012:sink_startofpacket
	wire  [88:0] id_router_012_src_data;                                                                                       // id_router_012:src_data -> rsp_xbar_demux_012:sink_data
	wire  [12:0] id_router_012_src_channel;                                                                                    // id_router_012:src_channel -> rsp_xbar_demux_012:sink_channel
	wire         id_router_012_src_ready;                                                                                      // rsp_xbar_demux_012:sink_ready -> id_router_012:src_ready
	wire         cmd_xbar_mux_003_src_endofpacket;                                                                             // cmd_xbar_mux_003:src_endofpacket -> width_adapter:in_endofpacket
	wire         cmd_xbar_mux_003_src_valid;                                                                                   // cmd_xbar_mux_003:src_valid -> width_adapter:in_valid
	wire         cmd_xbar_mux_003_src_startofpacket;                                                                           // cmd_xbar_mux_003:src_startofpacket -> width_adapter:in_startofpacket
	wire  [88:0] cmd_xbar_mux_003_src_data;                                                                                    // cmd_xbar_mux_003:src_data -> width_adapter:in_data
	wire  [12:0] cmd_xbar_mux_003_src_channel;                                                                                 // cmd_xbar_mux_003:src_channel -> width_adapter:in_channel
	wire         cmd_xbar_mux_003_src_ready;                                                                                   // width_adapter:in_ready -> cmd_xbar_mux_003:src_ready
	wire         width_adapter_src_endofpacket;                                                                                // width_adapter:out_endofpacket -> burst_adapter:sink0_endofpacket
	wire         width_adapter_src_valid;                                                                                      // width_adapter:out_valid -> burst_adapter:sink0_valid
	wire         width_adapter_src_startofpacket;                                                                              // width_adapter:out_startofpacket -> burst_adapter:sink0_startofpacket
	wire  [70:0] width_adapter_src_data;                                                                                       // width_adapter:out_data -> burst_adapter:sink0_data
	wire         width_adapter_src_ready;                                                                                      // burst_adapter:sink0_ready -> width_adapter:out_ready
	wire  [12:0] width_adapter_src_channel;                                                                                    // width_adapter:out_channel -> burst_adapter:sink0_channel
	wire         id_router_003_src_endofpacket;                                                                                // id_router_003:src_endofpacket -> width_adapter_001:in_endofpacket
	wire         id_router_003_src_valid;                                                                                      // id_router_003:src_valid -> width_adapter_001:in_valid
	wire         id_router_003_src_startofpacket;                                                                              // id_router_003:src_startofpacket -> width_adapter_001:in_startofpacket
	wire  [70:0] id_router_003_src_data;                                                                                       // id_router_003:src_data -> width_adapter_001:in_data
	wire  [12:0] id_router_003_src_channel;                                                                                    // id_router_003:src_channel -> width_adapter_001:in_channel
	wire         id_router_003_src_ready;                                                                                      // width_adapter_001:in_ready -> id_router_003:src_ready
	wire         width_adapter_001_src_endofpacket;                                                                            // width_adapter_001:out_endofpacket -> rsp_xbar_demux_003:sink_endofpacket
	wire         width_adapter_001_src_valid;                                                                                  // width_adapter_001:out_valid -> rsp_xbar_demux_003:sink_valid
	wire         width_adapter_001_src_startofpacket;                                                                          // width_adapter_001:out_startofpacket -> rsp_xbar_demux_003:sink_startofpacket
	wire  [88:0] width_adapter_001_src_data;                                                                                   // width_adapter_001:out_data -> rsp_xbar_demux_003:sink_data
	wire         width_adapter_001_src_ready;                                                                                  // rsp_xbar_demux_003:sink_ready -> width_adapter_001:out_ready
	wire  [12:0] width_adapter_001_src_channel;                                                                                // width_adapter_001:out_channel -> rsp_xbar_demux_003:sink_channel
	wire  [12:0] limiter_cmd_valid_data;                                                                                       // limiter:cmd_src_valid -> cmd_xbar_demux:sink_valid
	wire  [12:0] limiter_001_cmd_valid_data;                                                                                   // limiter_001:cmd_src_valid -> cmd_xbar_demux_001:sink_valid
	wire  [12:0] limiter_002_cmd_valid_data;                                                                                   // limiter_002:cmd_src_valid -> cmd_xbar_demux_002:sink_valid
	wire         irq_mapper_receiver0_irq;                                                                                     // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                                                                     // epcs_flash_controller:irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                                                                     // uart:irq -> irq_mapper:receiver2_irq
	wire         irq_mapper_receiver3_irq;                                                                                     // sys_clk_timer:irq -> irq_mapper:receiver3_irq
	wire         irq_mapper_receiver4_irq;                                                                                     // timer_0:irq -> irq_mapper:receiver4_irq
	wire   [7:0] vic_0_irq_input_irq;                                                                                          // irq_mapper:sender_irq -> vic_0:irq_input_irq

	mynios2_cpu cpu (
		.clk                                   (up_clock_sys_clk_clk),                                               //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                                    //                   reset_n.reset_n
		.d_address                             (cpu_data_master_address),                                            //               data_master.address
		.d_byteenable                          (cpu_data_master_byteenable),                                         //                          .byteenable
		.d_read                                (cpu_data_master_read),                                               //                          .read
		.d_readdata                            (cpu_data_master_readdata),                                           //                          .readdata
		.d_waitrequest                         (cpu_data_master_waitrequest),                                        //                          .waitrequest
		.d_write                               (cpu_data_master_write),                                              //                          .write
		.d_writedata                           (cpu_data_master_writedata),                                          //                          .writedata
		.d_readdatavalid                       (cpu_data_master_readdatavalid),                                      //                          .readdatavalid
		.jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),                                        //                          .debugaccess
		.i_address                             (cpu_instruction_master_address),                                     //        instruction_master.address
		.i_read                                (cpu_instruction_master_read),                                        //                          .read
		.i_readdata                            (cpu_instruction_master_readdata),                                    //                          .readdata
		.i_waitrequest                         (cpu_instruction_master_waitrequest),                                 //                          .waitrequest
		.i_readdatavalid                       (cpu_instruction_master_readdatavalid),                               //                          .readdatavalid
		.eic_port_valid                        (vic_0_interrupt_controller_out_valid),                               //   interrupt_controller_in.valid
		.eic_port_data                         (vic_0_interrupt_controller_out_data),                                //                          .data
		.jtag_debug_module_resetrequest        (cpu_jtag_debug_module_reset_reset),                                  //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (cpu_jtag_debug_module_translator_avalon_anti_slave_0_address),       //         jtag_debug_module.address
		.jtag_debug_module_begintransfer       (cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer), //                          .begintransfer
		.jtag_debug_module_byteenable          (cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),    //                          .byteenable
		.jtag_debug_module_debugaccess         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),   //                          .debugaccess
		.jtag_debug_module_readdata            (cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata),      //                          .readdata
		.jtag_debug_module_select              (cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),    //                          .chipselect
		.jtag_debug_module_write               (cpu_jtag_debug_module_translator_avalon_anti_slave_0_write),         //                          .write
		.jtag_debug_module_writedata           (cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata),     //                          .writedata
		.no_ci_readra                          ()                                                                    // custom_instruction_master.readra
	);

	mynios2_jtag_uart jtag_uart (
		.clk            (up_clock_sys_clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                                        //             reset.reset_n
		.av_chipselect  (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address),     //                  .address
		.av_read_n      (~jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read),       //                  .read_n
		.av_readdata    (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),    //                  .readdata
		.av_write_n     (~jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write),      //                  .write_n
		.av_writedata   (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),   //                  .writedata
		.av_waitrequest (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest), //                  .waitrequest
		.dataavailable  (),                                                                       //                  .dataavailable
		.readyfordata   (),                                                                       //                  .readyfordata
		.av_irq         (irq_mapper_receiver0_irq)                                                //               irq.irq
	);

	mynios2_onchip_memory2 onchip_memory2 (
		.clk        (up_clock_sys_clk_clk),                                        //   clk1.clk
		.address    (onchip_memory2_s1_translator_avalon_anti_slave_0_address),    //     s1.address
		.chipselect (onchip_memory2_s1_translator_avalon_anti_slave_0_chipselect), //       .chipselect
		.clken      (onchip_memory2_s1_translator_avalon_anti_slave_0_clken),      //       .clken
		.readdata   (onchip_memory2_s1_translator_avalon_anti_slave_0_readdata),   //       .readdata
		.write      (onchip_memory2_s1_translator_avalon_anti_slave_0_write),      //       .write
		.writedata  (onchip_memory2_s1_translator_avalon_anti_slave_0_writedata),  //       .writedata
		.byteenable (onchip_memory2_s1_translator_avalon_anti_slave_0_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset)                               // reset1.reset
	);

	mynios2_epcs_flash_controller epcs_flash_controller (
		.clk           (up_clock_sys_clk_clk),                                                              //               clk.clk
		.reset_n       (~rst_controller_reset_out_reset),                                                   //             reset.reset_n
		.address       (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_address),    // epcs_control_port.address
		.chipselect    (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_chipselect), //                  .chipselect
		.dataavailable (),                                                                                  //                  .dataavailable
		.endofpacket   (),                                                                                  //                  .endofpacket
		.read_n        (~epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_read),      //                  .read_n
		.readdata      (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_readdata),   //                  .readdata
		.readyfordata  (),                                                                                  //                  .readyfordata
		.write_n       (~epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_write),     //                  .write_n
		.writedata     (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_writedata),  //                  .writedata
		.irq           (irq_mapper_receiver1_irq),                                                          //               irq.irq
		.dclk          (epcs_dclk),                                                                         //          external.export
		.sce           (epcs_sce),                                                                          //                  .export
		.sdo           (epcs_sdo),                                                                          //                  .export
		.data0         (epcs_data0)                                                                         //                  .export
	);

	mynios2_pio_0 pio_0 (
		.clk        (up_clock_sys_clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                    //               reset.reset_n
		.address    (pio_0_s1_translator_avalon_anti_slave_0_address),    //                  s1.address
		.write_n    (~pio_0_s1_translator_avalon_anti_slave_0_write),     //                    .write_n
		.writedata  (pio_0_s1_translator_avalon_anti_slave_0_writedata),  //                    .writedata
		.chipselect (pio_0_s1_translator_avalon_anti_slave_0_chipselect), //                    .chipselect
		.readdata   (pio_0_s1_translator_avalon_anti_slave_0_readdata),   //                    .readdata
		.out_port   (pio_led_export)                                      // external_connection.export
	);

	slave_template #(
		.DATA_WIDTH          (32),
		.ENABLE_SYNC_SIGNALS (0),
		.MODE_0              (2),
		.MODE_1              (2),
		.MODE_2              (2),
		.MODE_3              (2),
		.MODE_4              (2),
		.MODE_5              (2),
		.MODE_6              (2),
		.MODE_7              (2),
		.MODE_8              (2),
		.MODE_9              (2),
		.MODE_10             (2),
		.MODE_11             (2),
		.MODE_12             (2),
		.MODE_13             (2),
		.MODE_14             (2),
		.MODE_15             (2),
		.IRQ_EN              (0)
	) slave_template_0 (
		.clk              (up_clock_sys_clk_clk),                                          //       clock_reset.clk
		.reset            (rst_controller_reset_out_reset),                                // clock_reset_reset.reset
		.slave_address    (slave_template_0_s0_translator_avalon_anti_slave_0_address),    //                s0.address
		.slave_read       (slave_template_0_s0_translator_avalon_anti_slave_0_read),       //                  .read
		.slave_write      (slave_template_0_s0_translator_avalon_anti_slave_0_write),      //                  .write
		.slave_readdata   (slave_template_0_s0_translator_avalon_anti_slave_0_readdata),   //                  .readdata
		.slave_writedata  (slave_template_0_s0_translator_avalon_anti_slave_0_writedata),  //                  .writedata
		.slave_byteenable (slave_template_0_s0_translator_avalon_anti_slave_0_byteenable), //                  .byteenable
		.user_dataout_0   (multi_reg_dataout_0),                                           //    user_interface.export
		.user_dataout_1   (multi_reg_dataout_1),                                           //                  .export
		.user_dataout_2   (multi_reg_dataout_2),                                           //                  .export
		.user_dataout_3   (multi_reg_dataout_3),                                           //                  .export
		.user_dataout_4   (multi_reg_dataout_4),                                           //                  .export
		.user_dataout_5   (multi_reg_dataout_5),                                           //                  .export
		.user_dataout_6   (multi_reg_dataout_6),                                           //                  .export
		.user_dataout_7   (multi_reg_dataout_7),                                           //                  .export
		.user_dataout_8   (multi_reg_dataout_8),                                           //                  .export
		.user_dataout_9   (multi_reg_dataout_9),                                           //                  .export
		.user_dataout_10  (multi_reg_dataout_10),                                          //                  .export
		.user_dataout_11  (multi_reg_dataout_11),                                          //                  .export
		.user_dataout_12  (multi_reg_dataout_12),                                          //                  .export
		.user_dataout_13  (multi_reg_dataout_13),                                          //                  .export
		.user_dataout_14  (multi_reg_dataout_14),                                          //                  .export
		.user_dataout_15  (multi_reg_dataout_15),                                          //                  .export
		.user_datain_0    (multi_reg_datain_0),                                            //                  .export
		.user_datain_1    (multi_reg_datain_1),                                            //                  .export
		.user_datain_2    (multi_reg_datain_2),                                            //                  .export
		.user_datain_3    (multi_reg_datain_3),                                            //                  .export
		.user_datain_4    (multi_reg_datain_4),                                            //                  .export
		.user_datain_5    (multi_reg_datain_5),                                            //                  .export
		.user_datain_6    (multi_reg_datain_6),                                            //                  .export
		.user_datain_7    (multi_reg_datain_7),                                            //                  .export
		.user_datain_8    (multi_reg_datain_8),                                            //                  .export
		.user_datain_9    (multi_reg_datain_9),                                            //                  .export
		.user_datain_10   (multi_reg_datain_10),                                           //                  .export
		.user_datain_11   (multi_reg_datain_11),                                           //                  .export
		.user_datain_12   (multi_reg_datain_12),                                           //                  .export
		.user_datain_13   (multi_reg_datain_13),                                           //                  .export
		.user_datain_14   (multi_reg_datain_14),                                           //                  .export
		.user_datain_15   (multi_reg_datain_15),                                           //                  .export
		.slave_irq        (),                                                              //       (terminated)
		.user_write       (),                                                              //       (terminated)
		.user_read        (),                                                              //       (terminated)
		.user_chipselect  ()                                                               //       (terminated)
	);

	mynios2_uart uart (
		.clk           (up_clock_sys_clk_clk),                                 //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),                      //               reset.reset_n
		.address       (uart_s1_translator_avalon_anti_slave_0_address),       //                  s1.address
		.begintransfer (uart_s1_translator_avalon_anti_slave_0_begintransfer), //                    .begintransfer
		.chipselect    (uart_s1_translator_avalon_anti_slave_0_chipselect),    //                    .chipselect
		.read_n        (~uart_s1_translator_avalon_anti_slave_0_read),         //                    .read_n
		.write_n       (~uart_s1_translator_avalon_anti_slave_0_write),        //                    .write_n
		.writedata     (uart_s1_translator_avalon_anti_slave_0_writedata),     //                    .writedata
		.readdata      (uart_s1_translator_avalon_anti_slave_0_readdata),      //                    .readdata
		.dataavailable (),                                                     //                    .dataavailable
		.readyfordata  (),                                                     //                    .readyfordata
		.rxd           (uart_export_rxd),                                      // external_connection.export
		.txd           (uart_export_txd),                                      //                    .export
		.irq           (irq_mapper_receiver2_irq)                              //                 irq.irq
	);

	mynios2_sysid_qsys_0 sysid_qsys_0 (
		.clock    (up_clock_sys_clk_clk),                                               //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                                    //         reset.reset_n
		.readdata (sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_readdata), // control_slave.readdata
		.address  (sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_address)   //              .address
	);

	slave_template #(
		.DATA_WIDTH          (32),
		.ENABLE_SYNC_SIGNALS (0),
		.MODE_0              (2),
		.MODE_1              (2),
		.MODE_2              (2),
		.MODE_3              (2),
		.MODE_4              (2),
		.MODE_5              (2),
		.MODE_6              (2),
		.MODE_7              (2),
		.MODE_8              (2),
		.MODE_9              (2),
		.MODE_10             (2),
		.MODE_11             (2),
		.MODE_12             (2),
		.MODE_13             (2),
		.MODE_14             (2),
		.MODE_15             (2),
		.IRQ_EN              (0)
	) slave_template_1 (
		.clk              (up_clock_sys_clk_clk),                                          //       clock_reset.clk
		.reset            (rst_controller_reset_out_reset),                                // clock_reset_reset.reset
		.slave_address    (slave_template_1_s0_translator_avalon_anti_slave_0_address),    //                s0.address
		.slave_read       (slave_template_1_s0_translator_avalon_anti_slave_0_read),       //                  .read
		.slave_write      (slave_template_1_s0_translator_avalon_anti_slave_0_write),      //                  .write
		.slave_readdata   (slave_template_1_s0_translator_avalon_anti_slave_0_readdata),   //                  .readdata
		.slave_writedata  (slave_template_1_s0_translator_avalon_anti_slave_0_writedata),  //                  .writedata
		.slave_byteenable (slave_template_1_s0_translator_avalon_anti_slave_0_byteenable), //                  .byteenable
		.user_dataout_0   (multi_reg_1_dataout_0),                                         //    user_interface.export
		.user_dataout_1   (multi_reg_1_dataout_1),                                         //                  .export
		.user_dataout_2   (multi_reg_1_dataout_2),                                         //                  .export
		.user_dataout_3   (multi_reg_1_dataout_3),                                         //                  .export
		.user_dataout_4   (multi_reg_1_dataout_4),                                         //                  .export
		.user_dataout_5   (multi_reg_1_dataout_5),                                         //                  .export
		.user_dataout_6   (multi_reg_1_dataout_6),                                         //                  .export
		.user_dataout_7   (multi_reg_1_dataout_7),                                         //                  .export
		.user_dataout_8   (multi_reg_1_dataout_8),                                         //                  .export
		.user_dataout_9   (multi_reg_1_dataout_9),                                         //                  .export
		.user_dataout_10  (multi_reg_1_dataout_10),                                        //                  .export
		.user_dataout_11  (multi_reg_1_dataout_11),                                        //                  .export
		.user_dataout_12  (multi_reg_1_dataout_12),                                        //                  .export
		.user_dataout_13  (multi_reg_1_dataout_13),                                        //                  .export
		.user_dataout_14  (multi_reg_1_dataout_14),                                        //                  .export
		.user_dataout_15  (multi_reg_1_dataout_15),                                        //                  .export
		.user_datain_0    (multi_reg_1_datain_0),                                          //                  .export
		.user_datain_1    (multi_reg_1_datain_1),                                          //                  .export
		.user_datain_2    (multi_reg_1_datain_2),                                          //                  .export
		.user_datain_3    (multi_reg_1_datain_3),                                          //                  .export
		.user_datain_4    (multi_reg_1_datain_4),                                          //                  .export
		.user_datain_5    (multi_reg_1_datain_5),                                          //                  .export
		.user_datain_6    (multi_reg_1_datain_6),                                          //                  .export
		.user_datain_7    (multi_reg_1_datain_7),                                          //                  .export
		.user_datain_8    (multi_reg_1_datain_8),                                          //                  .export
		.user_datain_9    (multi_reg_1_datain_9),                                          //                  .export
		.user_datain_10   (multi_reg_1_datain_10),                                         //                  .export
		.user_datain_11   (multi_reg_1_datain_11),                                         //                  .export
		.user_datain_12   (multi_reg_1_datain_12),                                         //                  .export
		.user_datain_13   (multi_reg_1_datain_13),                                         //                  .export
		.user_datain_14   (multi_reg_1_datain_14),                                         //                  .export
		.user_datain_15   (multi_reg_1_datain_15),                                         //                  .export
		.slave_irq        (),                                                              //       (terminated)
		.user_write       (),                                                              //       (terminated)
		.user_read        (),                                                              //       (terminated)
		.user_chipselect  ()                                                               //       (terminated)
	);

	mynios2_up_clock up_clock (
		.CLOCK_50    (clk_clk),                            //       clk_in_primary.clk
		.reset       (rst_controller_001_reset_out_reset), // clk_in_primary_reset.reset
		.sys_clk     (up_clock_sys_clk_clk),               //              sys_clk.clk
		.sys_reset_n (up_clock_sys_clk_reset_reset),       //        sys_clk_reset.reset_n
		.SDRAM_CLK   (sdram_clk_clk)                       //            sdram_clk.clk
	);

	mynios2_sdram_0 sdram_0 (
		.clk            (up_clock_sys_clk_clk),                                    //   clk.clk
		.reset_n        (~rst_controller_002_reset_out_reset),                     // reset.reset_n
		.az_addr        (sdram_0_s1_translator_avalon_anti_slave_0_address),       //    s1.address
		.az_be_n        (~sdram_0_s1_translator_avalon_anti_slave_0_byteenable),   //      .byteenable_n
		.az_cs          (sdram_0_s1_translator_avalon_anti_slave_0_chipselect),    //      .chipselect
		.az_data        (sdram_0_s1_translator_avalon_anti_slave_0_writedata),     //      .writedata
		.az_rd_n        (~sdram_0_s1_translator_avalon_anti_slave_0_read),         //      .read_n
		.az_wr_n        (~sdram_0_s1_translator_avalon_anti_slave_0_write),        //      .write_n
		.za_data        (sdram_0_s1_translator_avalon_anti_slave_0_readdata),      //      .readdata
		.za_valid       (sdram_0_s1_translator_avalon_anti_slave_0_readdatavalid), //      .readdatavalid
		.za_waitrequest (sdram_0_s1_translator_avalon_anti_slave_0_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_addr),                                              //  wire.export
		.zs_ba          (sdram_ba),                                                //      .export
		.zs_cas_n       (sdram_cas_n),                                             //      .export
		.zs_cke         (sdram_cke),                                               //      .export
		.zs_cs_n        (sdram_cs_n),                                              //      .export
		.zs_dq          (sdram_dq),                                                //      .export
		.zs_dqm         (sdram_dqm),                                               //      .export
		.zs_ras_n       (sdram_ras_n),                                             //      .export
		.zs_we_n        (sdram_we_n)                                               //      .export
	);

	mynios2_sys_clk_timer sys_clk_timer (
		.clk        (up_clock_sys_clk_clk),                                       //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                            // reset.reset_n
		.address    (sys_clk_timer_s1_translator_avalon_anti_slave_0_address),    //    s1.address
		.writedata  (sys_clk_timer_s1_translator_avalon_anti_slave_0_writedata),  //      .writedata
		.readdata   (sys_clk_timer_s1_translator_avalon_anti_slave_0_readdata),   //      .readdata
		.chipselect (sys_clk_timer_s1_translator_avalon_anti_slave_0_chipselect), //      .chipselect
		.write_n    (~sys_clk_timer_s1_translator_avalon_anti_slave_0_write),     //      .write_n
		.irq        (irq_mapper_receiver3_irq)                                    //   irq.irq
	);

	mynios2_vic_0 vic_0 (
		.clk_clk                        (up_clock_sys_clk_clk),                                      //                      clk.clk
		.clk_reset_reset                (rst_controller_reset_out_reset),                            //                clk_reset.reset
		.dummy_master_read              (vic_0_dummy_master_read),                                   //             dummy_master.read
		.dummy_master_write             (vic_0_dummy_master_write),                                  //                         .write
		.dummy_master_waitrequest       (vic_0_dummy_master_waitrequest),                            //                         .waitrequest
		.dummy_master_address           (vic_0_dummy_master_address),                                //                         .address
		.dummy_master_writedata         (vic_0_dummy_master_writedata),                              //                         .writedata
		.dummy_master_readdata          (vic_0_dummy_master_readdata),                               //                         .readdata
		.irq_input_irq                  (vic_0_irq_input_irq),                                       //                irq_input.irq
		.csr_access_read                (vic_0_csr_access_translator_avalon_anti_slave_0_read),      //               csr_access.read
		.csr_access_write               (vic_0_csr_access_translator_avalon_anti_slave_0_write),     //                         .write
		.csr_access_address             (vic_0_csr_access_translator_avalon_anti_slave_0_address),   //                         .address
		.csr_access_writedata           (vic_0_csr_access_translator_avalon_anti_slave_0_writedata), //                         .writedata
		.csr_access_readdata            (vic_0_csr_access_translator_avalon_anti_slave_0_readdata),  //                         .readdata
		.interrupt_controller_out_valid (vic_0_interrupt_controller_out_valid),                      // interrupt_controller_out.valid
		.interrupt_controller_out_data  (vic_0_interrupt_controller_out_data)                        //                         .data
	);

	mynios2_timer_0 timer_0 (
		.clk        (up_clock_sys_clk_clk),                                 //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                      // reset.reset_n
		.address    (timer_0_s1_translator_avalon_anti_slave_0_address),    //    s1.address
		.writedata  (timer_0_s1_translator_avalon_anti_slave_0_writedata),  //      .writedata
		.readdata   (timer_0_s1_translator_avalon_anti_slave_0_readdata),   //      .readdata
		.chipselect (timer_0_s1_translator_avalon_anti_slave_0_chipselect), //      .chipselect
		.write_n    (~timer_0_s1_translator_avalon_anti_slave_0_write),     //      .write_n
		.irq        (irq_mapper_receiver4_irq)                              //   irq.irq
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (27),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (32),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (1),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_instruction_master_translator (
		.clk                   (up_clock_sys_clk_clk),                                                      //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                            //                     reset.reset
		.uav_address           (cpu_instruction_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_instruction_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_instruction_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_instruction_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_instruction_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_instruction_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_instruction_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_instruction_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_instruction_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_instruction_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_instruction_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_instruction_master_waitrequest),                                        //                          .waitrequest
		.av_read               (cpu_instruction_master_read),                                               //                          .read
		.av_readdata           (cpu_instruction_master_readdata),                                           //                          .readdata
		.av_readdatavalid      (cpu_instruction_master_readdatavalid),                                      //                          .readdatavalid
		.av_burstcount         (1'b1),                                                                      //               (terminated)
		.av_byteenable         (4'b1111),                                                                   //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                      //               (terminated)
		.av_begintransfer      (1'b0),                                                                      //               (terminated)
		.av_chipselect         (1'b0),                                                                      //               (terminated)
		.av_write              (1'b0),                                                                      //               (terminated)
		.av_writedata          (32'b00000000000000000000000000000000),                                      //               (terminated)
		.av_lock               (1'b0),                                                                      //               (terminated)
		.av_debugaccess        (1'b0),                                                                      //               (terminated)
		.uav_clken             (),                                                                          //               (terminated)
		.av_clken              (1'b1)                                                                       //               (terminated)
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (27),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (32),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_data_master_translator (
		.clk                   (up_clock_sys_clk_clk),                                               //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                     //                     reset.reset
		.uav_address           (cpu_data_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_data_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_data_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_data_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_data_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_data_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_data_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_data_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_data_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_data_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_data_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_data_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_data_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable         (cpu_data_master_byteenable),                                         //                          .byteenable
		.av_read               (cpu_data_master_read),                                               //                          .read
		.av_readdata           (cpu_data_master_readdata),                                           //                          .readdata
		.av_readdatavalid      (cpu_data_master_readdatavalid),                                      //                          .readdatavalid
		.av_write              (cpu_data_master_write),                                              //                          .write
		.av_writedata          (cpu_data_master_writedata),                                          //                          .writedata
		.av_debugaccess        (cpu_data_master_debugaccess),                                        //                          .debugaccess
		.av_burstcount         (1'b1),                                                               //               (terminated)
		.av_beginbursttransfer (1'b0),                                                               //               (terminated)
		.av_begintransfer      (1'b0),                                                               //               (terminated)
		.av_chipselect         (1'b0),                                                               //               (terminated)
		.av_lock               (1'b0),                                                               //               (terminated)
		.uav_clken             (),                                                                   //               (terminated)
		.av_clken              (1'b1)                                                                //               (terminated)
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (32),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (32),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (0),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) vic_0_dummy_master_translator (
		.clk                   (up_clock_sys_clk_clk),                                                  //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                        //                     reset.reset
		.uav_address           (vic_0_dummy_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (vic_0_dummy_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (vic_0_dummy_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (vic_0_dummy_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (vic_0_dummy_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (vic_0_dummy_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (vic_0_dummy_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (vic_0_dummy_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (vic_0_dummy_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (vic_0_dummy_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (vic_0_dummy_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (vic_0_dummy_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (vic_0_dummy_master_waitrequest),                                        //                          .waitrequest
		.av_read               (vic_0_dummy_master_read),                                               //                          .read
		.av_readdata           (vic_0_dummy_master_readdata),                                           //                          .readdata
		.av_write              (vic_0_dummy_master_write),                                              //                          .write
		.av_writedata          (vic_0_dummy_master_writedata),                                          //                          .writedata
		.av_burstcount         (1'b1),                                                                  //               (terminated)
		.av_byteenable         (4'b1111),                                                               //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                  //               (terminated)
		.av_begintransfer      (1'b0),                                                                  //               (terminated)
		.av_chipselect         (1'b0),                                                                  //               (terminated)
		.av_readdatavalid      (),                                                                      //               (terminated)
		.av_lock               (1'b0),                                                                  //               (terminated)
		.av_debugaccess        (1'b0),                                                                  //               (terminated)
		.uav_clken             (),                                                                      //               (terminated)
		.av_clken              (1'b1)                                                                   //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) cpu_jtag_debug_module_translator (
		.clk                   (up_clock_sys_clk_clk),                                                             //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                   //                    reset.reset
		.uav_address           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (cpu_jtag_debug_module_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (cpu_jtag_debug_module_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_byteenable         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_debugaccess        (cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),                 //                         .debugaccess
		.av_read               (),                                                                                 //              (terminated)
		.av_beginbursttransfer (),                                                                                 //              (terminated)
		.av_burstcount         (),                                                                                 //              (terminated)
		.av_readdatavalid      (1'b0),                                                                             //              (terminated)
		.av_waitrequest        (1'b0),                                                                             //              (terminated)
		.av_writebyteenable    (),                                                                                 //              (terminated)
		.av_lock               (),                                                                                 //              (terminated)
		.av_clken              (),                                                                                 //              (terminated)
		.uav_clken             (1'b0),                                                                             //              (terminated)
		.av_outputenable       ()                                                                                  //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (10),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (1),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) onchip_memory2_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                                         //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                               //                    reset.reset
		.uav_address           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (onchip_memory2_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (onchip_memory2_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (onchip_memory2_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (onchip_memory2_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (onchip_memory2_s1_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (onchip_memory2_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_clken              (onchip_memory2_s1_translator_avalon_anti_slave_0_clken),                       //                         .clken
		.av_read               (),                                                                             //              (terminated)
		.av_begintransfer      (),                                                                             //              (terminated)
		.av_beginbursttransfer (),                                                                             //              (terminated)
		.av_burstcount         (),                                                                             //              (terminated)
		.av_readdatavalid      (1'b0),                                                                         //              (terminated)
		.av_waitrequest        (1'b0),                                                                         //              (terminated)
		.av_writebyteenable    (),                                                                             //              (terminated)
		.av_lock               (),                                                                             //              (terminated)
		.uav_clken             (1'b0),                                                                         //              (terminated)
		.av_debugaccess        (),                                                                             //              (terminated)
		.av_outputenable       ()                                                                              //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (1),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) epcs_flash_controller_epcs_control_port_translator (
		.clk                   (up_clock_sys_clk_clk),                                                                               //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                                     //                    reset.reset
		.uav_address           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (epcs_flash_controller_epcs_control_port_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                                                   //              (terminated)
		.av_beginbursttransfer (),                                                                                                   //              (terminated)
		.av_burstcount         (),                                                                                                   //              (terminated)
		.av_byteenable         (),                                                                                                   //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                               //              (terminated)
		.av_waitrequest        (1'b0),                                                                                               //              (terminated)
		.av_writebyteenable    (),                                                                                                   //              (terminated)
		.av_lock               (),                                                                                                   //              (terminated)
		.av_clken              (),                                                                                                   //              (terminated)
		.uav_clken             (1'b0),                                                                                               //              (terminated)
		.av_debugaccess        (),                                                                                                   //              (terminated)
		.av_outputenable       ()                                                                                                    //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (24),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (16),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (2),
		.UAV_BYTEENABLE_W               (2),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (2),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (1),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (2),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) sdram_0_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                                  //                      clk.clk
		.reset                 (rst_controller_002_reset_out_reset),                                    //                    reset.reset
		.uav_address           (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (sdram_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (sdram_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (sdram_0_s1_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (sdram_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (sdram_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (sdram_0_s1_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_readdatavalid      (sdram_0_s1_translator_avalon_anti_slave_0_readdatavalid),               //                         .readdatavalid
		.av_waitrequest        (sdram_0_s1_translator_avalon_anti_slave_0_waitrequest),                 //                         .waitrequest
		.av_chipselect         (sdram_0_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                      //              (terminated)
		.av_beginbursttransfer (),                                                                      //              (terminated)
		.av_burstcount         (),                                                                      //              (terminated)
		.av_writebyteenable    (),                                                                      //              (terminated)
		.av_lock               (),                                                                      //              (terminated)
		.av_clken              (),                                                                      //              (terminated)
		.uav_clken             (1'b0),                                                                  //              (terminated)
		.av_debugaccess        (),                                                                      //              (terminated)
		.av_outputenable       ()                                                                       //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (1),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) jtag_uart_avalon_jtag_slave_translator (
		.clk                   (up_clock_sys_clk_clk),                                                                   //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                         //                    reset.reset
		.uav_address           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_waitrequest        (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest),                 //                         .waitrequest
		.av_chipselect         (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                                       //              (terminated)
		.av_beginbursttransfer (),                                                                                       //              (terminated)
		.av_burstcount         (),                                                                                       //              (terminated)
		.av_byteenable         (),                                                                                       //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                   //              (terminated)
		.av_writebyteenable    (),                                                                                       //              (terminated)
		.av_lock               (),                                                                                       //              (terminated)
		.av_clken              (),                                                                                       //              (terminated)
		.uav_clken             (1'b0),                                                                                   //              (terminated)
		.av_debugaccess        (),                                                                                       //              (terminated)
		.av_outputenable       ()                                                                                        //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) pio_0_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                                //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                      //                    reset.reset
		.uav_address           (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (pio_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (pio_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (pio_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (pio_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (pio_0_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_read               (),                                                                    //              (terminated)
		.av_begintransfer      (),                                                                    //              (terminated)
		.av_beginbursttransfer (),                                                                    //              (terminated)
		.av_burstcount         (),                                                                    //              (terminated)
		.av_byteenable         (),                                                                    //              (terminated)
		.av_readdatavalid      (1'b0),                                                                //              (terminated)
		.av_waitrequest        (1'b0),                                                                //              (terminated)
		.av_writebyteenable    (),                                                                    //              (terminated)
		.av_lock               (),                                                                    //              (terminated)
		.av_clken              (),                                                                    //              (terminated)
		.uav_clken             (1'b0),                                                                //              (terminated)
		.av_debugaccess        (),                                                                    //              (terminated)
		.av_outputenable       ()                                                                     //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (3),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) slave_template_0_s0_translator (
		.clk                   (up_clock_sys_clk_clk),                                                           //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (slave_template_0_s0_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (slave_template_0_s0_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (slave_template_0_s0_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (slave_template_0_s0_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (slave_template_0_s0_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (slave_template_0_s0_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_begintransfer      (),                                                                               //              (terminated)
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_readdatavalid      (1'b0),                                                                           //              (terminated)
		.av_waitrequest        (1'b0),                                                                           //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.av_chipselect         (),                                                                               //              (terminated)
		.av_clken              (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (1),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) uart_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                               //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                     //                    reset.reset
		.uav_address           (uart_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (uart_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (uart_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (uart_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (uart_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (uart_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (uart_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (uart_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (uart_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (uart_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (uart_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (uart_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (uart_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (uart_s1_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (uart_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (uart_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (uart_s1_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_chipselect         (uart_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_beginbursttransfer (),                                                                   //              (terminated)
		.av_burstcount         (),                                                                   //              (terminated)
		.av_byteenable         (),                                                                   //              (terminated)
		.av_readdatavalid      (1'b0),                                                               //              (terminated)
		.av_waitrequest        (1'b0),                                                               //              (terminated)
		.av_writebyteenable    (),                                                                   //              (terminated)
		.av_lock               (),                                                                   //              (terminated)
		.av_clken              (),                                                                   //              (terminated)
		.uav_clken             (1'b0),                                                               //              (terminated)
		.av_debugaccess        (),                                                                   //              (terminated)
		.av_outputenable       ()                                                                    //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (1),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) sysid_qsys_0_control_slave_translator (
		.clk                   (up_clock_sys_clk_clk),                                                                  //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                        //                    reset.reset
		.uav_address           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_readdata           (sysid_qsys_0_control_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_write              (),                                                                                      //              (terminated)
		.av_read               (),                                                                                      //              (terminated)
		.av_writedata          (),                                                                                      //              (terminated)
		.av_begintransfer      (),                                                                                      //              (terminated)
		.av_beginbursttransfer (),                                                                                      //              (terminated)
		.av_burstcount         (),                                                                                      //              (terminated)
		.av_byteenable         (),                                                                                      //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                  //              (terminated)
		.av_waitrequest        (1'b0),                                                                                  //              (terminated)
		.av_writebyteenable    (),                                                                                      //              (terminated)
		.av_lock               (),                                                                                      //              (terminated)
		.av_chipselect         (),                                                                                      //              (terminated)
		.av_clken              (),                                                                                      //              (terminated)
		.uav_clken             (1'b0),                                                                                  //              (terminated)
		.av_debugaccess        (),                                                                                      //              (terminated)
		.av_outputenable       ()                                                                                       //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (3),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) slave_template_1_s0_translator (
		.clk                   (up_clock_sys_clk_clk),                                                           //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (slave_template_1_s0_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (slave_template_1_s0_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (slave_template_1_s0_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (slave_template_1_s0_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (slave_template_1_s0_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (slave_template_1_s0_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_begintransfer      (),                                                                               //              (terminated)
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_readdatavalid      (1'b0),                                                                           //              (terminated)
		.av_waitrequest        (1'b0),                                                                           //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.av_chipselect         (),                                                                               //              (terminated)
		.av_clken              (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) sys_clk_timer_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                              //                    reset.reset
		.uav_address           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (sys_clk_timer_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (sys_clk_timer_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (sys_clk_timer_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (sys_clk_timer_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (sys_clk_timer_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_read               (),                                                                            //              (terminated)
		.av_begintransfer      (),                                                                            //              (terminated)
		.av_beginbursttransfer (),                                                                            //              (terminated)
		.av_burstcount         (),                                                                            //              (terminated)
		.av_byteenable         (),                                                                            //              (terminated)
		.av_readdatavalid      (1'b0),                                                                        //              (terminated)
		.av_waitrequest        (1'b0),                                                                        //              (terminated)
		.av_writebyteenable    (),                                                                            //              (terminated)
		.av_lock               (),                                                                            //              (terminated)
		.av_clken              (),                                                                            //              (terminated)
		.uav_clken             (1'b0),                                                                        //              (terminated)
		.av_debugaccess        (),                                                                            //              (terminated)
		.av_outputenable       ()                                                                             //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (8),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (4),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) vic_0_csr_access_translator (
		.clk                   (up_clock_sys_clk_clk),                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                              //                    reset.reset
		.uav_address           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (vic_0_csr_access_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (vic_0_csr_access_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (vic_0_csr_access_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (vic_0_csr_access_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (vic_0_csr_access_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (),                                                                            //              (terminated)
		.av_beginbursttransfer (),                                                                            //              (terminated)
		.av_burstcount         (),                                                                            //              (terminated)
		.av_byteenable         (),                                                                            //              (terminated)
		.av_readdatavalid      (1'b0),                                                                        //              (terminated)
		.av_waitrequest        (1'b0),                                                                        //              (terminated)
		.av_writebyteenable    (),                                                                            //              (terminated)
		.av_lock               (),                                                                            //              (terminated)
		.av_chipselect         (),                                                                            //              (terminated)
		.av_clken              (),                                                                            //              (terminated)
		.uav_clken             (1'b0),                                                                        //              (terminated)
		.av_debugaccess        (),                                                                            //              (terminated)
		.av_outputenable       ()                                                                             //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) timer_0_s1_translator (
		.clk                   (up_clock_sys_clk_clk),                                                  //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                        //                    reset.reset
		.uav_address           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (timer_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (timer_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (timer_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (timer_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (timer_0_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_read               (),                                                                      //              (terminated)
		.av_begintransfer      (),                                                                      //              (terminated)
		.av_beginbursttransfer (),                                                                      //              (terminated)
		.av_burstcount         (),                                                                      //              (terminated)
		.av_byteenable         (),                                                                      //              (terminated)
		.av_readdatavalid      (1'b0),                                                                  //              (terminated)
		.av_waitrequest        (1'b0),                                                                  //              (terminated)
		.av_writebyteenable    (),                                                                      //              (terminated)
		.av_lock               (),                                                                      //              (terminated)
		.av_clken              (),                                                                      //              (terminated)
		.uav_clken             (1'b0),                                                                  //              (terminated)
		.av_debugaccess        (),                                                                      //              (terminated)
		.av_outputenable       ()                                                                       //              (terminated)
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.PKT_BEGIN_BURST           (79),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (1),
		.BURSTWRAP_VALUE           (3)
	) cpu_instruction_master_translator_avalon_universal_master_0_agent (
		.clk              (up_clock_sys_clk_clk),                                                               //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                     // clk_reset.reset
		.av_address       (cpu_instruction_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_instruction_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_instruction_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_instruction_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_instruction_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_instruction_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_instruction_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_instruction_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_instruction_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_instruction_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_rsp_src_valid),                                                              //        rp.valid
		.rp_data          (limiter_rsp_src_data),                                                               //          .data
		.rp_channel       (limiter_rsp_src_channel),                                                            //          .channel
		.rp_startofpacket (limiter_rsp_src_startofpacket),                                                      //          .startofpacket
		.rp_endofpacket   (limiter_rsp_src_endofpacket),                                                        //          .endofpacket
		.rp_ready         (limiter_rsp_src_ready)                                                               //          .ready
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.PKT_BEGIN_BURST           (79),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (2),
		.BURSTWRAP_VALUE           (7)
	) cpu_data_master_translator_avalon_universal_master_0_agent (
		.clk              (up_clock_sys_clk_clk),                                                        //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.av_address       (cpu_data_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_data_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_data_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_data_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_data_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_data_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_data_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_data_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_data_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_data_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_data_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_001_rsp_src_valid),                                                   //        rp.valid
		.rp_data          (limiter_001_rsp_src_data),                                                    //          .data
		.rp_channel       (limiter_001_rsp_src_channel),                                                 //          .channel
		.rp_startofpacket (limiter_001_rsp_src_startofpacket),                                           //          .startofpacket
		.rp_endofpacket   (limiter_001_rsp_src_endofpacket),                                             //          .endofpacket
		.rp_ready         (limiter_001_rsp_src_ready)                                                    //          .ready
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.PKT_BEGIN_BURST           (79),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (3),
		.BURSTWRAP_VALUE           (7)
	) vic_0_dummy_master_translator_avalon_universal_master_0_agent (
		.clk              (up_clock_sys_clk_clk),                                                           //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.av_address       (vic_0_dummy_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (vic_0_dummy_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (vic_0_dummy_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (vic_0_dummy_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (vic_0_dummy_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (vic_0_dummy_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (vic_0_dummy_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (vic_0_dummy_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (vic_0_dummy_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (vic_0_dummy_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (vic_0_dummy_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_002_rsp_src_valid),                                                      //        rp.valid
		.rp_data          (limiter_002_rsp_src_data),                                                       //          .data
		.rp_channel       (limiter_002_rsp_src_channel),                                                    //          .channel
		.rp_startofpacket (limiter_002_rsp_src_startofpacket),                                              //          .startofpacket
		.rp_endofpacket   (limiter_002_rsp_src_endofpacket),                                                //          .endofpacket
		.rp_ready         (limiter_002_rsp_src_ready)                                                       //          .ready
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                       //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                             //       clk_reset.reset
		.m0_address              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_src_ready),                                                                     //              cp.ready
		.cp_valid                (cmd_xbar_mux_src_valid),                                                                     //                .valid
		.cp_data                 (cmd_xbar_mux_src_data),                                                                      //                .data
		.cp_startofpacket        (cmd_xbar_mux_src_startofpacket),                                                             //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_src_endofpacket),                                                               //                .endofpacket
		.cp_channel              (cmd_xbar_mux_src_channel),                                                                   //                .channel
		.rf_sink_ready           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                       //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                             // clk_reset.reset
		.in_data           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                      // (terminated)
		.csr_read          (1'b0),                                                                                       // (terminated)
		.csr_write         (1'b0),                                                                                       // (terminated)
		.csr_readdata      (),                                                                                           // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                       // (terminated)
		.almost_full_data  (),                                                                                           // (terminated)
		.almost_empty_data (),                                                                                           // (terminated)
		.in_empty          (1'b0),                                                                                       // (terminated)
		.out_empty         (),                                                                                           // (terminated)
		.in_error          (1'b0),                                                                                       // (terminated)
		.out_error         (),                                                                                           // (terminated)
		.in_channel        (1'b0),                                                                                       // (terminated)
		.out_channel       ()                                                                                            // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) onchip_memory2_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                   //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                         //       clk_reset.reset
		.m0_address              (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_001_src_ready),                                                             //              cp.ready
		.cp_valid                (cmd_xbar_mux_001_src_valid),                                                             //                .valid
		.cp_data                 (cmd_xbar_mux_001_src_data),                                                              //                .data
		.cp_startofpacket        (cmd_xbar_mux_001_src_startofpacket),                                                     //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_001_src_endofpacket),                                                       //                .endofpacket
		.cp_channel              (cmd_xbar_mux_001_src_channel),                                                           //                .channel
		.rf_sink_ready           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                   //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                         // clk_reset.reset
		.in_data           (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                  // (terminated)
		.csr_read          (1'b0),                                                                                   // (terminated)
		.csr_write         (1'b0),                                                                                   // (terminated)
		.csr_readdata      (),                                                                                       // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                   // (terminated)
		.almost_full_data  (),                                                                                       // (terminated)
		.almost_empty_data (),                                                                                       // (terminated)
		.in_empty          (1'b0),                                                                                   // (terminated)
		.out_empty         (),                                                                                       // (terminated)
		.in_error          (1'b0),                                                                                   // (terminated)
		.out_error         (),                                                                                       // (terminated)
		.in_channel        (1'b0),                                                                                   // (terminated)
		.out_channel       ()                                                                                        // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                                         //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                               //       clk_reset.reset
		.m0_address              (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_002_src_ready),                                                                                   //              cp.ready
		.cp_valid                (cmd_xbar_mux_002_src_valid),                                                                                   //                .valid
		.cp_data                 (cmd_xbar_mux_002_src_data),                                                                                    //                .data
		.cp_startofpacket        (cmd_xbar_mux_002_src_startofpacket),                                                                           //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_002_src_endofpacket),                                                                             //                .endofpacket
		.cp_channel              (cmd_xbar_mux_002_src_channel),                                                                                 //                .channel
		.rf_sink_ready           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                                         //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                               // clk_reset.reset
		.in_data           (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                                        // (terminated)
		.csr_read          (1'b0),                                                                                                         // (terminated)
		.csr_write         (1'b0),                                                                                                         // (terminated)
		.csr_readdata      (),                                                                                                             // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                                         // (terminated)
		.almost_full_data  (),                                                                                                             // (terminated)
		.almost_empty_data (),                                                                                                             // (terminated)
		.in_empty          (1'b0),                                                                                                         // (terminated)
		.out_empty         (),                                                                                                             // (terminated)
		.in_error          (1'b0),                                                                                                         // (terminated)
		.out_error         (),                                                                                                             // (terminated)
		.in_channel        (1'b0),                                                                                                         // (terminated)
		.out_channel       ()                                                                                                              // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (15),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (61),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (17),
		.PKT_BYTEEN_L              (16),
		.PKT_ADDR_H                (49),
		.PKT_ADDR_L                (18),
		.PKT_TRANS_COMPRESSED_READ (50),
		.PKT_TRANS_POSTED          (51),
		.PKT_TRANS_WRITE           (52),
		.PKT_TRANS_READ            (53),
		.PKT_TRANS_LOCK            (54),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (62),
		.PKT_DEST_ID_H             (69),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (60),
		.PKT_BURSTWRAP_L           (58),
		.PKT_BYTE_CNT_H            (57),
		.PKT_BYTE_CNT_L            (55),
		.PKT_PROTECTION_H          (70),
		.PKT_PROTECTION_L          (70),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (71),
		.AVS_BURSTCOUNT_W          (2),
		.SUPPRESS_0_BYTEEN_CMD     (1),
		.PREVENT_FIFO_OVERFLOW     (1)
	) sdram_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                            //             clk.clk
		.reset                   (rst_controller_002_reset_out_reset),                                              //       clk_reset.reset
		.m0_address              (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (sdram_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (burst_adapter_source0_ready),                                                     //              cp.ready
		.cp_valid                (burst_adapter_source0_valid),                                                     //                .valid
		.cp_data                 (burst_adapter_source0_data),                                                      //                .data
		.cp_startofpacket        (burst_adapter_source0_startofpacket),                                             //                .startofpacket
		.cp_endofpacket          (burst_adapter_source0_endofpacket),                                               //                .endofpacket
		.cp_channel              (burst_adapter_source0_channel),                                                   //                .channel
		.rf_sink_ready           (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (sdram_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (72),
		.FIFO_DEPTH          (8),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                            //       clk.clk
		.reset             (rst_controller_002_reset_out_reset),                                              // clk_reset.reset
		.in_data           (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (sdram_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                           // (terminated)
		.csr_read          (1'b0),                                                                            // (terminated)
		.csr_write         (1'b0),                                                                            // (terminated)
		.csr_readdata      (),                                                                                // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                            // (terminated)
		.almost_full_data  (),                                                                                // (terminated)
		.almost_empty_data (),                                                                                // (terminated)
		.in_empty          (1'b0),                                                                            // (terminated)
		.out_empty         (),                                                                                // (terminated)
		.in_error          (1'b0),                                                                            // (terminated)
		.out_error         (),                                                                                // (terminated)
		.in_channel        (1'b0),                                                                            // (terminated)
		.out_channel       ()                                                                                 // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                             //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                   //       clk_reset.reset
		.m0_address              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src4_ready),                                                                    //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src4_valid),                                                                    //                .valid
		.cp_data                 (cmd_xbar_demux_001_src4_data),                                                                     //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src4_startofpacket),                                                            //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src4_endofpacket),                                                              //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src4_channel),                                                                  //                .channel
		.rf_sink_ready           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                             //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                   // clk_reset.reset
		.in_data           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                            // (terminated)
		.csr_read          (1'b0),                                                                                             // (terminated)
		.csr_write         (1'b0),                                                                                             // (terminated)
		.csr_readdata      (),                                                                                                 // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                             // (terminated)
		.almost_full_data  (),                                                                                                 // (terminated)
		.almost_empty_data (),                                                                                                 // (terminated)
		.in_empty          (1'b0),                                                                                             // (terminated)
		.out_empty         (),                                                                                                 // (terminated)
		.in_error          (1'b0),                                                                                             // (terminated)
		.out_error         (),                                                                                                 // (terminated)
		.in_channel        (1'b0),                                                                                             // (terminated)
		.out_channel       ()                                                                                                  // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) pio_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                          //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                //       clk_reset.reset
		.m0_address              (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (pio_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src5_ready),                                                 //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src5_valid),                                                 //                .valid
		.cp_data                 (cmd_xbar_demux_001_src5_data),                                                  //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src5_startofpacket),                                         //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src5_endofpacket),                                           //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src5_channel),                                               //                .channel
		.rf_sink_ready           (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (pio_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                          //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                // clk_reset.reset
		.in_data           (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (pio_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (pio_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                         // (terminated)
		.csr_read          (1'b0),                                                                          // (terminated)
		.csr_write         (1'b0),                                                                          // (terminated)
		.csr_readdata      (),                                                                              // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                          // (terminated)
		.almost_full_data  (),                                                                              // (terminated)
		.almost_empty_data (),                                                                              // (terminated)
		.in_empty          (1'b0),                                                                          // (terminated)
		.out_empty         (),                                                                              // (terminated)
		.in_error          (1'b0),                                                                          // (terminated)
		.out_error         (),                                                                              // (terminated)
		.in_channel        (1'b0),                                                                          // (terminated)
		.out_channel       ()                                                                               // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) slave_template_0_s0_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                     //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (slave_template_0_s0_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src6_ready),                                                            //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src6_valid),                                                            //                .valid
		.cp_data                 (cmd_xbar_demux_001_src6_data),                                                             //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src6_startofpacket),                                                    //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src6_endofpacket),                                                      //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src6_channel),                                                          //                .channel
		.rf_sink_ready           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (4),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                     //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                    // (terminated)
		.csr_read          (1'b0),                                                                                     // (terminated)
		.csr_write         (1'b0),                                                                                     // (terminated)
		.csr_readdata      (),                                                                                         // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                     // (terminated)
		.almost_full_data  (),                                                                                         // (terminated)
		.almost_empty_data (),                                                                                         // (terminated)
		.in_empty          (1'b0),                                                                                     // (terminated)
		.out_empty         (),                                                                                         // (terminated)
		.in_error          (1'b0),                                                                                     // (terminated)
		.out_error         (),                                                                                         // (terminated)
		.in_channel        (1'b0),                                                                                     // (terminated)
		.out_channel       ()                                                                                          // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) uart_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                         //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                               //       clk_reset.reset
		.m0_address              (uart_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (uart_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (uart_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (uart_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (uart_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (uart_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (uart_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (uart_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (uart_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (uart_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (uart_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (uart_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (uart_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (uart_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (uart_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (uart_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src7_ready),                                                //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src7_valid),                                                //                .valid
		.cp_data                 (cmd_xbar_demux_001_src7_data),                                                 //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src7_startofpacket),                                        //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src7_endofpacket),                                          //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src7_channel),                                              //                .channel
		.rf_sink_ready           (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (uart_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                         //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                               // clk_reset.reset
		.in_data           (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (uart_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (uart_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                        // (terminated)
		.csr_read          (1'b0),                                                                         // (terminated)
		.csr_write         (1'b0),                                                                         // (terminated)
		.csr_readdata      (),                                                                             // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                         // (terminated)
		.almost_full_data  (),                                                                             // (terminated)
		.almost_empty_data (),                                                                             // (terminated)
		.in_empty          (1'b0),                                                                         // (terminated)
		.out_empty         (),                                                                             // (terminated)
		.in_error          (1'b0),                                                                         // (terminated)
		.out_error         (),                                                                             // (terminated)
		.in_channel        (1'b0),                                                                         // (terminated)
		.out_channel       ()                                                                              // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                            //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                  //       clk_reset.reset
		.m0_address              (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src8_ready),                                                                   //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src8_valid),                                                                   //                .valid
		.cp_data                 (cmd_xbar_demux_001_src8_data),                                                                    //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src8_startofpacket),                                                           //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src8_endofpacket),                                                             //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src8_channel),                                                                 //                .channel
		.rf_sink_ready           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                            //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                  // clk_reset.reset
		.in_data           (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                           // (terminated)
		.csr_read          (1'b0),                                                                                            // (terminated)
		.csr_write         (1'b0),                                                                                            // (terminated)
		.csr_readdata      (),                                                                                                // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                            // (terminated)
		.almost_full_data  (),                                                                                                // (terminated)
		.almost_empty_data (),                                                                                                // (terminated)
		.in_empty          (1'b0),                                                                                            // (terminated)
		.out_empty         (),                                                                                                // (terminated)
		.in_error          (1'b0),                                                                                            // (terminated)
		.out_error         (),                                                                                                // (terminated)
		.in_channel        (1'b0),                                                                                            // (terminated)
		.out_channel       ()                                                                                                 // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) slave_template_1_s0_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                     //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (slave_template_1_s0_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src9_ready),                                                            //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src9_valid),                                                            //                .valid
		.cp_data                 (cmd_xbar_demux_001_src9_data),                                                             //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src9_startofpacket),                                                    //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src9_endofpacket),                                                      //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src9_channel),                                                          //                .channel
		.rf_sink_ready           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (4),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                     //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                    // (terminated)
		.csr_read          (1'b0),                                                                                     // (terminated)
		.csr_write         (1'b0),                                                                                     // (terminated)
		.csr_readdata      (),                                                                                         // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                     // (terminated)
		.almost_full_data  (),                                                                                         // (terminated)
		.almost_empty_data (),                                                                                         // (terminated)
		.in_empty          (1'b0),                                                                                     // (terminated)
		.out_empty         (),                                                                                         // (terminated)
		.in_error          (1'b0),                                                                                     // (terminated)
		.out_error         (),                                                                                         // (terminated)
		.in_channel        (1'b0),                                                                                     // (terminated)
		.out_channel       ()                                                                                          // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) sys_clk_timer_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                        //       clk_reset.reset
		.m0_address              (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src10_ready),                                                        //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src10_valid),                                                        //                .valid
		.cp_data                 (cmd_xbar_demux_001_src10_data),                                                         //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src10_startofpacket),                                                //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src10_endofpacket),                                                  //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src10_channel),                                                      //                .channel
		.rf_sink_ready           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                        // clk_reset.reset
		.in_data           (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                 // (terminated)
		.csr_read          (1'b0),                                                                                  // (terminated)
		.csr_write         (1'b0),                                                                                  // (terminated)
		.csr_readdata      (),                                                                                      // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                  // (terminated)
		.almost_full_data  (),                                                                                      // (terminated)
		.almost_empty_data (),                                                                                      // (terminated)
		.in_empty          (1'b0),                                                                                  // (terminated)
		.out_empty         (),                                                                                      // (terminated)
		.in_error          (1'b0),                                                                                  // (terminated)
		.out_error         (),                                                                                      // (terminated)
		.in_channel        (1'b0),                                                                                  // (terminated)
		.out_channel       ()                                                                                       // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) vic_0_csr_access_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                        //       clk_reset.reset
		.m0_address              (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (vic_0_csr_access_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_011_src_ready),                                                            //              cp.ready
		.cp_valid                (cmd_xbar_mux_011_src_valid),                                                            //                .valid
		.cp_data                 (cmd_xbar_mux_011_src_data),                                                             //                .data
		.cp_startofpacket        (cmd_xbar_mux_011_src_startofpacket),                                                    //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_011_src_endofpacket),                                                      //                .endofpacket
		.cp_channel              (cmd_xbar_mux_011_src_channel),                                                          //                .channel
		.rf_sink_ready           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (5),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                        // clk_reset.reset
		.in_data           (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                 // (terminated)
		.csr_read          (1'b0),                                                                                  // (terminated)
		.csr_write         (1'b0),                                                                                  // (terminated)
		.csr_readdata      (),                                                                                      // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                  // (terminated)
		.almost_full_data  (),                                                                                      // (terminated)
		.almost_empty_data (),                                                                                      // (terminated)
		.in_empty          (1'b0),                                                                                  // (terminated)
		.out_empty         (),                                                                                      // (terminated)
		.in_error          (1'b0),                                                                                  // (terminated)
		.out_error         (),                                                                                      // (terminated)
		.in_channel        (1'b0),                                                                                  // (terminated)
		.out_channel       ()                                                                                       // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (79),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (67),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (68),
		.PKT_TRANS_POSTED          (69),
		.PKT_TRANS_WRITE           (70),
		.PKT_TRANS_READ            (71),
		.PKT_TRANS_LOCK            (72),
		.PKT_SRC_ID_H              (83),
		.PKT_SRC_ID_L              (80),
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_BURSTWRAP_H           (78),
		.PKT_BURSTWRAP_L           (76),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_PROTECTION_H          (88),
		.PKT_PROTECTION_L          (88),
		.ST_CHANNEL_W              (13),
		.ST_DATA_W                 (89),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) timer_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (up_clock_sys_clk_clk),                                                            //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                  //       clk_reset.reset
		.m0_address              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src12_ready),                                                  //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src12_valid),                                                  //                .valid
		.cp_data                 (cmd_xbar_demux_001_src12_data),                                                   //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src12_startofpacket),                                          //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src12_endofpacket),                                            //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src12_channel),                                                //                .channel
		.rf_sink_ready           (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (90),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (up_clock_sys_clk_clk),                                                            //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                  // clk_reset.reset
		.in_data           (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                           // (terminated)
		.csr_read          (1'b0),                                                                            // (terminated)
		.csr_write         (1'b0),                                                                            // (terminated)
		.csr_readdata      (),                                                                                // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                            // (terminated)
		.almost_full_data  (),                                                                                // (terminated)
		.almost_empty_data (),                                                                                // (terminated)
		.in_empty          (1'b0),                                                                            // (terminated)
		.out_empty         (),                                                                                // (terminated)
		.in_error          (1'b0),                                                                            // (terminated)
		.out_error         (),                                                                                // (terminated)
		.in_channel        (1'b0),                                                                            // (terminated)
		.out_channel       ()                                                                                 // (terminated)
	);

	mynios2_addr_router addr_router (
		.sink_ready         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                     // clk_reset.reset
		.src_ready          (addr_router_src_ready),                                                              //       src.ready
		.src_valid          (addr_router_src_valid),                                                              //          .valid
		.src_data           (addr_router_src_data),                                                               //          .data
		.src_channel        (addr_router_src_channel),                                                            //          .channel
		.src_startofpacket  (addr_router_src_startofpacket),                                                      //          .startofpacket
		.src_endofpacket    (addr_router_src_endofpacket)                                                         //          .endofpacket
	);

	mynios2_addr_router_001 addr_router_001 (
		.sink_ready         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.src_ready          (addr_router_001_src_ready),                                                   //       src.ready
		.src_valid          (addr_router_001_src_valid),                                                   //          .valid
		.src_data           (addr_router_001_src_data),                                                    //          .data
		.src_channel        (addr_router_001_src_channel),                                                 //          .channel
		.src_startofpacket  (addr_router_001_src_startofpacket),                                           //          .startofpacket
		.src_endofpacket    (addr_router_001_src_endofpacket)                                              //          .endofpacket
	);

	mynios2_addr_router_002 addr_router_002 (
		.sink_ready         (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (vic_0_dummy_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                           //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (addr_router_002_src_ready),                                                      //       src.ready
		.src_valid          (addr_router_002_src_valid),                                                      //          .valid
		.src_data           (addr_router_002_src_data),                                                       //          .data
		.src_channel        (addr_router_002_src_channel),                                                    //          .channel
		.src_startofpacket  (addr_router_002_src_startofpacket),                                              //          .startofpacket
		.src_endofpacket    (addr_router_002_src_endofpacket)                                                 //          .endofpacket
	);

	mynios2_id_router id_router (
		.sink_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                             //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.src_ready          (id_router_src_ready),                                                              //       src.ready
		.src_valid          (id_router_src_valid),                                                              //          .valid
		.src_data           (id_router_src_data),                                                               //          .data
		.src_channel        (id_router_src_channel),                                                            //          .channel
		.src_startofpacket  (id_router_src_startofpacket),                                                      //          .startofpacket
		.src_endofpacket    (id_router_src_endofpacket)                                                         //          .endofpacket
	);

	mynios2_id_router id_router_001 (
		.sink_ready         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (onchip_memory2_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                         //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                               // clk_reset.reset
		.src_ready          (id_router_001_src_ready),                                                      //       src.ready
		.src_valid          (id_router_001_src_valid),                                                      //          .valid
		.src_data           (id_router_001_src_data),                                                       //          .data
		.src_channel        (id_router_001_src_channel),                                                    //          .channel
		.src_startofpacket  (id_router_001_src_startofpacket),                                              //          .startofpacket
		.src_endofpacket    (id_router_001_src_endofpacket)                                                 //          .endofpacket
	);

	mynios2_id_router id_router_002 (
		.sink_ready         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (epcs_flash_controller_epcs_control_port_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                                     // clk_reset.reset
		.src_ready          (id_router_002_src_ready),                                                                            //       src.ready
		.src_valid          (id_router_002_src_valid),                                                                            //          .valid
		.src_data           (id_router_002_src_data),                                                                             //          .data
		.src_channel        (id_router_002_src_channel),                                                                          //          .channel
		.src_startofpacket  (id_router_002_src_startofpacket),                                                                    //          .startofpacket
		.src_endofpacket    (id_router_002_src_endofpacket)                                                                       //          .endofpacket
	);

	mynios2_id_router_003 id_router_003 (
		.sink_ready         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (sdram_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                  //       clk.clk
		.reset              (rst_controller_002_reset_out_reset),                                    // clk_reset.reset
		.src_ready          (id_router_003_src_ready),                                               //       src.ready
		.src_valid          (id_router_003_src_valid),                                               //          .valid
		.src_data           (id_router_003_src_data),                                                //          .data
		.src_channel        (id_router_003_src_channel),                                             //          .channel
		.src_startofpacket  (id_router_003_src_startofpacket),                                       //          .startofpacket
		.src_endofpacket    (id_router_003_src_endofpacket)                                          //          .endofpacket
	);

	mynios2_id_router_004 id_router_004 (
		.sink_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                                   //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                         // clk_reset.reset
		.src_ready          (id_router_004_src_ready),                                                                //       src.ready
		.src_valid          (id_router_004_src_valid),                                                                //          .valid
		.src_data           (id_router_004_src_data),                                                                 //          .data
		.src_channel        (id_router_004_src_channel),                                                              //          .channel
		.src_startofpacket  (id_router_004_src_startofpacket),                                                        //          .startofpacket
		.src_endofpacket    (id_router_004_src_endofpacket)                                                           //          .endofpacket
	);

	mynios2_id_router_004 id_router_005 (
		.sink_ready         (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (pio_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                      // clk_reset.reset
		.src_ready          (id_router_005_src_ready),                                             //       src.ready
		.src_valid          (id_router_005_src_valid),                                             //          .valid
		.src_data           (id_router_005_src_data),                                              //          .data
		.src_channel        (id_router_005_src_channel),                                           //          .channel
		.src_startofpacket  (id_router_005_src_startofpacket),                                     //          .startofpacket
		.src_endofpacket    (id_router_005_src_endofpacket)                                        //          .endofpacket
	);

	mynios2_id_router_004 id_router_006 (
		.sink_ready         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (slave_template_0_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                           //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_006_src_ready),                                                        //       src.ready
		.src_valid          (id_router_006_src_valid),                                                        //          .valid
		.src_data           (id_router_006_src_data),                                                         //          .data
		.src_channel        (id_router_006_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_006_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_006_src_endofpacket)                                                   //          .endofpacket
	);

	mynios2_id_router_004 id_router_007 (
		.sink_ready         (uart_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (uart_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (uart_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (uart_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (uart_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                     // clk_reset.reset
		.src_ready          (id_router_007_src_ready),                                            //       src.ready
		.src_valid          (id_router_007_src_valid),                                            //          .valid
		.src_data           (id_router_007_src_data),                                             //          .data
		.src_channel        (id_router_007_src_channel),                                          //          .channel
		.src_startofpacket  (id_router_007_src_startofpacket),                                    //          .startofpacket
		.src_endofpacket    (id_router_007_src_endofpacket)                                       //          .endofpacket
	);

	mynios2_id_router_004 id_router_008 (
		.sink_ready         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (sysid_qsys_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                        // clk_reset.reset
		.src_ready          (id_router_008_src_ready),                                                               //       src.ready
		.src_valid          (id_router_008_src_valid),                                                               //          .valid
		.src_data           (id_router_008_src_data),                                                                //          .data
		.src_channel        (id_router_008_src_channel),                                                             //          .channel
		.src_startofpacket  (id_router_008_src_startofpacket),                                                       //          .startofpacket
		.src_endofpacket    (id_router_008_src_endofpacket)                                                          //          .endofpacket
	);

	mynios2_id_router_004 id_router_009 (
		.sink_ready         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (slave_template_1_s0_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                           //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_009_src_ready),                                                        //       src.ready
		.src_valid          (id_router_009_src_valid),                                                        //          .valid
		.src_data           (id_router_009_src_data),                                                         //          .data
		.src_channel        (id_router_009_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_009_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_009_src_endofpacket)                                                   //          .endofpacket
	);

	mynios2_id_router_004 id_router_010 (
		.sink_ready         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (sys_clk_timer_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.src_ready          (id_router_010_src_ready),                                                     //       src.ready
		.src_valid          (id_router_010_src_valid),                                                     //          .valid
		.src_data           (id_router_010_src_data),                                                      //          .data
		.src_channel        (id_router_010_src_channel),                                                   //          .channel
		.src_startofpacket  (id_router_010_src_startofpacket),                                             //          .startofpacket
		.src_endofpacket    (id_router_010_src_endofpacket)                                                //          .endofpacket
	);

	mynios2_id_router_011 id_router_011 (
		.sink_ready         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (vic_0_csr_access_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.src_ready          (id_router_011_src_ready),                                                     //       src.ready
		.src_valid          (id_router_011_src_valid),                                                     //          .valid
		.src_data           (id_router_011_src_data),                                                      //          .data
		.src_channel        (id_router_011_src_channel),                                                   //          .channel
		.src_startofpacket  (id_router_011_src_startofpacket),                                             //          .startofpacket
		.src_endofpacket    (id_router_011_src_endofpacket)                                                //          .endofpacket
	);

	mynios2_id_router_004 id_router_012 (
		.sink_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (up_clock_sys_clk_clk),                                                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                        // clk_reset.reset
		.src_ready          (id_router_012_src_ready),                                               //       src.ready
		.src_valid          (id_router_012_src_valid),                                               //          .valid
		.src_data           (id_router_012_src_data),                                                //          .data
		.src_channel        (id_router_012_src_channel),                                             //          .channel
		.src_startofpacket  (id_router_012_src_startofpacket),                                       //          .startofpacket
		.src_endofpacket    (id_router_012_src_endofpacket)                                          //          .endofpacket
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_TRANS_POSTED          (69),
		.MAX_OUTSTANDING_RESPONSES (13),
		.PIPELINED                 (0),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.VALID_WIDTH               (13),
		.ENFORCE_ORDER             (1),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter (
		.clk                    (up_clock_sys_clk_clk),           //       clk.clk
		.reset                  (rst_controller_reset_out_reset), // clk_reset.reset
		.cmd_sink_ready         (addr_router_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_src_data),           //          .data
		.cmd_sink_channel       (addr_router_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_cmd_valid_data)          // cmd_valid.data
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_TRANS_POSTED          (69),
		.MAX_OUTSTANDING_RESPONSES (13),
		.PIPELINED                 (0),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.VALID_WIDTH               (13),
		.ENFORCE_ORDER             (1),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter_001 (
		.clk                    (up_clock_sys_clk_clk),               //       clk.clk
		.reset                  (rst_controller_reset_out_reset),     // clk_reset.reset
		.cmd_sink_ready         (addr_router_001_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_001_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_001_src_data),           //          .data
		.cmd_sink_channel       (addr_router_001_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_001_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_001_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_001_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_001_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_001_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_001_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_001_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_001_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_001_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_001_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_001_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_001_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_001_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_001_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_001_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_001_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_001_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_001_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_001_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_001_cmd_valid_data)          // cmd_valid.data
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (87),
		.PKT_DEST_ID_L             (84),
		.PKT_TRANS_POSTED          (69),
		.MAX_OUTSTANDING_RESPONSES (8),
		.PIPELINED                 (0),
		.ST_DATA_W                 (89),
		.ST_CHANNEL_W              (13),
		.VALID_WIDTH               (13),
		.ENFORCE_ORDER             (0),
		.PKT_BYTE_CNT_H            (75),
		.PKT_BYTE_CNT_L            (73),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter_002 (
		.clk                    (up_clock_sys_clk_clk),                  //       clk.clk
		.reset                  (rst_controller_reset_out_reset),        // clk_reset.reset
		.cmd_sink_ready         (addr_router_002_src_ready),             //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_002_src_valid),             //          .valid
		.cmd_sink_data          (addr_router_002_src_data),              //          .data
		.cmd_sink_channel       (addr_router_002_src_channel),           //          .channel
		.cmd_sink_startofpacket (addr_router_002_src_startofpacket),     //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_002_src_endofpacket),       //          .endofpacket
		.cmd_src_ready          (limiter_002_cmd_src_ready),             //   cmd_src.ready
		.cmd_src_data           (limiter_002_cmd_src_data),              //          .data
		.cmd_src_channel        (limiter_002_cmd_src_channel),           //          .channel
		.cmd_src_startofpacket  (limiter_002_cmd_src_startofpacket),     //          .startofpacket
		.cmd_src_endofpacket    (limiter_002_cmd_src_endofpacket),       //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_demux_011_src1_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_demux_011_src1_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_demux_011_src1_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_demux_011_src1_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_demux_011_src1_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_demux_011_src1_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_002_rsp_src_ready),             //   rsp_src.ready
		.rsp_src_valid          (limiter_002_rsp_src_valid),             //          .valid
		.rsp_src_data           (limiter_002_rsp_src_data),              //          .data
		.rsp_src_channel        (limiter_002_rsp_src_channel),           //          .channel
		.rsp_src_startofpacket  (limiter_002_rsp_src_startofpacket),     //          .startofpacket
		.rsp_src_endofpacket    (limiter_002_rsp_src_endofpacket),       //          .endofpacket
		.cmd_src_valid          (limiter_002_cmd_valid_data)             // cmd_valid.data
	);

	altera_merlin_burst_adapter #(
		.PKT_ADDR_H                (49),
		.PKT_ADDR_L                (18),
		.PKT_BEGIN_BURST           (61),
		.PKT_BYTE_CNT_H            (57),
		.PKT_BYTE_CNT_L            (55),
		.PKT_BYTEEN_H              (17),
		.PKT_BYTEEN_L              (16),
		.PKT_BURSTWRAP_H           (60),
		.PKT_BURSTWRAP_L           (58),
		.PKT_TRANS_COMPRESSED_READ (50),
		.PKT_TRANS_WRITE           (52),
		.PKT_TRANS_READ            (53),
		.ST_DATA_W                 (71),
		.ST_CHANNEL_W              (13),
		.OUT_BYTE_CNT_H            (56),
		.OUT_BURSTWRAP_H           (60),
		.COMPRESSED_READ_SUPPORT   (0),
		.BURSTWRAP_CONST_MASK      (3),
		.BURSTWRAP_CONST_VALUE     (3)
	) burst_adapter (
		.clk                   (up_clock_sys_clk_clk),                //       cr0.clk
		.reset                 (rst_controller_002_reset_out_reset),  // cr0_reset.reset
		.sink0_valid           (width_adapter_src_valid),             //     sink0.valid
		.sink0_data            (width_adapter_src_data),              //          .data
		.sink0_channel         (width_adapter_src_channel),           //          .channel
		.sink0_startofpacket   (width_adapter_src_startofpacket),     //          .startofpacket
		.sink0_endofpacket     (width_adapter_src_endofpacket),       //          .endofpacket
		.sink0_ready           (width_adapter_src_ready),             //          .ready
		.source0_valid         (burst_adapter_source0_valid),         //   source0.valid
		.source0_data          (burst_adapter_source0_data),          //          .data
		.source0_channel       (burst_adapter_source0_channel),       //          .channel
		.source0_startofpacket (burst_adapter_source0_startofpacket), //          .startofpacket
		.source0_endofpacket   (burst_adapter_source0_endofpacket),   //          .endofpacket
		.source0_ready         (burst_adapter_source0_ready)          //          .ready
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (2),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller (
		.reset_in0  (cpu_jtag_debug_module_reset_reset), // reset_in0.reset
		.reset_in1  (~up_clock_sys_clk_reset_reset),     // reset_in1.reset
		.clk        (up_clock_sys_clk_clk),              //       clk.clk
		.reset_out  (rst_controller_reset_out_reset),    // reset_out.reset
		.reset_in2  (1'b0),                              // (terminated)
		.reset_in3  (1'b0),                              // (terminated)
		.reset_in4  (1'b0),                              // (terminated)
		.reset_in5  (1'b0),                              // (terminated)
		.reset_in6  (1'b0),                              // (terminated)
		.reset_in7  (1'b0),                              // (terminated)
		.reset_in8  (1'b0),                              // (terminated)
		.reset_in9  (1'b0),                              // (terminated)
		.reset_in10 (1'b0),                              // (terminated)
		.reset_in11 (1'b0),                              // (terminated)
		.reset_in12 (1'b0),                              // (terminated)
		.reset_in13 (1'b0),                              // (terminated)
		.reset_in14 (1'b0),                              // (terminated)
		.reset_in15 (1'b0)                               // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (3),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller_001 (
		.reset_in0  (~reset_reset_n),                     // reset_in0.reset
		.reset_in1  (cpu_jtag_debug_module_reset_reset),  // reset_in1.reset
		.reset_in2  (~up_clock_sys_clk_reset_reset),      // reset_in2.reset
		.clk        (clk_clk),                            //       clk.clk
		.reset_out  (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_in3  (1'b0),                               // (terminated)
		.reset_in4  (1'b0),                               // (terminated)
		.reset_in5  (1'b0),                               // (terminated)
		.reset_in6  (1'b0),                               // (terminated)
		.reset_in7  (1'b0),                               // (terminated)
		.reset_in8  (1'b0),                               // (terminated)
		.reset_in9  (1'b0),                               // (terminated)
		.reset_in10 (1'b0),                               // (terminated)
		.reset_in11 (1'b0),                               // (terminated)
		.reset_in12 (1'b0),                               // (terminated)
		.reset_in13 (1'b0),                               // (terminated)
		.reset_in14 (1'b0),                               // (terminated)
		.reset_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (2),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller_002 (
		.reset_in0  (cpu_jtag_debug_module_reset_reset),  // reset_in0.reset
		.reset_in1  (~reset_reset_n),                     // reset_in1.reset
		.clk        (up_clock_sys_clk_clk),               //       clk.clk
		.reset_out  (rst_controller_002_reset_out_reset), // reset_out.reset
		.reset_in2  (1'b0),                               // (terminated)
		.reset_in3  (1'b0),                               // (terminated)
		.reset_in4  (1'b0),                               // (terminated)
		.reset_in5  (1'b0),                               // (terminated)
		.reset_in6  (1'b0),                               // (terminated)
		.reset_in7  (1'b0),                               // (terminated)
		.reset_in8  (1'b0),                               // (terminated)
		.reset_in9  (1'b0),                               // (terminated)
		.reset_in10 (1'b0),                               // (terminated)
		.reset_in11 (1'b0),                               // (terminated)
		.reset_in12 (1'b0),                               // (terminated)
		.reset_in13 (1'b0),                               // (terminated)
		.reset_in14 (1'b0),                               // (terminated)
		.reset_in15 (1'b0)                                // (terminated)
	);

	mynios2_cmd_xbar_demux cmd_xbar_demux (
		.clk                (up_clock_sys_clk_clk),              //        clk.clk
		.reset              (rst_controller_reset_out_reset),    //  clk_reset.reset
		.sink_ready         (limiter_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_cmd_src_channel),           //           .channel
		.sink_data          (limiter_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_src0_endofpacket),   //           .endofpacket
		.src1_ready         (cmd_xbar_demux_src1_ready),         //       src1.ready
		.src1_valid         (cmd_xbar_demux_src1_valid),         //           .valid
		.src1_data          (cmd_xbar_demux_src1_data),          //           .data
		.src1_channel       (cmd_xbar_demux_src1_channel),       //           .channel
		.src1_startofpacket (cmd_xbar_demux_src1_startofpacket), //           .startofpacket
		.src1_endofpacket   (cmd_xbar_demux_src1_endofpacket),   //           .endofpacket
		.src2_ready         (cmd_xbar_demux_src2_ready),         //       src2.ready
		.src2_valid         (cmd_xbar_demux_src2_valid),         //           .valid
		.src2_data          (cmd_xbar_demux_src2_data),          //           .data
		.src2_channel       (cmd_xbar_demux_src2_channel),       //           .channel
		.src2_startofpacket (cmd_xbar_demux_src2_startofpacket), //           .startofpacket
		.src2_endofpacket   (cmd_xbar_demux_src2_endofpacket),   //           .endofpacket
		.src3_ready         (cmd_xbar_demux_src3_ready),         //       src3.ready
		.src3_valid         (cmd_xbar_demux_src3_valid),         //           .valid
		.src3_data          (cmd_xbar_demux_src3_data),          //           .data
		.src3_channel       (cmd_xbar_demux_src3_channel),       //           .channel
		.src3_startofpacket (cmd_xbar_demux_src3_startofpacket), //           .startofpacket
		.src3_endofpacket   (cmd_xbar_demux_src3_endofpacket)    //           .endofpacket
	);

	mynios2_cmd_xbar_demux_001 cmd_xbar_demux_001 (
		.clk                 (up_clock_sys_clk_clk),                   //        clk.clk
		.reset               (rst_controller_reset_out_reset),         //  clk_reset.reset
		.sink_ready          (limiter_001_cmd_src_ready),              //       sink.ready
		.sink_channel        (limiter_001_cmd_src_channel),            //           .channel
		.sink_data           (limiter_001_cmd_src_data),               //           .data
		.sink_startofpacket  (limiter_001_cmd_src_startofpacket),      //           .startofpacket
		.sink_endofpacket    (limiter_001_cmd_src_endofpacket),        //           .endofpacket
		.sink_valid          (limiter_001_cmd_valid_data),             // sink_valid.data
		.src0_ready          (cmd_xbar_demux_001_src0_ready),          //       src0.ready
		.src0_valid          (cmd_xbar_demux_001_src0_valid),          //           .valid
		.src0_data           (cmd_xbar_demux_001_src0_data),           //           .data
		.src0_channel        (cmd_xbar_demux_001_src0_channel),        //           .channel
		.src0_startofpacket  (cmd_xbar_demux_001_src0_startofpacket),  //           .startofpacket
		.src0_endofpacket    (cmd_xbar_demux_001_src0_endofpacket),    //           .endofpacket
		.src1_ready          (cmd_xbar_demux_001_src1_ready),          //       src1.ready
		.src1_valid          (cmd_xbar_demux_001_src1_valid),          //           .valid
		.src1_data           (cmd_xbar_demux_001_src1_data),           //           .data
		.src1_channel        (cmd_xbar_demux_001_src1_channel),        //           .channel
		.src1_startofpacket  (cmd_xbar_demux_001_src1_startofpacket),  //           .startofpacket
		.src1_endofpacket    (cmd_xbar_demux_001_src1_endofpacket),    //           .endofpacket
		.src2_ready          (cmd_xbar_demux_001_src2_ready),          //       src2.ready
		.src2_valid          (cmd_xbar_demux_001_src2_valid),          //           .valid
		.src2_data           (cmd_xbar_demux_001_src2_data),           //           .data
		.src2_channel        (cmd_xbar_demux_001_src2_channel),        //           .channel
		.src2_startofpacket  (cmd_xbar_demux_001_src2_startofpacket),  //           .startofpacket
		.src2_endofpacket    (cmd_xbar_demux_001_src2_endofpacket),    //           .endofpacket
		.src3_ready          (cmd_xbar_demux_001_src3_ready),          //       src3.ready
		.src3_valid          (cmd_xbar_demux_001_src3_valid),          //           .valid
		.src3_data           (cmd_xbar_demux_001_src3_data),           //           .data
		.src3_channel        (cmd_xbar_demux_001_src3_channel),        //           .channel
		.src3_startofpacket  (cmd_xbar_demux_001_src3_startofpacket),  //           .startofpacket
		.src3_endofpacket    (cmd_xbar_demux_001_src3_endofpacket),    //           .endofpacket
		.src4_ready          (cmd_xbar_demux_001_src4_ready),          //       src4.ready
		.src4_valid          (cmd_xbar_demux_001_src4_valid),          //           .valid
		.src4_data           (cmd_xbar_demux_001_src4_data),           //           .data
		.src4_channel        (cmd_xbar_demux_001_src4_channel),        //           .channel
		.src4_startofpacket  (cmd_xbar_demux_001_src4_startofpacket),  //           .startofpacket
		.src4_endofpacket    (cmd_xbar_demux_001_src4_endofpacket),    //           .endofpacket
		.src5_ready          (cmd_xbar_demux_001_src5_ready),          //       src5.ready
		.src5_valid          (cmd_xbar_demux_001_src5_valid),          //           .valid
		.src5_data           (cmd_xbar_demux_001_src5_data),           //           .data
		.src5_channel        (cmd_xbar_demux_001_src5_channel),        //           .channel
		.src5_startofpacket  (cmd_xbar_demux_001_src5_startofpacket),  //           .startofpacket
		.src5_endofpacket    (cmd_xbar_demux_001_src5_endofpacket),    //           .endofpacket
		.src6_ready          (cmd_xbar_demux_001_src6_ready),          //       src6.ready
		.src6_valid          (cmd_xbar_demux_001_src6_valid),          //           .valid
		.src6_data           (cmd_xbar_demux_001_src6_data),           //           .data
		.src6_channel        (cmd_xbar_demux_001_src6_channel),        //           .channel
		.src6_startofpacket  (cmd_xbar_demux_001_src6_startofpacket),  //           .startofpacket
		.src6_endofpacket    (cmd_xbar_demux_001_src6_endofpacket),    //           .endofpacket
		.src7_ready          (cmd_xbar_demux_001_src7_ready),          //       src7.ready
		.src7_valid          (cmd_xbar_demux_001_src7_valid),          //           .valid
		.src7_data           (cmd_xbar_demux_001_src7_data),           //           .data
		.src7_channel        (cmd_xbar_demux_001_src7_channel),        //           .channel
		.src7_startofpacket  (cmd_xbar_demux_001_src7_startofpacket),  //           .startofpacket
		.src7_endofpacket    (cmd_xbar_demux_001_src7_endofpacket),    //           .endofpacket
		.src8_ready          (cmd_xbar_demux_001_src8_ready),          //       src8.ready
		.src8_valid          (cmd_xbar_demux_001_src8_valid),          //           .valid
		.src8_data           (cmd_xbar_demux_001_src8_data),           //           .data
		.src8_channel        (cmd_xbar_demux_001_src8_channel),        //           .channel
		.src8_startofpacket  (cmd_xbar_demux_001_src8_startofpacket),  //           .startofpacket
		.src8_endofpacket    (cmd_xbar_demux_001_src8_endofpacket),    //           .endofpacket
		.src9_ready          (cmd_xbar_demux_001_src9_ready),          //       src9.ready
		.src9_valid          (cmd_xbar_demux_001_src9_valid),          //           .valid
		.src9_data           (cmd_xbar_demux_001_src9_data),           //           .data
		.src9_channel        (cmd_xbar_demux_001_src9_channel),        //           .channel
		.src9_startofpacket  (cmd_xbar_demux_001_src9_startofpacket),  //           .startofpacket
		.src9_endofpacket    (cmd_xbar_demux_001_src9_endofpacket),    //           .endofpacket
		.src10_ready         (cmd_xbar_demux_001_src10_ready),         //      src10.ready
		.src10_valid         (cmd_xbar_demux_001_src10_valid),         //           .valid
		.src10_data          (cmd_xbar_demux_001_src10_data),          //           .data
		.src10_channel       (cmd_xbar_demux_001_src10_channel),       //           .channel
		.src10_startofpacket (cmd_xbar_demux_001_src10_startofpacket), //           .startofpacket
		.src10_endofpacket   (cmd_xbar_demux_001_src10_endofpacket),   //           .endofpacket
		.src11_ready         (cmd_xbar_demux_001_src11_ready),         //      src11.ready
		.src11_valid         (cmd_xbar_demux_001_src11_valid),         //           .valid
		.src11_data          (cmd_xbar_demux_001_src11_data),          //           .data
		.src11_channel       (cmd_xbar_demux_001_src11_channel),       //           .channel
		.src11_startofpacket (cmd_xbar_demux_001_src11_startofpacket), //           .startofpacket
		.src11_endofpacket   (cmd_xbar_demux_001_src11_endofpacket),   //           .endofpacket
		.src12_ready         (cmd_xbar_demux_001_src12_ready),         //      src12.ready
		.src12_valid         (cmd_xbar_demux_001_src12_valid),         //           .valid
		.src12_data          (cmd_xbar_demux_001_src12_data),          //           .data
		.src12_channel       (cmd_xbar_demux_001_src12_channel),       //           .channel
		.src12_startofpacket (cmd_xbar_demux_001_src12_startofpacket), //           .startofpacket
		.src12_endofpacket   (cmd_xbar_demux_001_src12_endofpacket)    //           .endofpacket
	);

	mynios2_cmd_xbar_demux_002 cmd_xbar_demux_002 (
		.clk                (up_clock_sys_clk_clk),                  //        clk.clk
		.reset              (rst_controller_reset_out_reset),        //  clk_reset.reset
		.sink_ready         (limiter_002_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_002_cmd_src_channel),           //           .channel
		.sink_data          (limiter_002_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_002_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_002_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_002_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_002_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_002_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_002_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_002_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_002_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_002_src0_endofpacket)    //           .endofpacket
	);

	mynios2_cmd_xbar_mux cmd_xbar_mux (
		.clk                 (up_clock_sys_clk_clk),                  //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_src_ready),                //       src.ready
		.src_valid           (cmd_xbar_mux_src_valid),                //          .valid
		.src_data            (cmd_xbar_mux_src_data),                 //          .data
		.src_channel         (cmd_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (cmd_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src0_endofpacket)    //          .endofpacket
	);

	mynios2_cmd_xbar_mux cmd_xbar_mux_001 (
		.clk                 (up_clock_sys_clk_clk),                  //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_001_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_001_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_001_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src1_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src1_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	mynios2_cmd_xbar_mux cmd_xbar_mux_002 (
		.clk                 (up_clock_sys_clk_clk),                  //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_002_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_002_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_002_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_002_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_002_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_002_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src2_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src2_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src2_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src2_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src2_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src2_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src2_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src2_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src2_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src2_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src2_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src2_endofpacket)    //          .endofpacket
	);

	mynios2_cmd_xbar_mux cmd_xbar_mux_003 (
		.clk                 (up_clock_sys_clk_clk),                  //       clk.clk
		.reset               (rst_controller_002_reset_out_reset),    // clk_reset.reset
		.src_ready           (cmd_xbar_mux_003_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_003_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_003_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_003_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_003_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_003_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src3_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src3_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src3_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src3_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src3_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src3_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src3_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src3_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src3_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src3_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src3_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src3_endofpacket)    //          .endofpacket
	);

	mynios2_cmd_xbar_mux cmd_xbar_mux_011 (
		.clk                 (up_clock_sys_clk_clk),                   //       clk.clk
		.reset               (rst_controller_reset_out_reset),         // clk_reset.reset
		.src_ready           (cmd_xbar_mux_011_src_ready),             //       src.ready
		.src_valid           (cmd_xbar_mux_011_src_valid),             //          .valid
		.src_data            (cmd_xbar_mux_011_src_data),              //          .data
		.src_channel         (cmd_xbar_mux_011_src_channel),           //          .channel
		.src_startofpacket   (cmd_xbar_mux_011_src_startofpacket),     //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_011_src_endofpacket),       //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_001_src11_ready),         //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_001_src11_valid),         //          .valid
		.sink0_channel       (cmd_xbar_demux_001_src11_channel),       //          .channel
		.sink0_data          (cmd_xbar_demux_001_src11_data),          //          .data
		.sink0_startofpacket (cmd_xbar_demux_001_src11_startofpacket), //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_001_src11_endofpacket),   //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_002_src0_ready),          //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_002_src0_valid),          //          .valid
		.sink1_channel       (cmd_xbar_demux_002_src0_channel),        //          .channel
		.sink1_data          (cmd_xbar_demux_002_src0_data),           //          .data
		.sink1_startofpacket (cmd_xbar_demux_002_src0_startofpacket),  //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_002_src0_endofpacket)     //          .endofpacket
	);

	mynios2_rsp_xbar_demux rsp_xbar_demux (
		.clk                (up_clock_sys_clk_clk),              //       clk.clk
		.reset              (rst_controller_reset_out_reset),    // clk_reset.reset
		.sink_ready         (id_router_src_ready),               //      sink.ready
		.sink_channel       (id_router_src_channel),             //          .channel
		.sink_data          (id_router_src_data),                //          .data
		.sink_startofpacket (id_router_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_src1_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux rsp_xbar_demux_001 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_001_src_ready),               //      sink.ready
		.sink_channel       (id_router_001_src_channel),             //          .channel
		.sink_data          (id_router_001_src_data),                //          .data
		.sink_startofpacket (id_router_001_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_001_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_001_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_001_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_001_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_001_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_001_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_001_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_001_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux rsp_xbar_demux_002 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_002_src_ready),               //      sink.ready
		.sink_channel       (id_router_002_src_channel),             //          .channel
		.sink_data          (id_router_002_src_data),                //          .data
		.sink_startofpacket (id_router_002_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_002_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_002_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_002_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_002_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_002_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_002_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_002_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_002_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_002_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_002_src1_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux rsp_xbar_demux_003 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_002_reset_out_reset),    // clk_reset.reset
		.sink_ready         (width_adapter_001_src_ready),           //      sink.ready
		.sink_channel       (width_adapter_001_src_channel),         //          .channel
		.sink_data          (width_adapter_001_src_data),            //          .data
		.sink_startofpacket (width_adapter_001_src_startofpacket),   //          .startofpacket
		.sink_endofpacket   (width_adapter_001_src_endofpacket),     //          .endofpacket
		.sink_valid         (width_adapter_001_src_valid),           //          .valid
		.src0_ready         (rsp_xbar_demux_003_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_003_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_003_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_003_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_003_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_003_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_003_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_003_src1_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_004 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_004_src_ready),               //      sink.ready
		.sink_channel       (id_router_004_src_channel),             //          .channel
		.sink_data          (id_router_004_src_data),                //          .data
		.sink_startofpacket (id_router_004_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_004_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_004_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_004_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_004_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_004_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_004_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_004_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_004_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_005 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_005_src_ready),               //      sink.ready
		.sink_channel       (id_router_005_src_channel),             //          .channel
		.sink_data          (id_router_005_src_data),                //          .data
		.sink_startofpacket (id_router_005_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_005_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_005_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_005_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_005_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_005_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_005_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_005_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_005_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_006 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_006_src_ready),               //      sink.ready
		.sink_channel       (id_router_006_src_channel),             //          .channel
		.sink_data          (id_router_006_src_data),                //          .data
		.sink_startofpacket (id_router_006_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_006_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_006_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_006_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_006_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_006_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_006_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_006_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_006_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_007 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_007_src_ready),               //      sink.ready
		.sink_channel       (id_router_007_src_channel),             //          .channel
		.sink_data          (id_router_007_src_data),                //          .data
		.sink_startofpacket (id_router_007_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_007_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_007_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_007_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_007_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_007_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_007_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_007_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_007_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_008 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_008_src_ready),               //      sink.ready
		.sink_channel       (id_router_008_src_channel),             //          .channel
		.sink_data          (id_router_008_src_data),                //          .data
		.sink_startofpacket (id_router_008_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_008_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_008_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_008_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_008_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_008_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_008_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_008_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_008_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_009 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_009_src_ready),               //      sink.ready
		.sink_channel       (id_router_009_src_channel),             //          .channel
		.sink_data          (id_router_009_src_data),                //          .data
		.sink_startofpacket (id_router_009_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_009_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_009_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_009_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_009_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_009_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_009_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_009_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_009_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_010 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_010_src_ready),               //      sink.ready
		.sink_channel       (id_router_010_src_channel),             //          .channel
		.sink_data          (id_router_010_src_data),                //          .data
		.sink_startofpacket (id_router_010_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_010_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_010_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_010_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_010_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_010_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_010_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_010_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_010_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux rsp_xbar_demux_011 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_011_src_ready),               //      sink.ready
		.sink_channel       (id_router_011_src_channel),             //          .channel
		.sink_data          (id_router_011_src_data),                //          .data
		.sink_startofpacket (id_router_011_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_011_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_011_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_011_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_011_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_011_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_011_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_011_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_011_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_011_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_011_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_011_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_011_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_011_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_011_src1_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_demux_004 rsp_xbar_demux_012 (
		.clk                (up_clock_sys_clk_clk),                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_012_src_ready),               //      sink.ready
		.sink_channel       (id_router_012_src_channel),             //          .channel
		.sink_data          (id_router_012_src_data),                //          .data
		.sink_startofpacket (id_router_012_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_012_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_012_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_012_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_012_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_012_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_012_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_012_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_012_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_mux rsp_xbar_mux (
		.clk                 (up_clock_sys_clk_clk),                  //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (rsp_xbar_mux_src_ready),                //       src.ready
		.src_valid           (rsp_xbar_mux_src_valid),                //          .valid
		.src_data            (rsp_xbar_mux_src_data),                 //          .data
		.src_channel         (rsp_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (rsp_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (rsp_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (rsp_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (rsp_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (rsp_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (rsp_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (rsp_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (rsp_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (rsp_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (rsp_xbar_demux_001_src0_endofpacket),   //          .endofpacket
		.sink2_ready         (rsp_xbar_demux_002_src0_ready),         //     sink2.ready
		.sink2_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.sink2_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.sink2_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.sink2_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.sink2_endofpacket   (rsp_xbar_demux_002_src0_endofpacket),   //          .endofpacket
		.sink3_ready         (rsp_xbar_demux_003_src0_ready),         //     sink3.ready
		.sink3_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.sink3_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.sink3_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.sink3_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.sink3_endofpacket   (rsp_xbar_demux_003_src0_endofpacket)    //          .endofpacket
	);

	mynios2_rsp_xbar_mux_001 rsp_xbar_mux_001 (
		.clk                  (up_clock_sys_clk_clk),                  //       clk.clk
		.reset                (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready            (rsp_xbar_mux_001_src_ready),            //       src.ready
		.src_valid            (rsp_xbar_mux_001_src_valid),            //          .valid
		.src_data             (rsp_xbar_mux_001_src_data),             //          .data
		.src_channel          (rsp_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket    (rsp_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket      (rsp_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready          (rsp_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid          (rsp_xbar_demux_src1_valid),             //          .valid
		.sink0_channel        (rsp_xbar_demux_src1_channel),           //          .channel
		.sink0_data           (rsp_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket  (rsp_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket    (rsp_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready          (rsp_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid          (rsp_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel        (rsp_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data           (rsp_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket  (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket    (rsp_xbar_demux_001_src1_endofpacket),   //          .endofpacket
		.sink2_ready          (rsp_xbar_demux_002_src1_ready),         //     sink2.ready
		.sink2_valid          (rsp_xbar_demux_002_src1_valid),         //          .valid
		.sink2_channel        (rsp_xbar_demux_002_src1_channel),       //          .channel
		.sink2_data           (rsp_xbar_demux_002_src1_data),          //          .data
		.sink2_startofpacket  (rsp_xbar_demux_002_src1_startofpacket), //          .startofpacket
		.sink2_endofpacket    (rsp_xbar_demux_002_src1_endofpacket),   //          .endofpacket
		.sink3_ready          (rsp_xbar_demux_003_src1_ready),         //     sink3.ready
		.sink3_valid          (rsp_xbar_demux_003_src1_valid),         //          .valid
		.sink3_channel        (rsp_xbar_demux_003_src1_channel),       //          .channel
		.sink3_data           (rsp_xbar_demux_003_src1_data),          //          .data
		.sink3_startofpacket  (rsp_xbar_demux_003_src1_startofpacket), //          .startofpacket
		.sink3_endofpacket    (rsp_xbar_demux_003_src1_endofpacket),   //          .endofpacket
		.sink4_ready          (rsp_xbar_demux_004_src0_ready),         //     sink4.ready
		.sink4_valid          (rsp_xbar_demux_004_src0_valid),         //          .valid
		.sink4_channel        (rsp_xbar_demux_004_src0_channel),       //          .channel
		.sink4_data           (rsp_xbar_demux_004_src0_data),          //          .data
		.sink4_startofpacket  (rsp_xbar_demux_004_src0_startofpacket), //          .startofpacket
		.sink4_endofpacket    (rsp_xbar_demux_004_src0_endofpacket),   //          .endofpacket
		.sink5_ready          (rsp_xbar_demux_005_src0_ready),         //     sink5.ready
		.sink5_valid          (rsp_xbar_demux_005_src0_valid),         //          .valid
		.sink5_channel        (rsp_xbar_demux_005_src0_channel),       //          .channel
		.sink5_data           (rsp_xbar_demux_005_src0_data),          //          .data
		.sink5_startofpacket  (rsp_xbar_demux_005_src0_startofpacket), //          .startofpacket
		.sink5_endofpacket    (rsp_xbar_demux_005_src0_endofpacket),   //          .endofpacket
		.sink6_ready          (rsp_xbar_demux_006_src0_ready),         //     sink6.ready
		.sink6_valid          (rsp_xbar_demux_006_src0_valid),         //          .valid
		.sink6_channel        (rsp_xbar_demux_006_src0_channel),       //          .channel
		.sink6_data           (rsp_xbar_demux_006_src0_data),          //          .data
		.sink6_startofpacket  (rsp_xbar_demux_006_src0_startofpacket), //          .startofpacket
		.sink6_endofpacket    (rsp_xbar_demux_006_src0_endofpacket),   //          .endofpacket
		.sink7_ready          (rsp_xbar_demux_007_src0_ready),         //     sink7.ready
		.sink7_valid          (rsp_xbar_demux_007_src0_valid),         //          .valid
		.sink7_channel        (rsp_xbar_demux_007_src0_channel),       //          .channel
		.sink7_data           (rsp_xbar_demux_007_src0_data),          //          .data
		.sink7_startofpacket  (rsp_xbar_demux_007_src0_startofpacket), //          .startofpacket
		.sink7_endofpacket    (rsp_xbar_demux_007_src0_endofpacket),   //          .endofpacket
		.sink8_ready          (rsp_xbar_demux_008_src0_ready),         //     sink8.ready
		.sink8_valid          (rsp_xbar_demux_008_src0_valid),         //          .valid
		.sink8_channel        (rsp_xbar_demux_008_src0_channel),       //          .channel
		.sink8_data           (rsp_xbar_demux_008_src0_data),          //          .data
		.sink8_startofpacket  (rsp_xbar_demux_008_src0_startofpacket), //          .startofpacket
		.sink8_endofpacket    (rsp_xbar_demux_008_src0_endofpacket),   //          .endofpacket
		.sink9_ready          (rsp_xbar_demux_009_src0_ready),         //     sink9.ready
		.sink9_valid          (rsp_xbar_demux_009_src0_valid),         //          .valid
		.sink9_channel        (rsp_xbar_demux_009_src0_channel),       //          .channel
		.sink9_data           (rsp_xbar_demux_009_src0_data),          //          .data
		.sink9_startofpacket  (rsp_xbar_demux_009_src0_startofpacket), //          .startofpacket
		.sink9_endofpacket    (rsp_xbar_demux_009_src0_endofpacket),   //          .endofpacket
		.sink10_ready         (rsp_xbar_demux_010_src0_ready),         //    sink10.ready
		.sink10_valid         (rsp_xbar_demux_010_src0_valid),         //          .valid
		.sink10_channel       (rsp_xbar_demux_010_src0_channel),       //          .channel
		.sink10_data          (rsp_xbar_demux_010_src0_data),          //          .data
		.sink10_startofpacket (rsp_xbar_demux_010_src0_startofpacket), //          .startofpacket
		.sink10_endofpacket   (rsp_xbar_demux_010_src0_endofpacket),   //          .endofpacket
		.sink11_ready         (rsp_xbar_demux_011_src0_ready),         //    sink11.ready
		.sink11_valid         (rsp_xbar_demux_011_src0_valid),         //          .valid
		.sink11_channel       (rsp_xbar_demux_011_src0_channel),       //          .channel
		.sink11_data          (rsp_xbar_demux_011_src0_data),          //          .data
		.sink11_startofpacket (rsp_xbar_demux_011_src0_startofpacket), //          .startofpacket
		.sink11_endofpacket   (rsp_xbar_demux_011_src0_endofpacket),   //          .endofpacket
		.sink12_ready         (rsp_xbar_demux_012_src0_ready),         //    sink12.ready
		.sink12_valid         (rsp_xbar_demux_012_src0_valid),         //          .valid
		.sink12_channel       (rsp_xbar_demux_012_src0_channel),       //          .channel
		.sink12_data          (rsp_xbar_demux_012_src0_data),          //          .data
		.sink12_startofpacket (rsp_xbar_demux_012_src0_startofpacket), //          .startofpacket
		.sink12_endofpacket   (rsp_xbar_demux_012_src0_endofpacket)    //          .endofpacket
	);

	altera_merlin_width_adapter #(
		.IN_PKT_ADDR_H                 (67),
		.IN_PKT_ADDR_L                 (36),
		.IN_PKT_DATA_H                 (31),
		.IN_PKT_DATA_L                 (0),
		.IN_PKT_BYTEEN_H               (35),
		.IN_PKT_BYTEEN_L               (32),
		.IN_PKT_BYTE_CNT_H             (75),
		.IN_PKT_BYTE_CNT_L             (73),
		.IN_PKT_TRANS_COMPRESSED_READ  (68),
		.IN_PKT_BURSTWRAP_H            (78),
		.IN_PKT_BURSTWRAP_L            (76),
		.IN_ST_DATA_W                  (89),
		.OUT_PKT_ADDR_H                (49),
		.OUT_PKT_ADDR_L                (18),
		.OUT_PKT_DATA_H                (15),
		.OUT_PKT_DATA_L                (0),
		.OUT_PKT_BYTEEN_H              (17),
		.OUT_PKT_BYTEEN_L              (16),
		.OUT_PKT_BYTE_CNT_H            (57),
		.OUT_PKT_BYTE_CNT_L            (55),
		.OUT_PKT_TRANS_COMPRESSED_READ (50),
		.OUT_ST_DATA_W                 (71),
		.ST_CHANNEL_W                  (13),
		.OPTIMIZE_FOR_RSP              (0)
	) width_adapter (
		.clk               (up_clock_sys_clk_clk),               //       clk.clk
		.reset             (rst_controller_002_reset_out_reset), // clk_reset.reset
		.in_valid          (cmd_xbar_mux_003_src_valid),         //      sink.valid
		.in_channel        (cmd_xbar_mux_003_src_channel),       //          .channel
		.in_startofpacket  (cmd_xbar_mux_003_src_startofpacket), //          .startofpacket
		.in_endofpacket    (cmd_xbar_mux_003_src_endofpacket),   //          .endofpacket
		.in_ready          (cmd_xbar_mux_003_src_ready),         //          .ready
		.in_data           (cmd_xbar_mux_003_src_data),          //          .data
		.out_endofpacket   (width_adapter_src_endofpacket),      //       src.endofpacket
		.out_data          (width_adapter_src_data),             //          .data
		.out_channel       (width_adapter_src_channel),          //          .channel
		.out_valid         (width_adapter_src_valid),            //          .valid
		.out_ready         (width_adapter_src_ready),            //          .ready
		.out_startofpacket (width_adapter_src_startofpacket)     //          .startofpacket
	);

	altera_merlin_width_adapter #(
		.IN_PKT_ADDR_H                 (49),
		.IN_PKT_ADDR_L                 (18),
		.IN_PKT_DATA_H                 (15),
		.IN_PKT_DATA_L                 (0),
		.IN_PKT_BYTEEN_H               (17),
		.IN_PKT_BYTEEN_L               (16),
		.IN_PKT_BYTE_CNT_H             (57),
		.IN_PKT_BYTE_CNT_L             (55),
		.IN_PKT_TRANS_COMPRESSED_READ  (50),
		.IN_PKT_BURSTWRAP_H            (60),
		.IN_PKT_BURSTWRAP_L            (58),
		.IN_ST_DATA_W                  (71),
		.OUT_PKT_ADDR_H                (67),
		.OUT_PKT_ADDR_L                (36),
		.OUT_PKT_DATA_H                (31),
		.OUT_PKT_DATA_L                (0),
		.OUT_PKT_BYTEEN_H              (35),
		.OUT_PKT_BYTEEN_L              (32),
		.OUT_PKT_BYTE_CNT_H            (75),
		.OUT_PKT_BYTE_CNT_L            (73),
		.OUT_PKT_TRANS_COMPRESSED_READ (68),
		.OUT_ST_DATA_W                 (89),
		.ST_CHANNEL_W                  (13),
		.OPTIMIZE_FOR_RSP              (1)
	) width_adapter_001 (
		.clk               (up_clock_sys_clk_clk),                //       clk.clk
		.reset             (rst_controller_002_reset_out_reset),  // clk_reset.reset
		.in_valid          (id_router_003_src_valid),             //      sink.valid
		.in_channel        (id_router_003_src_channel),           //          .channel
		.in_startofpacket  (id_router_003_src_startofpacket),     //          .startofpacket
		.in_endofpacket    (id_router_003_src_endofpacket),       //          .endofpacket
		.in_ready          (id_router_003_src_ready),             //          .ready
		.in_data           (id_router_003_src_data),              //          .data
		.out_endofpacket   (width_adapter_001_src_endofpacket),   //       src.endofpacket
		.out_data          (width_adapter_001_src_data),          //          .data
		.out_channel       (width_adapter_001_src_channel),       //          .channel
		.out_valid         (width_adapter_001_src_valid),         //          .valid
		.out_ready         (width_adapter_001_src_ready),         //          .ready
		.out_startofpacket (width_adapter_001_src_startofpacket)  //          .startofpacket
	);

	mynios2_irq_mapper irq_mapper (
		.clk           (up_clock_sys_clk_clk),           //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.receiver3_irq (irq_mapper_receiver3_irq),       // receiver3.irq
		.receiver4_irq (irq_mapper_receiver4_irq),       // receiver4.irq
		.sender_irq    (vic_0_irq_input_irq)             //    sender.irq
	);

endmodule
