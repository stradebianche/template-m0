# template-m0
Basic application template for Cortex-M0 

## Cortex-M0 Startup Procedure
  * Reset sequence, PC loaded with 0x00000000        
  * CPU reads value from location 0x00000000 into MSP (1)
  * CPU steps into 0x00000004
  * Value from location 0x00000004 is loaded into PC (reset handler) (2)
  * CPU goes to PC, and starts executing further instructions (4)
  
```
  Memory Layout
  
    ADDRESS         VALUE
 | 0x00000000 |      MSP      |     (1)
 | 0x00000004 | reset_handler |     (2)
 | 0x00000008 |      irq      |     (3)
             ...
 |   @rst     |  instruction  |     (4)
 
```
