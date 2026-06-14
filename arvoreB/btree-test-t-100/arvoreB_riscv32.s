	.file	"arvoreB.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	criarArvoreB
	.type	criarArvoreB, @function
criarArvoreB:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	mv	s1,a0
	li	a0,8
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L5
.L2:
	mv	a0,s1
	call	alocarNodo
	sw	a0,0(s0)
	sw	s1,4(s0)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_restore_state
	call	encerraProgFaltaMemoria
	j	.L2
	.cfi_endproc
.LFE22:
	.size	criarArvoreB, .-criarArvoreB
	.align	1
	.globl	inserirArvoreB
	.type	inserirArvoreB, @function
inserirArvoreB:
.LFB23:
	.cfi_startproc
	lw	a3,0(a0)
	lw	a2,4(a0)
	lw	a6,0(a3)
	slli	a4,a2,1
	addi	a4,a4,-1
	beq	a6,a4,.L11
	mv	a0,a3
	tail	inserirNaoCheio
.L11:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	sw	a1,12(sp)
	sw	a0,8(sp)
	call	dividirRaiz
	lw	a5,8(sp)
	lw	a1,12(sp)
	lw	ra,28(sp)
	.cfi_restore 1
	lw	a2,4(a5)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	inserirNaoCheio
	.cfi_endproc
.LFE23:
	.size	inserirArvoreB, .-inserirArvoreB
	.align	1
	.globl	merge
	.type	merge, @function
merge:
.LFB24:
	.cfi_startproc
	seqz	a5,a1
	seqz	a4,a2
	seqz	a0,a0
	or	a5,a5,a4
	or	a0,a0,a5
	bne	a0,zero,.L12
	lw	a5,0(a1)
	lw	a6,4(a1)
	slli	a5,a5,2
	add	a5,a6,a5
	sw	a3,0(a5)
	lw	a5,0(a2)
	ble	a5,zero,.L14
	lw	a3,4(a2)
	li	a4,0
.L15:
	lw	a5,0(a1)
	lw	a0,0(a3)
	addi	a3,a3,4
	add	a5,a4,a5
	slli	a5,a5,2
	add	a5,a6,a5
	sw	a0,4(a5)
	lw	a5,0(a2)
	addi	a4,a4,1
	blt	a4,a5,.L15
.L14:
	lw	a4,0(a1)
	lbu	a3,8(a1)
	addi	a7,a4,1
	bne	a3,zero,.L16
	blt	a5,zero,.L16
	lw	a2,12(a2)
	lw	a3,12(a1)
	slli	a0,a4,2
	slli	a6,a5,2
	addi	a4,a2,4
	addi	a3,a3,4
	add	a3,a3,a0
	add	a6,a6,a4
	j	.L17
.L20:
	addi	a4,a4,4
.L17:
	lw	a0,0(a2)
	addi	a3,a3,4
	mv	a2,a4
	sw	a0,-4(a3)
	bne	a6,a4,.L20
.L16:
	add	a5,a5,a7
	sw	a5,0(a1)
.L12:
	ret
	.cfi_endproc
.LFE24:
	.size	merge, .-merge
	.align	1
	.globl	redistribuicao
	.type	redistribuicao, @function
redistribuicao:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	mv	a4,a2
	sw	ra,44(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lw	a2,0(a1)
	lw	a5,12(a1)
	mv	s0,a1
	mv	t1,a0
	lw	a1,4(a0)
	ble	a4,zero,.L46
	addi	t3,a4,-1
	slli	a3,t3,2
	add	a3,a5,a3
	lw	a6,0(a3)
	lw	a0,0(a6)
	bge	a4,a2,.L25
	lw	a7,8(a3)
	lw	a3,0(a7)
	ble	a3,a0,.L26
	addi	t3,a4,1
	blt	a3,a1,.L42
.L41:
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a3,0(a5)
	lw	a6,4(s0)
	lw	a1,0(a3)
	lw	a2,4(a3)
	add	a6,a6,a4
	lw	t1,0(a6)
	lbu	a0,8(a3)
	slli	a1,a1,2
	add	a2,a2,a1
	sw	t1,0(a2)
	bne	a0,zero,.L29
	lw	a0,12(a7)
	lw	a2,0(a3)
	lw	a1,12(a3)
	lw	t1,0(a0)
	slli	a3,a2,2
	lw	a2,0(a7)
	add	a3,a1,a3
	sw	t1,4(a3)
	ble	a2,zero,.L47
	slli	a2,a2,2
	addi	a1,a0,4
	sw	a5,24(sp)
	sw	a4,20(sp)
	sw	a7,16(sp)
	sw	a6,12(sp)
	call	memmove
	lw	a5,24(sp)
	lw	a4,20(sp)
	lw	a7,16(sp)
	lw	a3,0(a5)
	lw	a6,12(sp)
.L29:
	lw	a5,0(a3)
	lw	a2,4(a7)
	mv	a0,a7
	addi	a5,a5,1
	sw	a5,0(a3)
	lw	a1,0(a2)
	sw	a4,16(sp)
	sw	a7,12(sp)
	sw	a1,0(a6)
	call	removeChaveNodo
	lw	a7,12(sp)
	lw	a5,4(a7)
	mv	a0,a7
	lw	a1,0(a5)
	call	ajustaFilhos
	lw	a5,12(s0)
	lw	a4,16(sp)
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	add	a5,a5,a4
	lw	a6,0(a5)
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	mv	a0,a6
	jr	ra
.L25:
	.cfi_restore_state
	blt	a0,a1,.L36
.L28:
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a3,0(a5)
	lw	a2,0(a3)
	ble	a2,zero,.L32
	lw	a1,4(a3)
	slli	a2,a2,2
	sw	a6,24(sp)
	addi	a0,a1,4
	sw	a5,20(sp)
	sw	a4,16(sp)
	sw	a3,12(sp)
	call	memmove
	lw	a6,24(sp)
	lw	a5,20(sp)
	lw	a4,16(sp)
	lw	a3,12(sp)
.L32:
	lbu	a2,8(a3)
	bne	a2,zero,.L33
	lw	a1,0(a3)
	addi	a2,a1,1
	ble	a2,zero,.L34
	slli	a1,a1,2
.L35:
	lw	a3,12(a3)
	slli	a7,a2,2
	addi	a2,a2,-1
	add	a0,a3,a1
	lw	a0,0(a0)
	add	a3,a3,a7
	addi	a1,a1,-4
	sw	a0,0(a3)
	lw	a3,0(a5)
	bne	a2,zero,.L35
.L34:
	lw	a1,0(a6)
	lw	a2,12(a6)
	lw	a0,12(a3)
	slli	a3,a1,2
	add	a3,a2,a3
	lw	a3,0(a3)
	sw	a3,0(a0)
	lw	a3,0(a5)
.L33:
	lw	a7,4(s0)
	addi	a2,a4,-4
	lw	a5,4(a3)
	add	a7,a7,a2
	lw	a2,0(a7)
	li	a1,0
	mv	a0,a6
	sw	a2,0(a5)
	lw	a5,0(a3)
	lw	a2,4(a6)
	sw	a4,12(sp)
	addi	a5,a5,1
	sw	a5,0(a3)
	lw	a5,0(a6)
	add	a5,a5,a1
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,-4(a5)
	sw	a5,0(a7)
	lw	a5,0(a6)
	add	a5,a5,a1
	slli	a5,a5,2
	add	a2,a2,a5
	lw	a1,-4(a2)
	call	removeChaveNodo
	lw	a5,12(s0)
	lw	a4,12(sp)
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	add	a5,a5,a4
	lw	a6,0(a5)
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	mv	a0,a6
	jr	ra
.L36:
	.cfi_restore_state
	lw	a7,4(s0)
	slli	a3,a4,2
	add	a5,a5,a3
	addi	a3,a3,-4
	add	a7,a7,a3
	lw	a2,0(a5)
	lw	a3,0(a7)
	mv	a1,a6
	mv	a0,s0
	sw	t1,28(sp)
	sw	a6,16(sp)
	sw	a4,24(sp)
	sw	a2,12(sp)
	sw	a7,20(sp)
	call	merge
	lw	a7,20(sp)
	mv	a0,s0
	lw	a1,0(a7)
	call	removeChaveNodo
	lw	a1,24(sp)
	mv	a0,s0
	call	ajustaFilhos
	lw	a0,12(sp)
	call	excluiNodo
	lw	t1,28(sp)
	lw	a6,16(sp)
	lw	a5,0(t1)
	beq	a5,s0,.L48
.L21:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	mv	a0,a6
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L46:
	.cfi_restore_state
	bge	a4,a2,.L23
	addi	t3,a4,1
	slli	a3,t3,2
	add	a3,a5,a3
	lw	a7,0(a3)
	lw	a3,0(a7)
	bge	a3,a1,.L41
	j	.L42
.L23:
	lw	a6,-4(a5)
	lw	a3,0(a6)
	bge	a3,a1,.L49
	li	t3,-1
.L27:
	bge	a4,t3,.L36
	mv	a7,a6
.L42:
	lw	a3,4(s0)
	slli	a4,a4,2
	add	a5,a5,a4
	add	a4,a3,a4
	lw	a3,0(a4)
	lw	a1,0(a5)
	mv	a2,a7
	mv	a0,s0
	sw	t1,28(sp)
	sw	t3,24(sp)
	sw	a7,16(sp)
	sw	a4,20(sp)
	sw	a5,12(sp)
	call	merge
	lw	a5,12(sp)
	lw	a4,20(sp)
	mv	a0,s0
	lw	a6,0(a5)
	lw	a1,0(a4)
	sw	a6,12(sp)
	call	removeChaveNodo
	lw	a1,24(sp)
	mv	a0,s0
	call	ajustaFilhos
	lw	a0,16(sp)
	call	excluiNodo
	lw	t1,28(sp)
	lw	a6,12(sp)
	lw	a5,0(t1)
	bne	a5,s0,.L21
.L48:
	lw	a5,0(s0)
	bgt	a5,zero,.L21
	sw	a6,0(t1)
	mv	a0,s0
	sw	t1,12(sp)
	call	excluiNodo
	lw	t1,12(sp)
	lw	a6,0(t1)
	j	.L21
.L26:
	bge	a0,a1,.L28
	j	.L27
.L49:
	li	a3,-1
	bge	a4,a3,.L28
	mv	a7,a6
	j	.L41
.L47:
	lw	a3,0(a5)
	j	.L29
	.cfi_endproc
.LFE25:
	.size	redistribuicao, .-redistribuicao
	.align	1
	.globl	removerChaveRec
	.type	removerChaveRec, @function
removerChaveRec:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s1,36(sp)
	.cfi_offset 9, -12
	mv	s1,a1
	sw	s0,40(sp)
	.cfi_offset 8, -8
	mv	s0,a2
	lw	a2,0(s1)
	sw	s2,32(sp)
	sw	s4,24(sp)
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	li	s2,1073741824
	sw	ra,44(sp)
	sw	s3,28(sp)
	sw	s5,20(sp)
	.cfi_offset 1, -4
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	mv	s4,a0
	addi	s2,s2,-1
	ble	a2,zero,.L63
.L70:
	lw	a3,4(s1)
	li	a5,0
	mv	a4,a3
	j	.L53
.L54:
	addi	a5,a5,1
	beq	a5,a2,.L52
.L53:
	lw	a0,0(a4)
	addi	a4,a4,4
	blt	a0,s0,.L54
	ble	a2,a5,.L55
	slli	s3,a5,2
	add	a6,a3,s3
	lw	a4,0(a6)
	beq	a4,s0,.L68
.L55:
	mv	a2,a5
.L52:
	lbu	a5,8(s1)
	bne	a5,zero,.L65
.L71:
	lw	a5,12(s1)
	slli	a3,a2,2
	lw	a4,4(s4)
	add	a5,a5,a3
	lw	a0,0(a5)
	addi	a4,a4,-1
	lw	a3,0(a0)
.L61:
	beq	a4,a3,.L69
	mv	s1,a0
.L72:
	lw	a2,0(s1)
	bgt	a2,zero,.L70
.L63:
	lbu	a5,8(s1)
	li	a2,0
	beq	a5,zero,.L71
.L65:
	li	s5,0
.L57:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	mv	a0,s5
	lw	s5,20(sp)
	.cfi_restore 21
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L69:
	.cfi_restore_state
	mv	a1,s1
	mv	a0,s4
	call	redistribuicao
	mv	s1,a0
	j	.L72
.L68:
	lbu	s5,8(s1)
	bne	s5,zero,.L73
	lw	a2,12(s1)
	lw	a4,4(s4)
	add	a3,a2,s3
	lw	a0,0(a3)
	lw	a3,0(a0)
	bge	a3,a4,.L74
	addi	s5,s3,4
	add	a2,a2,s5
	lw	a7,0(a2)
	lw	a1,0(a7)
	bge	a1,a4,.L75
	addi	a4,a4,-1
	sub	a1,a1,a4
	sub	s5,a3,a4
	seqz	a1,a1
	seqz	s5,s5
	and	s5,s5,a1
	mv	a2,a5
	beq	s5,zero,.L61
	mv	a3,s0
	mv	a2,a7
	mv	a1,a0
	mv	a0,s1
	sw	a7,4(sp)
	sw	a5,12(sp)
	sw	a6,8(sp)
	call	merge
	lw	a6,8(sp)
	mv	a0,s1
	lw	a1,0(a6)
	call	removeChaveNodo
	lw	a5,12(sp)
	mv	a0,s1
	addi	a1,a5,1
	call	ajustaFilhos
	lw	a0,4(sp)
	call	excluiNodo
	lw	a5,0(s1)
	bgt	a5,zero,.L62
	mv	a0,s4
	call	ajustaRaiz
	lw	a0,0(s4)
	mv	s1,a0
	j	.L72
.L74:
	mv	a1,a5
	mv	a0,s1
	call	encontraPred
	lw	a5,0(a0)
	lw	a3,4(a0)
	lw	a4,4(s1)
	add	a5,a5,s2
	slli	a5,a5,2
	add	a3,a3,a5
	lw	a5,12(s1)
	lw	s0,0(a3)
	add	a4,a4,s3
	add	a5,a5,s3
	lw	a0,0(a5)
	sw	s0,0(a4)
	mv	s1,a0
	j	.L72
.L75:
	mv	a1,a5
	mv	a0,s1
	call	encontraSuc
	lw	a5,12(s1)
	lw	a3,4(a0)
	lw	a4,4(s1)
	add	a5,a5,s5
	lw	s0,0(a3)
	lw	a0,0(a5)
	add	a4,a4,s3
	sw	s0,0(a4)
	mv	s1,a0
	j	.L72
.L73:
	mv	a1,a5
	mv	a0,s1
	call	removeFolha
	j	.L57
.L62:
	lw	a5,12(s1)
	mv	a2,s0
	mv	a0,s4
	add	a5,a5,s3
	lw	a1,0(a5)
	call	removerChaveRec
	j	.L57
	.cfi_endproc
.LFE26:
	.size	removerChaveRec, .-removerChaveRec
	.align	1
	.globl	removerChaveArvoreB
	.type	removerChaveArvoreB, @function
removerChaveArvoreB:
.LFB27:
	.cfi_startproc
	mv	a2,a1
	beq	a0,zero,.L77
	lw	a1,0(a0)
	tail	removerChaveRec
.L77:
	ret
	.cfi_endproc
.LFE27:
	.size	removerChaveArvoreB, .-removerChaveArvoreB
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	" "
	.align	2
.LC1:
	.string	""
	.align	2
.LC2:
	.string	"----//----\nNivel %d\n----//----\n"
	.align	2
.LC3:
	.string	"%c (n:%d) ["
	.align	2
.LC4:
	.string	"%d%s"
	.text
	.align	1
	.globl	imprimirArvoreB
	.type	imprimirArvoreB, @function
imprimirArvoreB:
.LFB28:
	.cfi_startproc
	lw	a5,0(a0)
	beq	a5,zero,.L78
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s6,16(sp)
	sw	s8,8(sp)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s7,12(sp)
	sw	s9,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 9, -12
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 25, -44
	mv	s0,a0
	call	criaFila
	lw	a1,0(s0)
	mv	s6,a0
	li	s8,0
	call	enfileirar
	mv	a0,s6
	lui	s2,%hi(.LC1)
	lui	s3,%hi(.LC0)
	call	filaVazia
	bne	a0,zero,.L106
.L93:
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	mv	a1,s8
	call	printf
	lw	a5,0(s6)
	beq	a5,zero,.L81
	li	a4,0
.L82:
	lw	a5,4(a5)
	mv	s4,a4
	addi	a4,a4,1
	bne	a5,zero,.L82
	lui	s7,%hi(.LC3)
	addi	s7,s7,%lo(.LC3)
	li	s5,0
.L92:
	mv	a0,s6
	call	desenfileirar
	lbu	a1,8(a0)
	lw	a2,0(a0)
	mv	s9,a0
	seqz	a1,a1
	neg	a1,a1
	andi	a1,a1,3
	mv	a0,s7
	addi	a1,a1,70
	call	printf
	lw	a5,0(s9)
	ble	a5,zero,.L84
	lui	s1,%hi(.LC4)
	addi	s1,s1,%lo(.LC4)
	li	s0,0
.L86:
	lw	a4,4(s9)
	slli	a3,s0,2
	addi	a5,a5,-1
	add	a4,a4,a3
	lw	a1,0(a4)
	mv	a0,s1
	addi	a2,s2,%lo(.LC1)
	ble	a5,s0,.L85
	addi	a2,s3,%lo(.LC0)
.L85:
	call	printf
	lw	a5,0(s9)
	addi	s0,s0,1
	bgt	a5,s0,.L86
.L84:
	li	a0,93
	call	putchar
	bgt	s4,s5,.L107
	lbu	a5,8(s9)
	beq	a5,zero,.L89
.L90:
	beq	s4,s5,.L81
.L88:
	addi	s5,s5,1
	j	.L92
.L107:
	li	a0,32
	call	putchar
	lbu	a5,8(s9)
	bne	a5,zero,.L88
.L89:
	lw	a5,0(s9)
	blt	a5,zero,.L90
	li	s0,0
.L91:
	lw	a5,12(s9)
	slli	a4,s0,2
	mv	a0,s6
	add	a5,a5,a4
	lw	a1,0(a5)
	addi	s0,s0,1
	call	enfileirar
	lw	a5,0(s9)
	bge	a5,s0,.L91
	bne	s4,s5,.L88
.L81:
	li	a0,10
	call	putchar
	mv	a0,s6
	addi	s8,s8,1
	call	filaVazia
	beq	a0,zero,.L93
.L106:
	lw	s0,40(sp)
	.cfi_restore 8
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s7,12(sp)
	.cfi_restore 23
	lw	s8,8(sp)
	.cfi_restore 24
	lw	s9,4(sp)
	.cfi_restore 25
	mv	a0,s6
	lw	s6,16(sp)
	.cfi_restore 22
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	destroiFila
.L78:
	ret
	.cfi_endproc
.LFE28:
	.size	imprimirArvoreB, .-imprimirArvoreB
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"\303\201rvore vazia"
	.text
	.align	1
	.globl	imprimirEmOrdem
	.type	imprimirEmOrdem, @function
imprimirEmOrdem:
.LFB29:
	.cfi_startproc
	beq	a0,zero,.L109
	lw	a0,0(a0)
	beq	a0,zero,.L109
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	imprimeNodo
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	putchar
.L109:
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	tail	puts
	.cfi_endproc
.LFE29:
	.size	imprimirEmOrdem, .-imprimirEmOrdem
	.align	1
	.globl	buscarArvoreB
	.type	buscarArvoreB, @function
buscarArvoreB:
.LFB30:
	.cfi_startproc
	lw	a0,0(a0)
	beq	a0,zero,.L125
.L117:
	lw	a6,0(a0)
	ble	a6,zero,.L126
	lw	a7,4(a0)
	li	a5,0
	mv	a4,a7
	j	.L123
.L120:
	addi	a5,a5,1
	beq	a5,a6,.L119
.L123:
	lw	a3,0(a4)
	addi	a4,a4,4
	blt	a3,a1,.L120
	ble	a6,a5,.L122
	slli	a4,a5,2
	add	a7,a7,a4
	lw	a4,0(a7)
	beq	a4,a1,.L118
.L122:
	mv	a6,a5
.L119:
	lbu	a5,8(a0)
	bne	a5,zero,.L124
.L128:
	lw	a5,12(a0)
	slli	a6,a6,2
	add	a5,a5,a6
	lw	a0,0(a5)
	bne	a0,zero,.L117
.L125:
	li	a5,-1
.L118:
	sw	a5,0(a2)
	ret
.L126:
	lbu	a5,8(a0)
	li	a6,0
	beq	a5,zero,.L128
.L124:
	li	a5,-1
	li	a0,0
	sw	a5,0(a2)
	ret
	.cfi_endproc
.LFE30:
	.size	buscarArvoreB, .-buscarArvoreB
	.align	1
	.globl	deletarArvore
	.type	deletarArvore, @function
deletarArvore:
.LFB31:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	liberarArvoreB
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	free
	.cfi_endproc
.LFE31:
	.size	deletarArvore, .-deletarArvore
	.ident	"GCC: (g6afcc4f6d) 16.1.0"
	.section	.note.GNU-stack,"",@progbits
