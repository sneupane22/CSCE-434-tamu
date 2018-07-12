	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Wild:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp0
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -12($fp)	# spill _tmp0 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L0:
	# _tmp1 = *(names + -4)
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp2 = i < _tmp1
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp2 Goto _L1
	  sw $t1, -16($fp)	# spill _tmp1 from $t1 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp2 from $t3 to $fp-20
	  beqz $t3, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp4 = i < _tmp3
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp5 = *(names + -4)
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp6 = i < _tmp5
	  slt $t5, $t1, $t4	
	# _tmp7 = _tmp6 == _tmp3
	  seq $t6, $t5, $t0	
	# _tmp8 = _tmp4 || _tmp7
	  or $t9, $t2, $t6	
	  sw $t9, -44($fp)	# spill _tmp8 from $t9 to $fp-44
	# IfZ _tmp8 Goto _L2
	  lw $t7, -44($fp)	# fill _tmp8 to $t7 from $fp-44
	  sw $t0, -24($fp)	# spill _tmp3 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp5 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp6 from $t5 to $fp-36
	  sw $t6, -40($fp)	# spill _tmp7 from $t6 to $fp-40
	  beqz $t7, _L2	# branch if _tmp8 is zero 
	# _tmp9 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -48($fp)	# spill _tmp9 from $t0 to $fp-48
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp10 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp11 = _tmp10 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp12 = names + _tmp11
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp13 = *(_tmp12)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, 8($fp)	# fill answer to $t6 from $fp+8
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _StringEqual
	  sw $t0, -52($fp)	# spill _tmp10 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	  sw $t4, -60($fp)	# spill _tmp12 from $t4 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp13 from $t5 to $fp-64
	  jal _StringEqual   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp14 Goto _L3
	  sw $t0, -68($fp)	# spill _tmp14 from $t0 to $fp-68
	  beqz $t0, _L3	# branch if _tmp14 is zero 
	# _tmp15 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp15
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L3:
	# _tmp16 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp17 = i + _tmp16
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp17
	  move $t1, $t2		# copy value to register for i
	# Goto _L0
	  sw $t0, -76($fp)	# spill _tmp16 from $t0 to $fp-76
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	  b _L0		# unconditional branch
  _L1:
	# _tmp18 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp18
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
	# BeginFunc 260
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 260	# decrement sp to make space for locals/temps
	# _tmp19 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp20 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp21 = _tmp19 < _tmp20
	  slt $t2, $t0, $t1	
	# IfZ _tmp21 Goto _L4
	  sw $t0, -12($fp)	# spill _tmp19 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp20 from $t1 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp21 from $t2 to $fp-20
	  beqz $t2, _L4	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -24($fp)	# spill _tmp22 from $t0 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp23 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp24 = _tmp23 + _tmp19
	  lw $t1, -12($fp)	# fill _tmp19 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	# _tmp25 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp26 = _tmp24 * _tmp25
	  mul $t4, $t2, $t3	
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	  sw $t0, -28($fp)	# spill _tmp23 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp24 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp25 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp26 from $t4 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	  lw $t1, -12($fp)	# fill _tmp19 to $t1 from $fp-12
	  sw $t1, 0($t0) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	  lw $t2, -36($fp)	# fill _tmp25 to $t2 from $fp-36
	  add $t3, $t0, $t2	
	# names = _tmp28
	  move $t4, $t3		# copy value to register for names
	# _tmp29 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp30 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp31 = _tmp29 < _tmp30
	  slt $t9, $t5, $t6	
	  sw $t9, -60($fp)	# spill _tmp31 from $t9 to $fp-60
	# _tmp32 = *(names + -4)
	  lw $t9, -4($t4) 	# load with offset
	  sw $t9, -64($fp)	# spill _tmp32 from $t9 to $fp-64
	# _tmp33 = _tmp29 < _tmp32
	  lw $t8, -64($fp)	# fill _tmp32 to $t8 from $fp-64
	  slt $t9, $t5, $t8	
	  sw $t9, -68($fp)	# spill _tmp33 from $t9 to $fp-68
	# _tmp34 = _tmp33 == _tmp30
	  lw $t7, -68($fp)	# fill _tmp33 to $t7 from $fp-68
	  seq $t9, $t7, $t6	
	  sw $t9, -72($fp)	# spill _tmp34 from $t9 to $fp-72
	# _tmp35 = _tmp31 || _tmp34
	  lw $t7, -60($fp)	# fill _tmp31 to $t7 from $fp-60
	  lw $t8, -72($fp)	# fill _tmp34 to $t8 from $fp-72
	  or $t9, $t7, $t8	
	  sw $t9, -76($fp)	# spill _tmp35 from $t9 to $fp-76
	# IfZ _tmp35 Goto _L5
	  lw $t7, -76($fp)	# fill _tmp35 to $t7 from $fp-76
	  sw $t0, -44($fp)	# spill _tmp27 from $t0 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp28 from $t3 to $fp-48
	  sw $t4, -8($fp)	# spill names from $t4 to $fp-8
	  sw $t5, -52($fp)	# spill _tmp29 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp30 from $t6 to $fp-56
	  beqz $t7, _L5	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -80($fp)	# spill _tmp36 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp37 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp38 = _tmp37 * _tmp29
	  lw $t1, -52($fp)	# fill _tmp29 to $t1 from $fp-52
	  mul $t2, $t0, $t1	
	# _tmp39 = names + _tmp38
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp40 = "Brian"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Brian"
	  .text
	  la $t5, _string4	# load label
	# *(_tmp39) = _tmp40
	  sw $t5, 0($t4) 	# store with offset
	# _tmp41 = 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp42 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -104($fp)	# spill _tmp42 from $t9 to $fp-104
	# _tmp43 = _tmp41 < _tmp42
	  lw $t8, -104($fp)	# fill _tmp42 to $t8 from $fp-104
	  slt $t9, $t6, $t8	
	  sw $t9, -108($fp)	# spill _tmp43 from $t9 to $fp-108
	# _tmp44 = *(names + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -112($fp)	# spill _tmp44 from $t9 to $fp-112
	# _tmp45 = _tmp41 < _tmp44
	  lw $t8, -112($fp)	# fill _tmp44 to $t8 from $fp-112
	  slt $t9, $t6, $t8	
	  sw $t9, -116($fp)	# spill _tmp45 from $t9 to $fp-116
	# _tmp46 = _tmp45 == _tmp42
	  lw $t7, -116($fp)	# fill _tmp45 to $t7 from $fp-116
	  lw $t8, -104($fp)	# fill _tmp42 to $t8 from $fp-104
	  seq $t9, $t7, $t8	
	  sw $t9, -120($fp)	# spill _tmp46 from $t9 to $fp-120
	# _tmp47 = _tmp43 || _tmp46
	  lw $t7, -108($fp)	# fill _tmp43 to $t7 from $fp-108
	  lw $t8, -120($fp)	# fill _tmp46 to $t8 from $fp-120
	  or $t9, $t7, $t8	
	  sw $t9, -124($fp)	# spill _tmp47 from $t9 to $fp-124
	# IfZ _tmp47 Goto _L6
	  lw $t7, -124($fp)	# fill _tmp47 to $t7 from $fp-124
	  sw $t0, -84($fp)	# spill _tmp37 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp38 from $t2 to $fp-88
	  sw $t4, -92($fp)	# spill _tmp39 from $t4 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp40 from $t5 to $fp-96
	  sw $t6, -100($fp)	# spill _tmp41 from $t6 to $fp-100
	  beqz $t7, _L6	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -128($fp)	# spill _tmp48 from $t0 to $fp-128
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp49 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp50 = _tmp49 * _tmp41
	  lw $t1, -100($fp)	# fill _tmp41 to $t1 from $fp-100
	  mul $t2, $t0, $t1	
	# _tmp51 = names + _tmp50
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp52 = "Cam"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Cam"
	  .text
	  la $t5, _string6	# load label
	# *(_tmp51) = _tmp52
	  sw $t5, 0($t4) 	# store with offset
	# _tmp53 = 2
	  li $t6, 2		# load constant value 2 into $t6
	# _tmp54 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -152($fp)	# spill _tmp54 from $t9 to $fp-152
	# _tmp55 = _tmp53 < _tmp54
	  lw $t8, -152($fp)	# fill _tmp54 to $t8 from $fp-152
	  slt $t9, $t6, $t8	
	  sw $t9, -156($fp)	# spill _tmp55 from $t9 to $fp-156
	# _tmp56 = *(names + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -160($fp)	# spill _tmp56 from $t9 to $fp-160
	# _tmp57 = _tmp53 < _tmp56
	  lw $t8, -160($fp)	# fill _tmp56 to $t8 from $fp-160
	  slt $t9, $t6, $t8	
	  sw $t9, -164($fp)	# spill _tmp57 from $t9 to $fp-164
	# _tmp58 = _tmp57 == _tmp54
	  lw $t7, -164($fp)	# fill _tmp57 to $t7 from $fp-164
	  lw $t8, -152($fp)	# fill _tmp54 to $t8 from $fp-152
	  seq $t9, $t7, $t8	
	  sw $t9, -168($fp)	# spill _tmp58 from $t9 to $fp-168
	# _tmp59 = _tmp55 || _tmp58
	  lw $t7, -156($fp)	# fill _tmp55 to $t7 from $fp-156
	  lw $t8, -168($fp)	# fill _tmp58 to $t8 from $fp-168
	  or $t9, $t7, $t8	
	  sw $t9, -172($fp)	# spill _tmp59 from $t9 to $fp-172
	# IfZ _tmp59 Goto _L7
	  lw $t7, -172($fp)	# fill _tmp59 to $t7 from $fp-172
	  sw $t0, -132($fp)	# spill _tmp49 from $t0 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp50 from $t2 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp51 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp52 from $t5 to $fp-144
	  sw $t6, -148($fp)	# spill _tmp53 from $t6 to $fp-148
	  beqz $t7, _L7	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -176($fp)	# spill _tmp60 from $t0 to $fp-176
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp61 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp62 = _tmp61 * _tmp53
	  lw $t1, -148($fp)	# fill _tmp53 to $t1 from $fp-148
	  mul $t2, $t0, $t1	
	# _tmp63 = names + _tmp62
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp64 = "Gavan"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Gavan"
	  .text
	  la $t5, _string8	# load label
	# *(_tmp63) = _tmp64
	  sw $t5, 0($t4) 	# store with offset
	# _tmp65 = 3
	  li $t6, 3		# load constant value 3 into $t6
	# _tmp66 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -200($fp)	# spill _tmp66 from $t9 to $fp-200
	# _tmp67 = _tmp65 < _tmp66
	  lw $t8, -200($fp)	# fill _tmp66 to $t8 from $fp-200
	  slt $t9, $t6, $t8	
	  sw $t9, -204($fp)	# spill _tmp67 from $t9 to $fp-204
	# _tmp68 = *(names + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -208($fp)	# spill _tmp68 from $t9 to $fp-208
	# _tmp69 = _tmp65 < _tmp68
	  lw $t8, -208($fp)	# fill _tmp68 to $t8 from $fp-208
	  slt $t9, $t6, $t8	
	  sw $t9, -212($fp)	# spill _tmp69 from $t9 to $fp-212
	# _tmp70 = _tmp69 == _tmp66
	  lw $t7, -212($fp)	# fill _tmp69 to $t7 from $fp-212
	  lw $t8, -200($fp)	# fill _tmp66 to $t8 from $fp-200
	  seq $t9, $t7, $t8	
	  sw $t9, -216($fp)	# spill _tmp70 from $t9 to $fp-216
	# _tmp71 = _tmp67 || _tmp70
	  lw $t7, -204($fp)	# fill _tmp67 to $t7 from $fp-204
	  lw $t8, -216($fp)	# fill _tmp70 to $t8 from $fp-216
	  or $t9, $t7, $t8	
	  sw $t9, -220($fp)	# spill _tmp71 from $t9 to $fp-220
	# IfZ _tmp71 Goto _L8
	  lw $t7, -220($fp)	# fill _tmp71 to $t7 from $fp-220
	  sw $t0, -180($fp)	# spill _tmp61 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp62 from $t2 to $fp-184
	  sw $t4, -188($fp)	# spill _tmp63 from $t4 to $fp-188
	  sw $t5, -192($fp)	# spill _tmp64 from $t5 to $fp-192
	  sw $t6, -196($fp)	# spill _tmp65 from $t6 to $fp-196
	  beqz $t7, _L8	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -224($fp)	# spill _tmp72 from $t0 to $fp-224
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp73 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp74 = _tmp73 * _tmp65
	  lw $t1, -196($fp)	# fill _tmp65 to $t1 from $fp-196
	  mul $t2, $t0, $t1	
	# _tmp75 = names + _tmp74
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp76 = "Julie"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Julie"
	  .text
	  la $t5, _string10	# load label
	# *(_tmp75) = _tmp76
	  sw $t5, 0($t4) 	# store with offset
	  sw $t0, -228($fp)	# spill _tmp73 from $t0 to $fp-228
	  sw $t2, -232($fp)	# spill _tmp74 from $t2 to $fp-232
	  sw $t4, -236($fp)	# spill _tmp75 from $t4 to $fp-236
	  sw $t5, -240($fp)	# spill _tmp76 from $t5 to $fp-240
  _L9:
	# _tmp77 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# IfZ _tmp77 Goto _L10
	  sw $t0, -244($fp)	# spill _tmp77 from $t0 to $fp-244
	  beqz $t0, _L10	# branch if _tmp77 is zero 
	# _tmp78 = "\nWho is your favorite CS143 staff member? "
	  .data			# create string constant marked with label
	  _string11: .asciiz "\nWho is your favorite CS143 staff member? "
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -248($fp)	# spill _tmp78 from $t0 to $fp-248
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam names
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, -8($fp)	# fill names to $t1 from $fp-8
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp80 = LCall _Wild
	  sw $t0, -252($fp)	# spill _tmp79 from $t0 to $fp-252
	  jal _Wild          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp80 Goto _L11
	  sw $t0, -256($fp)	# spill _tmp80 from $t0 to $fp-256
	  beqz $t0, _L11	# branch if _tmp80 is zero 
	# _tmp81 = "You just earned 1000 bonus points!\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "You just earned 1000 bonus points!\n"
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp81
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -260($fp)	# spill _tmp81 from $t0 to $fp-260
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L10
	  b _L10		# unconditional branch
  _L11:
	# _tmp82 = "That's not a good way to make points. Try again!\..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "That's not a good way to make points. Try again!\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -264($fp)	# spill _tmp82 from $t0 to $fp-264
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L9
	  b _L9		# unconditional branch
  _L10:
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
