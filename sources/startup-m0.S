/* Startup file for cortex-m */
    .syntax unified
    .arch   armv6-m

    .section .isr_vector,"ax",%progbits
    .align 4
    .globl	__isr_vector

__isr_vector:
    .long _estack      /* MSP initial value */
    .long start+1      /* Reset Handler */
    .long end          /* NMI Handler */
    .long end          /* Hard Fault Handler */

start:
    /* Copy data from .text to RAM */
    ldr    r1, =_sidata
    ldr    r2, =_sdata
    ldr    r3, =_edata

  copy_data:
    cmp    r2, r3
    beq    end_copy_data 
    ldr    r0, [r1]
    str    r0, [r2] 
    adds   r1, #4 
    adds   r2, #4 
    b      copy_data
    end_copy_data:

    ldr    r1, =_sbss
    ldr    r2, =_ebss
    movs   r0, #0

  zero_bss:
    cmp    r1, r2	
    beq    end_zero_bss 
    str    r0, [r1]
    adds   r1, #4
    b      zero_bss 
    end_zero_bss:

    /* branch to main */
    bl     main 

end:
    b end

