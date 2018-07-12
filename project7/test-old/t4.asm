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
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp1 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp2 = _tmp0 < _tmp1
	  slt $t2, $t0, $t1	
	# _tmp3 = *(c + -4)
	  lw $t3, 12($fp)	# fill c to $t3 from $fp+12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp4 = _tmp0 < _tmp3
	  slt $t5, $t0, $t4	
	# _tmp5 = _tmp4 == _tmp1
	  seq $t6, $t5, $t1	
	# _tmp6 = _tmp2 || _tmp5
	  or $t9, $t2, $t6	
	  sw $t9, -32($fp)	# spill _tmp6 from $t9 to $fp-32
	# IfZ _tmp6 Goto _L0
	  lw $t7, -32($fp)	# fill _tmp6 to $t7 from $fp-32
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t1, -12($fp)	# spill _tmp1 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp4 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp5 from $t6 to $fp-28
	  beqz $t7, _L0	# branch if _tmp6 is zero 
	# _tmp7 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -36($fp)	# spill _tmp7 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp8 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp9 = _tmp8 * _tmp0
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp10 = c + _tmp9
	  lw $t3, 12($fp)	# fill c to $t3 from $fp+12
	  add $t4, $t3, $t2	
	# _tmp11 = *(_tmp10)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp12 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp13 = _tmp11 < _tmp12
	  slt $t9, $t5, $t6	
	  sw $t9, -60($fp)	# spill _tmp13 from $t9 to $fp-60
	# _tmp14 = *(b + -4)
	  lw $t7, 8($fp)	# fill b to $t7 from $fp+8
	  lw $t9, -4($t7) 	# load with offset
	  sw $t9, -64($fp)	# spill _tmp14 from $t9 to $fp-64
	# _tmp15 = _tmp11 < _tmp14
	  lw $t8, -64($fp)	# fill _tmp14 to $t8 from $fp-64
	  slt $t9, $t5, $t8	
	  sw $t9, -68($fp)	# spill _tmp15 from $t9 to $fp-68
	# _tmp16 = _tmp15 == _tmp12
	  lw $t7, -68($fp)	# fill _tmp15 to $t7 from $fp-68
	  seq $t9, $t7, $t6	
	  sw $t9, -72($fp)	# spill _tmp16 from $t9 to $fp-72
	# _tmp17 = _tmp13 || _tmp16
	  lw $t7, -60($fp)	# fill _tmp13 to $t7 from $fp-60
	  lw $t8, -72($fp)	# fill _tmp16 to $t8 from $fp-72
	  or $t9, $t7, $t8	
	  sw $t9, -76($fp)	# spill _tmp17 from $t9 to $fp-76
	# IfZ _tmp17 Goto _L1
	  lw $t7, -76($fp)	# fill _tmp17 to $t7 from $fp-76
	  sw $t0, -40($fp)	# spill _tmp8 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp10 from $t4 to $fp-48
	  sw $t5, -52($fp)	# spill _tmp11 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp12 from $t6 to $fp-56
	  beqz $t7, _L1	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -80($fp)	# spill _tmp18 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp19 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp20 = _tmp19 * _tmp11
	  lw $t1, -52($fp)	# fill _tmp11 to $t1 from $fp-52
	  mul $t2, $t0, $t1	
	# _tmp21 = b + _tmp20
	  lw $t3, 8($fp)	# fill b to $t3 from $fp+8
	  add $t4, $t3, $t2	
	# _tmp22 = *(_tmp21)
	  lw $t5, 0($t4) 	# load with offset
	# Return _tmp22
	  move $v0, $t5		# assign return value into $v0
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
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp24 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp25 = _tmp23 < _tmp24
	  slt $t2, $t0, $t1	
	# IfZ _tmp25 Goto _L2
	  sw $t0, -16($fp)	# spill _tmp23 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp24 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp25 from $t2 to $fp-24
	  beqz $t2, _L2	# branch if _tmp25 is zero 
	# _tmp26 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -28($fp)	# spill _tmp26 from $t0 to $fp-28
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp27 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp28 = _tmp27 + _tmp23
	  lw $t1, -16($fp)	# fill _tmp23 to $t1 from $fp-16
	  add $t2, $t0, $t1	
	# _tmp29 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp30 = _tmp28 * _tmp29
	  mul $t4, $t2, $t3	
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp31 = LCall _Alloc
	  sw $t0, -32($fp)	# spill _tmp27 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp28 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp29 from $t3 to $fp-40
	  sw $t4, -44($fp)	# spill _tmp30 from $t4 to $fp-44
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp31) = _tmp23
	  lw $t1, -16($fp)	# fill _tmp23 to $t1 from $fp-16
	  sw $t1, 0($t0) 	# store with offset
	# _tmp32 = _tmp31 + _tmp29
	  lw $t2, -40($fp)	# fill _tmp29 to $t2 from $fp-40
	  add $t3, $t0, $t2	
	# d = _tmp32
	  move $t4, $t3		# copy value to register for d
	# _tmp33 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp34 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp35 = _tmp33 < _tmp34
	  slt $t9, $t5, $t6	
	  sw $t9, -64($fp)	# spill _tmp35 from $t9 to $fp-64
	# _tmp36 = *(d + -4)
	  lw $t9, -4($t4) 	# load with offset
	  sw $t9, -68($fp)	# spill _tmp36 from $t9 to $fp-68
	# _tmp37 = _tmp33 < _tmp36
	  lw $t8, -68($fp)	# fill _tmp36 to $t8 from $fp-68
	  slt $t9, $t5, $t8	
	  sw $t9, -72($fp)	# spill _tmp37 from $t9 to $fp-72
	# _tmp38 = _tmp37 == _tmp34
	  lw $t7, -72($fp)	# fill _tmp37 to $t7 from $fp-72
	  seq $t9, $t7, $t6	
	  sw $t9, -76($fp)	# spill _tmp38 from $t9 to $fp-76
	# _tmp39 = _tmp35 || _tmp38
	  lw $t7, -64($fp)	# fill _tmp35 to $t7 from $fp-64
	  lw $t8, -76($fp)	# fill _tmp38 to $t8 from $fp-76
	  or $t9, $t7, $t8	
	  sw $t9, -80($fp)	# spill _tmp39 from $t9 to $fp-80
	# IfZ _tmp39 Goto _L3
	  lw $t7, -80($fp)	# fill _tmp39 to $t7 from $fp-80
	  sw $t0, -48($fp)	# spill _tmp31 from $t0 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp32 from $t3 to $fp-52
	  sw $t4, -12($fp)	# spill d from $t4 to $fp-12
	  sw $t5, -56($fp)	# spill _tmp33 from $t5 to $fp-56
	  sw $t6, -60($fp)	# spill _tmp34 from $t6 to $fp-60
	  beqz $t7, _L3	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -84($fp)	# spill _tmp40 from $t0 to $fp-84
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp41 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp42 = _tmp41 * _tmp33
	  lw $t1, -56($fp)	# fill _tmp33 to $t1 from $fp-56
	  mul $t2, $t0, $t1	
	# _tmp43 = d + _tmp42
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  add $t4, $t3, $t2	
	# _tmp44 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# _tmp45 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp46 = _tmp44 < _tmp45
	  slt $t9, $t5, $t6	
	  sw $t9, -108($fp)	# spill _tmp46 from $t9 to $fp-108
	# IfZ _tmp46 Goto _L4
	  lw $t7, -108($fp)	# fill _tmp46 to $t7 from $fp-108
	  sw $t0, -88($fp)	# spill _tmp41 from $t0 to $fp-88
	  sw $t2, -92($fp)	# spill _tmp42 from $t2 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp43 from $t4 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp44 from $t5 to $fp-100
	  sw $t6, -104($fp)	# spill _tmp45 from $t6 to $fp-104
	  beqz $t7, _L4	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -112($fp)	# spill _tmp47 from $t0 to $fp-112
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp48 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp49 = _tmp48 + _tmp44
	  lw $t1, -100($fp)	# fill _tmp44 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	# _tmp50 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp51 = _tmp49 * _tmp50
	  mul $t4, $t2, $t3	
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  sw $t0, -116($fp)	# spill _tmp48 from $t0 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp49 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp50 from $t3 to $fp-124
	  sw $t4, -128($fp)	# spill _tmp51 from $t4 to $fp-128
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp52) = _tmp44
	  lw $t1, -100($fp)	# fill _tmp44 to $t1 from $fp-100
	  sw $t1, 0($t0) 	# store with offset
	# _tmp53 = _tmp52 + _tmp50
	  lw $t2, -124($fp)	# fill _tmp50 to $t2 from $fp-124
	  add $t3, $t0, $t2	
	# *(_tmp43) = _tmp53
	  lw $t4, -96($fp)	# fill _tmp43 to $t4 from $fp-96
	  sw $t3, 0($t4) 	# store with offset
	# _tmp54 = 10
	  li $t5, 10		# load constant value 10 into $t5
	# _tmp55 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp56 = _tmp54 < _tmp55
	  slt $t9, $t5, $t6	
	  sw $t9, -148($fp)	# spill _tmp56 from $t9 to $fp-148
	# IfZ _tmp56 Goto _L5
	  lw $t7, -148($fp)	# fill _tmp56 to $t7 from $fp-148
	  sw $t0, -132($fp)	# spill _tmp52 from $t0 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp53 from $t3 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp54 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp55 from $t6 to $fp-144
	  beqz $t7, _L5	# branch if _tmp56 is zero 
	# _tmp57 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp57
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -152($fp)	# spill _tmp57 from $t0 to $fp-152
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp58 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp59 = _tmp58 + _tmp54
	  lw $t1, -140($fp)	# fill _tmp54 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	# _tmp60 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp61 = _tmp59 * _tmp60
	  mul $t4, $t2, $t3	
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp62 = LCall _Alloc
	  sw $t0, -156($fp)	# spill _tmp58 from $t0 to $fp-156
	  sw $t2, -160($fp)	# spill _tmp59 from $t2 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp60 from $t3 to $fp-164
	  sw $t4, -168($fp)	# spill _tmp61 from $t4 to $fp-168
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp62) = _tmp54
	  lw $t1, -140($fp)	# fill _tmp54 to $t1 from $fp-140
	  sw $t1, 0($t0) 	# store with offset
	# _tmp63 = _tmp62 + _tmp60
	  lw $t2, -164($fp)	# fill _tmp60 to $t2 from $fp-164
	  add $t3, $t0, $t2	
	# c = _tmp63
	  move $t4, $t3		# copy value to register for c
	# _tmp64 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp65 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp66 = _tmp64 < _tmp65
	  slt $t9, $t5, $t6	
	  sw $t9, -188($fp)	# spill _tmp66 from $t9 to $fp-188
	# _tmp67 = *(c + -4)
	  lw $t9, -4($t4) 	# load with offset
	  sw $t9, -192($fp)	# spill _tmp67 from $t9 to $fp-192
	# _tmp68 = _tmp64 < _tmp67
	  lw $t8, -192($fp)	# fill _tmp67 to $t8 from $fp-192
	  slt $t9, $t5, $t8	
	  sw $t9, -196($fp)	# spill _tmp68 from $t9 to $fp-196
	# _tmp69 = _tmp68 == _tmp65
	  lw $t7, -196($fp)	# fill _tmp68 to $t7 from $fp-196
	  seq $t9, $t7, $t6	
	  sw $t9, -200($fp)	# spill _tmp69 from $t9 to $fp-200
	# _tmp70 = _tmp66 || _tmp69
	  lw $t7, -188($fp)	# fill _tmp66 to $t7 from $fp-188
	  lw $t8, -200($fp)	# fill _tmp69 to $t8 from $fp-200
	  or $t9, $t7, $t8	
	  sw $t9, -204($fp)	# spill _tmp70 from $t9 to $fp-204
	# IfZ _tmp70 Goto _L6
	  lw $t7, -204($fp)	# fill _tmp70 to $t7 from $fp-204
	  sw $t0, -172($fp)	# spill _tmp62 from $t0 to $fp-172
	  sw $t3, -176($fp)	# spill _tmp63 from $t3 to $fp-176
	  sw $t4, -8($fp)	# spill c from $t4 to $fp-8
	  sw $t5, -180($fp)	# spill _tmp64 from $t5 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp65 from $t6 to $fp-184
	  beqz $t7, _L6	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -208($fp)	# spill _tmp71 from $t0 to $fp-208
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp72 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp73 = _tmp72 * _tmp64
	  lw $t1, -180($fp)	# fill _tmp64 to $t1 from $fp-180
	  mul $t2, $t0, $t1	
	# _tmp74 = c + _tmp73
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp75 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp76 = 5
	  li $t6, 5		# load constant value 5 into $t6
	# _tmp77 = 3
	  li $t9, 3		# load constant value 3 into $t9
	  sw $t9, -232($fp)	# spill _tmp77 from $t9 to $fp-232
	# _tmp78 = _tmp76 * _tmp77
	  lw $t8, -232($fp)	# fill _tmp77 to $t8 from $fp-232
	  mul $t9, $t6, $t8	
	  sw $t9, -236($fp)	# spill _tmp78 from $t9 to $fp-236
	# _tmp79 = 4
	  li $t9, 4		# load constant value 4 into $t9
	  sw $t9, -240($fp)	# spill _tmp79 from $t9 to $fp-240
	# _tmp80 = _tmp78 / _tmp79
	  lw $t7, -236($fp)	# fill _tmp78 to $t7 from $fp-236
	  lw $t8, -240($fp)	# fill _tmp79 to $t8 from $fp-240
	  div $t9, $t7, $t8	
	  sw $t9, -244($fp)	# spill _tmp80 from $t9 to $fp-244
	# _tmp81 = 2
	  li $t9, 2		# load constant value 2 into $t9
	  sw $t9, -248($fp)	# spill _tmp81 from $t9 to $fp-248
	# _tmp82 = _tmp80 % _tmp81
	  lw $t7, -244($fp)	# fill _tmp80 to $t7 from $fp-244
	  lw $t8, -248($fp)	# fill _tmp81 to $t8 from $fp-248
	  rem $t9, $t7, $t8	
	  sw $t9, -252($fp)	# spill _tmp82 from $t9 to $fp-252
	# _tmp83 = _tmp75 + _tmp82
	  lw $t8, -252($fp)	# fill _tmp82 to $t8 from $fp-252
	  add $t9, $t5, $t8	
	  sw $t9, -256($fp)	# spill _tmp83 from $t9 to $fp-256
	# *(_tmp74) = _tmp83
	  lw $t7, -256($fp)	# fill _tmp83 to $t7 from $fp-256
	  sw $t7, 0($t4) 	# store with offset
	# _tmp84 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -260($fp)	# spill _tmp84 from $t9 to $fp-260
	# _tmp85 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -264($fp)	# spill _tmp85 from $t9 to $fp-264
	# _tmp86 = _tmp84 < _tmp85
	  lw $t7, -260($fp)	# fill _tmp84 to $t7 from $fp-260
	  lw $t8, -264($fp)	# fill _tmp85 to $t8 from $fp-264
	  slt $t9, $t7, $t8	
	  sw $t9, -268($fp)	# spill _tmp86 from $t9 to $fp-268
	# _tmp87 = *(d + -4)
	  lw $t7, -12($fp)	# fill d to $t7 from $fp-12
	  lw $t9, -4($t7) 	# load with offset
	  sw $t9, -272($fp)	# spill _tmp87 from $t9 to $fp-272
	# _tmp88 = _tmp84 < _tmp87
	  lw $t7, -260($fp)	# fill _tmp84 to $t7 from $fp-260
	  lw $t8, -272($fp)	# fill _tmp87 to $t8 from $fp-272
	  slt $t9, $t7, $t8	
	  sw $t9, -276($fp)	# spill _tmp88 from $t9 to $fp-276
	# _tmp89 = _tmp88 == _tmp85
	  lw $t7, -276($fp)	# fill _tmp88 to $t7 from $fp-276
	  lw $t8, -264($fp)	# fill _tmp85 to $t8 from $fp-264
	  seq $t9, $t7, $t8	
	  sw $t9, -280($fp)	# spill _tmp89 from $t9 to $fp-280
	# _tmp90 = _tmp86 || _tmp89
	  lw $t7, -268($fp)	# fill _tmp86 to $t7 from $fp-268
	  lw $t8, -280($fp)	# fill _tmp89 to $t8 from $fp-280
	  or $t9, $t7, $t8	
	  sw $t9, -284($fp)	# spill _tmp90 from $t9 to $fp-284
	# IfZ _tmp90 Goto _L7
	  lw $t7, -284($fp)	# fill _tmp90 to $t7 from $fp-284
	  sw $t0, -212($fp)	# spill _tmp72 from $t0 to $fp-212
	  sw $t2, -216($fp)	# spill _tmp73 from $t2 to $fp-216
	  sw $t4, -220($fp)	# spill _tmp74 from $t4 to $fp-220
	  sw $t5, -224($fp)	# spill _tmp75 from $t5 to $fp-224
	  sw $t6, -228($fp)	# spill _tmp76 from $t6 to $fp-228
	  beqz $t7, _L7	# branch if _tmp90 is zero 
	# _tmp91 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp91
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -288($fp)	# spill _tmp91 from $t0 to $fp-288
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp92 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp93 = _tmp92 * _tmp84
	  lw $t1, -260($fp)	# fill _tmp84 to $t1 from $fp-260
	  mul $t2, $t0, $t1	
	# _tmp94 = d + _tmp93
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  add $t4, $t3, $t2	
	# _tmp95 = *(_tmp94)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp96 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp97 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -312($fp)	# spill _tmp97 from $t9 to $fp-312
	# _tmp98 = _tmp96 < _tmp97
	  lw $t8, -312($fp)	# fill _tmp97 to $t8 from $fp-312
	  slt $t9, $t6, $t8	
	  sw $t9, -316($fp)	# spill _tmp98 from $t9 to $fp-316
	# _tmp99 = *(c + -4)
	  lw $t7, -8($fp)	# fill c to $t7 from $fp-8
	  lw $t9, -4($t7) 	# load with offset
	  sw $t9, -320($fp)	# spill _tmp99 from $t9 to $fp-320
	# _tmp100 = _tmp96 < _tmp99
	  lw $t8, -320($fp)	# fill _tmp99 to $t8 from $fp-320
	  slt $t9, $t6, $t8	
	  sw $t9, -324($fp)	# spill _tmp100 from $t9 to $fp-324
	# _tmp101 = _tmp100 == _tmp97
	  lw $t7, -324($fp)	# fill _tmp100 to $t7 from $fp-324
	  lw $t8, -312($fp)	# fill _tmp97 to $t8 from $fp-312
	  seq $t9, $t7, $t8	
	  sw $t9, -328($fp)	# spill _tmp101 from $t9 to $fp-328
	# _tmp102 = _tmp98 || _tmp101
	  lw $t7, -316($fp)	# fill _tmp98 to $t7 from $fp-316
	  lw $t8, -328($fp)	# fill _tmp101 to $t8 from $fp-328
	  or $t9, $t7, $t8	
	  sw $t9, -332($fp)	# spill _tmp102 from $t9 to $fp-332
	# IfZ _tmp102 Goto _L8
	  lw $t7, -332($fp)	# fill _tmp102 to $t7 from $fp-332
	  sw $t0, -292($fp)	# spill _tmp92 from $t0 to $fp-292
	  sw $t2, -296($fp)	# spill _tmp93 from $t2 to $fp-296
	  sw $t4, -300($fp)	# spill _tmp94 from $t4 to $fp-300
	  sw $t5, -304($fp)	# spill _tmp95 from $t5 to $fp-304
	  sw $t6, -308($fp)	# spill _tmp96 from $t6 to $fp-308
	  beqz $t7, _L8	# branch if _tmp102 is zero 
	# _tmp103 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp103
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -336($fp)	# spill _tmp103 from $t0 to $fp-336
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp104 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp105 = _tmp104 * _tmp96
	  lw $t1, -308($fp)	# fill _tmp96 to $t1 from $fp-308
	  mul $t2, $t0, $t1	
	# _tmp106 = c + _tmp105
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp107 = *(_tmp106)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp108 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp109 = _tmp107 < _tmp108
	  slt $t9, $t5, $t6	
	  sw $t9, -360($fp)	# spill _tmp109 from $t9 to $fp-360
	# _tmp110 = *(_tmp95 + -4)
	  lw $t7, -304($fp)	# fill _tmp95 to $t7 from $fp-304
	  lw $t9, -4($t7) 	# load with offset
	  sw $t9, -364($fp)	# spill _tmp110 from $t9 to $fp-364
	# _tmp111 = _tmp107 < _tmp110
	  lw $t8, -364($fp)	# fill _tmp110 to $t8 from $fp-364
	  slt $t9, $t5, $t8	
	  sw $t9, -368($fp)	# spill _tmp111 from $t9 to $fp-368
	# _tmp112 = _tmp111 == _tmp108
	  lw $t7, -368($fp)	# fill _tmp111 to $t7 from $fp-368
	  seq $t9, $t7, $t6	
	  sw $t9, -372($fp)	# spill _tmp112 from $t9 to $fp-372
	# _tmp113 = _tmp109 || _tmp112
	  lw $t7, -360($fp)	# fill _tmp109 to $t7 from $fp-360
	  lw $t8, -372($fp)	# fill _tmp112 to $t8 from $fp-372
	  or $t9, $t7, $t8	
	  sw $t9, -376($fp)	# spill _tmp113 from $t9 to $fp-376
	# IfZ _tmp113 Goto _L9
	  lw $t7, -376($fp)	# fill _tmp113 to $t7 from $fp-376
	  sw $t0, -340($fp)	# spill _tmp104 from $t0 to $fp-340
	  sw $t2, -344($fp)	# spill _tmp105 from $t2 to $fp-344
	  sw $t4, -348($fp)	# spill _tmp106 from $t4 to $fp-348
	  sw $t5, -352($fp)	# spill _tmp107 from $t5 to $fp-352
	  sw $t6, -356($fp)	# spill _tmp108 from $t6 to $fp-356
	  beqz $t7, _L9	# branch if _tmp113 is zero 
	# _tmp114 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp114
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -380($fp)	# spill _tmp114 from $t0 to $fp-380
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp115 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp116 = _tmp115 * _tmp107
	  lw $t1, -352($fp)	# fill _tmp107 to $t1 from $fp-352
	  mul $t2, $t0, $t1	
	# _tmp117 = _tmp95 + _tmp116
	  lw $t3, -304($fp)	# fill _tmp95 to $t3 from $fp-304
	  add $t4, $t3, $t2	
	# _tmp118 = 55
	  li $t5, 55		# load constant value 55 into $t5
	# *(_tmp117) = _tmp118
	  sw $t5, 0($t4) 	# store with offset
	# _tmp119 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp120 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -404($fp)	# spill _tmp120 from $t9 to $fp-404
	# _tmp121 = _tmp119 < _tmp120
	  lw $t8, -404($fp)	# fill _tmp120 to $t8 from $fp-404
	  slt $t9, $t6, $t8	
	  sw $t9, -408($fp)	# spill _tmp121 from $t9 to $fp-408
	# _tmp122 = *(c + -4)
	  lw $t7, -8($fp)	# fill c to $t7 from $fp-8
	  lw $t9, -4($t7) 	# load with offset
	  sw $t9, -412($fp)	# spill _tmp122 from $t9 to $fp-412
	# _tmp123 = _tmp119 < _tmp122
	  lw $t8, -412($fp)	# fill _tmp122 to $t8 from $fp-412
	  slt $t9, $t6, $t8	
	  sw $t9, -416($fp)	# spill _tmp123 from $t9 to $fp-416
	# _tmp124 = _tmp123 == _tmp120
	  lw $t7, -416($fp)	# fill _tmp123 to $t7 from $fp-416
	  lw $t8, -404($fp)	# fill _tmp120 to $t8 from $fp-404
	  seq $t9, $t7, $t8	
	  sw $t9, -420($fp)	# spill _tmp124 from $t9 to $fp-420
	# _tmp125 = _tmp121 || _tmp124
	  lw $t7, -408($fp)	# fill _tmp121 to $t7 from $fp-408
	  lw $t8, -420($fp)	# fill _tmp124 to $t8 from $fp-420
	  or $t9, $t7, $t8	
	  sw $t9, -424($fp)	# spill _tmp125 from $t9 to $fp-424
	# IfZ _tmp125 Goto _L10
	  lw $t7, -424($fp)	# fill _tmp125 to $t7 from $fp-424
	  sw $t0, -384($fp)	# spill _tmp115 from $t0 to $fp-384
	  sw $t2, -388($fp)	# spill _tmp116 from $t2 to $fp-388
	  sw $t4, -392($fp)	# spill _tmp117 from $t4 to $fp-392
	  sw $t5, -396($fp)	# spill _tmp118 from $t5 to $fp-396
	  sw $t6, -400($fp)	# spill _tmp119 from $t6 to $fp-400
	  beqz $t7, _L10	# branch if _tmp125 is zero 
	# _tmp126 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp126
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -428($fp)	# spill _tmp126 from $t0 to $fp-428
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp127 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp128 = _tmp127 * _tmp119
	  lw $t1, -400($fp)	# fill _tmp119 to $t1 from $fp-400
	  mul $t2, $t0, $t1	
	# _tmp129 = c + _tmp128
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp130 = *(_tmp129)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp130
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -432($fp)	# spill _tmp127 from $t0 to $fp-432
	  sw $t2, -436($fp)	# spill _tmp128 from $t2 to $fp-436
	  sw $t4, -440($fp)	# spill _tmp129 from $t4 to $fp-440
	  sw $t5, -444($fp)	# spill _tmp130 from $t5 to $fp-444
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp131 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp131
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -448($fp)	# spill _tmp131 from $t0 to $fp-448
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp132 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp133 = 100
	  li $t1, 100		# load constant value 100 into $t1
	# _tmp134 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp135 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp136 = _tmp134 < _tmp135
	  slt $t4, $t2, $t3	
	# _tmp137 = *(d + -4)
	  lw $t5, -12($fp)	# fill d to $t5 from $fp-12
	  lw $t6, -4($t5) 	# load with offset
	# _tmp138 = _tmp134 < _tmp137
	  slt $t9, $t2, $t6	
	  sw $t9, -476($fp)	# spill _tmp138 from $t9 to $fp-476
	# _tmp139 = _tmp138 == _tmp135
	  lw $t7, -476($fp)	# fill _tmp138 to $t7 from $fp-476
	  seq $t9, $t7, $t3	
	  sw $t9, -480($fp)	# spill _tmp139 from $t9 to $fp-480
	# _tmp140 = _tmp136 || _tmp139
	  lw $t8, -480($fp)	# fill _tmp139 to $t8 from $fp-480
	  or $t9, $t4, $t8	
	  sw $t9, -484($fp)	# spill _tmp140 from $t9 to $fp-484
	# IfZ _tmp140 Goto _L11
	  lw $t7, -484($fp)	# fill _tmp140 to $t7 from $fp-484
	  sw $t0, -452($fp)	# spill _tmp132 from $t0 to $fp-452
	  sw $t1, -456($fp)	# spill _tmp133 from $t1 to $fp-456
	  sw $t2, -460($fp)	# spill _tmp134 from $t2 to $fp-460
	  sw $t3, -464($fp)	# spill _tmp135 from $t3 to $fp-464
	  sw $t4, -468($fp)	# spill _tmp136 from $t4 to $fp-468
	  sw $t6, -472($fp)	# spill _tmp137 from $t6 to $fp-472
	  beqz $t7, _L11	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -488($fp)	# spill _tmp141 from $t0 to $fp-488
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp142 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp143 = _tmp142 * _tmp134
	  lw $t1, -460($fp)	# fill _tmp134 to $t1 from $fp-460
	  mul $t2, $t0, $t1	
	# _tmp144 = d + _tmp143
	  lw $t3, -12($fp)	# fill d to $t3 from $fp-12
	  add $t4, $t3, $t2	
	# _tmp145 = *(_tmp144)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -8($fp)	# fill c to $t6 from $fp-8
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam _tmp145
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam _tmp133
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -456($fp)	# fill _tmp133 to $t7 from $fp-456
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp146 = LCall _Binky
	  sw $t0, -492($fp)	# spill _tmp142 from $t0 to $fp-492
	  sw $t2, -496($fp)	# spill _tmp143 from $t2 to $fp-496
	  sw $t4, -500($fp)	# spill _tmp144 from $t4 to $fp-500
	  sw $t5, -504($fp)	# spill _tmp145 from $t5 to $fp-504
	  jal _Binky         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp147 = _tmp132 * _tmp146
	  lw $t1, -452($fp)	# fill _tmp132 to $t1 from $fp-452
	  mul $t2, $t1, $t0	
	# PushParam _tmp147
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -508($fp)	# spill _tmp146 from $t0 to $fp-508
	  sw $t2, -512($fp)	# spill _tmp147 from $t2 to $fp-512
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
