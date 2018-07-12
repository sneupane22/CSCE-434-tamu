	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L0
	  lw $t3, 8($fp)	# fill c to $t3 from $fp+8
	  beqz $t3, _L0	# branch if c is zero 
	# _tmp0 = 2
	  li $t4, 2		# load constant value 2 into $t4
	  sw $t4, -8($fp)	# spill _tmp0 from $t4 to $fp-8
	# _tmp1 = a + _tmp0
	  lw $t4, 4($fp)	# fill a to $t4 from $fp+4
	  lw $t5, -8($fp)	# fill _tmp0 to $t5 from $fp-8
	  add $t6, $t4, $t5	
	  sw $t3, 8($fp)	# spill c from $t3 to $fp+8
	  sw $t6, -12($fp)	# spill _tmp1 from $t6 to $fp-12
	# Return _tmp1
	  lw $t3, -12($fp)	# fill _tmp1 to $t3 from $fp-12
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill a to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $t3, _string1	# load label
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp2 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L1:
	# _tmp3 = 18
	  li $t3, 18		# load constant value 18 into $t3
	  sw $t3, -20($fp)	# spill _tmp3 from $t3 to $fp-20
	# Return _tmp3
	  lw $t3, -20($fp)	# fill _tmp3 to $t3 from $fp-20
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -12($fp)	# spill _tmp4 from $t3 to $fp-12
	# a = _tmp4
	  lw $t3, -12($fp)	# fill _tmp4 to $t3 from $fp-12
	# _tmp5 = 2
	  li $t4, 2		# load constant value 2 into $t4
	  sw $t4, -16($fp)	# spill _tmp5 from $t4 to $fp-16
	# _tmp6 = a / _tmp5
	  lw $t4, -16($fp)	# fill _tmp5 to $t4 from $fp-16
	  div $t5, $t3, $t4	
	  sw $t3, 0($gp)	# spill a from $t3 to $gp+0
	  sw $t5, -20($fp)	# spill _tmp6 from $t5 to $fp-20
	# b = _tmp6
	  lw $t3, -20($fp)	# fill _tmp6 to $t3 from $fp-20
	# _tmp7 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -24($fp)	# spill _tmp7 from $t4 to $fp-24
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -24($fp)	# fill _tmp7 to $t4 from $fp-24
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill b from $t3 to $fp-8
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 0($gp)	# fill a to $t3 from $gp+0
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _foo
	  jal _foo           	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -28($fp)	# spill _tmp8 from $t3 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	  li $t3, 2		# load constant value 2 into $t3
	  sw $t3, -32($fp)	# spill _tmp9 from $t3 to $fp-32
	# _tmp10 = b + _tmp9
	  lw $t3, -8($fp)	# fill b to $t3 from $fp-8
	  lw $t4, -32($fp)	# fill _tmp9 to $t4 from $fp-32
	  add $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp10 from $t5 to $fp-36
	# _tmp11 = a < b
	  lw $t3, 0($gp)	# fill a to $t3 from $gp+0
	  lw $t4, -8($fp)	# fill b to $t4 from $fp-8
	  slt $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp11 from $t5 to $fp-40
	# _tmp12 = a == b
	  lw $t3, 0($gp)	# fill a to $t3 from $gp+0
	  lw $t4, -8($fp)	# fill b to $t4 from $fp-8
	  seq $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp12 from $t5 to $fp-44
	# _tmp13 = _tmp11 || _tmp12
	  lw $t3, -40($fp)	# fill _tmp11 to $t3 from $fp-40
	  lw $t4, -44($fp)	# fill _tmp12 to $t4 from $fp-44
	  or $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp13 from $t5 to $fp-48
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -48($fp)	# fill _tmp13 to $t3 from $fp-48
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -36($fp)	# fill _tmp10 to $t3 from $fp-36
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _foo
	  jal _foo           	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -52($fp)	# spill _tmp14 from $t3 to $fp-52
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	  li $t3, 3		# load constant value 3 into $t3
	  sw $t3, -56($fp)	# spill _tmp15 from $t3 to $fp-56
	# _tmp16 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -60($fp)	# spill _tmp16 from $t3 to $fp-60
	# _tmp17 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -64($fp)	# spill _tmp17 from $t3 to $fp-64
	# _tmp18 = _tmp16 && _tmp17
	  lw $t3, -60($fp)	# fill _tmp16 to $t3 from $fp-60
	  lw $t4, -64($fp)	# fill _tmp17 to $t4 from $fp-64
	  and $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp18 from $t5 to $fp-68
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -68($fp)	# fill _tmp18 to $t3 from $fp-68
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -56($fp)	# fill _tmp15 to $t3 from $fp-56
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp19 = LCall _foo
	  jal _foo           	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -72($fp)	# spill _tmp19 from $t3 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -76($fp)	# spill _tmp20 from $t3 to $fp-76
	# _tmp21 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -80($fp)	# spill _tmp21 from $t3 to $fp-80
	# _tmp22 = _tmp20 == _tmp21
	  lw $t3, -76($fp)	# fill _tmp20 to $t3 from $fp-76
	  lw $t4, -80($fp)	# fill _tmp21 to $t4 from $fp-80
	  seq $t5, $t3, $t4	
	  sw $t5, -84($fp)	# spill _tmp22 from $t5 to $fp-84
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -84($fp)	# fill _tmp22 to $t3 from $fp-84
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -72($fp)	# fill _tmp19 to $t3 from $fp-72
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _foo
	  jal _foo           	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp23 from $t3 to $fp-88
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
