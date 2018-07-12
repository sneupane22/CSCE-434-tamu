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
	# b = _tmp9
	  move $t4, $t3		# copy value to register for b
	# _tmp10 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp11 = sz < _tmp10
	  lw $t6, 4($fp)	# fill sz to $t6 from $fp+4
	  slt $t9, $t6, $t5	
	  sw $t9, -60($fp)	# spill _tmp11 from $t9 to $fp-60
	# IfZ _tmp11 Goto _L1
	  lw $t7, -60($fp)	# fill _tmp11 to $t7 from $fp-60
	  sw $t0, -48($fp)	# spill _tmp8 from $t0 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp9 from $t3 to $fp-52
	  sw $t4, 4($gp)	# spill b from $t4 to $gp+4
	  sw $t5, -56($fp)	# spill _tmp10 from $t5 to $fp-56
	  beqz $t7, _L1	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -64($fp)	# spill _tmp12 from $t0 to $fp-64
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
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp16 = _tmp14 * _tmp15
	  mul $t4, $t2, $t3	
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp17 = LCall _Alloc
	  sw $t0, -68($fp)	# spill _tmp13 from $t0 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp14 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp15 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp16 from $t4 to $fp-80
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
	  move $t4, $t3		# copy value to register for result
	# _tmp19 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# i = _tmp19
	  move $t6, $t5		# copy value to register for i
	  sw $t0, -84($fp)	# spill _tmp17 from $t0 to $fp-84
	  sw $t3, -88($fp)	# spill _tmp18 from $t3 to $fp-88
	  sw $t4, -12($fp)	# spill result from $t4 to $fp-12
	  sw $t5, -92($fp)	# spill _tmp19 from $t5 to $fp-92
	  sw $t6, -8($fp)	# spill i from $t6 to $fp-8
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
	  seq $t6, $t5, $t0	
	# _tmp26 = _tmp22 || _tmp25
	  or $t9, $t2, $t6	
	  sw $t9, -120($fp)	# spill _tmp26 from $t9 to $fp-120
	# IfZ _tmp26 Goto _L4
	  lw $t7, -120($fp)	# fill _tmp26 to $t7 from $fp-120
	  sw $t0, -100($fp)	# spill _tmp21 from $t0 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp22 from $t2 to $fp-104
	  sw $t4, -108($fp)	# spill _tmp23 from $t4 to $fp-108
	  sw $t5, -112($fp)	# spill _tmp24 from $t5 to $fp-112
	  sw $t6, -116($fp)	# spill _tmp25 from $t6 to $fp-116
	  beqz $t7, _L4	# branch if _tmp26 is zero 
	# _tmp27 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp27
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -124($fp)	# spill _tmp27 from $t0 to $fp-124
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
	  lw $t3, -12($fp)	# fill result to $t3 from $fp-12
	  add $t4, $t3, $t2	
	# *(_tmp30) = i
	  sw $t1, 0($t4) 	# store with offset
	# _tmp31 = 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp32 = i + _tmp31
	  add $t6, $t1, $t5	
	# i = _tmp32
	  move $t1, $t6		# copy value to register for i
	# Goto _L2
	  sw $t0, -128($fp)	# spill _tmp28 from $t0 to $fp-128
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -132($fp)	# spill _tmp29 from $t2 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp30 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp31 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp32 from $t6 to $fp-144
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
	  seq $t6, $t5, $t1	
	# _tmp39 = _tmp35 || _tmp38
	  or $t9, $t2, $t6	
	  sw $t9, -172($fp)	# spill _tmp39 from $t9 to $fp-172
	# IfZ _tmp39 Goto _L5
	  lw $t7, -172($fp)	# fill _tmp39 to $t7 from $fp-172
	  sw $t0, -148($fp)	# spill _tmp33 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp34 from $t1 to $fp-152
	  sw $t2, -156($fp)	# spill _tmp35 from $t2 to $fp-156
	  sw $t4, -160($fp)	# spill _tmp36 from $t4 to $fp-160
	  sw $t5, -164($fp)	# spill _tmp37 from $t5 to $fp-164
	  sw $t6, -168($fp)	# spill _tmp38 from $t6 to $fp-168
	  beqz $t7, _L5	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -176($fp)	# spill _tmp40 from $t0 to $fp-176
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
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  add $t4, $t3, $t2	
	# _tmp44 = "Done"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Done"
	  .text
	  la $t5, _string5	# load label
	# *(_tmp43) = _tmp44
	  sw $t5, 0($t4) 	# store with offset
	# Return result
	  lw $t6, -12($fp)	# fill result to $t6 from $fp-12
	  move $v0, $t6		# assign return value into $v0
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
	  sw $t0, -12($fp)	# spill _tmp45 from $t0 to $fp-12
	  jal _tester        	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp46
	  move $t1, $t0		# copy value to register for d
	# _tmp47 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp48 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp49 = _tmp47 < _tmp48
	  slt $t4, $t2, $t3	
	# _tmp50 = *(d + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp51 = _tmp47 < _tmp50
	  slt $t6, $t2, $t5	
	# _tmp52 = _tmp51 == _tmp48
	  seq $t9, $t6, $t3	
	  sw $t9, -40($fp)	# spill _tmp52 from $t9 to $fp-40
	# _tmp53 = _tmp49 || _tmp52
	  lw $t8, -40($fp)	# fill _tmp52 to $t8 from $fp-40
	  or $t9, $t4, $t8	
	  sw $t9, -44($fp)	# spill _tmp53 from $t9 to $fp-44
	# IfZ _tmp53 Goto _L6
	  lw $t7, -44($fp)	# fill _tmp53 to $t7 from $fp-44
	  sw $t0, -16($fp)	# spill _tmp46 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill d from $t1 to $fp-8
	  sw $t2, -20($fp)	# spill _tmp47 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp48 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp49 from $t4 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp50 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp51 from $t6 to $fp-36
	  beqz $t7, _L6	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -48($fp)	# spill _tmp54 from $t0 to $fp-48
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
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp58 = *(_tmp57)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp59 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp60 = _tmp58 < _tmp59
	  slt $t9, $t5, $t6	
	  sw $t9, -72($fp)	# spill _tmp60 from $t9 to $fp-72
	# _tmp61 = *(d + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -76($fp)	# spill _tmp61 from $t9 to $fp-76
	# _tmp62 = _tmp58 < _tmp61
	  lw $t8, -76($fp)	# fill _tmp61 to $t8 from $fp-76
	  slt $t9, $t5, $t8	
	  sw $t9, -80($fp)	# spill _tmp62 from $t9 to $fp-80
	# _tmp63 = _tmp62 == _tmp59
	  lw $t7, -80($fp)	# fill _tmp62 to $t7 from $fp-80
	  seq $t9, $t7, $t6	
	  sw $t9, -84($fp)	# spill _tmp63 from $t9 to $fp-84
	# _tmp64 = _tmp60 || _tmp63
	  lw $t7, -72($fp)	# fill _tmp60 to $t7 from $fp-72
	  lw $t8, -84($fp)	# fill _tmp63 to $t8 from $fp-84
	  or $t9, $t7, $t8	
	  sw $t9, -88($fp)	# spill _tmp64 from $t9 to $fp-88
	# IfZ _tmp64 Goto _L7
	  lw $t7, -88($fp)	# fill _tmp64 to $t7 from $fp-88
	  sw $t0, -52($fp)	# spill _tmp55 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp56 from $t2 to $fp-56
	  sw $t4, -60($fp)	# spill _tmp57 from $t4 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp58 from $t5 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp59 from $t6 to $fp-68
	  beqz $t7, _L7	# branch if _tmp64 is zero 
	# _tmp65 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -92($fp)	# spill _tmp65 from $t0 to $fp-92
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
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp69 = *(_tmp68)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -96($fp)	# spill _tmp66 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp67 from $t2 to $fp-100
	  sw $t4, -104($fp)	# spill _tmp68 from $t4 to $fp-104
	  sw $t5, -108($fp)	# spill _tmp69 from $t5 to $fp-108
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
	  sw $t0, -112($fp)	# spill _tmp70 from $t0 to $fp-112
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
	  sw $t1, -116($fp)	# spill _tmp71 from $t1 to $fp-116
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
	  sw $t0, -120($fp)	# spill _tmp72 from $t0 to $fp-120
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
	  seq $t6, $t5, $t1	
	# _tmp79 = _tmp75 || _tmp78
	  or $t9, $t2, $t6	
	  sw $t9, -148($fp)	# spill _tmp79 from $t9 to $fp-148
	# IfZ _tmp79 Goto _L8
	  lw $t7, -148($fp)	# fill _tmp79 to $t7 from $fp-148
	  sw $t0, -124($fp)	# spill _tmp73 from $t0 to $fp-124
	  sw $t1, -128($fp)	# spill _tmp74 from $t1 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp75 from $t2 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp76 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp77 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp78 from $t6 to $fp-144
	  beqz $t7, _L8	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -152($fp)	# spill _tmp80 from $t0 to $fp-152
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
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  add $t4, $t3, $t2	
	# _tmp84 = *(_tmp83)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -156($fp)	# spill _tmp81 from $t0 to $fp-156
	  sw $t2, -160($fp)	# spill _tmp82 from $t2 to $fp-160
	  sw $t4, -164($fp)	# spill _tmp83 from $t4 to $fp-164
	  sw $t5, -168($fp)	# spill _tmp84 from $t5 to $fp-168
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
	  sw $t0, -172($fp)	# spill _tmp85 from $t0 to $fp-172
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
