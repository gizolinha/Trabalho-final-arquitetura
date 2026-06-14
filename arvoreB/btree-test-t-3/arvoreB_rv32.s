	.file	"arvoreB.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	criarArvoreB
	.type	criarArvoreB, @function
criarArvoreB:
	addi	sp,sp,-16
	sw	s1,4(sp)
	mv	s1,a0
	li	a0,8
	sw	s0,8(sp)
	sw	ra,12(sp)
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L5
.L2:
	mv	a0,s1
	call	alocarNodo
	sw	a0,0(s0)
	sw	s1,4(s0)
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	call	encerraProgFaltaMemoria
	j	.L2
	.size	criarArvoreB, .-criarArvoreB
	.align	2
	.globl	inserirArvoreB
	.type	inserirArvoreB, @function
inserirArvoreB:
	lw	a4,0(a0)
	lw	a2,4(a0)
	lw	a3,0(a4)
	slli	a5,a2,1
	addi	a5,a5,-1
	beq	a3,a5,.L11
	mv	a0,a4
	tail	inserirNaoCheio
.L11:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a0
	mv	s1,a1
	call	dividirRaiz
	lw	a2,4(s0)
	lw	s0,8(sp)
	lw	ra,12(sp)
	mv	a1,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	tail	inserirNaoCheio
	.size	inserirArvoreB, .-inserirArvoreB
	.align	2
	.globl	merge
	.type	merge, @function
merge:
	beq	a0,zero,.L12
	beq	a1,zero,.L12
	beq	a2,zero,.L12
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
	addi	a5,a5,1
	slli	a5,a5,2
	add	a5,a6,a5
	sw	a0,0(a5)
	lw	a5,0(a2)
	addi	a4,a4,1
	blt	a4,a5,.L15
.L14:
	lw	a7,0(a1)
	lw	a4,8(a1)
	addi	a7,a7,1
	bne	a4,zero,.L17
	blt	a5,zero,.L17
	lw	a0,12(a2)
	lw	a2,12(a1)
	slli	a3,a7,2
	addi	a4,a0,4
	slli	a6,a5,2
	add	a3,a2,a3
	add	a6,a4,a6
	j	.L18
.L30:
	addi	a4,a4,4
.L18:
	lw	a2,0(a0)
	addi	a3,a3,4
	mv	a0,a4
	sw	a2,-4(a3)
	bne	a6,a4,.L30
.L17:
	add	a5,a5,a7
	sw	a5,0(a1)
	ret
.L12:
	ret
	.size	merge, .-merge
	.align	2
	.globl	redistribuicao
	.type	redistribuicao, @function
redistribuicao:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s7,12(sp)
	sw	ra,44(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s8,8(sp)
	lw	a3,0(a1)
	lw	s2,12(a1)
	mv	s0,a1
	mv	s1,a2
	mv	s7,a0
	ble	a2,zero,.L51
	addi	s8,a2,-1
	slli	a5,s8,2
	add	a5,s2,a5
	lw	s4,0(a5)
	lw	a4,0(s4)
	blt	a2,a3,.L52
.L34:
	lw	a5,4(s7)
	slli	s6,s1,2
	add	s2,s2,s6
	lw	s3,4(s0)
	lw	s5,0(s2)
	bgt	a5,a4,.L35
	lw	a2,0(s5)
	bgt	s8,s1,.L53
	ble	a2,zero,.L43
	lw	a1,4(s5)
	slli	a2,a2,2
	addi	a0,a1,4
	call	memmove
.L43:
	lw	a5,8(s5)
	bne	a5,zero,.L42
	lw	a3,0(s5)
	addi	a4,a3,1
	ble	a4,zero,.L44
	slli	a3,a3,2
.L46:
	lw	a5,12(s5)
	slli	a1,a4,2
	addi	a4,a4,-1
	add	a2,a5,a3
	lw	a2,0(a2)
	add	a5,a5,a1
	addi	a3,a3,-4
	sw	a2,0(a5)
	lw	s5,0(s2)
	bne	a4,zero,.L46
.L44:
	lw	a4,0(s4)
	lw	a5,12(s4)
	lw	a3,12(s5)
	slli	a4,a4,2
	add	a5,a5,a4
	lw	a5,0(a5)
	sw	a5,0(a3)
	lw	s5,0(s2)
.L42:
	addi	a5,s6,-4
	add	s3,s3,a5
	lw	a3,0(s3)
	lw	a5,4(s5)
	lw	a4,4(s4)
	mv	a0,s4
	sw	a3,0(a5)
	lw	a2,0(s5)
	li	a5,1073741824
	addi	a3,a5,-1
	addi	a5,a2,1
	sw	a5,0(s5)
	lw	a5,0(s4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,0(s3)
	lw	a5,0(s4)
	add	a5,a5,a3
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a1,0(a5)
	call	removeChaveNodo
	lw	s2,12(s0)
	add	s2,s2,s6
	lw	s3,0(s2)
	j	.L31
.L35:
	bgt	s8,s1,.L54
	addi	s2,s6,-4
	add	s3,s3,s2
	lw	a3,0(s3)
	mv	a2,s5
	mv	a1,s4
	mv	a0,s0
	call	merge
	lw	a5,4(s0)
	mv	a0,s0
	mv	s3,s4
	add	s2,a5,s2
	lw	a1,0(s2)
	call	removeChaveNodo
	mv	a1,s1
	mv	a0,s0
	call	ajustaFilhos
	mv	a0,s5
	call	excluiNodo
	lw	a5,0(s7)
	beq	a5,s0,.L55
.L31:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	mv	a0,s3
	lw	s3,28(sp)
	addi	sp,sp,48
	jr	ra
.L52:
	lw	a5,8(a5)
	lw	a5,0(a5)
	ble	a5,a4,.L34
.L33:
	addi	s8,s1,1
	slli	a5,s8,2
	add	a5,s2,a5
	lw	s4,0(a5)
	lw	a4,0(s4)
	j	.L34
.L53:
	lw	a5,4(s5)
	add	s3,s3,s6
	lw	a4,0(s3)
	slli	a2,a2,2
	add	a2,a5,a2
	sw	a4,0(a2)
	lw	a5,8(s5)
	bne	a5,zero,.L37
	lw	a0,12(s4)
	lw	a5,0(s5)
	lw	a4,12(s5)
	lw	a3,0(a0)
	addi	a5,a5,1
	lw	a2,0(s4)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	ble	a2,zero,.L50
	slli	a2,a2,2
	addi	a1,a0,4
	call	memmove
.L50:
	lw	s5,0(s2)
.L37:
	lw	a5,0(s5)
	lw	a4,4(s4)
	mv	a0,s4
	addi	a5,a5,1
	sw	a5,0(s5)
	lw	a1,0(a4)
	sw	a1,0(s3)
	call	removeChaveNodo
	lw	a5,4(s4)
	mv	a0,s4
	lw	a1,0(a5)
	call	ajustaFilhos
	lw	s2,12(s0)
	add	s2,s2,s6
	lw	s3,0(s2)
	j	.L31
.L54:
	add	s3,s3,s6
	lw	a3,0(s3)
	mv	a2,s4
	mv	a1,s5
	mv	a0,s0
	call	merge
	lw	a5,4(s0)
	lw	s2,12(s0)
	mv	a0,s0
	add	a5,a5,s6
	lw	a1,0(a5)
	add	s2,s2,s6
	lw	s3,0(s2)
	call	removeChaveNodo
	mv	a1,s8
	mv	a0,s0
	call	ajustaFilhos
	mv	a0,s4
	call	excluiNodo
	lw	a5,0(s7)
	bne	a5,s0,.L31
.L55:
	lw	a5,0(s0)
	bgt	a5,zero,.L31
	sw	s3,0(s7)
	mv	a0,s0
	call	excluiNodo
	lw	s3,0(s7)
	j	.L31
.L51:
	blt	a2,a3,.L33
	lw	s4,-4(s2)
	li	s8,-1
	lw	a4,0(s4)
	j	.L34
	.size	redistribuicao, .-redistribuicao
	.align	2
	.globl	removerChaveRec
	.type	removerChaveRec, @function
removerChaveRec:
	lw	a6,0(a1)
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	mv	s2,a1
	li	s3,1073741824
	sw	ra,44(sp)
	sw	s1,36(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	lw	a3,8(s2)
	mv	s4,a0
	mv	s0,a2
	addi	s3,s3,-1
	ble	a6,zero,.L70
.L76:
	lw	a5,4(s2)
	li	a2,0
	j	.L59
.L60:
	addi	a2,a2,1
	beq	a2,a6,.L58
.L59:
	lw	a4,0(a5)
	slli	s1,a2,2
	addi	a5,a5,4
	blt	a4,s0,.L60
	beq	a4,s0,.L75
.L58:
	bne	a3,zero,.L72
.L77:
	lw	a3,12(s2)
	slli	a4,a2,2
	lw	a5,4(s4)
	add	a4,a3,a4
	lw	a0,0(a4)
	addi	a5,a5,-1
	lw	a6,0(a0)
	beq	a6,a5,.L67
.L65:
	mv	s2,a0
.L82:
	lw	a3,8(s2)
	bgt	a6,zero,.L76
.L70:
	li	a2,0
	beq	a3,zero,.L77
.L72:
	li	a0,0
.L56:
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	sp,sp,48
	jr	ra
.L75:
	bne	a3,zero,.L78
	lw	a5,12(s2)
	lw	a4,4(s4)
	add	a3,a5,s1
	lw	a0,0(a3)
	lw	a6,0(a0)
	bge	a6,a4,.L79
	addi	s7,a2,1
	slli	s5,s7,2
	add	a5,a5,s5
	lw	s6,0(a5)
	lw	a5,0(s6)
	bge	a5,a4,.L80
	addi	a4,a4,-1
	bne	a6,a4,.L65
	beq	a5,a6,.L81
.L67:
	mv	a1,s2
	mv	a0,s4
	call	redistribuicao
	lw	a6,0(a0)
	mv	s2,a0
	j	.L82
.L79:
	mv	a1,a2
	mv	a0,s2
	call	encontraPred
	lw	a5,0(a0)
	lw	a2,4(a0)
	lw	a3,12(s2)
	add	a5,a5,s3
	slli	a5,a5,2
	lw	a4,4(s2)
	add	a5,a2,a5
	lw	s0,0(a5)
	add	a5,a3,s1
	lw	a0,0(a5)
	add	s1,a4,s1
	sw	s0,0(s1)
	lw	a6,0(a0)
	mv	s2,a0
	j	.L82
.L80:
	mv	a0,s2
	mv	a1,a2
	call	encontraSuc
	lw	a3,4(a0)
	lw	a4,12(s2)
	lw	a5,4(s2)
	lw	s0,0(a3)
	add	s5,a4,s5
	lw	a0,0(s5)
	add	s1,a5,s1
	sw	s0,0(s1)
	lw	a6,0(a0)
	mv	s2,a0
	j	.L82
.L81:
	mv	a3,s0
	mv	a2,s6
	mv	a1,a0
	mv	a0,s2
	call	merge
	lw	a5,4(s2)
	mv	a0,s2
	add	a5,a5,s1
	lw	a1,0(a5)
	call	removeChaveNodo
	mv	a1,s7
	mv	a0,s2
	call	ajustaFilhos
	mv	a0,s6
	call	excluiNodo
	lw	a5,0(s2)
	bgt	a5,zero,.L68
	mv	a0,s4
	call	ajustaRaiz
	lw	a0,0(s4)
	lw	a6,0(a0)
	mv	s2,a0
	j	.L82
.L78:
	mv	a0,s2
	mv	a1,a2
	call	removeFolha
	li	a0,1
	j	.L56
.L68:
	lw	a5,12(s2)
	mv	a2,s0
	mv	a0,s4
	add	a5,a5,s1
	lw	a1,0(a5)
	call	removerChaveRec
	li	a0,1
	j	.L56
	.size	removerChaveRec, .-removerChaveRec
	.align	2
	.globl	removerChaveArvoreB
	.type	removerChaveArvoreB, @function
removerChaveArvoreB:
	mv	a2,a1
	beq	a0,zero,.L84
	lw	a1,0(a0)
	tail	removerChaveRec
.L84:
	ret
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
	.align	2
	.globl	imprimirArvoreB
	.type	imprimirArvoreB, @function
imprimirArvoreB:
	lw	a5,0(a0)
	beq	a5,zero,.L85
	addi	sp,sp,-48
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
	mv	s0,a0
	call	criaFila
	lw	a1,0(s0)
	mv	s6,a0
	lui	s2,%hi(.LC0)
	call	enfileirar
	lui	s3,%hi(.LC1)
	mv	a0,s6
	li	s8,0
	addi	s2,s2,%lo(.LC0)
	addi	s3,s3,%lo(.LC1)
	call	filaVazia
	bne	a0,zero,.L111
.L98:
	lui	a0,%hi(.LC2)
	mv	a1,s8
	addi	a0,a0,%lo(.LC2)
	call	printf
	lw	a5,0(s6)
	beq	a5,zero,.L88
	li	a4,0
.L89:
	lw	a5,4(a5)
	mv	s4,a4
	addi	a4,a4,1
	bne	a5,zero,.L89
	li	s5,0
	lui	s7,%hi(.LC3)
	lui	s1,%hi(.LC4)
.L90:
	mv	a0,s6
	call	desenfileirar
	lw	a1,8(a0)
	lw	a2,0(a0)
	mv	s9,a0
	snez	a1,a1
	neg	a1,a1
	andi	a1,a1,-3
	addi	a0,s7,%lo(.LC3)
	addi	a1,a1,73
	call	printf
	lw	a5,0(s9)
	ble	a5,zero,.L92
	li	s0,0
.L94:
	lw	a4,4(s9)
	slli	a3,s0,2
	addi	a5,a5,-1
	add	a4,a4,a3
	lw	a1,0(a4)
	addi	a0,s1,%lo(.LC4)
	mv	a2,s2
	bgt	a5,s0,.L93
	mv	a2,s3
.L93:
	call	printf
	lw	a5,0(s9)
	addi	s0,s0,1
	bgt	a5,s0,.L94
.L92:
	li	a0,93
	call	putchar
	bgt	s4,s5,.L112
	lw	s0,8(s9)
	beq	s0,zero,.L113
.L96:
	addi	a5,s5,1
	beq	s4,s5,.L88
.L101:
	mv	s5,a5
	j	.L90
.L112:
	li	a0,32
	call	putchar
	lw	s0,8(s9)
	bne	s0,zero,.L96
.L113:
	lw	a5,0(s9)
	blt	a5,zero,.L96
.L97:
	lw	a5,12(s9)
	slli	a4,s0,2
	mv	a0,s6
	add	a5,a5,a4
	lw	a1,0(a5)
	addi	s0,s0,1
	call	enfileirar
	lw	a5,0(s9)
	bge	a5,s0,.L97
	addi	a5,s5,1
	bne	s4,s5,.L101
.L88:
	li	a0,10
	call	putchar
	mv	a0,s6
	addi	s8,s8,1
	call	filaVazia
	beq	a0,zero,.L98
.L111:
	lw	s0,40(sp)
	lw	ra,44(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	lw	s9,4(sp)
	mv	a0,s6
	lw	s6,16(sp)
	addi	sp,sp,48
	tail	destroiFila
.L85:
	ret
	.size	imprimirArvoreB, .-imprimirArvoreB
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"\303\201rvore vazia"
	.text
	.align	2
	.globl	imprimirEmOrdem
	.type	imprimirEmOrdem, @function
imprimirEmOrdem:
	beq	a0,zero,.L115
	lw	a0,0(a0)
	beq	a0,zero,.L115
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	imprimeNodo
	lw	ra,12(sp)
	li	a0,10
	addi	sp,sp,16
	tail	putchar
.L115:
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	tail	puts
	.size	imprimirEmOrdem, .-imprimirEmOrdem
	.align	2
	.globl	buscarArvoreB
	.type	buscarArvoreB, @function
buscarArvoreB:
	lw	a0,0(a0)
	beq	a0,zero,.L124
.L123:
	lw	a6,0(a0)
	ble	a6,zero,.L132
	lw	a4,4(a0)
	li	a5,0
	j	.L129
.L126:
	addi	a5,a5,1
	beq	a5,a6,.L125
.L129:
	lw	a3,0(a4)
	addi	a4,a4,4
	blt	a3,a1,.L126
	beq	a3,a1,.L138
.L125:
	lw	a4,8(a0)
	bne	a4,zero,.L124
	lw	a4,12(a0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	bne	a0,zero,.L123
.L124:
	li	a5,-1
	sw	a5,0(a2)
	li	a0,0
	ret
.L132:
	li	a5,0
	j	.L125
.L138:
	sw	a5,0(a2)
	ret
	.size	buscarArvoreB, .-buscarArvoreB
	.align	2
	.globl	deletarArvore
	.type	deletarArvore, @function
deletarArvore:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,12(sp)
	call	liberarArvoreB
	mv	a0,s0
	lw	s0,8(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	free
	.size	deletarArvore, .-deletarArvore
	.ident	"GCC: () 10.2.0"
