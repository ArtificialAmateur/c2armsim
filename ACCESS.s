	.arch armv5t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"ACCESS.c"
	.text
	.align	2
	.global	weird_func
	.syntax unified
	.arm
	.fpu softvfp
	.type	weird_func, %function
weird_func:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r3, r0, #1
	b	.L2
.L4:
	cmp	r0, #0
	bxeq	lr
.L2:
	ldrb	r0, [r3, #1]!	@ zero_extendqisi2
	ldrb	r2, [r1], #1	@ zero_extendqisi2
	cmp	r0, r2
	beq	.L4
	sub	r0, r0, r2
	bx	lr
	.size	weird_func, .-weird_func
	.align	2
	.global	funcinator
	.syntax unified
	.arm
	.fpu softvfp
	.type	funcinator, %function
funcinator:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L10
	mov	r3, r0
.L9:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L9
	sub	r0, r3, r0
	bx	lr
.L10:
	mov	r0, r3
	bx	lr
	.size	funcinator, .-funcinator
	.align	2
	.global	function4
	.syntax unified
	.arm
	.fpu softvfp
	.type	function4, %function
function4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	strb	r3, [r0]
	bxeq	lr
	mov	r2, r0
.L14:
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	strb	r3, [r2, #1]!
	bne	.L14
	bx	lr
	.size	function4, .-function4
	.align	2
	.global	_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #156
	ldr	r3, .L49
	sub	ip, fp, #156
	ldm	r3, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	lsr	r2, r3, #16
	strh	r3, [ip], #2	@ movhi
	ldr	r1, .L49+4
	mov	r0, #1
	strb	r2, [ip]
	bl	_write
	mov	r2, #64
	sub	r1, fp, #140
	mov	r0, #0
	bl	_read
	sub	r4, fp, #76
	ldr	r1, .L49+8
	mov	r0, #1
	bl	_write
	mov	r1, r4
	mov	r2, #64
	mov	r0, #0
	bl	_read
	sub	r1, fp, #141
	ldr	r2, .L49+12
	b	.L20
.L22:
	cmp	r3, #0
	beq	.L21
.L20:
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	ldrb	r3, [r2], #1	@ zero_extendqisi2
	cmp	r3, r0
	beq	.L22
	sub	r1, fp, #156
	mov	r0, #1
	bl	_write
	ldr	r1, .L49+16
	mov	r0, #1
	bl	_write
	bl	_halt
	mov	r0, #1
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L21:
	ldrb	r1, [fp, #-76]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L24
	mov	r3, r4
.L25:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L25
	sub	r3, r3, r4
	add	r3, r3, #8
	bic	r3, r3, #7
	sub	sp, sp, r3
	strb	r1, [sp]
	mov	r2, sp
	mov	r0, sp
	mov	r1, r4
.L27:
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	strb	r3, [r0, #1]!
	bne	.L27
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, r2
	beq	.L48
.L29:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L29
	sub	r1, r3, r2
	asrs	lr, r1, #1
	beq	.L48
	sub	r3, r2, #1
	mov	r0, r3
	sub	r1, r1, #1
	add	r2, r2, r1
	add	lr, r3, lr
.L31:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	lr, r3
	strb	ip, [r3]
	strb	r1, [r2], #-1
	bne	.L31
.L30:
	mov	r2, r0
	ldr	r1, .L49+20
	b	.L32
.L34:
	cmp	r3, #0
	beq	.L33
.L32:
	ldrb	r0, [r2, #1]!	@ zero_extendqisi2
	ldrb	r3, [r1], #1	@ zero_extendqisi2
	cmp	r3, r0
	beq	.L34
	sub	r1, fp, #156
	mov	r0, #1
	bl	_write
	ldr	r1, .L49+24
	mov	r0, #1
	bl	_write
.L35:
	bl	_halt
	mov	r0, #0
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L33:
	ldr	r1, .L49+28
	mov	r0, #1
	bl	_write
	ldr	r1, .L49+32
	mov	r0, #1
	bl	_write
	mov	r1, r4
	mov	r0, #1
	bl	_write
	b	.L35
.L24:
	strb	r1, [fp, #-160]
	sub	r0, fp, #161
	b	.L30
.L48:
	sub	r0, r2, #1
	b	.L30
.L50:
	.align	2
.L49:
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC0
	.word	.LC5
	.word	.LC1
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.size	_start, .-_start
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Hravishran\000"
	.space	1
.LC1:
	.ascii	"kr1k_5743b_dr4c1p\000"
	.space	2
.LC3:
	.ascii	"Input username: \000"
	.space	3
.LC4:
	.ascii	"Input password: \000"
	.space	3
.LC5:
	.ascii	"\012Incorrect username\012\000"
	.space	3
.LC6:
	.ascii	"Incorrect password\012\000"
.LC7:
	.ascii	"Correct!\012\000"
	.space	2
.LC8:
	.ascii	"Welcome back!\012\000"
	.space	1
.LC2:
	.ascii	"ACCESS DENIED\012\000"
	.ident	"GCC: (Ubuntu/Linaro 8.3.0-6ubuntu1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
