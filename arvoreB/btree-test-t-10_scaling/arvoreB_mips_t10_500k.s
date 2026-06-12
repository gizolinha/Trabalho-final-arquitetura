	.file	1 "arvoreB.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.module	arch=mips32r2
	.abicalls
	.text
	.align	2
	.globl	criarArvoreB
	.set	nomips16
	.set	nomicromips
	.ent	criarArvoreB
	.type	criarArvoreB, @function
criarArvoreB:
	.frame	$sp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$17,32($sp)
	move	$17,$4
	sw	$16,28($sp)
	.cprestore	16
	sw	$31,36($sp)
	lw	$25,%call16(malloc)($28)
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	li	$4,8			# 0x8

	lw	$28,16($sp)
	beq	$2,$0,$L5
	move	$16,$2

$L2:
	lw	$25,%call16(alocarNodo)($28)
	.reloc	1f,R_MIPS_JALR,alocarNodo
1:	jalr	$25
	move	$4,$17

	lw	$31,36($sp)
	sw	$17,4($16)
	sw	$2,0($16)
	move	$2,$16
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,40

$L5:
	lw	$25,%call16(encerraProgFaltaMemoria)($28)
	.reloc	1f,R_MIPS_JALR,encerraProgFaltaMemoria
1:	jalr	$25
	nop

	.option	pic0
	b	$L2
	.option	pic2
	lw	$28,16($sp)

	.set	macro
	.set	reorder
	.end	criarArvoreB
	.size	criarArvoreB, .-criarArvoreB
	.align	2
	.globl	inserirArvoreB
	.set	nomips16
	.set	nomicromips
	.ent	inserirArvoreB
	.type	inserirArvoreB, @function
inserirArvoreB:
	.frame	$sp,40,$31		# vars= 0, regs= 3/0, args= 16, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lw	$3,0($4)
	lui	$28,%hi(__gnu_local_gp)
	lw	$6,4($4)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sll	$2,$6,1
	lw	$7,0($3)
	sw	$31,36($sp)
	addiu	$2,$2,-1
	sw	$17,32($sp)
	sw	$16,28($sp)
	beq	$7,$2,$L10
	.cprestore	16

	lw	$31,36($sp)
	move	$4,$3
	lw	$17,32($sp)
	lw	$16,28($sp)
	lw	$25,%call16(inserirNaoCheio)($28)
	.reloc	1f,R_MIPS_JALR,inserirNaoCheio
1:	jr	$25
	addiu	$sp,$sp,40

$L10:
	lw	$25,%call16(dividirRaiz)($28)
	move	$16,$4
	.reloc	1f,R_MIPS_JALR,dividirRaiz
1:	jalr	$25
	move	$17,$5

	move	$5,$17
	lw	$28,16($sp)
	move	$4,$2
	lw	$6,4($16)
	lw	$31,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	lw	$25,%call16(inserirNaoCheio)($28)
	.reloc	1f,R_MIPS_JALR,inserirNaoCheio
1:	jr	$25
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	inserirArvoreB
	.size	inserirArvoreB, .-inserirArvoreB
	.align	2
	.globl	merge
	.set	nomips16
	.set	nomicromips
	.ent	merge
	.type	merge, @function
merge:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$4,$0,$L30
	nop

	beq	$5,$0,$L30
	nop

	beq	$6,$0,$L30
	nop

	lw	$2,0($5)
	lw	$8,4($5)
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$7,0($2)
	lw	$2,0($6)
	blez	$2,$L13
	move	$3,$0

	lw	$4,4($6)
$L14:
	lw	$2,0($5)
	addiu	$4,$4,4
	lw	$7,-4($4)
	addu	$2,$3,$2
	addiu	$3,$3,1
	addiu	$2,$2,1
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$7,0($2)
	lw	$2,0($6)
	slt	$7,$3,$2
	bne	$7,$0,$L14
	nop

$L13:
	lw	$9,0($5)
	lbu	$3,8($5)
	bne	$3,$0,$L16
	addiu	$9,$9,1

	bltz	$2,$L16
	nop

	lw	$6,12($6)
	sll	$7,$9,2
	lw	$4,12($5)
	sll	$8,$2,2
	addiu	$3,$6,4
	addu	$4,$4,$7
	.option	pic0
	b	$L17
	.option	pic2
	addu	$8,$3,$8

$L29:
	addiu	$3,$3,4
$L17:
	lw	$7,0($6)
	addiu	$4,$4,4
	move	$6,$3
	bne	$8,$3,$L29
	sw	$7,-4($4)

$L16:
	addu	$2,$2,$9
	jr	$31
	sw	$2,0($5)

$L30:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	merge
	.size	merge, .-merge
	.align	2
	.globl	redistribuicao
	.set	nomips16
	.set	nomicromips
	.ent	redistribuicao
	.type	redistribuicao, @function
redistribuicao:
	.frame	$sp,72,$31		# vars= 8, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	lw	$2,0($5)
	addiu	$sp,$sp,-72
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$22,56($sp)
	move	$22,$4
	sw	$18,40($sp)
	sw	$17,36($sp)
	move	$17,$6
	sw	$16,32($sp)
	move	$16,$5
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	.cprestore	16
	blez	$6,$L55
	lw	$18,12($5)

	addiu	$20,$6,-1
	slt	$2,$6,$2
	sll	$3,$20,2
	addu	$3,$18,$3
	lw	$21,0($3)
	bne	$2,$0,$L56
	lw	$4,0($21)

$L34:
	sll	$fp,$17,2
$L61:
	lw	$2,4($22)
	lw	$23,4($16)
	addu	$18,$18,$fp
	slt	$2,$4,$2
	bne	$2,$0,$L35
	lw	$19,0($18)

	slt	$20,$17,$20
	lw	$6,0($19)
	bne	$20,$0,$L57
	lbu	$17,8($19)

	blez	$6,$L43
	sll	$6,$6,2

	lw	$5,4($19)
	lw	$25,%call16(memmove)($28)
	.reloc	1f,R_MIPS_JALR,memmove
1:	jalr	$25
	addiu	$4,$5,4

	lw	$28,16($sp)
$L43:
	bne	$17,$0,$L60
	addiu	$6,$fp,-4

	lw	$3,0($19)
	addiu	$2,$3,1
	blez	$2,$L44
	nop

	lw	$2,12($19)
	sll	$4,$3,2
	addu	$2,$2,$4
	lw	$4,0($2)
	beq	$3,$0,$L47
	sw	$4,4($2)

	sll	$4,$3,2
	addiu	$4,$4,-4
$L46:
	lw	$2,0($18)
	sll	$6,$3,2
	addiu	$3,$3,-1
	lw	$2,12($2)
	addu	$5,$2,$4
	addu	$2,$2,$6
	addiu	$4,$4,-4
	lw	$5,0($5)
	bne	$3,$0,$L46
	sw	$5,0($2)

$L47:
	lw	$19,0($18)
$L44:
	lw	$3,0($21)
	lw	$2,12($21)
	lw	$4,12($19)
	sll	$3,$3,2
	addu	$2,$2,$3
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$19,0($18)
	addiu	$6,$fp,-4
$L60:
	lw	$2,4($19)
	lw	$3,4($21)
	li	$5,1073676288			# 0x3fff0000
	addu	$6,$23,$6
	lw	$25,%call16(removeChaveNodo)($28)
	ori	$5,$5,0xffff
	move	$4,$21
	lw	$7,0($6)
	sw	$7,0($2)
	lw	$2,0($19)
	addiu	$2,$2,1
	sw	$2,0($19)
	lw	$2,0($21)
	addu	$2,$2,$5
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($6)
	lw	$2,0($21)
	addu	$2,$2,$5
	sll	$2,$2,2
	addu	$3,$3,$2
	.option	pic0
	b	$L54
	.option	pic2
	lw	$5,0($3)

$L35:
	slt	$2,$17,$20
	bne	$2,$0,$L58
	move	$6,$21

	addiu	$2,$fp,-4
	move	$6,$19
	addu	$23,$23,$2
	move	$5,$21
	move	$4,$16
	.option	pic0
	jal	merge
	.option	pic2
	lw	$7,0($23)

	move	$4,$16
	lw	$28,16($sp)
	lw	$25,%call16(removeChaveNodo)($28)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	lw	$5,0($23)

	move	$4,$16
	lw	$28,16($sp)
	lw	$25,%call16(ajustaFilhos)($28)
	.reloc	1f,R_MIPS_JALR,ajustaFilhos
1:	jalr	$25
	move	$5,$17

	lw	$28,16($sp)
	lw	$25,%call16(excluiNodo)($28)
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	move	$4,$19

	move	$2,$21
	lw	$3,0($22)
	beq	$3,$16,$L59
	lw	$28,16($sp)

$L31:
	lw	$31,68($sp)
$L62:
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,72

$L56:
	lw	$2,8($3)
	lw	$2,0($2)
	slt	$2,$4,$2
	beq	$2,$0,$L61
	sll	$fp,$17,2

$L33:
	addiu	$20,$17,1
	sll	$2,$20,2
	addu	$2,$18,$2
	lw	$21,0($2)
	.option	pic0
	b	$L34
	.option	pic2
	lw	$4,0($21)

$L57:
	lw	$2,4($19)
	addu	$23,$23,$fp
	sll	$6,$6,2
	lw	$3,0($23)
	addu	$2,$2,$6
	bne	$17,$0,$L37
	sw	$3,0($2)

	lw	$2,0($19)
	lw	$4,12($21)
	lw	$3,12($19)
	addiu	$2,$2,1
	lw	$6,0($21)
	sll	$2,$2,2
	lw	$5,0($4)
	addu	$2,$3,$2
	blez	$6,$L53
	sw	$5,0($2)

	lw	$25,%call16(memmove)($28)
	sll	$6,$6,2
	.reloc	1f,R_MIPS_JALR,memmove
1:	jalr	$25
	addiu	$5,$4,4

	lw	$28,16($sp)
$L53:
	lw	$19,0($18)
$L37:
	lw	$2,0($19)
	move	$4,$21
	lw	$3,4($21)
	lw	$25,%call16(removeChaveNodo)($28)
	addiu	$2,$2,1
	sw	$2,0($19)
	lw	$5,0($3)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	sw	$5,0($23)

	move	$4,$21
	lw	$28,16($sp)
	lw	$2,4($21)
	lw	$25,%call16(ajustaFilhos)($28)
	lw	$5,0($2)
$L54:
	jalr	$25
	nop

	lw	$2,12($16)
	lw	$31,68($sp)
	lw	$23,60($sp)
	addu	$2,$2,$fp
	lw	$22,56($sp)
	lw	$fp,64($sp)
	lw	$21,52($sp)
	lw	$2,0($2)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,72

$L58:
	addu	$23,$23,$fp
	move	$5,$19
	lw	$7,0($23)
	.option	pic0
	jal	merge
	.option	pic2
	move	$4,$16

	move	$4,$16
	lw	$28,16($sp)
	lw	$2,0($18)
	lw	$5,0($23)
	lw	$25,%call16(removeChaveNodo)($28)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	sw	$2,28($sp)

	move	$4,$16
	lw	$28,16($sp)
	lw	$25,%call16(ajustaFilhos)($28)
	.reloc	1f,R_MIPS_JALR,ajustaFilhos
1:	jalr	$25
	move	$5,$20

	lw	$28,16($sp)
	lw	$25,%call16(excluiNodo)($28)
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	move	$4,$21

	lw	$3,0($22)
	lw	$28,16($sp)
	bne	$3,$16,$L31
	lw	$2,28($sp)

$L59:
	lw	$3,0($16)
	bgtz	$3,$L62
	lw	$31,68($sp)

	lw	$25,%call16(excluiNodo)($28)
	move	$4,$16
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	sw	$2,0($22)

	.option	pic0
	b	$L31
	.option	pic2
	lw	$2,0($22)

$L55:
	slt	$2,$6,$2
	bne	$2,$0,$L33
	nop

	lw	$21,-4($18)
	li	$20,-1			# 0xffffffffffffffff
	.option	pic0
	b	$L34
	.option	pic2
	lw	$4,0($21)

	.set	macro
	.set	reorder
	.end	redistribuicao
	.size	redistribuicao, .-redistribuicao
	.align	2
	.globl	removerChaveRec
	.set	nomips16
	.set	nomicromips
	.ent	removerChaveRec
	.type	removerChaveRec, @function
removerChaveRec:
	.frame	$sp,64,$31		# vars= 0, regs= 9/0, args= 16, gp= 8
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	lui	$28,%hi(__gnu_local_gp)
	sw	$18,36($sp)
	move	$18,$5
	sw	$17,32($sp)
	move	$17,$6
	sw	$19,40($sp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$20,44($sp)
	li	$19,1073676288			# 0x3fff0000
	sw	$31,60($sp)
	move	$20,$4
	sw	$23,56($sp)
	sw	$22,52($sp)
	sw	$21,48($sp)
	sw	$16,28($sp)
	.cprestore	16
	lw	$6,0($18)
	blez	$6,$L76
	ori	$19,$19,0xffff

$L83:
	lw	$5,4($18)
	move	$16,$0
	.option	pic0
	b	$L66
	.option	pic2
	move	$3,$5

$L67:
	addiu	$16,$16,1
	beq	$6,$16,$L65
	nop

$L66:
	lw	$2,0($3)
	slt	$2,$2,$17
	bne	$2,$0,$L67
	addiu	$3,$3,4

	slt	$6,$16,$6
	beq	$6,$0,$L65
	move	$6,$16

	sll	$21,$16,2
	addu	$10,$5,$21
	lw	$2,0($10)
	beq	$2,$17,$L82
	nop

$L65:
	lbu	$2,8($18)
	bne	$2,$0,$L75
	move	$2,$0

$L84:
	lw	$2,12($18)
	sll	$5,$6,2
	lw	$3,4($20)
	addu	$2,$2,$5
	addiu	$3,$3,-1
	lw	$2,0($2)
	lw	$4,0($2)
	beq	$4,$3,$L90
	move	$5,$18

$L71:
	move	$18,$2
$L89:
	lw	$6,0($18)
	bgtz	$6,$L83
	nop

$L76:
	lbu	$2,8($18)
	beq	$2,$0,$L84
	move	$6,$0

	move	$2,$0
$L75:
	lw	$31,60($sp)
	lw	$23,56($sp)
	lw	$22,52($sp)
	lw	$21,48($sp)
	lw	$20,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,64

$L82:
	lbu	$2,8($18)
	bne	$2,$0,$L85
	lw	$25,%call16(removeFolha)($28)

	lw	$3,12($18)
	lw	$4,4($20)
	addu	$2,$3,$21
	lw	$2,0($2)
	lw	$5,0($2)
	slt	$6,$5,$4
	beq	$6,$0,$L86
	addiu	$22,$21,4

	addu	$3,$3,$22
	lw	$23,0($3)
	lw	$3,0($23)
	slt	$7,$3,$4
	beq	$7,$0,$L87
	addiu	$4,$4,-1

	bne	$5,$4,$L71
	nop

	beq	$3,$5,$L88
	move	$6,$16

	move	$5,$18
$L90:
	.option	pic0
	jal	redistribuicao
	.option	pic2
	move	$4,$20

	lw	$28,16($sp)
	.option	pic0
	b	$L89
	.option	pic2
	move	$18,$2

$L86:
	lw	$25,%call16(encontraPred)($28)
	move	$4,$18
	.reloc	1f,R_MIPS_JALR,encontraPred
1:	jalr	$25
	move	$5,$16

	lw	$3,0($2)
	lw	$6,12($18)
	lw	$5,4($2)
	addu	$3,$3,$19
	lw	$4,4($18)
	addu	$2,$6,$21
	lw	$28,16($sp)
	sll	$3,$3,2
	addu	$4,$4,$21
	addu	$3,$5,$3
	lw	$2,0($2)
	lw	$17,0($3)
	move	$18,$2
	.option	pic0
	b	$L89
	.option	pic2
	sw	$17,0($4)

$L87:
	lw	$25,%call16(encontraSuc)($28)
	move	$4,$18
	.reloc	1f,R_MIPS_JALR,encontraSuc
1:	jalr	$25
	move	$5,$16

	lw	$4,12($18)
	lw	$2,4($2)
	lw	$3,4($18)
	addu	$4,$4,$22
	lw	$28,16($sp)
	lw	$17,0($2)
	addu	$3,$3,$21
	lw	$2,0($4)
	sw	$17,0($3)
	.option	pic0
	b	$L89
	.option	pic2
	move	$18,$2

$L85:
	move	$5,$16
	.reloc	1f,R_MIPS_JALR,removeFolha
1:	jalr	$25
	move	$4,$18

	.option	pic0
	b	$L75
	.option	pic2
	li	$2,1			# 0x1

$L88:
	move	$5,$2
	move	$7,$17
	move	$6,$23
	.option	pic0
	jal	merge
	.option	pic2
	move	$4,$18

	move	$4,$18
	lw	$28,16($sp)
	lw	$25,%call16(removeChaveNodo)($28)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	lw	$5,0($10)

	addiu	$5,$16,1
	lw	$28,16($sp)
	lw	$25,%call16(ajustaFilhos)($28)
	.reloc	1f,R_MIPS_JALR,ajustaFilhos
1:	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	lw	$25,%call16(excluiNodo)($28)
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	move	$4,$23

	lw	$2,0($18)
	bgtz	$2,$L74
	lw	$28,16($sp)

	lw	$25,%call16(ajustaRaiz)($28)
	.reloc	1f,R_MIPS_JALR,ajustaRaiz
1:	jalr	$25
	move	$4,$20

	lw	$2,0($20)
	lw	$28,16($sp)
	.option	pic0
	b	$L89
	.option	pic2
	move	$18,$2

$L74:
	lw	$2,12($18)
	move	$6,$17
	move	$4,$20
	addu	$2,$2,$21
	.option	pic0
	jal	removerChaveRec
	.option	pic2
	lw	$5,0($2)

	.option	pic0
	b	$L75
	.option	pic2
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	removerChaveRec
	.size	removerChaveRec, .-removerChaveRec
	.align	2
	.globl	removerChaveArvoreB
	.set	nomips16
	.set	nomicromips
	.ent	removerChaveArvoreB
	.type	removerChaveArvoreB, @function
removerChaveArvoreB:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$4,$0,$L92
	move	$6,$5

	.option	pic0
	j	removerChaveRec
	.option	pic2
	lw	$5,0($4)

$L92:
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	removerChaveArvoreB
	.size	removerChaveArvoreB, .-removerChaveArvoreB
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	" \000"
	.align	2
$LC1:
	.ascii	"\000"
	.align	2
$LC2:
	.ascii	"----//----\012Nivel %d\012----//----\012\000"
	.align	2
$LC3:
	.ascii	"%c (n:%d) [\000"
	.align	2
$LC4:
	.ascii	"%d%s\000"
	.text
	.align	2
	.globl	imprimirArvoreB
	.set	nomips16
	.set	nomicromips
	.ent	imprimirArvoreB
	.type	imprimirArvoreB, @function
imprimirArvoreB:
	.frame	$sp,72,$31		# vars= 8, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lw	$2,0($4)
	beq	$2,$0,$L123
	nop

	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-72
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,68($sp)
	sw	$21,52($sp)
	sw	$18,40($sp)
	lui	$18,%hi($LC0)
	sw	$17,36($sp)
	lui	$17,%hi($LC1)
	sw	$16,32($sp)
	move	$16,$4
	.cprestore	16
	addiu	$18,$18,%lo($LC0)
	sw	$fp,64($sp)
	addiu	$17,$17,%lo($LC1)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$20,48($sp)
	lw	$25,%call16(criaFila)($28)
	.reloc	1f,R_MIPS_JALR,criaFila
1:	jalr	$25
	sw	$19,44($sp)

	lw	$28,16($sp)
	move	$4,$2
	lw	$5,0($16)
	lw	$25,%call16(enfileirar)($28)
	.reloc	1f,R_MIPS_JALR,enfileirar
1:	jalr	$25
	move	$21,$2

	lui	$2,%hi($LC2)
	lw	$28,16($sp)
	move	$4,$21
	sw	$0,24($sp)
	lw	$25,%call16(filaVazia)($28)
	.reloc	1f,R_MIPS_JALR,filaVazia
1:	jalr	$25
	sw	$2,28($sp)

	bne	$2,$0,$L121
	lw	$28,16($sp)

$L108:
	lw	$2,28($sp)
	li	$4,2			# 0x2
	lw	$25,%call16(__printf_chk)($28)
	lw	$6,24($sp)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	addiu	$5,$2,%lo($LC2)

	lw	$2,0($21)
	beq	$2,$0,$L96
	lw	$28,16($sp)

	move	$3,$0
$L97:
	lw	$2,4($2)
	move	$19,$3
	bne	$2,$0,$L97
	addiu	$3,$3,1

	lui	$16,%hi($LC4)
	move	$20,$0
	lui	$23,%hi($LC3)
	addiu	$16,$16,%lo($LC4)
$L98:
	lw	$25,%call16(desenfileirar)($28)
	.reloc	1f,R_MIPS_JALR,desenfileirar
1:	jalr	$25
	move	$4,$21

	li	$3,73			# 0x49
	lw	$28,16($sp)
	move	$22,$2
	lbu	$2,8($2)
	li	$6,70			# 0x46
	lw	$7,0($22)
	addiu	$5,$23,%lo($LC3)
	li	$4,2			# 0x2
	lw	$25,%call16(__printf_chk)($28)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	movz	$6,$3,$2

	lw	$3,0($22)
	blez	$3,$L100
	lw	$28,16($sp)

	move	$fp,$0
$L102:
	lw	$6,4($22)
	sll	$2,$fp,2
	addiu	$3,$3,-1
	lw	$25,%call16(__printf_chk)($28)
	move	$7,$17
	addu	$6,$6,$2
	slt	$3,$fp,$3
	movn	$7,$18,$3
	li	$4,2			# 0x2
	move	$5,$16
	lw	$6,0($6)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	addiu	$fp,$fp,1

	lw	$3,0($22)
	slt	$2,$fp,$3
	bne	$2,$0,$L102
	lw	$28,16($sp)

$L100:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,93			# 0x5d

	slt	$2,$20,$19
	bne	$2,$0,$L122
	lw	$28,16($sp)

	lbu	$2,8($22)
	beq	$2,$0,$L105
	nop

$L106:
	beq	$19,$20,$L96
	addiu	$2,$20,1

	.option	pic0
	b	$L98
	.option	pic2
	move	$20,$2

$L96:
	lw	$2,24($sp)
	li	$4,10			# 0xa
	lw	$25,%call16(putchar)($28)
	addiu	$2,$2,1
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	sw	$2,24($sp)

	lw	$28,16($sp)
	lw	$25,%call16(filaVazia)($28)
	.reloc	1f,R_MIPS_JALR,filaVazia
1:	jalr	$25
	move	$4,$21

	beq	$2,$0,$L108
	lw	$28,16($sp)

$L121:
	lw	$31,68($sp)
	move	$4,$21
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	lw	$25,%call16(destroiFila)($28)
	.reloc	1f,R_MIPS_JALR,destroiFila
1:	jr	$25
	addiu	$sp,$sp,72

$L122:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,32			# 0x20

	lbu	$2,8($22)
	beq	$2,$0,$L105
	lw	$28,16($sp)

	addiu	$2,$20,1
	.option	pic0
	b	$L98
	.option	pic2
	move	$20,$2

$L105:
	lw	$2,0($22)
	bltz	$2,$L106
	nop

	move	$fp,$0
$L107:
	lw	$3,12($22)
	sll	$5,$fp,2
	lw	$25,%call16(enfileirar)($28)
	move	$4,$21
	addiu	$fp,$fp,1
	addu	$3,$3,$5
	.reloc	1f,R_MIPS_JALR,enfileirar
1:	jalr	$25
	lw	$5,0($3)

	lw	$3,0($22)
	slt	$3,$3,$fp
	beq	$3,$0,$L107
	lw	$28,16($sp)

	.option	pic0
	b	$L106
	nop

	.option	pic2
$L123:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	imprimirArvoreB
	.size	imprimirArvoreB, .-imprimirArvoreB
	.section	.rodata.str1.4
	.align	2
$LC5:
	.ascii	"\303\201rvore vazia\000"
	.text
	.align	2
	.globl	imprimirEmOrdem
	.set	nomips16
	.set	nomicromips
	.ent	imprimirEmOrdem
	.type	imprimirEmOrdem, @function
imprimirEmOrdem:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
	beq	$4,$0,$L125
	.cprestore	16

	lw	$4,0($4)
	beq	$4,$0,$L125
	lw	$25,%call16(imprimeNodo)($28)

	.reloc	1f,R_MIPS_JALR,imprimeNodo
1:	jalr	$25
	nop

	li	$4,10			# 0xa
	lw	$28,16($sp)
	lw	$31,28($sp)
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jr	$25
	addiu	$sp,$sp,32

$L125:
	lui	$4,%hi($LC5)
	lw	$31,28($sp)
	lw	$25,%call16(puts)($28)
	addiu	$sp,$sp,32
	.reloc	1f,R_MIPS_JALR,puts
1:	jr	$25
	addiu	$4,$4,%lo($LC5)

	.set	macro
	.set	reorder
	.end	imprimirEmOrdem
	.size	imprimirEmOrdem, .-imprimirEmOrdem
	.align	2
	.globl	buscarArvoreB
	.set	nomips16
	.set	nomicromips
	.ent	buscarArvoreB
	.type	buscarArvoreB, @function
buscarArvoreB:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lw	$2,0($4)
	beq	$2,$0,$L143
	li	$4,-1			# 0xffffffffffffffff

$L132:
	lw	$8,0($2)
	blez	$8,$L140
	nop

	lw	$9,4($2)
	move	$4,$0
	.option	pic0
	b	$L136
	.option	pic2
	move	$7,$9

$L135:
	addiu	$4,$4,1
	beq	$4,$8,$L134
	nop

$L136:
	lw	$3,0($7)
	slt	$3,$3,$5
	bne	$3,$0,$L135
	addiu	$7,$7,4

	slt	$8,$4,$8
	beq	$8,$0,$L134
	sll	$3,$4,2

	addu	$9,$9,$3
	lw	$3,0($9)
	beq	$3,$5,$L133
	nop

$L134:
	lbu	$3,8($2)
	bne	$3,$0,$L138
	nop

$L142:
	lw	$2,12($2)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$2,0($2)
	bne	$2,$0,$L132
	li	$4,-1			# 0xffffffffffffffff

$L133:
$L143:
	jr	$31
	sw	$4,0($6)

$L140:
	lbu	$3,8($2)
	beq	$3,$0,$L142
	move	$4,$0

$L138:
	li	$4,-1			# 0xffffffffffffffff
	move	$2,$0
	jr	$31
	sw	$4,0($6)

	.set	macro
	.set	reorder
	.end	buscarArvoreB
	.size	buscarArvoreB, .-buscarArvoreB
	.align	2
	.globl	deletarArvore
	.set	nomips16
	.set	nomicromips
	.ent	deletarArvore
	.type	deletarArvore, @function
deletarArvore:
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$16,24($sp)
	move	$16,$4
	sw	$31,28($sp)
	.cprestore	16
	lw	$25,%call16(liberarArvoreB)($28)
	.reloc	1f,R_MIPS_JALR,liberarArvoreB
1:	jalr	$25
	lw	$4,0($4)

	move	$4,$16
	lw	$28,16($sp)
	lw	$31,28($sp)
	lw	$16,24($sp)
	lw	$25,%call16(free)($28)
	.reloc	1f,R_MIPS_JALR,free
1:	jr	$25
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	deletarArvore
	.size	deletarArvore, .-deletarArvore
	.ident	"GCC: (Ubuntu 12.4.0-2ubuntu1~24.04) 12.4.0"
	.section	.note.GNU-stack,"",@progbits
