# template-m0
Basic application template for Cortex-M0 


## Cortex-M0 Startup Procedure
  * Reset sequence, PC loaded with 0x00000000        
  * CPU reads value from location 0x00000000 into MSP (1)
  * CPU steps into 0x00000004
  * Value from location 0x00000004 is loaded into PC (reset handler) (2)
  * CPU goes to PC, and starts executing further instructions (4)
  
```
  Initial Memory Layout
  
    ADDRESS         VALUE
 | 0x00000000 |      MSP      |     (1)
 | 0x00000004 |   rst_hndlr   |     (2)
 | 0x00000008 |      irq      |     (3)
             ...
 | @rst_hndlr |  instruction  |     (4)
             ...
```


## Reset Handler procedure
 Here, in reset_handler, we have acquired control over our microcontroller. Purpose of reset_handler is to initialize environment for user application. Task performed by reset_handler:
 * Copy variables from FLASH to SRAM
 * Branch to main()
