; addresses for I/O
.NAME	HEX= 0xFFFFF000
.NAME	LEDR=0xFFFFF020
.NAME	KEY= 0xFFFFF080
.NAME	SW=  0xFFFFF090
	

; bad PC goes here
.ORG 0x0
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	br	BadPC

; Interrupt Vector Table
.ORG 0x20
    	jmp	0x300(ZERO)
.ORG 0x24
	jmp	0x350(ZERO)
.ORG 0x28
	jmp	0x400(ZERO)
.ORG 0x32
	jmp	0x450(ZERO)
.ORG 0x36
	jmp	0x500(ZERO)
.ORG 0x40
	jmp	0x550(ZERO)
.ORG 0x44
	jmp	0x600(ZERO)
.ORG 0x48
	jmp	0x650(ZERO)
.ORG 0x52
	jmp	0x700(ZERO)
.ORG 0x56
	jmp	0x750(ZERO)
.ORG 0x60
	jmp	0x800(ZERO)
.ORG 0x64
	jmp	0x850(ZERO)
.ORG 0x68
	jmp	0x900(ZERO)
.ORG 0x72
	jmp	0x950(ZERO)
    
.ORG 0x80
BadPC:
	; for bad PC, display BAD on HEX
	andi	zero,t0,0x0
	not 	t0,zero
	andi	t0,t0,0b0000011111
	sw	t0,LEDR(zero)
	addi 	zero,t0,0xBAD
	sw 	t0,HEX(sp)
	br	BadPC

; Normal example display 80085 on HEX
.ORG 0x100
Done:
	addi 	zero, t0, 0b1010101010
	sw	t0, LEDR(zero)
	addi	zero,s1,0x80085
	sw	s1,HEX(zero) 
	br 	Done

; Interrupt Handlers
.ORG 0x300
	addi    zero, t0, 0x1000
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x350
	addi    zero, t0, 0x1001
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x400
	addi    zero, t0, 0x1002
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x450
	addi    zero, t0, 0x1003
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x500
	addi    zero, t0, 0x1004
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x550
	addi    zero, t0, 0x1005
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x600
	addi    zero, t0, 0x1006
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x650
	addi    zero, t0, 0x1007
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x700
	addi    zero, t0, 0x1008
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x750
	addi    zero, t0, 0x1009
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x800
	addi    zero, t0, 0x0000
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x850
	addi    zero, t0, 0x0001
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x900
	addi    zero, t0, 0x0002
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)
.ORG 0x950
	addi    zero, t0, 0x0003
    	sw      t0, HEX(sp)
	;lw	t1, LoopIter(zero)
	addi	zero, t1, 0x06
	lw	s2, LoopIter(zero)
	jmp	IntLoop(ZERO)

IntLoop:
	subi	t1, t1, 0x1
	sw	t1,LEDR(zero)
    	bne     t1, zero, IntLoop
	reti

LoopIter: 
.WORD 0x1000000