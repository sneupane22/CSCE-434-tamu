	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 5
	  li $t3, 5		# load constant value 5 into $t3
	  sw $t3, -12($fp)	# spill _tmp0 from $t3 to $fp-12
	# _tmp1 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp1 from $t3 to $fp-16
	# _tmp2 = _tmp1 - _tmp0
	  lw $t3, -16($fp)	# fill _tmp1 to $t3 from $fp-16
	  lw $t4, -12($fp)	# fill _tmp0 to $t4 from $fp-12
	  sub $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp2 from $t5 to $fp-20
	# _tmp3 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -24($fp)	# spill _tmp3 from $t3 to $fp-24
	# _tmp4 = _tmp2 < _tmp3
	  lw $t3, -20($fp)	# fill _tmp2 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp3 to $t4 from $fp-24
	  slt $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp4 from $t5 to $fp-28
	# IfZ _tmp4 Goto _L0
	  lw $t3, -28($fp)	# fill _tmp4 to $t3 from $fp-28
	  beqz $t3, _L0	# branch if _tmp4 is zero 
	# _tmp5 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -32($fp)	# spill _tmp5 from $t4 to $fp-32
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -32($fp)	# fill _tmp5 to $t4 from $fp-32
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -28($fp)	# spill _tmp4 from $t3 to $fp-28
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp6 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -36($fp)	# spill _tmp6 from $t3 to $fp-36
	# _tmp7 = _tmp6 + _tmp2
	  lw $t3, -36($fp)	# fill _tmp6 to $t3 from $fp-36
	  lw $t4, -20($fp)	# fill _tmp2 to $t4 from $fp-20
	  add $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp7 from $t5 to $fp-40
	# _tmp8 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -44($fp)	# spill _tmp8 from $t3 to $fp-44
	# _tmp9 = _tmp7 * _tmp8
	  lw $t3, -40($fp)	# fill _tmp7 to $t3 from $fp-40
	  lw $t4, -44($fp)	# fill _tmp8 to $t4 from $fp-44
	  mul $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp9 from $t5 to $fp-48
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -48($fp)	# fill _tmp9 to $t3 from $fp-48
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp10 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -52($fp)	# spill _tmp10 from $t3 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp10) = _tmp2
	  lw $t3, -20($fp)	# fill _tmp2 to $t3 from $fp-20
	  lw $t4, -52($fp)	# fill _tmp10 to $t4 from $fp-52
	  sw $t3, 0($t4) 	# store with offset
	# _tmp11 = _tmp10 + _tmp8
	  lw $t5, -44($fp)	# fill _tmp8 to $t5 from $fp-44
	  add $t6, $t4, $t5	
	  sw $t4, -52($fp)	# spill _tmp10 from $t4 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp11 from $t6 to $fp-56
	# arr = _tmp11
	  lw $t3, -56($fp)	# fill _tmp11 to $t3 from $fp-56
	# _tmp12 = "How did I get here?\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "How did I get here?\n"
	  .text
	  la $t4, _string2	# load label
	  sw $t4, -60($fp)	# spill _tmp12 from $t4 to $fp-60
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -60($fp)	# fill _tmp12 to $t4 from $fp-60
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill arr from $t3 to $fp-8
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
_PrintInt:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 1
        lw   $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
                                
_PrintString:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 4
        lw $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
        
_PrintBool:
	subu $sp, $sp, 8
	sw $fp, 8($sp)
	sw $ra, 4($sp)
        addiu $fp, $sp, 8
	lw $t1, 4($fp)
	blez $t1, fbr
	li   $v0, 4		# system call for print_str
	la   $a0, TRUE		# address of str to print
	syscall			
	b end
fbr:	li   $v0, 4		# system call for print_str
	la   $a0, FALSE		# address of str to print
	syscall				
end:	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra

_Alloc:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 9
        lw $a0, 4($fp)
	syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp) 
        jr $ra


_StringEqual:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps

	li $v0,0

	#Determine length string 1
	lw $t0, 4($fp)       
	li $t3,0
bloop1: 
	lb $t5, ($t0) 
	beqz $t5, eloop1	
	addi $t0, 1
	addi $t3, 1
	b bloop1
eloop1:

	#Determine length string 2
	lw $t1, 8($fp)
	li $t4,0
bloop2: 
	lb $t5, ($t1) 
	beqz $t5, eloop2	
	addi $t1, 1
	addi $t4, 1
	b bloop2
eloop2:
	bne $t3,$t4,end1       #Check String Lengths Same

	lw $t0, 4($fp)       
	lw $t1, 8($fp)
	li $t3, 0     		
bloop3:	
	lb $t5, ($t0) 
	lb $t6, ($t1) 
	bne $t5, $t6, end1
	addi $t3, 1
	addi $t0, 1
	addi $t1, 1
	bne $t3,$t4,bloop3
eloop3:	li $v0,1

end1:	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra                # return from function

_Halt:
        li $v0, 10
        syscall

_ReadInteger:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $v0, 5
	syscall
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
        

_ReadLine:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $a1, 40
	la $a0, SPACE
	li $v0, 8
	syscall

	la $t1, SPACE
bloop4: 
	lb $t5, ($t1) 
	beqz $t5, eloop4	
	addi $t1, 1
	b bloop4
eloop4:
	addi $t1,-1
	li $t6,0
        sb $t6, ($t1)

	la $v0, SPACE
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
	

	.data
TRUE:.asciiz "true"
FALSE:.asciiz "false"
SPACE:.asciiz "Making Space For Inputed Values Is Fun."
