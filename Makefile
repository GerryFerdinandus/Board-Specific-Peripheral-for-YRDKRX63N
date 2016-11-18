# project name
#PROJECT=Renesas-RX-Board-Support-Package-for-YRDKRX63N.elf
PROJECT_NAME=Renesas-RX-Board-Support-Package-for-YRDKRX63N

#include path for the *.h files
INCLUDE=\
	-I. \
	-Iboard/header \
	-Idriver/header \
	-Idriver/r_bsp \
	-Idriver/r_switches \
	-Idriver/r_bsp/board/rdkrx63n \
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
	driver/r_rspi_rx600/r_rspi_rx600.c \
	driver/r_glyph/glyph/fonts/bitmap_font.c \
	driver/r_glyph/glyph/fonts/font_8x16.c \
	driver/r_glyph/glyph/fonts/font_8x8.c \
	driver/r_glyph/glyph/fonts/font_helvr10.c \
	driver/r_glyph/glyph/fonts/font_winfreesystem14x16.c \
	driver/r_glyph/glyph/fonts/font_x5x7.c \
	driver/r_glyph/glyph/fonts/font_x6x13.c \
	driver/r_glyph/glyph/glyph.c \
	driver/r_glyph/glyph/st7579_lcd.c \
	driver/r_glyph/r_glyph.c \
	driver/r_glyph/r_glyph_register.c \
	driver/lcd/lcd.c \
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
	-Werror \
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
