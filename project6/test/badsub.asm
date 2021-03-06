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
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -16($fp)	# spill _tmp0 from $t3 to $fp-16
	# _tmp1 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -20($fp)	# spill _tmp1 from $t3 to $fp-20
	# _tmp2 = _tmp0 < _tmp1
	  lw $t3, -16($fp)	# fill _tmp0 to $t3 from $fp-16
	  lw $t4, -20($fp)	# fill _tmp1 to $t4 from $fp-20
	  slt $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp2 from $t5 to $fp-24
	# IfZ _tmp2 Goto _L0
	  lw $t3, -24($fp)	# fill _tmp2 to $t3 from $fp-24
	  beqz $t3, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -28($fp)	# spill _tmp3 from $t4 to $fp-28
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -28($fp)	# fill _tmp3 to $t4 from $fp-28
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -24($fp)	# spill _tmp2 from $t3 to $fp-24
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -32($fp)	# spill _tmp4 from $t3 to $fp-32
	# _tmp5 = _tmp4 + _tmp0
	  lw $t3, -32($fp)	# fill _tmp4 to $t3 from $fp-32
	  lw $t4, -16($fp)	# fill _tmp0 to $t4 from $fp-16
	  add $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp5 from $t5 to $fp-36
	# _tmp6 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -40($fp)	# spill _tmp6 from $t3 to $fp-40
	# _tmp7 = _tmp5 * _tmp6
	  lw $t3, -36($fp)	# fill _tmp5 to $t3 from $fp-36
	  lw $t4, -40($fp)	# fill _tmp6 to $t4 from $fp-40
	  mul $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp7 from $t5 to $fp-44
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -44($fp)	# fill _tmp7 to $t3 from $fp-44
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -48($fp)	# spill _tmp8 from $t3 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $t3, -16($fp)	# fill _tmp0 to $t3 from $fp-16
	  lw $t4, -48($fp)	# fill _tmp8 to $t4 from $fp-48
	  sw $t3, 0($t4) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $t5, -40($fp)	# fill _tmp6 to $t5 from $fp-40
	  add $t6, $t4, $t5	
	  sw $t4, -48($fp)	# spill _tmp8 from $t4 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp9 from $t6 to $fp-52
	# arr = _tmp9
	  lw $t3, -52($fp)	# fill _tmp9 to $t3 from $fp-52
	# _tmp10 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -56($fp)	# spill _tmp10 from $t4 to $fp-56
	# i = _tmp10
	  lw $t4, -56($fp)	# fill _tmp10 to $t4 from $fp-56
	  sw $t3, -8($fp)	# spill arr from $t3 to $fp-8
	  sw $t4, -12($fp)	# spill i from $t4 to $fp-12
  _L1:
	# _tmp11 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -60($fp)	# spill _tmp11 from $t3 to $fp-60
	# _tmp12 = i < _tmp11
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -60($fp)	# fill _tmp11 to $t4 from $fp-60
	  slt $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp12 from $t5 to $fp-64
	# _tmp13 = i == _tmp11
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -60($fp)	# fill _tmp11 to $t4 from $fp-60
	  seq $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp13 from $t5 to $fp-68
	# _tmp14 = _tmp12 || _tmp13
	  lw $t3, -64($fp)	# fill _tmp12 to $t3 from $fp-64
	  lw $t4, -68($fp)	# fill _tmp13 to $t4 from $fp-68
	  or $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp14 from $t5 to $fp-72
	# IfZ _tmp14 Goto _L2
	  lw $t3, -72($fp)	# fill _tmp14 to $t3 from $fp-72
	  beqz $t3, _L2	# branch if _tmp14 is zero 
	# _tmp15 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -76($fp)	# spill _tmp15 from $t4 to $fp-76
	# _tmp16 = i < _tmp15
	  lw $t4, -12($fp)	# fill i to $t4 from $fp-12
	  lw $t5, -76($fp)	# fill _tmp15 to $t5 from $fp-76
	  slt $t6, $t4, $t5	
	  sw $t3, -72($fp)	# spill _tmp14 from $t3 to $fp-72
	  sw $t6, -80($fp)	# spill _tmp16 from $t6 to $fp-80
	# _tmp17 = *(arr + -4)
	  lw $t3, -8($fp)	# fill arr to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp18 = i < _tmp17
	  lw $t5, -12($fp)	# fill i to $t5 from $fp-12
	  slt $t6, $t5, $t4	
	  sw $t4, -84($fp)	# spill _tmp17 from $t4 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp18 from $t6 to $fp-88
	# _tmp19 = _tmp18 == _tmp15
	  lw $t3, -88($fp)	# fill _tmp18 to $t3 from $fp-88
	  lw $t4, -76($fp)	# fill _tmp15 to $t4 from $fp-76
	  seq $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp19 from $t5 to $fp-92
	# _tmp20 = _tmp16 || _tmp19
	  lw $t3, -80($fp)	# fill _tmp16 to $t3 from $fp-80
	  lw $t4, -92($fp)	# fill _tmp19 to $t4 from $fp-92
	  or $t5, $t3, $t4	
	  sw $t5, -96($fp)	# spill _tmp20 from $t5 to $fp-96
	# IfZ _tmp20 Goto _L3
	  lw $t3, -96($fp)	# fill _tmp20 to $t3 from $fp-96
	  beqz $t3, _L3	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string2	# load label
	  sw $t4, -100($fp)	# spill _tmp21 from $t4 to $fp-100
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -100($fp)	# fill _tmp21 to $t4 from $fp-100
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -96($fp)	# spill _tmp20 from $t3 to $fp-96
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp22 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -104($fp)	# spill _tmp22 from $t3 to $fp-104
	# _tmp23 = _tmp22 * i
	  lw $t3, -104($fp)	# fill _tmp22 to $t3 from $fp-104
	  lw $t4, -12($fp)	# fill i to $t4 from $fp-12
	  mul $t5, $t3, $t4	
	  sw $t5, -108($fp)	# spill _tmp23 from $t5 to $fp-108
	# _tmp24 = arr + _tmp23
	  lw $t3, -8($fp)	# fill arr to $t3 from $fp-8
	  lw $t4, -108($fp)	# fill _tmp23 to $t4 from $fp-108
	  add $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp24 from $t5 to $fp-112
	# *(_tmp24) = i
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -112($fp)	# fill _tmp24 to $t4 from $fp-112
	  sw $t3, 0($t4) 	# store with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -112($fp)	# spill _tmp24 from $t4 to $fp-112
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp25 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t3, _string3	# load label
	  sw $t3, -116($fp)	# spill _tmp25 from $t3 to $fp-116
	# PushParam _tmp25
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -116($fp)	# fill _tmp25 to $t3 from $fp-116
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -120($fp)	# spill _tmp26 from $t3 to $fp-120
	# _tmp27 = i + _tmp26
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -120($fp)	# fill _tmp26 to $t4 from $fp-120
	  add $t5, $t3, $t4	
	  sw $t5, -124($fp)	# spill _tmp27 from $t5 to $fp-124
	# i = _tmp27
	  lw $t3, -124($fp)	# fill _tmp27 to $t3 from $fp-124
	# Goto _L1
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
	  b _L1		# unconditional branch
  _L2:
	# _tmp28 = "Done\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Done\n"
	  .text
	  la $t3, _string4	# load label
	  sw $t3, -128($fp)	# spill _tmp28 from $t3 to $fp-128
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -128($fp)	# fill _tmp28 to $t3 from $fp-128
	  sw $t3, 4($sp)	# copy param value to stack
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
