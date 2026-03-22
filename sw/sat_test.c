// Copyright (c) 2024 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0/
//
// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>


#include "config.h"
#include "uart.h"
#include "print.h"
#include "gpio.h"
#include "util.h"

#define TB_FREQUENCY 10000000
#define TB_BAUDRATE    115200

#define ADD_SAT(rd, rs1, rs2) \
  asm volatile (".insn r 0x33, 0x0, 0x08, %0, %1, %2": "=r"(rd) : "r"(rs1), "r"(rs2))

int main() {
    uart_init();
    


    printf("--- Saturation Test ---\n");

    // Use specific register constraints to force the compiler's hand
    volatile int a = 0x7fffffff, b = 1, result;
    ADD_SAT(result, a, b);            /* generates funct7=0x08, funct3=0 */
 
    printf("Result: %x\n", result);

    uart_write_flush();

    

    return 1;
}
