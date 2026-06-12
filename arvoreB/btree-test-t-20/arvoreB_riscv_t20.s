	.file	"arvoreB.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	criarArvoreB
	.type	criarArvoreB, @function
criarArvoreB:
.LFB39:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s1,8(sp)
	.cfi_offset 9, -24
	mv	s1,a0
	li	a0,16
	sd	s0,16(sp)
	sd	ra,24(sp)
	.cfi_offset 8, -16
	.cfi_offset 1, -8
	call	malloc@plt
	mv	s0,a0
	beq	a0,zero,.L5
.L2:
	mv	a0,s1
	call	alocarNodo@plt
	sd	a0,0(s0)
	sw	s1,8(s0)
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_restore_state
	call	encerraProgFaltaMemoria@plt
	j	.L2
	.cfi_endproc
.LFE39:
	.size	criarArvoreB, .-criarArvoreB
	.align	1
	.globl	inserirArvoreB
	.type	inserirArvoreB, @function
inserirArvoreB:
.LFB40:
	.cfi_startproc
	ld	a4,0(a0)
	lw	a2,8(a0)
	lw	a3,0(a4)
	slliw	a5,a2,1
	addiw	a5,a5,-1
	beq	a3,a5,.L11
	mv	a0,a4
	tail	inserirNaoCheio@plt
.L11:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	ra,24(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 1, -8
	mv	s0,a0
	mv	s1,a1
	call	dividirRaiz@plt
	lw	a2,8(s0)
	ld	s0,16(sp)
	.cfi_restore 8
	ld	ra,24(sp)
	.cfi_restore 1
	mv	a1,s1
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	inserirNaoCheio@plt
	.cfi_endproc
.LFE40:
	.size	inserirArvoreB, .-inserirArvoreB
	.align	1
	.globl	merge
	.type	merge, @function
merge:
.LFB41:
	.cfi_startproc
	beq	a0,zero,.L12
	beq	a1,zero,.L12
	beq	a2,zero,.L12
	lw	a5,0(a1)
	ld	a6,8(a1)
	slli	a5,a5,2
	add	a5,a6,a5
	sw	a3,0(a5)
	lw	a5,0(a2)
	ble	a5,zero,.L14
	ld	a3,8(a2)
	li	a4,0
.L15:
	lw	a5,0(a1)
	lw	a0,0(a3)
	addi	a3,a3,4
	addiw	a5,a5,1
	addw	a5,a5,a4
	slli	a5,a5,2
	add	a5,a6,a5
	sw	a0,0(a5)
	lw	a5,0(a2)
	addiw	a4,a4,1
	blt	a4,a5,.L15
.L14:
	lw	a7,0(a1)
	lbu	a3,16(a1)
	addiw	a4,a7,1
	mv	a7,a4
	bne	a3,zero,.L17
	blt	a5,zero,.L17
	ld	a2,24(a2)
	ld	a3,24(a1)
	slli	a0,a4,3
	slli	a6,a5,3
	addi	a4,a2,8
	add	a3,a3,a0
	add	a6,a6,a4
	j	.L18
.L30:
	addi	a4,a4,8
.L18:
	ld	a0,0(a2)
	addi	a3,a3,8
	mv	a2,a4
	sd	a0,-8(a3)
	bne	a6,a4,.L30
.L17:
	addw	a5,a5,a7
	sw	a5,0(a1)
	ret
.L12:
	ret
	.cfi_endproc
.LFE41:
	.size	merge, .-merge
	.align	1
	.globl	redistribuicao
	.type	redistribuicao, @function
redistribuicao:
.LFB42:
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,48(sp)
	sd	s3,24(sp)
	sd	s5,8(sp)
	.cfi_offset 8, -16
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	mv	s0,a2
	sd	ra,56(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s4,16(sp)
	ld	a5,24(a1)
	lw	a3,0(a1)
	lw	a2,8(a0)
	mv	s5,a1
	mv	s3,a0
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	ble	s0,zero,.L60
	addiw	s4,s0,-1
	slli	a4,s4,3
	add	a4,a5,a4
	ld	s2,0(a4)
	lw	a1,0(s2)
	bge	s0,a3,.L35
	ld	a3,16(a4)
	lw	a4,0(a3)
	ble	a4,a1,.L36
	addiw	s4,s0,1
	mv	s2,a3
	blt	a4,a2,.L54
.L53:
	slli	s3,s0,3
	add	s1,a5,s3
	ld	a5,0(s1)
	ld	a1,8(s5)
	slli	a2,s0,2
	lw	a3,0(a5)
	ld	a4,8(a5)
	add	s0,a1,a2
	lw	a1,0(s0)
	lbu	a2,16(a5)
	slli	a3,a3,2
	add	a4,a4,a3
	sw	a1,0(a4)
	bne	a2,zero,.L39
	ld	a0,24(s2)
	lw	a4,0(a5)
	ld	a3,24(a5)
	ld	a1,0(a0)
	addi	a5,a4,1
	lw	a2,0(s2)
	slli	a5,a5,3
	add	a5,a3,a5
	sd	a1,0(a5)
	ble	a2,zero,.L59
	slli	a5,a2,32
	srli	a2,a5,29
	addi	a1,a0,8
	call	memmove@plt
.L59:
	ld	a5,0(s1)
.L39:
	lw	a4,0(a5)
	ld	a3,8(s2)
	mv	a0,s2
	addiw	a4,a4,1
	sw	a4,0(a5)
	lw	a1,0(a3)
	sw	a1,0(s0)
	call	removeChaveNodo@plt
	ld	a5,8(s2)
	mv	a0,s2
	lw	a1,0(a5)
	call	ajustaFilhos@plt
	ld	a5,24(s5)
	add	a5,a5,s3
	ld	s1,0(a5)
	j	.L31
.L35:
	blt	a1,a2,.L50
.L38:
	slli	s4,s0,3
	add	s1,a5,s4
	ld	s3,0(s1)
	lw	a2,0(s3)
	ble	a2,zero,.L45
	addiw	a5,a2,-1
	ld	a0,8(s3)
	slli	a2,a2,2
	neg	a5,a5
	slli	a5,a5,2
	addi	a1,a2,-4
	add	a1,a1,a5
	add	a5,a5,a2
	add	a1,a0,a1
	add	a0,a0,a5
	call	memmove@plt
.L45:
	lbu	a5,16(s3)
	bne	a5,zero,.L43
	lw	a5,0(s3)
	addiw	a4,a5,1
	ble	a4,zero,.L46
	ld	a3,24(s3)
	slli	a4,a4,3
	add	a4,a3,a4
	ld	a3,-8(a4)
	sd	a3,0(a4)
	beq	a5,zero,.L49
	addiw	a2,a5,-1
	slli	a2,a2,32
	srli	a2,a2,32
	sub	a2,a5,a2
	slli	a2,a2,3
	slli	a5,a5,3
	addi	a5,a5,-8
	addi	a2,a2,-16
.L48:
	ld	a4,0(s1)
	ld	a4,24(a4)
	add	a4,a4,a5
	ld	a3,0(a4)
	addi	a5,a5,-8
	sd	a3,8(a4)
	bne	a2,a5,.L48
.L49:
	ld	s3,0(s1)
.L46:
	lw	a4,0(s2)
	ld	a5,24(s2)
	ld	a3,24(s3)
	slli	a4,a4,3
	add	a5,a5,a4
	ld	a5,0(a5)
	sd	a5,0(a3)
	ld	s3,0(s1)
.L43:
	ld	a3,8(s5)
	slli	s0,s0,2
	addi	s0,s0,-4
	add	a3,a3,s0
	lw	a2,0(a3)
	ld	a5,8(s3)
	ld	a4,8(s2)
	mv	a0,s2
	sw	a2,0(a5)
	lw	a5,0(s3)
	addiw	a5,a5,1
	sw	a5,0(s3)
	lw	a5,0(s2)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-4(a5)
	sw	a5,0(a3)
	lw	a5,0(s2)
	slli	a5,a5,2
	add	a4,a4,a5
	lw	a1,-4(a4)
	call	removeChaveNodo@plt
	ld	a5,24(s5)
	add	a5,a5,s4
	ld	s1,0(a5)
	j	.L31
.L33:
	ld	s2,-8(a5)
	lw	a4,0(s2)
	bge	a4,a2,.L61
	li	s4,-1
	blt	s0,s4,.L54
.L50:
	ld	s4,8(s5)
	slli	a4,s0,3
	add	a5,a5,a4
	slli	a4,s0,2
	addi	a4,a4,-4
	add	s4,s4,a4
	sd	s6,0(sp)
	.cfi_offset 22, -64
	ld	s6,0(a5)
	lw	a3,0(s4)
	mv	a1,s2
	mv	a2,s6
	mv	a0,s5
	call	merge
	lw	a1,0(s4)
	mv	a0,s5
	mv	s1,s2
	call	removeChaveNodo@plt
	mv	a1,s0
	mv	a0,s5
	call	ajustaFilhos@plt
	mv	a0,s6
	call	excluiNodo@plt
	ld	a5,0(s3)
	ld	s6,0(sp)
	.cfi_restore 22
	beq	a5,s5,.L62
.L31:
	ld	ra,56(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	ld	s2,32(sp)
	.cfi_restore 18
	ld	s3,24(sp)
	.cfi_restore 19
	ld	s4,16(sp)
	.cfi_restore 20
	ld	s5,8(sp)
	.cfi_restore 21
	mv	a0,s1
	ld	s1,40(sp)
	.cfi_restore 9
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L60:
	.cfi_restore_state
	bge	s0,a3,.L33
	addiw	s4,s0,1
	slli	a4,s4,3
	add	a4,a5,a4
	ld	s2,0(a4)
	lw	a4,0(s2)
	bge	a4,a2,.L53
.L54:
	ld	a4,8(s5)
	slli	a3,s0,3
	slli	s0,s0,2
	add	s1,a5,a3
	add	s0,a4,s0
	lw	a3,0(s0)
	ld	a1,0(s1)
	mv	a2,s2
	mv	a0,s5
	call	merge
	lw	a1,0(s0)
	mv	a0,s5
	ld	s1,0(s1)
	call	removeChaveNodo@plt
	mv	a1,s4
	mv	a0,s5
	call	ajustaFilhos@plt
	mv	a0,s2
	call	excluiNodo@plt
	ld	a5,0(s3)
	bne	a5,s5,.L31
.L62:
	lw	a5,0(s5)
	bgt	a5,zero,.L31
	sd	s1,0(s3)
	mv	a0,s5
	call	excluiNodo@plt
	ld	s1,0(s3)
	j	.L31
.L36:
	bge	a1,a2,.L38
	blt	s0,s4,.L54
	j	.L50
.L61:
	li	a4,-1
	blt	s0,a4,.L53
	j	.L38
	.cfi_endproc
.LFE42:
	.size	redistribuicao, .-redistribuicao
	.align	1
	.globl	removerChaveRec
	.type	removerChaveRec, @function
removerChaveRec:
.LFB43:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	s2,48(sp)
	.cfi_offset 18, -32
	mv	s2,a1
	sd	s1,56(sp)
	.cfi_offset 9, -24
	mv	s1,a2
	lw	a2,0(s2)
	sd	s4,32(sp)
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s3,40(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	sd	s8,0(sp)
	.cfi_offset 20, -48
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	mv	s4,a0
	ble	a2,zero,.L76
.L83:
	ld	a3,8(s2)
	li	s0,0
	mv	a5,a3
	j	.L66
.L67:
	addiw	s0,s0,1
	beq	a2,s0,.L65
.L66:
	lw	a4,0(a5)
	addi	a5,a5,4
	blt	a4,s1,.L67
	ble	a2,s0,.L77
	slli	s5,s0,2
	add	s3,a3,s5
	lw	a5,0(s3)
	mv	a2,s0
	beq	a5,s1,.L82
.L65:
	lbu	a5,16(s2)
	bne	a5,zero,.L80
.L84:
	ld	a4,24(s2)
	slli	a3,a2,3
	lw	a5,8(s4)
	add	a4,a4,a3
	ld	a0,0(a4)
	addiw	a5,a5,-1
	lw	a4,0(a0)
	beq	a4,a5,.L73
.L71:
	mv	s2,a0
.L89:
	lw	a2,0(s2)
	bgt	a2,zero,.L83
.L76:
	lbu	a5,16(s2)
	li	a2,0
	beq	a5,zero,.L84
.L80:
	li	a0,0
.L75:
	ld	ra,72(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	ld	s1,56(sp)
	.cfi_restore 9
	ld	s2,48(sp)
	.cfi_restore 18
	ld	s3,40(sp)
	.cfi_restore 19
	ld	s4,32(sp)
	.cfi_restore 20
	ld	s5,24(sp)
	.cfi_restore 21
	ld	s6,16(sp)
	.cfi_restore 22
	ld	s7,8(sp)
	.cfi_restore 23
	ld	s8,0(sp)
	.cfi_restore 24
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L82:
	.cfi_restore_state
	lbu	a5,16(s2)
	bne	a5,zero,.L85
	ld	a5,24(s2)
	slli	s6,s0,3
	lw	a4,8(s4)
	add	a3,a5,s6
	ld	a0,0(a3)
	lw	a3,0(a0)
	bge	a3,a4,.L86
	addi	s7,s6,8
	add	a5,a5,s7
	ld	s8,0(a5)
	lw	a5,0(s8)
	bge	a5,a4,.L87
	addiw	a4,a4,-1
	bne	a3,a4,.L71
	beq	a5,a3,.L88
.L73:
	mv	a1,s2
	mv	a0,s4
	call	redistribuicao
	mv	s2,a0
	j	.L89
.L86:
	mv	a0,s2
	mv	a1,s0
	call	encontraPred@plt
	lw	a2,0(a0)
	ld	a3,8(a0)
	ld	a4,24(s2)
	slli	a2,a2,2
	ld	a5,8(s2)
	add	a3,a3,a2
	add	a4,a4,s6
	ld	a0,0(a4)
	lw	s1,-4(a3)
	add	a5,a5,s5
	mv	s2,a0
	sw	s1,0(a5)
	j	.L89
.L87:
	mv	a0,s2
	mv	a1,s0
	call	encontraSuc@plt
	ld	a4,24(s2)
	ld	a3,8(a0)
	ld	a5,8(s2)
	add	a4,a4,s7
	ld	a0,0(a4)
	lw	s1,0(a3)
	add	a5,a5,s5
	mv	s2,a0
	sw	s1,0(a5)
	j	.L89
.L88:
	mv	a3,s1
	mv	a2,s8
	mv	a1,a0
	mv	a0,s2
	call	merge
	lw	a1,0(s3)
	mv	a0,s2
	call	removeChaveNodo@plt
	addiw	a1,s0,1
	mv	a0,s2
	call	ajustaFilhos@plt
	mv	a0,s8
	call	excluiNodo@plt
	lw	a5,0(s2)
	bgt	a5,zero,.L74
	mv	a0,s4
	call	ajustaRaiz@plt
	ld	a0,0(s4)
	mv	s2,a0
	j	.L89
.L85:
	mv	a0,s2
	mv	a1,s0
	call	removeFolha@plt
	li	a0,1
	j	.L75
.L74:
	ld	a5,24(s2)
	mv	a2,s1
	mv	a0,s4
	add	a5,a5,s6
	ld	a1,0(a5)
	call	removerChaveRec
	li	a0,1
	j	.L75
.L77:
	mv	a2,s0
	j	.L65
	.cfi_endproc
.LFE43:
	.size	removerChaveRec, .-removerChaveRec
	.align	1
	.globl	removerChaveArvoreB
	.type	removerChaveArvoreB, @function
removerChaveArvoreB:
.LFB44:
	.cfi_startproc
	mv	a2,a1
	beq	a0,zero,.L91
	ld	a1,0(a0)
	tail	removerChaveRec
.L91:
	ret
	.cfi_endproc
.LFE44:
	.size	removerChaveArvoreB, .-removerChaveArvoreB
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	" "
	.align	3
.LC1:
	.string	""
	.align	3
.LC2:
	.string	"----//----\nNivel %d\n----//----\n"
	.align	3
.LC3:
	.string	"%c (n:%d) ["
	.align	3
.LC4:
	.string	"%d%s"
	.text
	.align	1
	.globl	imprimirArvoreB
	.type	imprimirArvoreB, @function
imprimirArvoreB:
.LFB45:
	.cfi_startproc
	ld	a5,0(a0)
	beq	a5,zero,.L92
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s6,32(sp)
	sd	s8,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 24, -80
	mv	s0,a0
	sd	s5,40(sp)
	sd	s7,24(sp)
	sd	s9,8(sp)
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	.cfi_offset 25, -88
	call	criaFila@plt
	ld	a1,0(s0)
	mv	s6,a0
	li	s8,0
	call	enfileirar@plt
	mv	a0,s6
	call	filaVazia@plt
	lla	s2,.LC1
	lla	s4,.LC0
	lla	s1,.LC4
	mv	s3,a0
	bne	a0,zero,.L121
.L107:
	mv	a2,s8
	lla	a1,.LC2
	li	a0,2
	call	__printf_chk@plt
	ld	a5,0(s6)
	beq	a5,zero,.L95
	li	a4,0
.L96:
	ld	a5,8(a5)
	mv	s5,a4
	addiw	a4,a4,1
	bne	a5,zero,.L96
	lla	s7,.LC3
.L97:
	mv	a0,s6
	call	desenfileirar@plt
	lbu	a5,16(a0)
	mv	s9,a0
	li	a2,73
	beq	a5,zero,.L98
	li	a2,70
.L98:
	lw	a3,0(s9)
	mv	a1,s7
	li	a0,2
	call	__printf_chk@plt
	lw	a5,0(s9)
	ble	a5,zero,.L99
	li	s0,0
	li	a6,0
.L101:
	ld	a4,8(s9)
	slli	a3,s0,2
	addiw	a5,a5,-1
	add	a4,a4,a3
	lw	a2,0(a4)
	mv	a1,s1
	li	a0,2
	mv	a3,s2
	ble	a5,a6,.L100
	mv	a3,s4
.L100:
	call	__printf_chk@plt
	lw	a5,0(s9)
	addi	s0,s0,1
	sext.w	a6,s0
	bgt	a5,a6,.L101
.L99:
	li	a0,93
	call	putchar@plt
	bgt	s5,s3,.L122
	lbu	a5,16(s9)
	beq	a5,zero,.L104
.L105:
	addiw	a5,s3,1
	beq	s5,s3,.L95
.L108:
	mv	s3,a5
	j	.L97
.L95:
	li	a0,10
	call	putchar@plt
	mv	a0,s6
	call	filaVazia@plt
	addiw	s8,s8,1
	mv	s3,a0
	beq	a0,zero,.L107
.L121:
	ld	s0,80(sp)
	.cfi_remember_state
	.cfi_restore 8
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s1,72(sp)
	.cfi_restore 9
	ld	s2,64(sp)
	.cfi_restore 18
	ld	s3,56(sp)
	.cfi_restore 19
	ld	s4,48(sp)
	.cfi_restore 20
	ld	s5,40(sp)
	.cfi_restore 21
	ld	s7,24(sp)
	.cfi_restore 23
	ld	s8,16(sp)
	.cfi_restore 24
	ld	s9,8(sp)
	.cfi_restore 25
	mv	a0,s6
	ld	s6,32(sp)
	.cfi_restore 22
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	tail	destroiFila@plt
.L122:
	.cfi_restore_state
	li	a0,32
	call	putchar@plt
	lbu	a4,16(s9)
	addiw	a5,s3,1
	bne	a4,zero,.L108
.L104:
	lw	a5,0(s9)
	blt	a5,zero,.L105
	li	s0,0
.L106:
	ld	a5,24(s9)
	slli	a4,s0,3
	mv	a0,s6
	add	a5,a5,a4
	ld	a1,0(a5)
	addi	s0,s0,1
	call	enfileirar@plt
	lw	a4,0(s9)
	sext.w	a5,s0
	bge	a4,a5,.L106
	j	.L105
.L92:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	ret
	.cfi_endproc
.LFE45:
	.size	imprimirArvoreB, .-imprimirArvoreB
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"\303\201rvore vazia"
	.text
	.align	1
	.globl	imprimirEmOrdem
	.type	imprimirEmOrdem, @function
imprimirEmOrdem:
.LFB46:
	.cfi_startproc
	beq	a0,zero,.L124
	ld	a0,0(a0)
	beq	a0,zero,.L124
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	call	imprimeNodo@plt
	ld	ra,8(sp)
	.cfi_restore 1
	li	a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	putchar@plt
.L124:
	lla	a0,.LC5
	tail	puts@plt
	.cfi_endproc
.LFE46:
	.size	imprimirEmOrdem, .-imprimirEmOrdem
	.align	1
	.globl	buscarArvoreB
	.type	buscarArvoreB, @function
buscarArvoreB:
.LFB47:
	.cfi_startproc
	ld	a0,0(a0)
	beq	a0,zero,.L139
.L132:
	lw	a6,0(a0)
	ble	a6,zero,.L140
	ld	a7,8(a0)
	li	a5,0
	mv	a4,a7
	j	.L136
.L135:
	addiw	a5,a5,1
	beq	a5,a6,.L134
.L136:
	lw	a3,0(a4)
	addi	a4,a4,4
	blt	a3,a1,.L135
	ble	a6,a5,.L134
	slli	a4,a5,2
	add	a7,a7,a4
	lw	a4,0(a7)
	beq	a4,a1,.L133
.L134:
	lbu	a4,16(a0)
	bne	a4,zero,.L138
.L142:
	ld	a4,24(a0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a0,0(a5)
	bne	a0,zero,.L132
.L139:
	li	a5,-1
.L133:
	sw	a5,0(a2)
	ret
.L140:
	lbu	a4,16(a0)
	li	a5,0
	beq	a4,zero,.L142
.L138:
	li	a5,-1
	li	a0,0
	sw	a5,0(a2)
	ret
	.cfi_endproc
.LFE47:
	.size	buscarArvoreB, .-buscarArvoreB
	.align	1
	.globl	deletarArvore
	.type	deletarArvore, @function
deletarArvore:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,0(sp)
	.cfi_offset 8, -16
	mv	s0,a0
	ld	a0,0(a0)
	sd	ra,8(sp)
	.cfi_offset 1, -8
	call	liberarArvoreB@plt
	mv	a0,s0
	ld	s0,0(sp)
	.cfi_restore 8
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	free@plt
	.cfi_endproc
.LFE48:
	.size	deletarArvore, .-deletarArvore
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
