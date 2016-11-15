# project name
#PROJECT=Renesas-RX-Board-Support-Package-for-YRDKRX63N.elf
PROJECT_NAME=Renesas-RX-Board-Support-Package-for-YRDKRX63N

#include path for the *.h files
INCLUDE=\
	-I. \
	-Iboard/header \
	$(END)

# source code: asm files
SOURCE_ASM=\
	board/code/reset_program.asm \
	$(END)

# source code: S files
SOURCE_S=\
	$(END)

# source code: c files
SOURCE_C=\
	board/code/interrupt_handlers.c \
	board/code/hardware_setup.c \
	board/code/sbrk.c \
	test/main.c \
	$(END)
# There is a interrupt routine callback not suported in this build.
#	board/code/vector_table.c \


#compiler flag
CFLAGS=\
	-x c \
	-D__RX_LITTLE_ENDIAN__=1 \
	-mlittle-endian-data \
	-mcpu=rx600 \
	-Wall \
	$(END)

# assembler flags with gcc
ASFLAGS=\
	-x assembler-with-cpp \
	$(END)

# linker flags
LDFLAGS=\
	-nostartfiles \
	-Wl,--gc-sections \
	-Wl,-Map=$(PROJECT_MAP) \
	-T linker.ld \
	-e_PowerON_Reset \
	$(END)


#process all the variable define above in the build.mk file
-include build.mk
