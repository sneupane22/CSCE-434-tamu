	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _factorial:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -8($fp)	# spill _tmp0 from $t3 to $fp-8
	# _tmp1 = n < _tmp0
	  lw $t3, 4($fp)	# fill n to $t3 from $fp+4
	  lw $t4, -8($fp)	# fill _tmp0 to $t4 from $fp-8
	  slt $t5, $t3, $t4	
	  sw $t5, -12($fp)	# spill _tmp1 from $t5 to $fp-12
	# _tmp2 = n == _tmp0
	  lw $t3, 4($fp)	# fill n to $t3 from $fp+4
	  lw $t4, -8($fp)	# fill _tmp0 to $t4 from $fp-8
	  seq $t5, $t3, $t4	
	  sw $t5, -16($fp)	# spill _tmp2 from $t5 to $fp-16
	# _tmp3 = _tmp1 || _tmp2
	  lw $t3, -12($fp)	# fill _tmp1 to $t3 from $fp-12
	  lw $t4, -16($fp)	# fill _tmp2 to $t4 from $fp-16
	  or $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp3 from $t5 to $fp-20
	# IfZ _tmp3 Goto _L0
	  lw $t3, -20($fp)	# fill _tmp3 to $t3 from $fp-20
	  beqz $t3, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -24($fp)	# spill _tmp4 from $t4 to $fp-24
	# Return _tmp4
	  lw $t4, -24($fp)	# fill _tmp4 to $t4 from $fp-24
	  move $v0, $t4		# assign return value into $v0
	  sw $t3, -20($fp)	# spill _tmp3 from $t3 to $fp-20
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L0:
	# _tmp5 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -28($fp)	# spill _tmp5 from $t3 to $fp-28
	# _tmp6 = n - _tmp5
	  lw $t3, 4($fp)	# fill n to $t3 from $fp+4
	  lw $t4, -28($fp)	# fill _tmp5 to $t4 from $fp-28
	  sub $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp6 from $t5 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -32($fp)	# fill _tmp6 to $t3 from $fp-32
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp7 = LCall _factorial
	  jal _factorial     	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -36($fp)	# spill _tmp7 from $t3 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	  lw $t3, 4($fp)	# fill n to $t3 from $fp+4
	  lw $t4, -36($fp)	# fill _tmp7 to $t4 from $fp-36
	  mul $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp8 from $t5 to $fp-40
	# Return _tmp8
	  lw $t3, -40($fp)	# fill _tmp8 to $t3 from $fp-40
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
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -12($fp)	# spill _tmp9 from $t3 to $fp-12
	# n = _tmp9
	  lw $t3, -12($fp)	# fill _tmp9 to $t3 from $fp-12
	  sw $t3, -8($fp)	# spill n from $t3 to $fp-8
  _L1:
	# _tmp10 = 15
	  li $t3, 15		# load constant value 15 into $t3
	  sw $t3, -16($fp)	# spill _tmp10 from $t3 to $fp-16
	# _tmp11 = n < _tmp10
	  lw $t3, -8($fp)	# fill n to $t3 from $fp-8
	  lw $t4, -16($fp)	# fill _tmp10 to $t4 from $fp-16
	  slt $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp11 from $t5 to $fp-20
	# _tmp12 = n == _tmp10
	  lw $t3, -8($fp)	# fill n to $t3 from $fp-8
	  lw $t4, -16($fp)	# fill _tmp10 to $t4 from $fp-16
	  seq $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp12 from $t5 to $fp-24
	# _tmp13 = _tmp11 || _tmp12
	  lw $t3, -20($fp)	# fill _tmp11 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp12 to $t4 from $fp-24
	  or $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp13 from $t5 to $fp-28
	# IfZ _tmp13 Goto _L2
	  lw $t3, -28($fp)	# fill _tmp13 to $t3 from $fp-28
	  beqz $t3, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -32($fp)	# spill _tmp14 from $t4 to $fp-32
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -32($fp)	# fill _tmp14 to $t4 from $fp-32
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -28($fp)	# spill _tmp13 from $t3 to $fp-28
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill n to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	  la $t3, _string2	# load label
	  sw $t3, -36($fp)	# spill _tmp15 from $t3 to $fp-36
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -36($fp)	# fill _tmp15 to $t3 from $fp-36
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill n to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp16 = LCall _factorial
	  jal _factorial     	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -40($fp)	# spill _tmp16 from $t3 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -40($fp)	# fill _tmp16 to $t3 from $fp-40
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t3, _string3	# load label
	  sw $t3, -44($fp)	# spill _tmp17 from $t3 to $fp-44
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -44($fp)	# fill _tmp17 to $t3 from $fp-44
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -48($fp)	# spill _tmp18 from $t3 to $fp-48
	# _tmp19 = n + _tmp18
	  lw $t3, -8($fp)	# fill n to $t3 from $fp-8
	  lw $t4, -48($fp)	# fill _tmp18 to $t4 from $fp-48
	  add $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp19 from $t5 to $fp-52
	# n = _tmp19
	  lw $t3, -52($fp)	# fill _tmp19 to $t3 from $fp-52
	# Goto _L1
	  sw $t3, -8($fp)	# spill n from $t3 to $fp-8
	  b _L1		# unconditional branch
  _L2:
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
