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
	  seq $t4, $t5, $t1	
	# _tmp6 = _tmp2 || _tmp5
	  or $t1, $t2, $t4	
	# IfZ _tmp6 Goto _L0
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t1, -32($fp)	# spill _tmp6 from $t1 to $fp-32
	  beqz $t1, _L0	# branch if _tmp6 is zero 
	# _tmp7 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  add $t1, $t0, $t2	
	# _tmp11 = *(_tmp10)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp12 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp13 = _tmp11 < _tmp12
	  slt $t2, $t0, $t1	
	# _tmp14 = *(b + -4)
	  lw $t3, 8($fp)	# fill b to $t3 from $fp+8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp15 = _tmp11 < _tmp14
	  slt $t5, $t0, $t4	
	# _tmp16 = _tmp15 == _tmp12
	  seq $t4, $t5, $t1	
	# _tmp17 = _tmp13 || _tmp16
	  or $t1, $t2, $t4	
	# IfZ _tmp17 Goto _L1
	  sw $t0, -52($fp)	# spill _tmp11 from $t0 to $fp-52
	  sw $t1, -76($fp)	# spill _tmp17 from $t1 to $fp-76
	  beqz $t1, _L1	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  add $t1, $t0, $t2	
	# _tmp22 = *(_tmp21)
	  lw $t0, 0($t1) 	# load with offset
	# Return _tmp22
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
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp30 = _tmp28 * _tmp29
	  mul $t3, $t2, $t0	
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp31 = LCall _Alloc
	  sw $t0, -40($fp)	# spill _tmp29 from $t0 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp31) = _tmp23
	  lw $t1, -16($fp)	# fill _tmp23 to $t1 from $fp-16
	  sw $t1, 0($t0) 	# store with offset
	# _tmp32 = _tmp31 + _tmp29
	  lw $t1, -40($fp)	# fill _tmp29 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	# d = _tmp32
	  move $t0, $t2		# copy value to register for d
	# _tmp33 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp34 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp35 = _tmp33 < _tmp34
	  slt $t3, $t1, $t2	
	# _tmp36 = *(d + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp37 = _tmp33 < _tmp36
	  slt $t5, $t1, $t4	
	# _tmp38 = _tmp37 == _tmp34
	  seq $t4, $t5, $t2	
	# _tmp39 = _tmp35 || _tmp38
	  or $t2, $t3, $t4	
	# IfZ _tmp39 Goto _L3
	  sw $t0, -12($fp)	# spill d from $t0 to $fp-12
	  sw $t1, -56($fp)	# spill _tmp33 from $t1 to $fp-56
	  sw $t2, -80($fp)	# spill _tmp39 from $t2 to $fp-80
	  beqz $t2, _L3	# branch if _tmp39 is zero 
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
  _L3:
	# _tmp41 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp42 = _tmp41 * _tmp33
	  lw $t1, -56($fp)	# fill _tmp33 to $t1 from $fp-56
	  mul $t2, $t0, $t1	
	# _tmp43 = d + _tmp42
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  add $t1, $t0, $t2	
	# _tmp44 = 12
	  li $t2, 12		# load constant value 12 into $t2
	# _tmp45 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp46 = _tmp44 < _tmp45
	  slt $t4, $t2, $t3	
	# IfZ _tmp46 Goto _L4
	  sw $t1, -96($fp)	# spill _tmp43 from $t1 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp44 from $t2 to $fp-100
	  sw $t4, -108($fp)	# spill _tmp46 from $t4 to $fp-108
	  beqz $t4, _L4	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp51 = _tmp49 * _tmp50
	  mul $t3, $t2, $t0	
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  sw $t0, -124($fp)	# spill _tmp50 from $t0 to $fp-124
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp52) = _tmp44
	  lw $t1, -100($fp)	# fill _tmp44 to $t1 from $fp-100
	  sw $t1, 0($t0) 	# store with offset
	# _tmp53 = _tmp52 + _tmp50
	  lw $t1, -124($fp)	# fill _tmp50 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	# *(_tmp43) = _tmp53
	  lw $t0, -96($fp)	# fill _tmp43 to $t0 from $fp-96
	  sw $t2, 0($t0) 	# store with offset
	# _tmp54 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp55 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp56 = _tmp54 < _tmp55
	  slt $t2, $t0, $t1	
	# IfZ _tmp56 Goto _L5
	  sw $t0, -140($fp)	# spill _tmp54 from $t0 to $fp-140
	  sw $t2, -148($fp)	# spill _tmp56 from $t2 to $fp-148
	  beqz $t2, _L5	# branch if _tmp56 is zero 
	# _tmp57 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp57
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp61 = _tmp59 * _tmp60
	  mul $t3, $t2, $t0	
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp62 = LCall _Alloc
	  sw $t0, -164($fp)	# spill _tmp60 from $t0 to $fp-164
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp62) = _tmp54
	  lw $t1, -140($fp)	# fill _tmp54 to $t1 from $fp-140
	  sw $t1, 0($t0) 	# store with offset
	# _tmp63 = _tmp62 + _tmp60
	  lw $t1, -164($fp)	# fill _tmp60 to $t1 from $fp-164
	  add $t2, $t0, $t1	
	# c = _tmp63
	  move $t0, $t2		# copy value to register for c
	# _tmp64 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp65 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp66 = _tmp64 < _tmp65
	  slt $t3, $t1, $t2	
	# _tmp67 = *(c + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp68 = _tmp64 < _tmp67
	  slt $t5, $t1, $t4	
	# _tmp69 = _tmp68 == _tmp65
	  seq $t4, $t5, $t2	
	# _tmp70 = _tmp66 || _tmp69
	  or $t2, $t3, $t4	
	# IfZ _tmp70 Goto _L6
	  sw $t0, -8($fp)	# spill c from $t0 to $fp-8
	  sw $t1, -180($fp)	# spill _tmp64 from $t1 to $fp-180
	  sw $t2, -204($fp)	# spill _tmp70 from $t2 to $fp-204
	  beqz $t2, _L6	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp75 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp76 = 5
	  li $t3, 5		# load constant value 5 into $t3
	# _tmp77 = 3
	  li $t4, 3		# load constant value 3 into $t4
	# _tmp78 = _tmp76 * _tmp77
	  mul $t5, $t3, $t4	
	# _tmp79 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp80 = _tmp78 / _tmp79
	  div $t4, $t5, $t3	
	# _tmp81 = 2
	  li $t3, 2		# load constant value 2 into $t3
	# _tmp82 = _tmp80 % _tmp81
	  rem $t5, $t4, $t3	
	# _tmp83 = _tmp75 + _tmp82
	  add $t3, $t2, $t5	
	# *(_tmp74) = _tmp83
	  sw $t3, 0($t1) 	# store with offset
	# _tmp84 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp85 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp86 = _tmp84 < _tmp85
	  slt $t3, $t1, $t2	
	# _tmp87 = *(d + -4)
	  lw $t4, -12($fp)	# fill d to $t4 from $fp-12
	  lw $t5, -4($t4) 	# load with offset
	# _tmp88 = _tmp84 < _tmp87
	  slt $t6, $t1, $t5	
	# _tmp89 = _tmp88 == _tmp85
	  seq $t5, $t6, $t2	
	# _tmp90 = _tmp86 || _tmp89
	  or $t2, $t3, $t5	
	# IfZ _tmp90 Goto _L7
	  sw $t1, -260($fp)	# spill _tmp84 from $t1 to $fp-260
	  sw $t2, -284($fp)	# spill _tmp90 from $t2 to $fp-284
	  beqz $t2, _L7	# branch if _tmp90 is zero 
	# _tmp91 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp91
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  add $t1, $t0, $t2	
	# _tmp95 = *(_tmp94)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp96 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp97 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp98 = _tmp96 < _tmp97
	  slt $t4, $t1, $t3	
	# _tmp99 = *(c + -4)
	  lw $t5, -8($fp)	# fill c to $t5 from $fp-8
	  lw $t6, -4($t5) 	# load with offset
	# _tmp100 = _tmp96 < _tmp99
	  slt $t9, $t1, $t6	
	  sw $t9, -324($fp)	# spill _tmp100 from $t9 to $fp-324
	# _tmp101 = _tmp100 == _tmp97
	  lw $t6, -324($fp)	# fill _tmp100 to $t6 from $fp-324
	  seq $t9, $t6, $t3	
	  sw $t9, -328($fp)	# spill _tmp101 from $t9 to $fp-328
	# _tmp102 = _tmp98 || _tmp101
	  lw $t3, -328($fp)	# fill _tmp101 to $t3 from $fp-328
	  or $t6, $t4, $t3	
	# IfZ _tmp102 Goto _L8
	  sw $t1, -308($fp)	# spill _tmp96 from $t1 to $fp-308
	  sw $t2, -304($fp)	# spill _tmp95 from $t2 to $fp-304
	  sw $t6, -332($fp)	# spill _tmp102 from $t6 to $fp-332
	  beqz $t6, _L8	# branch if _tmp102 is zero 
	# _tmp103 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp103
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp107 = *(_tmp106)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp108 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp109 = _tmp107 < _tmp108
	  slt $t3, $t2, $t1	
	# _tmp110 = *(_tmp95 + -4)
	  lw $t4, -304($fp)	# fill _tmp95 to $t4 from $fp-304
	  lw $t5, -4($t4) 	# load with offset
	# _tmp111 = _tmp107 < _tmp110
	  slt $t6, $t2, $t5	
	# _tmp112 = _tmp111 == _tmp108
	  seq $t5, $t6, $t1	
	# _tmp113 = _tmp109 || _tmp112
	  or $t1, $t3, $t5	
	# IfZ _tmp113 Goto _L9
	  sw $t1, -376($fp)	# spill _tmp113 from $t1 to $fp-376
	  sw $t2, -352($fp)	# spill _tmp107 from $t2 to $fp-352
	  beqz $t1, _L9	# branch if _tmp113 is zero 
	# _tmp114 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp114
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -304($fp)	# fill _tmp95 to $t0 from $fp-304
	  add $t1, $t0, $t2	
	# _tmp118 = 55
	  li $t0, 55		# load constant value 55 into $t0
	# *(_tmp117) = _tmp118
	  sw $t0, 0($t1) 	# store with offset
	# _tmp119 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp120 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp121 = _tmp119 < _tmp120
	  slt $t2, $t0, $t1	
	# _tmp122 = *(c + -4)
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp123 = _tmp119 < _tmp122
	  slt $t5, $t0, $t4	
	# _tmp124 = _tmp123 == _tmp120
	  seq $t4, $t5, $t1	
	# _tmp125 = _tmp121 || _tmp124
	  or $t1, $t2, $t4	
	# IfZ _tmp125 Goto _L10
	  sw $t0, -400($fp)	# spill _tmp119 from $t0 to $fp-400
	  sw $t1, -424($fp)	# spill _tmp125 from $t1 to $fp-424
	  beqz $t1, _L10	# branch if _tmp125 is zero 
	# _tmp126 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp126
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp130 = *(_tmp129)
	  lw $t2, 0($t1) 	# load with offset
	# PushParam _tmp130
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
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
	  lw $t6, -476($fp)	# fill _tmp138 to $t6 from $fp-476
	  seq $t9, $t6, $t3	
	  sw $t9, -480($fp)	# spill _tmp139 from $t9 to $fp-480
	# _tmp140 = _tmp136 || _tmp139
	  lw $t3, -480($fp)	# fill _tmp139 to $t3 from $fp-480
	  or $t6, $t4, $t3	
	# IfZ _tmp140 Goto _L11
	  sw $t0, -452($fp)	# spill _tmp132 from $t0 to $fp-452
	  sw $t1, -456($fp)	# spill _tmp133 from $t1 to $fp-456
	  sw $t2, -460($fp)	# spill _tmp134 from $t2 to $fp-460
	  sw $t6, -484($fp)	# spill _tmp140 from $t6 to $fp-484
	  beqz $t6, _L11	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  add $t1, $t0, $t2	
	# _tmp145 = *(_tmp144)
	  lw $t0, 0($t1) 	# load with offset
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, -8($fp)	# fill c to $t1 from $fp-8
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp145
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp133
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -456($fp)	# fill _tmp133 to $t0 from $fp-456
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp146 = LCall _Binky
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
