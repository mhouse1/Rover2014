/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'mynios2'
 * SOPC Builder design path: C:/Users/Mike/Documents/Rover/FPGA_PROJECT_BASE_SYSTEM_V3/mynios2.sopcinfo
 *
 * Generated: Sun Feb 09 13:02:48 EST 2014
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x4004020
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1b
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 4096
#define ALT_CPU_EIC_PRESENT
#define ALT_CPU_EXCEPTION_ADDR 0x4001020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 8192
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x1b
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 7
#define ALT_CPU_RESET_ADDR 0x4004800


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x4004020
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1b
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 4096
#define NIOS2_EIC_PRESENT
#define NIOS2_EXCEPTION_ADDR 0x4001020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 8192
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x1b
#define NIOS2_NUM_OF_SHADOW_REG_SETS 7
#define NIOS2_RESET_ADDR 0x4004800


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_QSYS
#define __ALTERA_VIC
#define __SLAVE_TEMPLATE


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x4005480
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x4005480
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x4005480
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "mynios2"


/*
 * altera_vic_driver configuration
 *
 */

#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_1 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_2 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_3 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_4 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_5 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_6 0
#define ALTERA_VIC_DRIVER_ENABLE_PREEMPTION_RS_7 0
#define ALTERA_VIC_DRIVER_ISR_PREEMPTION_ENABLED
#define ALTERA_VIC_DRIVER_LINKER_SECTION .text
#define ALTERA_VIC_DRIVER_VIC_0_IRQ0_RIL 15
#define ALTERA_VIC_DRIVER_VIC_0_IRQ0_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ0_RRS 7
#define ALTERA_VIC_DRIVER_VIC_0_IRQ10_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ10_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ10_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ11_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ11_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ11_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ12_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ12_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ12_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ13_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ13_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ13_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ14_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ14_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ14_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ15_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ15_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ15_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ16_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ16_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ16_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ17_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ17_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ17_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ18_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ18_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ18_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ19_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ19_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ19_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ1_RIL 14
#define ALTERA_VIC_DRIVER_VIC_0_IRQ1_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ1_RRS 6
#define ALTERA_VIC_DRIVER_VIC_0_IRQ20_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ20_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ20_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ21_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ21_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ21_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ22_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ22_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ22_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ23_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ23_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ23_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ24_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ24_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ24_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ25_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ25_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ25_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ26_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ26_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ26_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ27_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ27_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ27_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ28_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ28_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ28_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ29_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ29_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ29_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ2_RIL 13
#define ALTERA_VIC_DRIVER_VIC_0_IRQ2_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ2_RRS 5
#define ALTERA_VIC_DRIVER_VIC_0_IRQ30_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ30_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ30_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ31_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ31_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ31_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ3_RIL 12
#define ALTERA_VIC_DRIVER_VIC_0_IRQ3_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ3_RRS 4
#define ALTERA_VIC_DRIVER_VIC_0_IRQ4_RIL 11
#define ALTERA_VIC_DRIVER_VIC_0_IRQ4_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ4_RRS 3
#define ALTERA_VIC_DRIVER_VIC_0_IRQ5_RIL 10
#define ALTERA_VIC_DRIVER_VIC_0_IRQ5_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ5_RRS 2
#define ALTERA_VIC_DRIVER_VIC_0_IRQ6_RIL 9
#define ALTERA_VIC_DRIVER_VIC_0_IRQ6_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ6_RRS 1
#define ALTERA_VIC_DRIVER_VIC_0_IRQ7_RIL 8
#define ALTERA_VIC_DRIVER_VIC_0_IRQ7_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ7_RRS 1
#define ALTERA_VIC_DRIVER_VIC_0_IRQ8_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ8_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ8_RRS 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ9_RIL 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ9_RNMI 0
#define ALTERA_VIC_DRIVER_VIC_0_IRQ9_RRS 0
#define VIC_0_VEC_SIZE 16
#define VIC_0_VEC_TBL_BASE VIC_0_VECTOR_TABLE


/*
 * epcs_flash_controller configuration
 *
 */

#define ALT_MODULE_CLASS_epcs_flash_controller altera_avalon_epcs_flash_controller
#define EPCS_FLASH_CONTROLLER_BASE 0x4004800
#define EPCS_FLASH_CONTROLLER_IRQ 1
#define EPCS_FLASH_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_CONTROLLER_NAME "/dev/epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_REGISTER_OFFSET 1024
#define EPCS_FLASH_CONTROLLER_SPAN 2048
#define EPCS_FLASH_CONTROLLER_TYPE "altera_avalon_epcs_flash_controller"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK SYS_CLK_TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x4005480
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_memory2 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_BASE 0x4001000
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "onchip_memory2"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_IRQ -1
#define ONCHIP_MEMORY2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "Auto"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_SIZE_VALUE 4000u
#define ONCHIP_MEMORY2_SPAN 4000
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * pio_0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_0 altera_avalon_pio
#define PIO_0_BASE 0x4005400
#define PIO_0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_0_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_0_CAPTURE 0
#define PIO_0_DATA_WIDTH 16
#define PIO_0_DO_TEST_BENCH_WIRING 0
#define PIO_0_DRIVEN_SIM_VALUE 0x0
#define PIO_0_EDGE_TYPE "NONE"
#define PIO_0_FREQ 50000000u
#define PIO_0_HAS_IN 0
#define PIO_0_HAS_OUT 1
#define PIO_0_HAS_TRI 0
#define PIO_0_IRQ -1
#define PIO_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_0_IRQ_TYPE "NONE"
#define PIO_0_NAME "/dev/pio_0"
#define PIO_0_RESET_VALUE 0x0
#define PIO_0_SPAN 32
#define PIO_0_TYPE "altera_avalon_pio"


/*
 * sdram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_0 altera_avalon_new_sdram_controller
#define SDRAM_0_BASE 0x2000000
#define SDRAM_0_CAS_LATENCY 3
#define SDRAM_0_CONTENTS_INFO ""
#define SDRAM_0_INIT_NOP_DELAY 0.0
#define SDRAM_0_INIT_REFRESH_COMMANDS 2
#define SDRAM_0_IRQ -1
#define SDRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_0_IS_INITIALIZED 1
#define SDRAM_0_NAME "/dev/sdram_0"
#define SDRAM_0_POWERUP_DELAY 100.0
#define SDRAM_0_REFRESH_PERIOD 15.625
#define SDRAM_0_REGISTER_DATA_IN 1
#define SDRAM_0_SDRAM_ADDR_WIDTH 0x18
#define SDRAM_0_SDRAM_BANK_WIDTH 2
#define SDRAM_0_SDRAM_COL_WIDTH 9
#define SDRAM_0_SDRAM_DATA_WIDTH 16
#define SDRAM_0_SDRAM_NUM_BANKS 4
#define SDRAM_0_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_0_SDRAM_ROW_WIDTH 13
#define SDRAM_0_SHARED_DATA 0
#define SDRAM_0_SIM_MODEL_BASE 0
#define SDRAM_0_SPAN 33554432
#define SDRAM_0_STARVATION_INDICATOR 0
#define SDRAM_0_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_0_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_0_T_AC 5.5
#define SDRAM_0_T_MRD 3
#define SDRAM_0_T_RCD 20.0
#define SDRAM_0_T_RFC 70.0
#define SDRAM_0_T_RP 20.0
#define SDRAM_0_T_WR 14.0


/*
 * slave_template_0 configuration
 *
 */

#define ALT_MODULE_CLASS_slave_template_0 slave_template
#define SLAVE_TEMPLATE_0_BASE 0x4003000
#define SLAVE_TEMPLATE_0_IRQ -1
#define SLAVE_TEMPLATE_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SLAVE_TEMPLATE_0_NAME "/dev/slave_template_0"
#define SLAVE_TEMPLATE_0_SPAN 2048
#define SLAVE_TEMPLATE_0_TYPE "slave_template"


/*
 * slave_template_1 configuration
 *
 */

#define ALT_MODULE_CLASS_slave_template_1 slave_template
#define SLAVE_TEMPLATE_1_BASE 0x4003800
#define SLAVE_TEMPLATE_1_IRQ -1
#define SLAVE_TEMPLATE_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SLAVE_TEMPLATE_1_NAME "/dev/slave_template_1"
#define SLAVE_TEMPLATE_1_SPAN 2048
#define SLAVE_TEMPLATE_1_TYPE "slave_template"


/*
 * sys_clk_timer configuration
 *
 */

#define ALT_MODULE_CLASS_sys_clk_timer altera_avalon_timer
#define SYS_CLK_TIMER_ALWAYS_RUN 1
#define SYS_CLK_TIMER_BASE 0x4005440
#define SYS_CLK_TIMER_COUNTER_SIZE 32
#define SYS_CLK_TIMER_FIXED_PERIOD 1
#define SYS_CLK_TIMER_FREQ 50000000u
#define SYS_CLK_TIMER_IRQ 3
#define SYS_CLK_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SYS_CLK_TIMER_LOAD_VALUE 499999ull
#define SYS_CLK_TIMER_MULT 0.0010
#define SYS_CLK_TIMER_NAME "/dev/sys_clk_timer"
#define SYS_CLK_TIMER_PERIOD 10
#define SYS_CLK_TIMER_PERIOD_UNITS "ms"
#define SYS_CLK_TIMER_RESET_OUTPUT 0
#define SYS_CLK_TIMER_SNAPSHOT 0
#define SYS_CLK_TIMER_SPAN 32
#define SYS_CLK_TIMER_TICKS_PER_SEC 100u
#define SYS_CLK_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define SYS_CLK_TIMER_TYPE "altera_avalon_timer"


/*
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x4005488
#define SYSID_QSYS_0_ID 12345678
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 1391926578
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x4005460
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000u
#define TIMER_0_IRQ 4
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 49999ull
#define TIMER_0_MULT 0.0010
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 1000u
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"


/*
 * uart configuration
 *
 */

#define ALT_MODULE_CLASS_uart altera_avalon_uart
#define UART_BASE 0x4005420
#define UART_BAUD 19200
#define UART_DATA_BITS 8
#define UART_FIXED_BAUD 1
#define UART_FREQ 50000000u
#define UART_IRQ 2
#define UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART_NAME "/dev/uart"
#define UART_PARITY 'N'
#define UART_SIM_CHAR_STREAM ""
#define UART_SIM_TRUE_BAUD 0
#define UART_SPAN 32
#define UART_STOP_BITS 1
#define UART_SYNC_REG_DEPTH 2
#define UART_TYPE "altera_avalon_uart"
#define UART_USE_CTS_RTS 0
#define UART_USE_EOP_REGISTER 0


/*
 * vic_0 configuration
 *
 */

#define ALT_MODULE_CLASS_vic_0 altera_vic
#define VIC_0_BASE 0x4005000
#define VIC_0_DAISY_CHAIN_ENABLE 0
#define VIC_0_INTERRUPT_CONTROLLER_ID 0
#define VIC_0_IRQ -1
#define VIC_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define VIC_0_NAME "/dev/vic_0"
#define VIC_0_NUMBER_OF_INT_PORTS 8
#define VIC_0_RIL_WIDTH 4
#define VIC_0_SPAN 1024
#define VIC_0_TYPE "altera_vic"

#endif /* __SYSTEM_H_ */
