/*
 *   Linker template for ARM Cortex-M0
 */

MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 32K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 4K
}

SECTIONS
{
    .text :
    {
        KEEP(*(.isr_vector))       /* keep this section here even if unused */
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
        _etext = .;                /* save end address of .text section */
        _sidata = _etext;

    } >FLASH = 0xff                /* put this in FLASH, erase empty with 1 */


    .data : AT(_etext)             /* put in text, but with RAM addressing */
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data.*)
        _edata = .; 

    } > RAM = 0


    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss.*)
        *(COMMON)                  /* dont know whta it is */
        . = ALIGN(4);
        _ebss = .;

    } > RAM

    _estack = (ORIGIN(RAM) + LENGTH(RAM));  /* top of stack */
    PROVIDE(_end = _ebss);                  /* (end) bottom of heap           */
                                            /* this line is for c std library */
                                            /* to provide start addres for    */
                                            /* dynamic heap allocation        */
}

