include makefile.conf

OBJS_DIR=./build/
SRCS_DIR=./sources/

all: startup.o main.o
	$(CC) -g -mcpu=$(MCPU) -mthumb -o main.elf -T $(LDSCRIPT) -Wl,--build-id=none -nostartfiles $(OBJS_DIR)startup.o $(OBJS_DIR)main.o

startup.o: $(SRCS_DIR)startup-m0.S
	arm-none-eabi-as -g -mcpu=$(MCPU) -mthumb -o $(OBJS_DIR)startup.o $(SRCS_DIR)startup-m0.S

main.o: $(SRCS_DIR)main.c	
	arm-none-eabi-gcc -c -Wall -g -mcpu=$(MCPU) -mthumb -O0 -o $(OBJS_DIR)main.o $(SRCS_DIR)main.c 


clean:
	rm ./build/*.elf ./build/*.o

