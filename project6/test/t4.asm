	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Binky:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -8($fp)	# spill _tmp0 from $t3 to $fp-8
	# _tmp1 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp1 from $t3 to $fp-12
	# _tmp2 = _tmp0 < _tmp1
	  lw $t3, -8($fp)	# fill _tmp0 to $t3 from $fp-8
	  lw $t4, -12($fp)	# fill _tmp1 to $t4 from $fp-12
	  slt $t5, $t3, $t4	
	  sw $t5, -16($fp)	# spill _tmp2 from $t5 to $fp-16
	# _tmp3 = *(c + -4)
	  lw $t3, 12($fp)	# fill c to $t3 from $fp+12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp4 = _tmp0 < _tmp3
	  lw $t5, -8($fp)	# fill _tmp0 to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  sw $t6, -24($fp)	# spill _tmp4 from $t6 to $fp-24
	# _tmp5 = _tmp4 == _tmp1
	  lw $t3, -24($fp)	# fill _tmp4 to $t3 from $fp-24
	  lw $t4, -12($fp)	# fill _tmp1 to $t4 from $fp-12
	  seq $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp5 from $t5 to $fp-28
	# _tmp6 = _tmp2 || _tmp5
	  lw $t3, -16($fp)	# fill _tmp2 to $t3 from $fp-16
	  lw $t4, -28($fp)	# fill _tmp5 to $t4 from $fp-28
	  or $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp6 from $t5 to $fp-32
	# IfZ _tmp6 Goto _L0
	  lw $t3, -32($fp)	# fill _tmp6 to $t3 from $fp-32
	  beqz $t3, _L0	# branch if _tmp6 is zero 
	# _tmp7 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -36($fp)	# spill _tmp7 from $t4 to $fp-36
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -36($fp)	# fill _tmp7 to $t4 from $fp-36
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -32($fp)	# spill _tmp6 from $t3 to $fp-32
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp8 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -40($fp)	# spill _tmp8 from $t3 to $fp-40
	# _tmp9 = _tmp8 * _tmp0
	  lw $t3, -40($fp)	# fill _tmp8 to $t3 from $fp-40
	  lw $t4, -8($fp)	# fill _tmp0 to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp9 from $t5 to $fp-44
	# _tmp10 = c + _tmp9
	  lw $t3, 12($fp)	# fill c to $t3 from $fp+12
	  lw $t4, -44($fp)	# fill _tmp9 to $t4 from $fp-44
	  add $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp10 from $t5 to $fp-48
	# _tmp11 = *(_tmp10)
	  lw $t3, -48($fp)	# fill _tmp10 to $t3 from $fp-48
	  lw $t4, 0($t3) 	# load with offset
	# _tmp12 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -56($fp)	# spill _tmp12 from $t5 to $fp-56
	# _tmp13 = _tmp11 < _tmp12
	  lw $t5, -56($fp)	# fill _tmp12 to $t5 from $fp-56
	  slt $t6, $t4, $t5	
	  sw $t4, -52($fp)	# spill _tmp11 from $t4 to $fp-52
	  sw $t6, -60($fp)	# spill _tmp13 from $t6 to $fp-60
	# _tmp14 = *(b + -4)
	  lw $t3, 8($fp)	# fill b to $t3 from $fp+8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp15 = _tmp11 < _tmp14
	  lw $t5, -52($fp)	# fill _tmp11 to $t5 from $fp-52
	  slt $t6, $t5, $t4	
	  sw $t4, -64($fp)	# spill _tmp14 from $t4 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp15 from $t6 to $fp-68
	# _tmp16 = _tmp15 == _tmp12
	  lw $t3, -68($fp)	# fill _tmp15 to $t3 from $fp-68
	  lw $t4, -56($fp)	# fill _tmp12 to $t4 from $fp-56
	  seq $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp16 from $t5 to $fp-72
	# _tmp17 = _tmp13 || _tmp16
	  lw $t3, -60($fp)	# fill _tmp13 to $t3 from $fp-60
	  lw $t4, -72($fp)	# fill _tmp16 to $t4 from $fp-72
	  or $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp17 from $t5 to $fp-76
	# IfZ _tmp17 Goto _L1
	  lw $t3, -76($fp)	# fill _tmp17 to $t3 from $fp-76
	  beqz $t3, _L1	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string2	# load label
	  sw $t4, -80($fp)	# spill _tmp18 from $t4 to $fp-80
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -80($fp)	# fill _tmp18 to $t4 from $fp-80
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -76($fp)	# spill _tmp17 from $t3 to $fp-76
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp19 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -84($fp)	# spill _tmp19 from $t3 to $fp-84
	# _tmp20 = _tmp19 * _tmp11
	  lw $t3, -84($fp)	# fill _tmp19 to $t3 from $fp-84
	  lw $t4, -52($fp)	# fill _tmp11 to $t4 from $fp-52
	  mul $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp20 from $t5 to $fp-88
	# _tmp21 = b + _tmp20
	  lw $t3, 8($fp)	# fill b to $t3 from $fp+8
	  lw $t4, -88($fp)	# fill _tmp20 to $t4 from $fp-88
	  add $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp21 from $t5 to $fp-92
	# _tmp22 = *(_tmp21)
	  lw $t3, -92($fp)	# fill _tmp21 to $t3 from $fp-92
	  lw $t4, 0($t3) 	# load with offset
	# Return _tmp22
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -96($fp)	# spill _tmp22 from $t4 to $fp-96
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
	# BeginFunc 508
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 508	# decrement sp to make space for locals/temps
	# _tmp23 = 5
	  li $t3, 5		# load constant value 5 into $t3
	  sw $t3, -16($fp)	# spill _tmp23 from $t3 to $fp-16
	# _tmp24 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -20($fp)	# spill _tmp24 from $t3 to $fp-20
	# _tmp25 = _tmp23 < _tmp24
	  lw $t3, -16($fp)	# fill _tmp23 to $t3 from $fp-16
	  lw $t4, -20($fp)	# fill _tmp24 to $t4 from $fp-20
	  slt $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp25 from $t5 to $fp-24
	# IfZ _tmp25 Goto _L2
	  lw $t3, -24($fp)	# fill _tmp25 to $t3 from $fp-24
	  beqz $t3, _L2	# branch if _tmp25 is zero 
	# _tmp26 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string3	# load label
	  sw $t4, -28($fp)	# spill _tmp26 from $t4 to $fp-28
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -28($fp)	# fill _tmp26 to $t4 from $fp-28
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -24($fp)	# spill _tmp25 from $t3 to $fp-24
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp27 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -32($fp)	# spill _tmp27 from $t3 to $fp-32
	# _tmp28 = _tmp27 + _tmp23
	  lw $t3, -32($fp)	# fill _tmp27 to $t3 from $fp-32
	  lw $t4, -16($fp)	# fill _tmp23 to $t4 from $fp-16
	  add $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp28 from $t5 to $fp-36
	# _tmp29 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -40($fp)	# spill _tmp29 from $t3 to $fp-40
	# _tmp30 = _tmp28 * _tmp29
	  lw $t3, -36($fp)	# fill _tmp28 to $t3 from $fp-36
	  lw $t4, -40($fp)	# fill _tmp29 to $t4 from $fp-40
	  mul $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp30 from $t5 to $fp-44
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -44($fp)	# fill _tmp30 to $t3 from $fp-44
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp31 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -48($fp)	# spill _tmp31 from $t3 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp31) = _tmp23
	  lw $t3, -16($fp)	# fill _tmp23 to $t3 from $fp-16
	  lw $t4, -48($fp)	# fill _tmp31 to $t4 from $fp-48
	  sw $t3, 0($t4) 	# store with offset
	# _tmp32 = _tmp31 + _tmp29
	  lw $t5, -40($fp)	# fill _tmp29 to $t5 from $fp-40
	  add $t6, $t4, $t5	
	  sw $t4, -48($fp)	# spill _tmp31 from $t4 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp32 from $t6 to $fp-52
	# d = _tmp32
	  lw $t3, -52($fp)	# fill _tmp32 to $t3 from $fp-52
	# _tmp33 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -56($fp)	# spill _tmp33 from $t4 to $fp-56
	# _tmp34 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -60($fp)	# spill _tmp34 from $t4 to $fp-60
	# _tmp35 = _tmp33 < _tmp34
	  lw $t4, -56($fp)	# fill _tmp33 to $t4 from $fp-56
	  lw $t5, -60($fp)	# fill _tmp34 to $t5 from $fp-60
	  slt $t6, $t4, $t5	
	  sw $t3, -12($fp)	# spill d from $t3 to $fp-12
	  sw $t6, -64($fp)	# spill _tmp35 from $t6 to $fp-64
	# _tmp36 = *(d + -4)
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp37 = _tmp33 < _tmp36
	  lw $t5, -56($fp)	# fill _tmp33 to $t5 from $fp-56
	  slt $t6, $t5, $t4	
	  sw $t4, -68($fp)	# spill _tmp36 from $t4 to $fp-68
	  sw $t6, -72($fp)	# spill _tmp37 from $t6 to $fp-72
	# _tmp38 = _tmp37 == _tmp34
	  lw $t3, -72($fp)	# fill _tmp37 to $t3 from $fp-72
	  lw $t4, -60($fp)	# fill _tmp34 to $t4 from $fp-60
	  seq $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp38 from $t5 to $fp-76
	# _tmp39 = _tmp35 || _tmp38
	  lw $t3, -64($fp)	# fill _tmp35 to $t3 from $fp-64
	  lw $t4, -76($fp)	# fill _tmp38 to $t4 from $fp-76
	  or $t5, $t3, $t4	
	  sw $t5, -80($fp)	# spill _tmp39 from $t5 to $fp-80
	# IfZ _tmp39 Goto _L3
	  lw $t3, -80($fp)	# fill _tmp39 to $t3 from $fp-80
	  beqz $t3, _L3	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string4	# load label
	  sw $t4, -84($fp)	# spill _tmp40 from $t4 to $fp-84
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -84($fp)	# fill _tmp40 to $t4 from $fp-84
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -80($fp)	# spill _tmp39 from $t3 to $fp-80
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp41 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -88($fp)	# spill _tmp41 from $t3 to $fp-88
	# _tmp42 = _tmp41 * _tmp33
	  lw $t3, -88($fp)	# fill _tmp41 to $t3 from $fp-88
	  lw $t4, -56($fp)	# fill _tmp33 to $t4 from $fp-56
	  mul $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp42 from $t5 to $fp-92
	# _tmp43 = d + _tmp42
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -92($fp)	# fill _tmp42 to $t4 from $fp-92
	  add $t5, $t3, $t4	
	  sw $t5, -96($fp)	# spill _tmp43 from $t5 to $fp-96
	# _tmp44 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -100($fp)	# spill _tmp44 from $t3 to $fp-100
	# _tmp45 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -104($fp)	# spill _tmp45 from $t3 to $fp-104
	# _tmp46 = _tmp44 < _tmp45
	  lw $t3, -100($fp)	# fill _tmp44 to $t3 from $fp-100
	  lw $t4, -104($fp)	# fill _tmp45 to $t4 from $fp-104
	  slt $t5, $t3, $t4	
	  sw $t5, -108($fp)	# spill _tmp46 from $t5 to $fp-108
	# IfZ _tmp46 Goto _L4
	  lw $t3, -108($fp)	# fill _tmp46 to $t3 from $fp-108
	  beqz $t3, _L4	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string5	# load label
	  sw $t4, -112($fp)	# spill _tmp47 from $t4 to $fp-112
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -112($fp)	# fill _tmp47 to $t4 from $fp-112
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -108($fp)	# spill _tmp46 from $t3 to $fp-108
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp48 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -116($fp)	# spill _tmp48 from $t3 to $fp-116
	# _tmp49 = _tmp48 + _tmp44
	  lw $t3, -116($fp)	# fill _tmp48 to $t3 from $fp-116
	  lw $t4, -100($fp)	# fill _tmp44 to $t4 from $fp-100
	  add $t5, $t3, $t4	
	  sw $t5, -120($fp)	# spill _tmp49 from $t5 to $fp-120
	# _tmp50 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -124($fp)	# spill _tmp50 from $t3 to $fp-124
	# _tmp51 = _tmp49 * _tmp50
	  lw $t3, -120($fp)	# fill _tmp49 to $t3 from $fp-120
	  lw $t4, -124($fp)	# fill _tmp50 to $t4 from $fp-124
	  mul $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp51 from $t5 to $fp-128
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -128($fp)	# fill _tmp51 to $t3 from $fp-128
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -132($fp)	# spill _tmp52 from $t3 to $fp-132
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp52) = _tmp44
	  lw $t3, -100($fp)	# fill _tmp44 to $t3 from $fp-100
	  lw $t4, -132($fp)	# fill _tmp52 to $t4 from $fp-132
	  sw $t3, 0($t4) 	# store with offset
	# _tmp53 = _tmp52 + _tmp50
	  lw $t5, -124($fp)	# fill _tmp50 to $t5 from $fp-124
	  add $t6, $t4, $t5	
	  sw $t4, -132($fp)	# spill _tmp52 from $t4 to $fp-132
	  sw $t6, -136($fp)	# spill _tmp53 from $t6 to $fp-136
	# *(_tmp43) = _tmp53
	  lw $t3, -136($fp)	# fill _tmp53 to $t3 from $fp-136
	  lw $t4, -96($fp)	# fill _tmp43 to $t4 from $fp-96
	  sw $t3, 0($t4) 	# store with offset
	# _tmp54 = 10
	  li $t5, 10		# load constant value 10 into $t5
	  sw $t5, -140($fp)	# spill _tmp54 from $t5 to $fp-140
	# _tmp55 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -144($fp)	# spill _tmp55 from $t5 to $fp-144
	# _tmp56 = _tmp54 < _tmp55
	  lw $t5, -140($fp)	# fill _tmp54 to $t5 from $fp-140
	  lw $t6, -144($fp)	# fill _tmp55 to $t6 from $fp-144
	  slt $t7, $t5, $t6	
	  sw $t4, -96($fp)	# spill _tmp43 from $t4 to $fp-96
	  sw $t7, -148($fp)	# spill _tmp56 from $t7 to $fp-148
	# IfZ _tmp56 Goto _L5
	  lw $t3, -148($fp)	# fill _tmp56 to $t3 from $fp-148
	  beqz $t3, _L5	# branch if _tmp56 is zero 
	# _tmp57 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string6	# load label
	  sw $t4, -152($fp)	# spill _tmp57 from $t4 to $fp-152
	# PushParam _tmp57
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -152($fp)	# fill _tmp57 to $t4 from $fp-152
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -148($fp)	# spill _tmp56 from $t3 to $fp-148
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp58 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -156($fp)	# spill _tmp58 from $t3 to $fp-156
	# _tmp59 = _tmp58 + _tmp54
	  lw $t3, -156($fp)	# fill _tmp58 to $t3 from $fp-156
	  lw $t4, -140($fp)	# fill _tmp54 to $t4 from $fp-140
	  add $t5, $t3, $t4	
	  sw $t5, -160($fp)	# spill _tmp59 from $t5 to $fp-160
	# _tmp60 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -164($fp)	# spill _tmp60 from $t3 to $fp-164
	# _tmp61 = _tmp59 * _tmp60
	  lw $t3, -160($fp)	# fill _tmp59 to $t3 from $fp-160
	  lw $t4, -164($fp)	# fill _tmp60 to $t4 from $fp-164
	  mul $t5, $t3, $t4	
	  sw $t5, -168($fp)	# spill _tmp61 from $t5 to $fp-168
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -168($fp)	# fill _tmp61 to $t3 from $fp-168
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp62 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -172($fp)	# spill _tmp62 from $t3 to $fp-172
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp62) = _tmp54
	  lw $t3, -140($fp)	# fill _tmp54 to $t3 from $fp-140
	  lw $t4, -172($fp)	# fill _tmp62 to $t4 from $fp-172
	  sw $t3, 0($t4) 	# store with offset
	# _tmp63 = _tmp62 + _tmp60
	  lw $t5, -164($fp)	# fill _tmp60 to $t5 from $fp-164
	  add $t6, $t4, $t5	
	  sw $t4, -172($fp)	# spill _tmp62 from $t4 to $fp-172
	  sw $t6, -176($fp)	# spill _tmp63 from $t6 to $fp-176
	# c = _tmp63
	  lw $t3, -176($fp)	# fill _tmp63 to $t3 from $fp-176
	# _tmp64 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -180($fp)	# spill _tmp64 from $t4 to $fp-180
	# _tmp65 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -184($fp)	# spill _tmp65 from $t4 to $fp-184
	# _tmp66 = _tmp64 < _tmp65
	  lw $t4, -180($fp)	# fill _tmp64 to $t4 from $fp-180
	  lw $t5, -184($fp)	# fill _tmp65 to $t5 from $fp-184
	  slt $t6, $t4, $t5	
	  sw $t3, -8($fp)	# spill c from $t3 to $fp-8
	  sw $t6, -188($fp)	# spill _tmp66 from $t6 to $fp-188
	# _tmp67 = *(c + -4)
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp68 = _tmp64 < _tmp67
	  lw $t5, -180($fp)	# fill _tmp64 to $t5 from $fp-180
	  slt $t6, $t5, $t4	
	  sw $t4, -192($fp)	# spill _tmp67 from $t4 to $fp-192
	  sw $t6, -196($fp)	# spill _tmp68 from $t6 to $fp-196
	# _tmp69 = _tmp68 == _tmp65
	  lw $t3, -196($fp)	# fill _tmp68 to $t3 from $fp-196
	  lw $t4, -184($fp)	# fill _tmp65 to $t4 from $fp-184
	  seq $t5, $t3, $t4	
	  sw $t5, -200($fp)	# spill _tmp69 from $t5 to $fp-200
	# _tmp70 = _tmp66 || _tmp69
	  lw $t3, -188($fp)	# fill _tmp66 to $t3 from $fp-188
	  lw $t4, -200($fp)	# fill _tmp69 to $t4 from $fp-200
	  or $t5, $t3, $t4	
	  sw $t5, -204($fp)	# spill _tmp70 from $t5 to $fp-204
	# IfZ _tmp70 Goto _L6
	  lw $t3, -204($fp)	# fill _tmp70 to $t3 from $fp-204
	  beqz $t3, _L6	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string7	# load label
	  sw $t4, -208($fp)	# spill _tmp71 from $t4 to $fp-208
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -208($fp)	# fill _tmp71 to $t4 from $fp-208
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -204($fp)	# spill _tmp70 from $t3 to $fp-204
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp72 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -212($fp)	# spill _tmp72 from $t3 to $fp-212
	# _tmp73 = _tmp72 * _tmp64
	  lw $t3, -212($fp)	# fill _tmp72 to $t3 from $fp-212
	  lw $t4, -180($fp)	# fill _tmp64 to $t4 from $fp-180
	  mul $t5, $t3, $t4	
	  sw $t5, -216($fp)	# spill _tmp73 from $t5 to $fp-216
	# _tmp74 = c + _tmp73
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -216($fp)	# fill _tmp73 to $t4 from $fp-216
	  add $t5, $t3, $t4	
	  sw $t5, -220($fp)	# spill _tmp74 from $t5 to $fp-220
	# _tmp75 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -224($fp)	# spill _tmp75 from $t3 to $fp-224
	# _tmp76 = 5
	  li $t3, 5		# load constant value 5 into $t3
	  sw $t3, -228($fp)	# spill _tmp76 from $t3 to $fp-228
	# _tmp77 = 3
	  li $t3, 3		# load constant value 3 into $t3
	  sw $t3, -232($fp)	# spill _tmp77 from $t3 to $fp-232
	# _tmp78 = _tmp76 * _tmp77
	  lw $t3, -228($fp)	# fill _tmp76 to $t3 from $fp-228
	  lw $t4, -232($fp)	# fill _tmp77 to $t4 from $fp-232
	  mul $t5, $t3, $t4	
	  sw $t5, -236($fp)	# spill _tmp78 from $t5 to $fp-236
	# _tmp79 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -240($fp)	# spill _tmp79 from $t3 to $fp-240
	# _tmp80 = _tmp78 / _tmp79
	  lw $t3, -236($fp)	# fill _tmp78 to $t3 from $fp-236
	  lw $t4, -240($fp)	# fill _tmp79 to $t4 from $fp-240
	  div $t5, $t3, $t4	
	  sw $t5, -244($fp)	# spill _tmp80 from $t5 to $fp-244
	# _tmp81 = 2
	  li $t3, 2		# load constant value 2 into $t3
	  sw $t3, -248($fp)	# spill _tmp81 from $t3 to $fp-248
	# _tmp82 = _tmp80 % _tmp81
	  lw $t3, -244($fp)	# fill _tmp80 to $t3 from $fp-244
	  lw $t4, -248($fp)	# fill _tmp81 to $t4 from $fp-248
	  rem $t5, $t3, $t4	
	  sw $t5, -252($fp)	# spill _tmp82 from $t5 to $fp-252
	# _tmp83 = _tmp75 + _tmp82
	  lw $t3, -224($fp)	# fill _tmp75 to $t3 from $fp-224
	  lw $t4, -252($fp)	# fill _tmp82 to $t4 from $fp-252
	  add $t5, $t3, $t4	
	  sw $t5, -256($fp)	# spill _tmp83 from $t5 to $fp-256
	# *(_tmp74) = _tmp83
	  lw $t3, -256($fp)	# fill _tmp83 to $t3 from $fp-256
	  lw $t4, -220($fp)	# fill _tmp74 to $t4 from $fp-220
	  sw $t3, 0($t4) 	# store with offset
	# _tmp84 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -260($fp)	# spill _tmp84 from $t5 to $fp-260
	# _tmp85 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -264($fp)	# spill _tmp85 from $t5 to $fp-264
	# _tmp86 = _tmp84 < _tmp85
	  lw $t5, -260($fp)	# fill _tmp84 to $t5 from $fp-260
	  lw $t6, -264($fp)	# fill _tmp85 to $t6 from $fp-264
	  slt $t7, $t5, $t6	
	  sw $t4, -220($fp)	# spill _tmp74 from $t4 to $fp-220
	  sw $t7, -268($fp)	# spill _tmp86 from $t7 to $fp-268
	# _tmp87 = *(d + -4)
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp88 = _tmp84 < _tmp87
	  lw $t5, -260($fp)	# fill _tmp84 to $t5 from $fp-260
	  slt $t6, $t5, $t4	
	  sw $t4, -272($fp)	# spill _tmp87 from $t4 to $fp-272
	  sw $t6, -276($fp)	# spill _tmp88 from $t6 to $fp-276
	# _tmp89 = _tmp88 == _tmp85
	  lw $t3, -276($fp)	# fill _tmp88 to $t3 from $fp-276
	  lw $t4, -264($fp)	# fill _tmp85 to $t4 from $fp-264
	  seq $t5, $t3, $t4	
	  sw $t5, -280($fp)	# spill _tmp89 from $t5 to $fp-280
	# _tmp90 = _tmp86 || _tmp89
	  lw $t3, -268($fp)	# fill _tmp86 to $t3 from $fp-268
	  lw $t4, -280($fp)	# fill _tmp89 to $t4 from $fp-280
	  or $t5, $t3, $t4	
	  sw $t5, -284($fp)	# spill _tmp90 from $t5 to $fp-284
	# IfZ _tmp90 Goto _L7
	  lw $t3, -284($fp)	# fill _tmp90 to $t3 from $fp-284
	  beqz $t3, _L7	# branch if _tmp90 is zero 
	# _tmp91 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string8	# load label
	  sw $t4, -288($fp)	# spill _tmp91 from $t4 to $fp-288
	# PushParam _tmp91
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -288($fp)	# fill _tmp91 to $t4 from $fp-288
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -284($fp)	# spill _tmp90 from $t3 to $fp-284
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp92 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -292($fp)	# spill _tmp92 from $t3 to $fp-292
	# _tmp93 = _tmp92 * _tmp84
	  lw $t3, -292($fp)	# fill _tmp92 to $t3 from $fp-292
	  lw $t4, -260($fp)	# fill _tmp84 to $t4 from $fp-260
	  mul $t5, $t3, $t4	
	  sw $t5, -296($fp)	# spill _tmp93 from $t5 to $fp-296
	# _tmp94 = d + _tmp93
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -296($fp)	# fill _tmp93 to $t4 from $fp-296
	  add $t5, $t3, $t4	
	  sw $t5, -300($fp)	# spill _tmp94 from $t5 to $fp-300
	# _tmp95 = *(_tmp94)
	  lw $t3, -300($fp)	# fill _tmp94 to $t3 from $fp-300
	  lw $t4, 0($t3) 	# load with offset
	# _tmp96 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -308($fp)	# spill _tmp96 from $t5 to $fp-308
	# _tmp97 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -312($fp)	# spill _tmp97 from $t5 to $fp-312
	# _tmp98 = _tmp96 < _tmp97
	  lw $t5, -308($fp)	# fill _tmp96 to $t5 from $fp-308
	  lw $t6, -312($fp)	# fill _tmp97 to $t6 from $fp-312
	  slt $t7, $t5, $t6	
	  sw $t4, -304($fp)	# spill _tmp95 from $t4 to $fp-304
	  sw $t7, -316($fp)	# spill _tmp98 from $t7 to $fp-316
	# _tmp99 = *(c + -4)
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp100 = _tmp96 < _tmp99
	  lw $t5, -308($fp)	# fill _tmp96 to $t5 from $fp-308
	  slt $t6, $t5, $t4	
	  sw $t4, -320($fp)	# spill _tmp99 from $t4 to $fp-320
	  sw $t6, -324($fp)	# spill _tmp100 from $t6 to $fp-324
	# _tmp101 = _tmp100 == _tmp97
	  lw $t3, -324($fp)	# fill _tmp100 to $t3 from $fp-324
	  lw $t4, -312($fp)	# fill _tmp97 to $t4 from $fp-312
	  seq $t5, $t3, $t4	
	  sw $t5, -328($fp)	# spill _tmp101 from $t5 to $fp-328
	# _tmp102 = _tmp98 || _tmp101
	  lw $t3, -316($fp)	# fill _tmp98 to $t3 from $fp-316
	  lw $t4, -328($fp)	# fill _tmp101 to $t4 from $fp-328
	  or $t5, $t3, $t4	
	  sw $t5, -332($fp)	# spill _tmp102 from $t5 to $fp-332
	# IfZ _tmp102 Goto _L8
	  lw $t3, -332($fp)	# fill _tmp102 to $t3 from $fp-332
	  beqz $t3, _L8	# branch if _tmp102 is zero 
	# _tmp103 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string9	# load label
	  sw $t4, -336($fp)	# spill _tmp103 from $t4 to $fp-336
	# PushParam _tmp103
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -336($fp)	# fill _tmp103 to $t4 from $fp-336
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -332($fp)	# spill _tmp102 from $t3 to $fp-332
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp104 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -340($fp)	# spill _tmp104 from $t3 to $fp-340
	# _tmp105 = _tmp104 * _tmp96
	  lw $t3, -340($fp)	# fill _tmp104 to $t3 from $fp-340
	  lw $t4, -308($fp)	# fill _tmp96 to $t4 from $fp-308
	  mul $t5, $t3, $t4	
	  sw $t5, -344($fp)	# spill _tmp105 from $t5 to $fp-344
	# _tmp106 = c + _tmp105
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -344($fp)	# fill _tmp105 to $t4 from $fp-344
	  add $t5, $t3, $t4	
	  sw $t5, -348($fp)	# spill _tmp106 from $t5 to $fp-348
	# _tmp107 = *(_tmp106)
	  lw $t3, -348($fp)	# fill _tmp106 to $t3 from $fp-348
	  lw $t4, 0($t3) 	# load with offset
	# _tmp108 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -356($fp)	# spill _tmp108 from $t5 to $fp-356
	# _tmp109 = _tmp107 < _tmp108
	  lw $t5, -356($fp)	# fill _tmp108 to $t5 from $fp-356
	  slt $t6, $t4, $t5	
	  sw $t4, -352($fp)	# spill _tmp107 from $t4 to $fp-352
	  sw $t6, -360($fp)	# spill _tmp109 from $t6 to $fp-360
	# _tmp110 = *(_tmp95 + -4)
	  lw $t3, -304($fp)	# fill _tmp95 to $t3 from $fp-304
	  lw $t4, -4($t3) 	# load with offset
	# _tmp111 = _tmp107 < _tmp110
	  lw $t5, -352($fp)	# fill _tmp107 to $t5 from $fp-352
	  slt $t6, $t5, $t4	
	  sw $t4, -364($fp)	# spill _tmp110 from $t4 to $fp-364
	  sw $t6, -368($fp)	# spill _tmp111 from $t6 to $fp-368
	# _tmp112 = _tmp111 == _tmp108
	  lw $t3, -368($fp)	# fill _tmp111 to $t3 from $fp-368
	  lw $t4, -356($fp)	# fill _tmp108 to $t4 from $fp-356
	  seq $t5, $t3, $t4	
	  sw $t5, -372($fp)	# spill _tmp112 from $t5 to $fp-372
	# _tmp113 = _tmp109 || _tmp112
	  lw $t3, -360($fp)	# fill _tmp109 to $t3 from $fp-360
	  lw $t4, -372($fp)	# fill _tmp112 to $t4 from $fp-372
	  or $t5, $t3, $t4	
	  sw $t5, -376($fp)	# spill _tmp113 from $t5 to $fp-376
	# IfZ _tmp113 Goto _L9
	  lw $t3, -376($fp)	# fill _tmp113 to $t3 from $fp-376
	  beqz $t3, _L9	# branch if _tmp113 is zero 
	# _tmp114 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string10	# load label
	  sw $t4, -380($fp)	# spill _tmp114 from $t4 to $fp-380
	# PushParam _tmp114
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -380($fp)	# fill _tmp114 to $t4 from $fp-380
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -376($fp)	# spill _tmp113 from $t3 to $fp-376
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp115 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -384($fp)	# spill _tmp115 from $t3 to $fp-384
	# _tmp116 = _tmp115 * _tmp107
	  lw $t3, -384($fp)	# fill _tmp115 to $t3 from $fp-384
	  lw $t4, -352($fp)	# fill _tmp107 to $t4 from $fp-352
	  mul $t5, $t3, $t4	
	  sw $t5, -388($fp)	# spill _tmp116 from $t5 to $fp-388
	# _tmp117 = _tmp95 + _tmp116
	  lw $t3, -304($fp)	# fill _tmp95 to $t3 from $fp-304
	  lw $t4, -388($fp)	# fill _tmp116 to $t4 from $fp-388
	  add $t5, $t3, $t4	
	  sw $t5, -392($fp)	# spill _tmp117 from $t5 to $fp-392
	# _tmp118 = 55
	  li $t3, 55		# load constant value 55 into $t3
	  sw $t3, -396($fp)	# spill _tmp118 from $t3 to $fp-396
	# *(_tmp117) = _tmp118
	  lw $t3, -396($fp)	# fill _tmp118 to $t3 from $fp-396
	  lw $t4, -392($fp)	# fill _tmp117 to $t4 from $fp-392
	  sw $t3, 0($t4) 	# store with offset
	# _tmp119 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -400($fp)	# spill _tmp119 from $t5 to $fp-400
	# _tmp120 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -404($fp)	# spill _tmp120 from $t5 to $fp-404
	# _tmp121 = _tmp119 < _tmp120
	  lw $t5, -400($fp)	# fill _tmp119 to $t5 from $fp-400
	  lw $t6, -404($fp)	# fill _tmp120 to $t6 from $fp-404
	  slt $t7, $t5, $t6	
	  sw $t4, -392($fp)	# spill _tmp117 from $t4 to $fp-392
	  sw $t7, -408($fp)	# spill _tmp121 from $t7 to $fp-408
	# _tmp122 = *(c + -4)
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp123 = _tmp119 < _tmp122
	  lw $t5, -400($fp)	# fill _tmp119 to $t5 from $fp-400
	  slt $t6, $t5, $t4	
	  sw $t4, -412($fp)	# spill _tmp122 from $t4 to $fp-412
	  sw $t6, -416($fp)	# spill _tmp123 from $t6 to $fp-416
	# _tmp124 = _tmp123 == _tmp120
	  lw $t3, -416($fp)	# fill _tmp123 to $t3 from $fp-416
	  lw $t4, -404($fp)	# fill _tmp120 to $t4 from $fp-404
	  seq $t5, $t3, $t4	
	  sw $t5, -420($fp)	# spill _tmp124 from $t5 to $fp-420
	# _tmp125 = _tmp121 || _tmp124
	  lw $t3, -408($fp)	# fill _tmp121 to $t3 from $fp-408
	  lw $t4, -420($fp)	# fill _tmp124 to $t4 from $fp-420
	  or $t5, $t3, $t4	
	  sw $t5, -424($fp)	# spill _tmp125 from $t5 to $fp-424
	# IfZ _tmp125 Goto _L10
	  lw $t3, -424($fp)	# fill _tmp125 to $t3 from $fp-424
	  beqz $t3, _L10	# branch if _tmp125 is zero 
	# _tmp126 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string11	# load label
	  sw $t4, -428($fp)	# spill _tmp126 from $t4 to $fp-428
	# PushParam _tmp126
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -428($fp)	# fill _tmp126 to $t4 from $fp-428
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -424($fp)	# spill _tmp125 from $t3 to $fp-424
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp127 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -432($fp)	# spill _tmp127 from $t3 to $fp-432
	# _tmp128 = _tmp127 * _tmp119
	  lw $t3, -432($fp)	# fill _tmp127 to $t3 from $fp-432
	  lw $t4, -400($fp)	# fill _tmp119 to $t4 from $fp-400
	  mul $t5, $t3, $t4	
	  sw $t5, -436($fp)	# spill _tmp128 from $t5 to $fp-436
	# _tmp129 = c + _tmp128
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -436($fp)	# fill _tmp128 to $t4 from $fp-436
	  add $t5, $t3, $t4	
	  sw $t5, -440($fp)	# spill _tmp129 from $t5 to $fp-440
	# _tmp130 = *(_tmp129)
	  lw $t3, -440($fp)	# fill _tmp129 to $t3 from $fp-440
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp130
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -444($fp)	# spill _tmp130 from $t4 to $fp-444
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp131 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t3, _string12	# load label
	  sw $t3, -448($fp)	# spill _tmp131 from $t3 to $fp-448
	# PushParam _tmp131
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -448($fp)	# fill _tmp131 to $t3 from $fp-448
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp132 = 2
	  li $t3, 2		# load constant value 2 into $t3
	  sw $t3, -452($fp)	# spill _tmp132 from $t3 to $fp-452
	# _tmp133 = 100
	  li $t3, 100		# load constant value 100 into $t3
	  sw $t3, -456($fp)	# spill _tmp133 from $t3 to $fp-456
	# _tmp134 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -460($fp)	# spill _tmp134 from $t3 to $fp-460
	# _tmp135 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -464($fp)	# spill _tmp135 from $t3 to $fp-464
	# _tmp136 = _tmp134 < _tmp135
	  lw $t3, -460($fp)	# fill _tmp134 to $t3 from $fp-460
	  lw $t4, -464($fp)	# fill _tmp135 to $t4 from $fp-464
	  slt $t5, $t3, $t4	
	  sw $t5, -468($fp)	# spill _tmp136 from $t5 to $fp-468
	# _tmp137 = *(d + -4)
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp138 = _tmp134 < _tmp137
	  lw $t5, -460($fp)	# fill _tmp134 to $t5 from $fp-460
	  slt $t6, $t5, $t4	
	  sw $t4, -472($fp)	# spill _tmp137 from $t4 to $fp-472
	  sw $t6, -476($fp)	# spill _tmp138 from $t6 to $fp-476
	# _tmp139 = _tmp138 == _tmp135
	  lw $t3, -476($fp)	# fill _tmp138 to $t3 from $fp-476
	  lw $t4, -464($fp)	# fill _tmp135 to $t4 from $fp-464
	  seq $t5, $t3, $t4	
	  sw $t5, -480($fp)	# spill _tmp139 from $t5 to $fp-480
	# _tmp140 = _tmp136 || _tmp139
	  lw $t3, -468($fp)	# fill _tmp136 to $t3 from $fp-468
	  lw $t4, -480($fp)	# fill _tmp139 to $t4 from $fp-480
	  or $t5, $t3, $t4	
	  sw $t5, -484($fp)	# spill _tmp140 from $t5 to $fp-484
	# IfZ _tmp140 Goto _L11
	  lw $t3, -484($fp)	# fill _tmp140 to $t3 from $fp-484
	  beqz $t3, _L11	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string13	# load label
	  sw $t4, -488($fp)	# spill _tmp141 from $t4 to $fp-488
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -488($fp)	# fill _tmp141 to $t4 from $fp-488
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -484($fp)	# spill _tmp140 from $t3 to $fp-484
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp142 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -492($fp)	# spill _tmp142 from $t3 to $fp-492
	# _tmp143 = _tmp142 * _tmp134
	  lw $t3, -492($fp)	# fill _tmp142 to $t3 from $fp-492
	  lw $t4, -460($fp)	# fill _tmp134 to $t4 from $fp-460
	  mul $t5, $t3, $t4	
	  sw $t5, -496($fp)	# spill _tmp143 from $t5 to $fp-496
	# _tmp144 = d + _tmp143
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  lw $t4, -496($fp)	# fill _tmp143 to $t4 from $fp-496
	  add $t5, $t3, $t4	
	  sw $t5, -500($fp)	# spill _tmp144 from $t5 to $fp-500
	# _tmp145 = *(_tmp144)
	  lw $t3, -500($fp)	# fill _tmp144 to $t3 from $fp-500
	  lw $t4, 0($t3) 	# load with offset
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -8($fp)	# fill c to $t5 from $fp-8
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, -504($fp)	# spill _tmp145 from $t4 to $fp-504
	# PushParam _tmp145
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -504($fp)	# fill _tmp145 to $t3 from $fp-504
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp133
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -456($fp)	# fill _tmp133 to $t3 from $fp-456
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp146 = LCall _Binky
	  jal _Binky         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -508($fp)	# spill _tmp146 from $t3 to $fp-508
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp147 = _tmp132 * _tmp146
	  lw $t3, -452($fp)	# fill _tmp132 to $t3 from $fp-452
	  lw $t4, -508($fp)	# fill _tmp146 to $t4 from $fp-508
	  mul $t5, $t3, $t4	
	  sw $t5, -512($fp)	# spill _tmp147 from $t5 to $fp-512
	# PushParam _tmp147
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -512($fp)	# fill _tmp147 to $t3 from $fp-512
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
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
