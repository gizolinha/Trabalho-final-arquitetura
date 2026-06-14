# compiladores Cruzados
MIPS_CC  = mips-linux-gnu-gcc
# RISCV_CC = riscv64-linux-gnu-gcc
RISCV_CC = riscv32-unknown-linux-gnu-gcc

# flags (-O2 para otimizar, -static para o QEMU, -Wall para avisos)
CFLAGS   = -O2 -static -Wall

# arquivos fonte
SRCS     = main.c arvoreB.c util.c

# executáveis de saída
BIN_MIPS  = bench_mips
BIN_RISCV = bench_riscv

.PHONY: all mips riscv run_mips run_riscv asm clean

# compila MIPS e RISCV
all: mips riscv

# compilação MIPS apenas
mips: $(SRCS)
	$(MIPS_CC) $(CFLAGS) $(SRCS) -o $(BIN_MIPS)

# compilação RISC-V apenas
riscv: $(SRCS)
	$(RISCV_CC) $(CFLAGS) $(SRCS) -o $(BIN_RISCV)

# teste  MIPS medindo o tempo de exe
run_mips: mips
	time qemu-mips ./$(BIN_MIPS)

# teste do RISC-V medindo o tempo de exe
run_riscv: riscv
	time qemu-riscv32 ./$(BIN_RISCV)

# gera arquivos assembly (.s) de MIPS e RISCV
asm:
	$(MIPS_CC) $(CFLAGS) -S arvoreB.c -o arvoreB_mips.s
	$(RISCV_CC) $(CFLAGS) -S arvoreB.c -o arvoreB_riscv.s

clean:
	rm -f $(BIN_MIPS) $(BIN_RISCV) *.s