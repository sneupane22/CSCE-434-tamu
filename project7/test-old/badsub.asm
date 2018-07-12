	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp0 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp1 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp2 = _tmp0 < _tmp1
	  slt $t2, $t0, $t1	
	# IfZ _tmp2 Goto _L0
	  sw $t0, -16($fp)	# spill _tmp0 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp1 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	  beqz $t2, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -28($fp)	# spill _tmp3 from $t0 to $fp-28
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp5 = _tmp4 + _tmp0
	  lw $t1, -16($fp)	# fill _tmp0 to $t1 from $fp-16
	  add $t2, $t0, $t1	
	# _tmp6 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp7 = _tmp5 * _tmp6
	  mul $t4, $t2, $t3	
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  sw $t0, -32($fp)	# spill _tmp4 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp5 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp6 from $t3 to $fp-40
	  sw $t4, -44($fp)	# spill _tmp7 from $t4 to $fp-44
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $t1, -16($fp)	# fill _tmp0 to $t1 from $fp-16
	  sw $t1, 0($t0) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $t2, -40($fp)	# fill _tmp6 to $t2 from $fp-40
	  add $t3, $t0, $t2	
	# arr = _tmp9
	  move $t4, $t3		# copy value to register for arr
	# _tmp10 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# i = _tmp10
	  move $t6, $t5		# copy value to register for i
	  sw $t0, -48($fp)	# spill _tmp8 from $t0 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp9 from $t3 to $fp-52
	  sw $t4, -8($fp)	# spill arr from $t4 to $fp-8
	  sw $t5, -56($fp)	# spill _tmp10 from $t5 to $fp-56
	  sw $t6, -12($fp)	# spill i from $t6 to $fp-12
  _L1:
	# _tmp11 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp12 = i < _tmp11
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# _tmp13 = i == _tmp11
	  seq $t3, $t1, $t0	
	# _tmp14 = _tmp12 || _tmp13
	  or $t4, $t2, $t3	
	# IfZ _tmp14 Goto _L2
	  sw $t0, -60($fp)	# spill _tmp11 from $t0 to $fp-60
	  sw $t2, -64($fp)	# spill _tmp12 from $t2 to $fp-64
	  sw $t3, -68($fp)	# spill _tmp13 from $t3 to $fp-68
	  sw $t4, -72($fp)	# spill _tmp14 from $t4 to $fp-72
	  beqz $t4, _L2	# branch if _tmp14 is zero 
	# _tmp15 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp16 = i < _tmp15
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# _tmp17 = *(arr + -4)
	  lw $t3, -8($fp)	# fill arr to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp18 = i < _tmp17
	  slt $t5, $t1, $t4	
	# _tmp19 = _tmp18 == _tmp15
	  seq $t6, $t5, $t0	
	# _tmp20 = _tmp16 || _tmp19
	  or $t9, $t2, $t6	
	  sw $t9, -96($fp)	# spill _tmp20 from $t9 to $fp-96
	# IfZ _tmp20 Goto _L3
	  lw $t7, -96($fp)	# fill _tmp20 to $t7 from $fp-96
	  sw $t0, -76($fp)	# spill _tmp15 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp16 from $t2 to $fp-80
	  sw $t4, -84($fp)	# spill _tmp17 from $t4 to $fp-84
	  sw $t5, -88($fp)	# spill _tmp18 from $t5 to $fp-88
	  sw $t6, -92($fp)	# spill _tmp19 from $t6 to $fp-92
	  beqz $t7, _L3	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -100($fp)	# spill _tmp21 from $t0 to $fp-100
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp22 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp23 = _tmp22 * i
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp24 = arr + _tmp23
	  lw $t3, -8($fp)	# fill arr to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# *(_tmp24) = i
	  sw $t1, 0($t4) 	# store with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -104($fp)	# spill _tmp22 from $t0 to $fp-104
	  sw $t2, -108($fp)	# spill _tmp23 from $t2 to $fp-108
	  sw $t4, -112($fp)	# spill _tmp24 from $t4 to $fp-112
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -116($fp)	# spill _tmp25 from $t0 to $fp-116
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp27 = i + _tmp26
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# i = _tmp27
	  move $t1, $t2		# copy value to register for i
	# Goto _L1
	  sw $t0, -120($fp)	# spill _tmp26 from $t0 to $fp-120
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
	  sw $t2, -124($fp)	# spill _tmp27 from $t2 to $fp-124
	  b _L1		# unconditional branch
  _L2:
	# _tmp28 = "Done\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Done\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -128($fp)	# spill _tmp28 from $t0 to $fp-128
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
