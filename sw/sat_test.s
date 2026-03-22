
sat_test.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <printf>:
   0:	fa010113          	addi	sp,sp,-96
   4:	04f12a23          	sw	a5,84(sp)
   8:	04410793          	addi	a5,sp,68
   c:	02812c23          	sw	s0,56(sp)
  10:	02912a23          	sw	s1,52(sp)
  14:	03212823          	sw	s2,48(sp)
  18:	03312623          	sw	s3,44(sp)
  1c:	03412423          	sw	s4,40(sp)
  20:	02112e23          	sw	ra,60(sp)
  24:	03512223          	sw	s5,36(sp)
  28:	03612023          	sw	s6,32(sp)
  2c:	01712e23          	sw	s7,28(sp)
  30:	00050413          	mv	s0,a0
  34:	04b12223          	sw	a1,68(sp)
  38:	04c12423          	sw	a2,72(sp)
  3c:	04d12623          	sw	a3,76(sp)
  40:	04e12823          	sw	a4,80(sp)
  44:	05012c23          	sw	a6,88(sp)
  48:	05112e23          	sw	a7,92(sp)
  4c:	00f12023          	sw	a5,0(sp)
  50:	02500493          	li	s1,37
  54:	07800913          	li	s2,120
  58:	06300993          	li	s3,99
  5c:	07300a13          	li	s4,115

00000060 <.L2>:
  60:	00044503          	lbu	a0,0(s0)
  64:	02051863          	bnez	a0,94 <.L13>
  68:	03c12083          	lw	ra,60(sp)
  6c:	03812403          	lw	s0,56(sp)
  70:	03412483          	lw	s1,52(sp)
  74:	03012903          	lw	s2,48(sp)
  78:	02c12983          	lw	s3,44(sp)
  7c:	02812a03          	lw	s4,40(sp)
  80:	02412a83          	lw	s5,36(sp)
  84:	02012b03          	lw	s6,32(sp)
  88:	01c12b83          	lw	s7,28(sp)
  8c:	06010113          	addi	sp,sp,96
  90:	00008067          	ret

00000094 <.L13>:
  94:	0c951863          	bne	a0,s1,164 <.L3>
  98:	00144783          	lbu	a5,1(s0)
  9c:	00140a93          	addi	s5,s0,1
  a0:	07279c63          	bne	a5,s2,118 <.L4>
  a4:	00012783          	lw	a5,0(sp)
  a8:	03000513          	li	a0,48
  ac:	00478713          	addi	a4,a5,4
  b0:	0007a783          	lw	a5,0(a5)
  b4:	00e12023          	sw	a4,0(sp)
  b8:	06078a63          	beqz	a5,12c <.L18>
  bc:	00000713          	li	a4,0
  c0:	00410b13          	addi	s6,sp,4
  c4:	00000597          	auipc	a1,0x0
  c8:	00058593          	mv	a1,a1

000000cc <.L5>:
  cc:	00f7f693          	andi	a3,a5,15
  d0:	00d586b3          	add	a3,a1,a3
  d4:	0006c683          	lbu	a3,0(a3)
  d8:	00eb0633          	add	a2,s6,a4
  dc:	0047d793          	srli	a5,a5,0x4
  e0:	00d60023          	sb	a3,0(a2)
  e4:	00070413          	mv	s0,a4
  e8:	00170713          	addi	a4,a4,1
  ec:	fe0790e3          	bnez	a5,cc <.L5>
  f0:	fff00b93          	li	s7,-1

000000f4 <.L7>:
  f4:	008b07b3          	add	a5,s6,s0
  f8:	0007c503          	lbu	a0,0(a5)
  fc:	fff40413          	addi	s0,s0,-1
 100:	00000097          	auipc	ra,0x0
 104:	000080e7          	jalr	ra # 100 <.L7+0xc>
 108:	ff7416e3          	bne	s0,s7,f4 <.L7>

0000010c <.L10>:
 10c:	000a8413          	mv	s0,s5

00000110 <.L8>:
 110:	00140413          	addi	s0,s0,1
 114:	f4dff06f          	j	60 <.L2>

00000118 <.L4>:
 118:	03379063          	bne	a5,s3,138 <.L9>
 11c:	00012783          	lw	a5,0(sp)
 120:	0007c503          	lbu	a0,0(a5)
 124:	00478713          	addi	a4,a5,4
 128:	00e12023          	sw	a4,0(sp)

0000012c <.L18>:
 12c:	00000097          	auipc	ra,0x0
 130:	000080e7          	jalr	ra # 12c <.L18>
 134:	fd9ff06f          	j	10c <.L10>

00000138 <.L9>:
 138:	fd479ae3          	bne	a5,s4,10c <.L10>
 13c:	00012783          	lw	a5,0(sp)
 140:	0007a403          	lw	s0,0(a5)
 144:	00478713          	addi	a4,a5,4
 148:	00e12023          	sw	a4,0(sp)

0000014c <.L11>:
 14c:	00044503          	lbu	a0,0(s0)
 150:	fa050ee3          	beqz	a0,10c <.L10>
 154:	00140413          	addi	s0,s0,1
 158:	00000097          	auipc	ra,0x0
 15c:	000080e7          	jalr	ra # 158 <.L11+0xc>
 160:	fedff06f          	j	14c <.L11>

00000164 <.L3>:
 164:	00000097          	auipc	ra,0x0
 168:	000080e7          	jalr	ra # 164 <.L3>
 16c:	fa5ff06f          	j	110 <.L8>

Disassembly of section .text.startup:

00000000 <main>:
   0:	fe010113          	addi	sp,sp,-32
   4:	00112e23          	sw	ra,28(sp)
   8:	00812c23          	sw	s0,24(sp)
   c:	00000097          	auipc	ra,0x0
  10:	000080e7          	jalr	ra # c <main+0xc>
  14:	00000517          	auipc	a0,0x0
  18:	00050513          	mv	a0,a0
  1c:	00000097          	auipc	ra,0x0
  20:	000080e7          	jalr	ra # 1c <main+0x1c>
  24:	800007b7          	lui	a5,0x80000
  28:	fff78793          	addi	a5,a5,-1 # 7fffffff <.L3+0x7ffffe9b>
  2c:	00f12223          	sw	a5,4(sp)
  30:	00100413          	li	s0,1
  34:	00812423          	sw	s0,8(sp)
  38:	00412783          	lw	a5,4(sp)
  3c:	00812703          	lw	a4,8(sp)
  40:	10e787b3          	.insn	4, 0x10e787b3
  44:	00f12623          	sw	a5,12(sp)
  48:	00c12583          	lw	a1,12(sp)
  4c:	00000517          	auipc	a0,0x0
  50:	00050513          	mv	a0,a0
  54:	00000097          	auipc	ra,0x0
  58:	000080e7          	jalr	ra # 54 <main+0x54>
  5c:	00000097          	auipc	ra,0x0
  60:	000080e7          	jalr	ra # 5c <main+0x5c>
  64:	01c12083          	lw	ra,28(sp)
  68:	00040513          	mv	a0,s0
  6c:	01812403          	lw	s0,24(sp)
  70:	02010113          	addi	sp,sp,32
  74:	00008067          	ret
