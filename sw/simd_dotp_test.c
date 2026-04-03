#include <stdint.h>
#include "config.h"
#include "uart.h"
#include "print.h"
#include "gpio.h"
#include "util.h"

#define TB_FREQUENCY 10000000
#define TB_BAUDRATE    115200

int32_t call_simd_dotp(int32_t a, int32_t b) {
    int32_t result;

    asm volatile (
        ".insn r 0x33, 0, 0x38, %0, %1, %2"
        : "=r" (result)          // %0: Output (rd)
        : "r" (a), "r" (b)       // %1: rs1, %2: rs2
    );

    return result;
}
//01010101 = 1+4+16+64 = 85
int main() {
    uart_init();
    printf("--- SIMD DOTP Test ---\n");

    uint32_t a=0b00000001000000010000000100000001;
    uint32_t b=0b00000001000000010000000100000001;
    int32_t result;
    result=call_simd_dotp(a,b);        
 
    printf("Result: %x\n", result);
    printf("Expected result is 4\n");

    uart_write_flush();

    

    return 1;
}