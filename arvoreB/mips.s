	.file	1 "arvoreB.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
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

	lw	$7,12($6)
	sll	$4,$9,2
	lw	$6,12($5)
	sll	$8,$2,2
	addiu	$3,$7,4
	addu	$4,$6,$4
	.option	pic0
	b	$L17
	.option	pic2
	addu	$8,$3,$8

$L29:
	addiu	$3,$3,4
$L17:
	lw	$6,0($7)
	addiu	$4,$4,4
	move	$7,$3
	bne	$8,$3,$L29
	sw	$6,-4($4)

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
	sw	$23,60($sp)
	move	$23,$4
	sw	$19,44($sp)
	sw	$17,36($sp)
	move	$17,$6
	sw	$16,32($sp)
	move	$16,$5
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$18,40($sp)
	.cprestore	16
	blez	$6,$L53
	lw	$19,12($5)

	addiu	$20,$6,-1
	slt	$2,$6,$2
	sll	$3,$20,2
	addu	$3,$19,$3
	lw	$21,0($3)
	bne	$2,$0,$L54
	lw	$4,0($21)

$L34:
	sll	$22,$17,2
$L58:
	lw	$2,4($23)
	lw	$fp,4($16)
	addu	$19,$19,$22
	slt	$2,$4,$2
	bne	$2,$0,$L35
	lw	$18,0($19)

	slt	$17,$17,$20
	bne	$17,$0,$L55
	lw	$6,0($18)

	blez	$6,$L43
	sll	$6,$6,2

	lw	$5,4($18)
	lw	$25,%call16(memmove)($28)
	.reloc	1f,R_MIPS_JALR,memmove
1:	jalr	$25
	addiu	$4,$5,4

	lw	$28,16($sp)
$L43:
	lbu	$2,8($18)
	bne	$2,$0,$L41
	nop

	lw	$4,0($18)
	addiu	$3,$4,1
	blez	$3,$L44
	nop

	sll	$4,$4,2
$L46:
	lw	$2,12($18)
	sll	$6,$3,2
	addiu	$3,$3,-1
	addu	$5,$2,$4
	addu	$2,$2,$6
	addiu	$4,$4,-4
	lw	$5,0($5)
	sw	$5,0($2)
	bne	$3,$0,$L46
	lw	$18,0($19)

$L44:
	lw	$3,0($21)
	lw	$2,12($21)
	lw	$4,12($18)
	sll	$3,$3,2
	addu	$2,$2,$3
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$18,0($19)
$L41:
	addiu	$2,$22,-4
	lw	$6,4($18)
	lw	$3,4($21)
	move	$4,$21
	addu	$fp,$fp,$2
	lw	$25,%call16(removeChaveNodo)($28)
	li	$2,1073676288			# 0x3fff0000
	ori	$5,$2,0xffff
	lw	$2,0($fp)
	sw	$2,0($6)
	lw	$2,0($18)
	addiu	$2,$2,1
	sw	$2,0($18)
	lw	$2,0($21)
	addu	$2,$2,$5
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($fp)
	lw	$2,0($21)
	addu	$2,$2,$5
	sll	$2,$2,2
	.option	pic0
	b	$L52
	.option	pic2
	addu	$2,$3,$2

$L35:
	slt	$2,$17,$20
	bne	$2,$0,$L56
	move	$6,$21

	addiu	$10,$22,-4
	move	$6,$18
	addu	$fp,$fp,$10
	move	$5,$21
	move	$4,$16
	.option	pic0
	jal	merge
	.option	pic2
	lw	$7,0($fp)

	move	$4,$16
	lw	$2,4($16)
	lw	$28,16($sp)
	addu	$10,$2,$10
	lw	$25,%call16(removeChaveNodo)($28)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	lw	$5,0($10)

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
	move	$4,$18

	move	$2,$21
	lw	$3,0($23)
	beq	$3,$16,$L57
	lw	$28,16($sp)

$L31:
	lw	$31,68($sp)
$L59:
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

$L54:
	lw	$2,8($3)
	lw	$2,0($2)
	slt	$2,$4,$2
	beq	$2,$0,$L58
	sll	$22,$17,2

$L33:
	addiu	$20,$17,1
	sll	$2,$20,2
	addu	$2,$19,$2
	lw	$21,0($2)
	.option	pic0
	b	$L34
	.option	pic2
	lw	$4,0($21)

$L55:
	lw	$2,4($18)
	addu	$fp,$fp,$22
	sll	$6,$6,2
	lbu	$3,8($18)
	lw	$4,0($fp)
	addu	$6,$2,$6
	bne	$3,$0,$L37
	sw	$4,0($6)

	lw	$2,0($18)
	lw	$4,12($21)
	lw	$3,12($18)
	addiu	$2,$2,1
	lw	$6,0($21)
	sll	$2,$2,2
	lw	$5,0($4)
	addu	$2,$3,$2
	blez	$6,$L51
	sw	$5,0($2)

	lw	$25,%call16(memmove)($28)
	sll	$6,$6,2
	.reloc	1f,R_MIPS_JALR,memmove
1:	jalr	$25
	addiu	$5,$4,4

	lw	$28,16($sp)
$L51:
	lw	$18,0($19)
$L37:
	lw	$2,0($18)
	move	$4,$21
	lw	$3,4($21)
	lw	$25,%call16(removeChaveNodo)($28)
	addiu	$2,$2,1
	sw	$2,0($18)
	lw	$5,0($3)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	sw	$5,0($fp)

	move	$4,$21
	lw	$28,16($sp)
	lw	$2,4($21)
	lw	$25,%call16(ajustaFilhos)($28)
$L52:
	jalr	$25
	lw	$5,0($2)

	lw	$10,12($16)
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addu	$10,$10,$22
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$2,0($10)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,72

$L56:
	addu	$fp,$fp,$22
	move	$5,$18
	lw	$7,0($fp)
	.option	pic0
	jal	merge
	.option	pic2
	move	$4,$16

	move	$4,$16
	lw	$2,4($16)
	lw	$10,12($16)
	lw	$28,16($sp)
	addu	$2,$2,$22
	addu	$10,$10,$22
	lw	$5,0($2)
	lw	$2,0($10)
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

	lw	$3,0($23)
	lw	$28,16($sp)
	bne	$3,$16,$L31
	lw	$2,28($sp)

$L57:
	lw	$3,0($16)
	bgtz	$3,$L59
	lw	$31,68($sp)

	lw	$25,%call16(excluiNodo)($28)
	move	$4,$16
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	sw	$2,0($23)

	.option	pic0
	b	$L31
	.option	pic2
	lw	$2,0($23)

$L53:
	slt	$2,$6,$2
	bne	$2,$0,$L33
	nop

	lw	$21,-4($19)
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
	.frame	$sp,72,$31		# vars= 8, regs= 9/0, args= 16, gp= 8
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	lw	$9,0($5)
	lui	$28,%hi(__gnu_local_gp)
	sw	$19,48($sp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	li	$19,1073676288			# 0x3fff0000
	sw	$20,52($sp)
	sw	$18,44($sp)
	move	$20,$4
	sw	$16,36($sp)
	move	$18,$5
	sw	$31,68($sp)
	move	$16,$6
	sw	$23,64($sp)
	ori	$19,$19,0xffff
	sw	$22,60($sp)
	sw	$21,56($sp)
	sw	$17,40($sp)
	blez	$9,$L74
	.cprestore	16

$L81:
	lw	$2,4($18)
	.option	pic0
	b	$L63
	.option	pic2
	move	$6,$0

$L64:
	addiu	$6,$6,1
	beq	$6,$9,$L62
	nop

$L63:
	lw	$3,0($2)
	sll	$17,$6,2
	slt	$8,$3,$16
	bne	$8,$0,$L64
	addiu	$2,$2,4

	beq	$3,$16,$L80
	nop

$L62:
	lbu	$2,8($18)
	bne	$2,$0,$L78
	move	$2,$0

$L82:
	lw	$5,12($18)
	sll	$2,$6,2
	lw	$3,4($20)
	addu	$2,$5,$2
	addiu	$3,$3,-1
	lw	$2,0($2)
	lw	$9,0($2)
	beq	$9,$3,$L88
	move	$5,$18

$L69:
	move	$18,$2
$L87:
	bgtz	$9,$L81
	nop

$L74:
	lbu	$2,8($18)
	beq	$2,$0,$L82
	move	$6,$0

	move	$2,$0
$L78:
	lw	$31,68($sp)
	lw	$23,64($sp)
	lw	$22,60($sp)
	lw	$21,56($sp)
	lw	$20,52($sp)
	lw	$19,48($sp)
	lw	$18,44($sp)
	lw	$17,40($sp)
	lw	$16,36($sp)
	jr	$31
	addiu	$sp,$sp,72

$L80:
	lbu	$2,8($18)
	bne	$2,$0,$L83
	lw	$25,%call16(removeFolha)($28)

	lw	$3,12($18)
	lw	$4,4($20)
	addu	$2,$3,$17
	lw	$2,0($2)
	lw	$9,0($2)
	slt	$5,$9,$4
	beq	$5,$0,$L84
	addiu	$23,$6,1

	sll	$21,$23,2
	addu	$3,$3,$21
	lw	$22,0($3)
	lw	$3,0($22)
	slt	$5,$3,$4
	beq	$5,$0,$L85
	addiu	$4,$4,-1

	bne	$9,$4,$L69
	nop

	beq	$3,$9,$L86
	move	$7,$16

	move	$5,$18
$L88:
	.option	pic0
	jal	redistribuicao
	.option	pic2
	move	$4,$20

	lw	$28,16($sp)
	move	$18,$2
	.option	pic0
	b	$L87
	.option	pic2
	lw	$9,0($2)

$L84:
	lw	$25,%call16(encontraPred)($28)
	move	$5,$6
	.reloc	1f,R_MIPS_JALR,encontraPred
1:	jalr	$25
	move	$4,$18

	lw	$3,0($2)
	lw	$5,12($18)
	lw	$4,4($18)
	addu	$3,$3,$19
	lw	$28,16($sp)
	addu	$6,$5,$17
	lw	$5,4($2)
	sll	$3,$3,2
	addu	$17,$4,$17
	addu	$3,$5,$3
	lw	$2,0($6)
	lw	$16,0($3)
	move	$18,$2
	sw	$16,0($17)
	.option	pic0
	b	$L87
	.option	pic2
	lw	$9,0($2)

$L85:
	lw	$25,%call16(encontraSuc)($28)
	move	$4,$18
	.reloc	1f,R_MIPS_JALR,encontraSuc
1:	jalr	$25
	move	$5,$6

	lw	$4,12($18)
	lw	$2,4($2)
	lw	$3,4($18)
	addu	$4,$4,$21
	lw	$28,16($sp)
	lw	$16,0($2)
	addu	$3,$3,$17
	lw	$2,0($4)
	sw	$16,0($3)
	move	$18,$2
	.option	pic0
	b	$L87
	.option	pic2
	lw	$9,0($2)

$L86:
	move	$6,$22
	move	$5,$2
	.option	pic0
	jal	merge
	.option	pic2
	move	$4,$18

	move	$4,$18
	lw	$2,4($18)
	lw	$28,16($sp)
	addu	$2,$2,$17
	lw	$25,%call16(removeChaveNodo)($28)
	.reloc	1f,R_MIPS_JALR,removeChaveNodo
1:	jalr	$25
	lw	$5,0($2)

	move	$4,$18
	lw	$28,16($sp)
	lw	$25,%call16(ajustaFilhos)($28)
	.reloc	1f,R_MIPS_JALR,ajustaFilhos
1:	jalr	$25
	move	$5,$23

	lw	$28,16($sp)
	lw	$25,%call16(excluiNodo)($28)
	.reloc	1f,R_MIPS_JALR,excluiNodo
1:	jalr	$25
	move	$4,$22

	lw	$2,0($18)
	bgtz	$2,$L72
	lw	$28,16($sp)

	lw	$25,%call16(ajustaRaiz)($28)
	.reloc	1f,R_MIPS_JALR,ajustaRaiz
1:	jalr	$25
	move	$4,$20

	lw	$2,0($20)
	lw	$28,16($sp)
	move	$18,$2
	.option	pic0
	b	$L87
	.option	pic2
	lw	$9,0($2)

$L83:
	move	$4,$18
	sw	$2,28($sp)
	.reloc	1f,R_MIPS_JALR,removeFolha
1:	jalr	$25
	move	$5,$6

	lw	$31,68($sp)
	lw	$2,28($sp)
	lw	$23,64($sp)
	lw	$22,60($sp)
	lw	$21,56($sp)
	lw	$20,52($sp)
	lw	$19,48($sp)
	lw	$18,44($sp)
	lw	$17,40($sp)
	lw	$16,36($sp)
	jr	$31
	addiu	$sp,$sp,72

$L72:
	lw	$2,12($18)
	move	$6,$16
	move	$4,$20
	addu	$2,$2,$17
	.option	pic0
	jal	removerChaveRec
	.option	pic2
	lw	$5,0($2)

	.option	pic0
	b	$L78
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
	beq	$4,$0,$L90
	move	$6,$5

	.option	pic0
	j	removerChaveRec
	.option	pic2
	lw	$5,0($4)

$L90:
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
	beq	$2,$0,$L120
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

	bne	$2,$0,$L117
	lw	$28,16($sp)

$L104:
	lw	$2,28($sp)
	li	$4,1			# 0x1
	lw	$25,%call16(__printf_chk)($28)
	lw	$6,24($sp)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	addiu	$5,$2,%lo($LC2)

	lw	$2,0($21)
	beq	$2,$0,$L94
	lw	$28,16($sp)

	move	$3,$0
$L95:
	lw	$2,4($2)
	move	$19,$3
	bne	$2,$0,$L95
	addiu	$3,$3,1

	lui	$16,%hi($LC4)
	move	$20,$0
	lui	$23,%hi($LC3)
	addiu	$16,$16,%lo($LC4)
$L96:
	lw	$25,%call16(desenfileirar)($28)
	.reloc	1f,R_MIPS_JALR,desenfileirar
1:	jalr	$25
	move	$4,$21

	li	$3,70			# 0x46
	lbu	$6,8($2)
	move	$22,$2
	lw	$28,16($sp)
	addiu	$5,$23,%lo($LC3)
	lw	$7,0($2)
	li	$2,73			# 0x49
	li	$4,1			# 0x1
	movz	$3,$2,$6
	lw	$25,%call16(__printf_chk)($28)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	move	$6,$3

	lw	$3,0($22)
	blez	$3,$L98
	lw	$28,16($sp)

	move	$fp,$0
$L100:
	lw	$6,4($22)
	sll	$2,$fp,2
	addiu	$3,$3,-1
	lw	$25,%call16(__printf_chk)($28)
	move	$7,$17
	addu	$6,$6,$2
	slt	$3,$fp,$3
	movn	$7,$18,$3
	li	$4,1			# 0x1
	move	$5,$16
	lw	$6,0($6)
	.reloc	1f,R_MIPS_JALR,__printf_chk
1:	jalr	$25
	addiu	$fp,$fp,1

	lw	$3,0($22)
	slt	$2,$fp,$3
	bne	$2,$0,$L100
	lw	$28,16($sp)

$L98:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,93			# 0x5d

	slt	$2,$20,$19
	bne	$2,$0,$L118
	lw	$28,16($sp)

	lbu	$2,8($22)
	beq	$2,$0,$L119
	nop

$L102:
	beq	$19,$20,$L94
	addiu	$2,$20,1

$L107:
	.option	pic0
	b	$L96
	.option	pic2
	move	$20,$2

$L118:
	lw	$25,%call16(putchar)($28)
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	li	$4,32			# 0x20

	lbu	$2,8($22)
	bne	$2,$0,$L102
	lw	$28,16($sp)

$L119:
	lw	$2,0($22)
	bltz	$2,$L102
	nop

	move	$fp,$0
$L103:
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
	beq	$3,$0,$L103
	lw	$28,16($sp)

	bne	$19,$20,$L107
	addiu	$2,$20,1

$L94:
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

	beq	$2,$0,$L104
	lw	$28,16($sp)

$L117:
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

$L120:
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
	beq	$4,$0,$L122
	.cprestore	16

	lw	$4,0($4)
	beq	$4,$0,$L122
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

$L122:
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
	beq	$2,$0,$L145
	li	$3,-1			# 0xffffffffffffffff

$L129:
	lw	$9,0($2)
	blez	$9,$L138
	nop

	lw	$4,4($2)
	.option	pic0
	b	$L135
	.option	pic2
	move	$3,$0

$L132:
	addiu	$3,$3,1
	beq	$3,$9,$L131
	nop

$L135:
	lw	$7,0($4)
	slt	$8,$7,$5
	bne	$8,$0,$L132
	addiu	$4,$4,4

	beq	$7,$5,$L144
	nop

$L131:
	lbu	$4,8($2)
	bne	$4,$0,$L130
	sll	$3,$3,2

	lw	$2,12($2)
	addu	$3,$2,$3
	lw	$2,0($3)
	bne	$2,$0,$L129
	nop

$L130:
	li	$3,-1			# 0xffffffffffffffff
$L145:
	move	$2,$0
	jr	$31
	sw	$3,0($6)

$L138:
	.option	pic0
	b	$L131
	.option	pic2
	move	$3,$0

$L144:
	jr	$31
	sw	$3,0($6)

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
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
