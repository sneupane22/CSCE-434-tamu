	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _tester:
	# BeginFunc 188
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 188	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp2 = _tmp0 < _tmp1
	  slt $t2, $t0, $t1	
	# IfZ _tmp2 Goto _L0
	  sw $t0, -16($fp)	# spill _tmp0 from $t0 to $fp-16
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
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp7 = _tmp5 * _tmp6
	  mul $t3, $t2, $t0	
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  sw $t0, -40($fp)	# spill _tmp6 from $t0 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $t1, -16($fp)	# fill _tmp0 to $t1 from $fp-16
	  sw $t1, 0($t0) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $t1, -40($fp)	# fill _tmp6 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	# b = _tmp9
	  move $t0, $t2		# copy value to register for b
	# _tmp10 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp11 = sz < _tmp10
	  lw $t2, 4($fp)	# fill sz to $t2 from $fp+4
	  slt $t3, $t2, $t1	
	# IfZ _tmp11 Goto _L1
	  sw $t0, 4($gp)	# spill b from $t0 to $gp+4
	  sw $t3, -60($fp)	# spill _tmp11 from $t3 to $fp-60
	  beqz $t3, _L1	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp13 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp14 = _tmp13 + sz
	  lw $t1, 4($fp)	# fill sz to $t1 from $fp+4
	  add $t2, $t0, $t1	
	# _tmp15 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp16 = _tmp14 * _tmp15
	  mul $t3, $t2, $t0	
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp17 = LCall _Alloc
	  sw $t0, -76($fp)	# spill _tmp15 from $t0 to $fp-76
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp17) = sz
	  lw $t1, 4($fp)	# fill sz to $t1 from $fp+4
	  sw $t1, 0($t0) 	# store with offset
	# _tmp18 = _tmp17 + _tmp15
	  lw $t2, -76($fp)	# fill _tmp15 to $t2 from $fp-76
	  add $t3, $t0, $t2	
	# result = _tmp18
	  move $t0, $t3		# copy value to register for result
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# i = _tmp19
	  move $t3, $t2		# copy value to register for i
	  sw $t0, -12($fp)	# spill result from $t0 to $fp-12
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L2:
	# _tmp20 = i < sz
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, 4($fp)	# fill sz to $t1 from $fp+4
	  slt $t2, $t0, $t1	
	# IfZ _tmp20 Goto _L3
	  sw $t2, -96($fp)	# spill _tmp20 from $t2 to $fp-96
	  beqz $t2, _L3	# branch if _tmp20 is zero 
	# _tmp21 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp22 = i < _tmp21
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp23 = *(result + -4)
	  lw $t3, -12($fp)	# fill result to $t3 from $fp-12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp24 = i < _tmp23
	  slt $t5, $t1, $t4	
	# _tmp25 = _tmp24 == _tmp21
	  seq $t4, $t5, $t0	
	# _tmp26 = _tmp22 || _tmp25
	  or $t0, $t2, $t4	
	# IfZ _tmp26 Goto _L4
	  sw $t0, -120($fp)	# spill _tmp26 from $t0 to $fp-120
	  beqz $t0, _L4	# branch if _tmp26 is zero 
	# _tmp27 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp28 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp29 = _tmp28 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp30 = result + _tmp29
	  lw $t0, -12($fp)	# fill result to $t0 from $fp-12
	  add $t3, $t0, $t2	
	# *(_tmp30) = i
	  sw $t1, 0($t3) 	# store with offset
	# _tmp31 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp32 = i + _tmp31
	  add $t3, $t1, $t2	
	# i = _tmp32
	  move $t1, $t3		# copy value to register for i
	# Goto _L2
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L2		# unconditional branch
  _L3:
	# _tmp33 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp34 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp35 = _tmp33 < _tmp34
	  slt $t2, $t0, $t1	
	# _tmp36 = *(b + -4)
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp37 = _tmp33 < _tmp36
	  slt $t5, $t0, $t4	
	# _tmp38 = _tmp37 == _tmp34
	  seq $t4, $t5, $t1	
	# _tmp39 = _tmp35 || _tmp38
	  or $t1, $t2, $t4	
	# IfZ _tmp39 Goto _L5
	  sw $t0, -148($fp)	# spill _tmp33 from $t0 to $fp-148
	  sw $t1, -172($fp)	# spill _tmp39 from $t1 to $fp-172
	  beqz $t1, _L5	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp41 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp42 = _tmp41 * _tmp33
	  lw $t1, -148($fp)	# fill _tmp33 to $t1 from $fp-148
	  mul $t2, $t0, $t1	
	# _tmp43 = b + _tmp42
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  add $t1, $t0, $t2	
	# _tmp44 = "Done"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Done"
	  .text
	  la $t0, _string5	# load label
	# *(_tmp43) = _tmp44
	  sw $t0, 0($t1) 	# store with offset
	# Return result
	  lw $t0, -12($fp)	# fill result to $t0 from $fp-12
	  move $v0, $t0		# assign return value into $v0
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
	# BeginFunc 168
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp45 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp46 = LCall _tester
	  jal _tester        	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp46
	  move $t1, $t0		# copy value to register for d
	# _tmp47 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp48 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp49 = _tmp47 < _tmp48
	  slt $t3, $t0, $t2	
	# _tmp50 = *(d + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp51 = _tmp47 < _tmp50
	  slt $t5, $t0, $t4	
	# _tmp52 = _tmp51 == _tmp48
	  seq $t4, $t5, $t2	
	# _tmp53 = _tmp49 || _tmp52
	  or $t2, $t3, $t4	
	# IfZ _tmp53 Goto _L6
	  sw $t0, -20($fp)	# spill _tmp47 from $t0 to $fp-20
	  sw $t1, -8($fp)	# spill d from $t1 to $fp-8
	  sw $t2, -44($fp)	# spill _tmp53 from $t2 to $fp-44
	  beqz $t2, _L6	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp55 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp56 = _tmp55 * _tmp47
	  lw $t1, -20($fp)	# fill _tmp47 to $t1 from $fp-20
	  mul $t2, $t0, $t1	
	# _tmp57 = d + _tmp56
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp58 = *(_tmp57)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp59 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp60 = _tmp58 < _tmp59
	  slt $t3, $t2, $t1	
	# _tmp61 = *(d + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp62 = _tmp58 < _tmp61
	  slt $t5, $t2, $t4	
	# _tmp63 = _tmp62 == _tmp59
	  seq $t4, $t5, $t1	
	# _tmp64 = _tmp60 || _tmp63
	  or $t1, $t3, $t4	
	# IfZ _tmp64 Goto _L7
	  sw $t1, -88($fp)	# spill _tmp64 from $t1 to $fp-88
	  sw $t2, -64($fp)	# spill _tmp58 from $t2 to $fp-64
	  beqz $t1, _L7	# branch if _tmp64 is zero 
	# _tmp65 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp66 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp67 = _tmp66 * _tmp58
	  lw $t1, -64($fp)	# fill _tmp58 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	# _tmp68 = d + _tmp67
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp69 = *(_tmp68)
	  lw $t2, 0($t1) 	# load with offset
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = "\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp71 = *(d + -4)
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t1, -4($t0) 	# load with offset
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp72 = "\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp74 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp75 = _tmp73 < _tmp74
	  slt $t2, $t0, $t1	
	# _tmp76 = *(b + -4)
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp77 = _tmp73 < _tmp76
	  slt $t5, $t0, $t4	
	# _tmp78 = _tmp77 == _tmp74
	  seq $t4, $t5, $t1	
	# _tmp79 = _tmp75 || _tmp78
	  or $t1, $t2, $t4	
	# IfZ _tmp79 Goto _L8
	  sw $t0, -124($fp)	# spill _tmp73 from $t0 to $fp-124
	  sw $t1, -148($fp)	# spill _tmp79 from $t1 to $fp-148
	  beqz $t1, _L8	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp81 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp82 = _tmp81 * _tmp73
	  lw $t1, -124($fp)	# fill _tmp73 to $t1 from $fp-124
	  mul $t2, $t0, $t1	
	# _tmp83 = b + _tmp82
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  add $t1, $t0, $t2	
	# _tmp84 = *(_tmp83)
	  lw $t0, 0($t1) 	# load with offset
	# PushParam _tmp84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp85 = "\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp85
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
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
