	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _ReadArray:
	# BeginFunc 128
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 128	# decrement sp to make space for locals/temps
	# _tmp0 = "How many scores? "
	  .data			# create string constant marked with label
	  _string1: .asciiz "How many scores? "
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -24($fp)	# spill _tmp0 from $t0 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# numScores = _tmp1
	  move $t1, $t0		# copy value to register for numScores
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp3 = numScores < _tmp2
	  slt $t3, $t1, $t2	
	# IfZ _tmp3 Goto _L0
	  sw $t0, -28($fp)	# spill _tmp1 from $t0 to $fp-28
	  sw $t1, -20($fp)	# spill numScores from $t1 to $fp-20
	  sw $t2, -32($fp)	# spill _tmp2 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp3 from $t3 to $fp-36
	  beqz $t3, _L0	# branch if _tmp3 is zero 
	# _tmp4 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -40($fp)	# spill _tmp4 from $t0 to $fp-40
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp5 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = _tmp5 + numScores
	  lw $t1, -20($fp)	# fill numScores to $t1 from $fp-20
	  add $t2, $t0, $t1	
	# _tmp7 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp8 = _tmp6 * _tmp7
	  mul $t4, $t2, $t3	
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	  sw $t0, -44($fp)	# spill _tmp5 from $t0 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp6 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp7 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp8 from $t4 to $fp-56
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = numScores
	  lw $t1, -20($fp)	# fill numScores to $t1 from $fp-20
	  sw $t1, 0($t0) 	# store with offset
	# _tmp10 = _tmp9 + _tmp7
	  lw $t2, -52($fp)	# fill _tmp7 to $t2 from $fp-52
	  add $t3, $t0, $t2	
	# arr = _tmp10
	  move $t4, $t3		# copy value to register for arr
	# _tmp11 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# i = _tmp11
	  move $t6, $t5		# copy value to register for i
	  sw $t0, -60($fp)	# spill _tmp9 from $t0 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp10 from $t3 to $fp-64
	  sw $t4, -16($fp)	# spill arr from $t4 to $fp-16
	  sw $t5, -68($fp)	# spill _tmp11 from $t5 to $fp-68
	  sw $t6, -8($fp)	# spill i from $t6 to $fp-8
  _L1:
	# _tmp12 = *(arr + -4)
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
	  lw $t1, -4($t0) 	# load with offset
	# _tmp13 = i < _tmp12
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp13 Goto _L2
	  sw $t1, -72($fp)	# spill _tmp12 from $t1 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp13 from $t3 to $fp-76
	  beqz $t3, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Enter next number: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Enter next number: "
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -80($fp)	# spill _tmp14 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# num = _tmp15
	  move $t1, $t0		# copy value to register for num
	# _tmp16 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp17 = i < _tmp16
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp18 = *(arr + -4)
	  lw $t5, -16($fp)	# fill arr to $t5 from $fp-16
	  lw $t6, -4($t5) 	# load with offset
	# _tmp19 = i < _tmp18
	  slt $t9, $t3, $t6	
	  sw $t9, -100($fp)	# spill _tmp19 from $t9 to $fp-100
	# _tmp20 = _tmp19 == _tmp16
	  lw $t7, -100($fp)	# fill _tmp19 to $t7 from $fp-100
	  seq $t9, $t7, $t2	
	  sw $t9, -104($fp)	# spill _tmp20 from $t9 to $fp-104
	# _tmp21 = _tmp17 || _tmp20
	  lw $t8, -104($fp)	# fill _tmp20 to $t8 from $fp-104
	  or $t9, $t4, $t8	
	  sw $t9, -108($fp)	# spill _tmp21 from $t9 to $fp-108
	# IfZ _tmp21 Goto _L3
	  lw $t7, -108($fp)	# fill _tmp21 to $t7 from $fp-108
	  sw $t0, -84($fp)	# spill _tmp15 from $t0 to $fp-84
	  sw $t1, -12($fp)	# spill num from $t1 to $fp-12
	  sw $t2, -88($fp)	# spill _tmp16 from $t2 to $fp-88
	  sw $t4, -92($fp)	# spill _tmp17 from $t4 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp18 from $t6 to $fp-96
	  beqz $t7, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -112($fp)	# spill _tmp22 from $t0 to $fp-112
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp23 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp24 = _tmp23 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp25 = arr + _tmp24
	  lw $t3, -16($fp)	# fill arr to $t3 from $fp-16
	  add $t4, $t3, $t2	
	# *(_tmp25) = num
	  lw $t5, -12($fp)	# fill num to $t5 from $fp-12
	  sw $t5, 0($t4) 	# store with offset
	# _tmp26 = 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp27 = i + _tmp26
	  add $t9, $t1, $t6	
	  sw $t9, -132($fp)	# spill _tmp27 from $t9 to $fp-132
	# i = _tmp27
	  lw $t7, -132($fp)	# fill _tmp27 to $t7 from $fp-132
	  move $t1, $t7		# copy value to register for i
	# Goto _L1
	  sw $t0, -116($fp)	# spill _tmp23 from $t0 to $fp-116
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -120($fp)	# spill _tmp24 from $t2 to $fp-120
	  sw $t4, -124($fp)	# spill _tmp25 from $t4 to $fp-124
	  sw $t6, -128($fp)	# spill _tmp26 from $t6 to $fp-128
	  b _L1		# unconditional branch
  _L2:
	# Return arr
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
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
  _Sort:
	# BeginFunc 304
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 304	# decrement sp to make space for locals/temps
	# _tmp28 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# i = _tmp28
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -20($fp)	# spill _tmp28 from $t0 to $fp-20
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L4:
	# _tmp29 = *(arr + -4)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp30 = i < _tmp29
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp30 Goto _L5
	  sw $t1, -24($fp)	# spill _tmp29 from $t1 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp30 from $t3 to $fp-28
	  beqz $t3, _L5	# branch if _tmp30 is zero 
	# _tmp31 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp32 = i - _tmp31
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  sub $t2, $t1, $t0	
	# j = _tmp32
	  move $t3, $t2		# copy value to register for j
	# _tmp33 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp34 = i < _tmp33
	  slt $t5, $t1, $t4	
	# _tmp35 = *(arr + -4)
	  lw $t6, 4($fp)	# fill arr to $t6 from $fp+4
	  lw $t9, -4($t6) 	# load with offset
	  sw $t9, -48($fp)	# spill _tmp35 from $t9 to $fp-48
	# _tmp36 = i < _tmp35
	  lw $t8, -48($fp)	# fill _tmp35 to $t8 from $fp-48
	  slt $t9, $t1, $t8	
	  sw $t9, -52($fp)	# spill _tmp36 from $t9 to $fp-52
	# _tmp37 = _tmp36 == _tmp33
	  lw $t7, -52($fp)	# fill _tmp36 to $t7 from $fp-52
	  seq $t9, $t7, $t4	
	  sw $t9, -56($fp)	# spill _tmp37 from $t9 to $fp-56
	# _tmp38 = _tmp34 || _tmp37
	  lw $t8, -56($fp)	# fill _tmp37 to $t8 from $fp-56
	  or $t9, $t5, $t8	
	  sw $t9, -60($fp)	# spill _tmp38 from $t9 to $fp-60
	# IfZ _tmp38 Goto _L6
	  lw $t7, -60($fp)	# fill _tmp38 to $t7 from $fp-60
	  sw $t0, -32($fp)	# spill _tmp31 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp32 from $t2 to $fp-36
	  sw $t3, -12($fp)	# spill j from $t3 to $fp-12
	  sw $t4, -40($fp)	# spill _tmp33 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp34 from $t5 to $fp-44
	  beqz $t7, _L6	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -64($fp)	# spill _tmp39 from $t0 to $fp-64
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp40 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp41 = _tmp40 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp42 = arr + _tmp41
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp43 = *(_tmp42)
	  lw $t5, 0($t4) 	# load with offset
	# val = _tmp43
	  move $t6, $t5		# copy value to register for val
	  sw $t0, -68($fp)	# spill _tmp40 from $t0 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp41 from $t2 to $fp-72
	  sw $t4, -76($fp)	# spill _tmp42 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp43 from $t5 to $fp-80
	  sw $t6, -16($fp)	# spill val from $t6 to $fp-16
  _L7:
	# _tmp44 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp45 = _tmp44 < j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	# _tmp46 = _tmp44 == j
	  seq $t3, $t0, $t1	
	# _tmp47 = _tmp45 || _tmp46
	  or $t4, $t2, $t3	
	# IfZ _tmp47 Goto _L8
	  sw $t0, -84($fp)	# spill _tmp44 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp45 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp46 from $t3 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp47 from $t4 to $fp-96
	  beqz $t4, _L8	# branch if _tmp47 is zero 
	# _tmp48 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp49 = j < _tmp48
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# _tmp50 = *(arr + -4)
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp51 = j < _tmp50
	  slt $t5, $t1, $t4	
	# _tmp52 = _tmp51 == _tmp48
	  seq $t6, $t5, $t0	
	# _tmp53 = _tmp49 || _tmp52
	  or $t9, $t2, $t6	
	  sw $t9, -120($fp)	# spill _tmp53 from $t9 to $fp-120
	# IfZ _tmp53 Goto _L9
	  lw $t7, -120($fp)	# fill _tmp53 to $t7 from $fp-120
	  sw $t0, -100($fp)	# spill _tmp48 from $t0 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp49 from $t2 to $fp-104
	  sw $t4, -108($fp)	# spill _tmp50 from $t4 to $fp-108
	  sw $t5, -112($fp)	# spill _tmp51 from $t5 to $fp-112
	  sw $t6, -116($fp)	# spill _tmp52 from $t6 to $fp-116
	  beqz $t7, _L9	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -124($fp)	# spill _tmp54 from $t0 to $fp-124
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp55 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp56 = _tmp55 * j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp57 = arr + _tmp56
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp58 = *(_tmp57)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp59 = _tmp58 < val
	  lw $t6, -16($fp)	# fill val to $t6 from $fp-16
	  slt $t9, $t5, $t6	
	  sw $t9, -144($fp)	# spill _tmp59 from $t9 to $fp-144
	# _tmp60 = _tmp58 == val
	  seq $t9, $t5, $t6	
	  sw $t9, -148($fp)	# spill _tmp60 from $t9 to $fp-148
	# _tmp61 = _tmp59 || _tmp60
	  lw $t7, -144($fp)	# fill _tmp59 to $t7 from $fp-144
	  lw $t8, -148($fp)	# fill _tmp60 to $t8 from $fp-148
	  or $t9, $t7, $t8	
	  sw $t9, -152($fp)	# spill _tmp61 from $t9 to $fp-152
	# IfZ _tmp61 Goto _L10
	  lw $t7, -152($fp)	# fill _tmp61 to $t7 from $fp-152
	  sw $t0, -128($fp)	# spill _tmp55 from $t0 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp56 from $t2 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp57 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp58 from $t5 to $fp-140
	  beqz $t7, _L10	# branch if _tmp61 is zero 
	# Goto _L8
	  b _L8		# unconditional branch
  _L10:
	# _tmp62 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp63 = j + _tmp62
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# _tmp64 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp65 = _tmp63 < _tmp64
	  slt $t4, $t2, $t3	
	# _tmp66 = *(arr + -4)
	  lw $t5, 4($fp)	# fill arr to $t5 from $fp+4
	  lw $t6, -4($t5) 	# load with offset
	# _tmp67 = _tmp63 < _tmp66
	  slt $t9, $t2, $t6	
	  sw $t9, -176($fp)	# spill _tmp67 from $t9 to $fp-176
	# _tmp68 = _tmp67 == _tmp64
	  lw $t7, -176($fp)	# fill _tmp67 to $t7 from $fp-176
	  seq $t9, $t7, $t3	
	  sw $t9, -180($fp)	# spill _tmp68 from $t9 to $fp-180
	# _tmp69 = _tmp65 || _tmp68
	  lw $t8, -180($fp)	# fill _tmp68 to $t8 from $fp-180
	  or $t9, $t4, $t8	
	  sw $t9, -184($fp)	# spill _tmp69 from $t9 to $fp-184
	# IfZ _tmp69 Goto _L11
	  lw $t7, -184($fp)	# fill _tmp69 to $t7 from $fp-184
	  sw $t0, -156($fp)	# spill _tmp62 from $t0 to $fp-156
	  sw $t2, -160($fp)	# spill _tmp63 from $t2 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp64 from $t3 to $fp-164
	  sw $t4, -168($fp)	# spill _tmp65 from $t4 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp66 from $t6 to $fp-172
	  beqz $t7, _L11	# branch if _tmp69 is zero 
	# _tmp70 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -188($fp)	# spill _tmp70 from $t0 to $fp-188
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp71 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp72 = _tmp71 * _tmp63
	  lw $t1, -160($fp)	# fill _tmp63 to $t1 from $fp-160
	  mul $t2, $t0, $t1	
	# _tmp73 = arr + _tmp72
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp74 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp75 = j < _tmp74
	  lw $t6, -12($fp)	# fill j to $t6 from $fp-12
	  slt $t9, $t6, $t5	
	  sw $t9, -208($fp)	# spill _tmp75 from $t9 to $fp-208
	# _tmp76 = *(arr + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -212($fp)	# spill _tmp76 from $t9 to $fp-212
	# _tmp77 = j < _tmp76
	  lw $t8, -212($fp)	# fill _tmp76 to $t8 from $fp-212
	  slt $t9, $t6, $t8	
	  sw $t9, -216($fp)	# spill _tmp77 from $t9 to $fp-216
	# _tmp78 = _tmp77 == _tmp74
	  lw $t7, -216($fp)	# fill _tmp77 to $t7 from $fp-216
	  seq $t9, $t7, $t5	
	  sw $t9, -220($fp)	# spill _tmp78 from $t9 to $fp-220
	# _tmp79 = _tmp75 || _tmp78
	  lw $t7, -208($fp)	# fill _tmp75 to $t7 from $fp-208
	  lw $t8, -220($fp)	# fill _tmp78 to $t8 from $fp-220
	  or $t9, $t7, $t8	
	  sw $t9, -224($fp)	# spill _tmp79 from $t9 to $fp-224
	# IfZ _tmp79 Goto _L12
	  lw $t7, -224($fp)	# fill _tmp79 to $t7 from $fp-224
	  sw $t0, -192($fp)	# spill _tmp71 from $t0 to $fp-192
	  sw $t2, -196($fp)	# spill _tmp72 from $t2 to $fp-196
	  sw $t4, -200($fp)	# spill _tmp73 from $t4 to $fp-200
	  sw $t5, -204($fp)	# spill _tmp74 from $t5 to $fp-204
	  beqz $t7, _L12	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -228($fp)	# spill _tmp80 from $t0 to $fp-228
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp81 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp82 = _tmp81 * j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp83 = arr + _tmp82
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp84 = *(_tmp83)
	  lw $t5, 0($t4) 	# load with offset
	# *(_tmp73) = _tmp84
	  lw $t6, -200($fp)	# fill _tmp73 to $t6 from $fp-200
	  sw $t5, 0($t6) 	# store with offset
	# _tmp85 = 1
	  li $t9, 1		# load constant value 1 into $t9
	  sw $t9, -248($fp)	# spill _tmp85 from $t9 to $fp-248
	# _tmp86 = j - _tmp85
	  lw $t8, -248($fp)	# fill _tmp85 to $t8 from $fp-248
	  sub $t9, $t1, $t8	
	  sw $t9, -252($fp)	# spill _tmp86 from $t9 to $fp-252
	# j = _tmp86
	  lw $t7, -252($fp)	# fill _tmp86 to $t7 from $fp-252
	  move $t1, $t7		# copy value to register for j
	# Goto _L7
	  sw $t0, -232($fp)	# spill _tmp81 from $t0 to $fp-232
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
	  sw $t2, -236($fp)	# spill _tmp82 from $t2 to $fp-236
	  sw $t4, -240($fp)	# spill _tmp83 from $t4 to $fp-240
	  sw $t5, -244($fp)	# spill _tmp84 from $t5 to $fp-244
	  b _L7		# unconditional branch
  _L8:
	# _tmp87 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp88 = j + _tmp87
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# _tmp89 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp90 = _tmp88 < _tmp89
	  slt $t4, $t2, $t3	
	# _tmp91 = *(arr + -4)
	  lw $t5, 4($fp)	# fill arr to $t5 from $fp+4
	  lw $t6, -4($t5) 	# load with offset
	# _tmp92 = _tmp88 < _tmp91
	  slt $t9, $t2, $t6	
	  sw $t9, -276($fp)	# spill _tmp92 from $t9 to $fp-276
	# _tmp93 = _tmp92 == _tmp89
	  lw $t7, -276($fp)	# fill _tmp92 to $t7 from $fp-276
	  seq $t9, $t7, $t3	
	  sw $t9, -280($fp)	# spill _tmp93 from $t9 to $fp-280
	# _tmp94 = _tmp90 || _tmp93
	  lw $t8, -280($fp)	# fill _tmp93 to $t8 from $fp-280
	  or $t9, $t4, $t8	
	  sw $t9, -284($fp)	# spill _tmp94 from $t9 to $fp-284
	# IfZ _tmp94 Goto _L13
	  lw $t7, -284($fp)	# fill _tmp94 to $t7 from $fp-284
	  sw $t0, -256($fp)	# spill _tmp87 from $t0 to $fp-256
	  sw $t2, -260($fp)	# spill _tmp88 from $t2 to $fp-260
	  sw $t3, -264($fp)	# spill _tmp89 from $t3 to $fp-264
	  sw $t4, -268($fp)	# spill _tmp90 from $t4 to $fp-268
	  sw $t6, -272($fp)	# spill _tmp91 from $t6 to $fp-272
	  beqz $t7, _L13	# branch if _tmp94 is zero 
	# _tmp95 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -288($fp)	# spill _tmp95 from $t0 to $fp-288
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp96 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp97 = _tmp96 * _tmp88
	  lw $t1, -260($fp)	# fill _tmp88 to $t1 from $fp-260
	  mul $t2, $t0, $t1	
	# _tmp98 = arr + _tmp97
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# *(_tmp98) = val
	  lw $t5, -16($fp)	# fill val to $t5 from $fp-16
	  sw $t5, 0($t4) 	# store with offset
	# _tmp99 = 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp100 = i + _tmp99
	  lw $t7, -8($fp)	# fill i to $t7 from $fp-8
	  add $t9, $t7, $t6	
	  sw $t9, -308($fp)	# spill _tmp100 from $t9 to $fp-308
	# i = _tmp100
	  lw $t7, -308($fp)	# fill _tmp100 to $t7 from $fp-308
	  move $t9, $t7		# copy value to register for i
	  sw $t9, -8($fp)	# spill i from $t9 to $fp-8
	# Goto _L4
	  sw $t0, -292($fp)	# spill _tmp96 from $t0 to $fp-292
	  sw $t2, -296($fp)	# spill _tmp97 from $t2 to $fp-296
	  sw $t4, -300($fp)	# spill _tmp98 from $t4 to $fp-300
	  sw $t6, -304($fp)	# spill _tmp99 from $t6 to $fp-304
	  b _L4		# unconditional branch
  _L5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintArray:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp101 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp101
	  move $t1, $t0		# copy value to register for i
	# _tmp102 = "Sorted results: "
	  .data			# create string constant marked with label
	  _string10: .asciiz "Sorted results: "
	  .text
	  la $t2, _string10	# load label
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -12($fp)	# spill _tmp101 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -16($fp)	# spill _tmp102 from $t2 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L14:
	# _tmp103 = *(arr + -4)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp104 = i < _tmp103
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp104 Goto _L15
	  sw $t1, -20($fp)	# spill _tmp103 from $t1 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp104 from $t3 to $fp-24
	  beqz $t3, _L15	# branch if _tmp104 is zero 
	# _tmp105 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp106 = i < _tmp105
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp107 = *(arr + -4)
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp108 = i < _tmp107
	  slt $t5, $t1, $t4	
	# _tmp109 = _tmp108 == _tmp105
	  seq $t6, $t5, $t0	
	# _tmp110 = _tmp106 || _tmp109
	  or $t9, $t2, $t6	
	  sw $t9, -48($fp)	# spill _tmp110 from $t9 to $fp-48
	# IfZ _tmp110 Goto _L16
	  lw $t7, -48($fp)	# fill _tmp110 to $t7 from $fp-48
	  sw $t0, -28($fp)	# spill _tmp105 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp106 from $t2 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp107 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp108 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp109 from $t6 to $fp-44
	  beqz $t7, _L16	# branch if _tmp110 is zero 
	# _tmp111 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp111
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -52($fp)	# spill _tmp111 from $t0 to $fp-52
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp112 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp113 = _tmp112 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp114 = arr + _tmp113
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  add $t4, $t3, $t2	
	# _tmp115 = *(_tmp114)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp115
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -56($fp)	# spill _tmp112 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp113 from $t2 to $fp-60
	  sw $t4, -64($fp)	# spill _tmp114 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp115 from $t5 to $fp-68
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp116 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -72($fp)	# spill _tmp116 from $t0 to $fp-72
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp117 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp118 = i + _tmp117
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp118
	  move $t1, $t2		# copy value to register for i
	# Goto _L14
	  sw $t0, -76($fp)	# spill _tmp117 from $t0 to $fp-76
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -80($fp)	# spill _tmp118 from $t2 to $fp-80
	  b _L14		# unconditional branch
  _L15:
	# _tmp119 = "\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp119
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -84($fp)	# spill _tmp119 from $t0 to $fp-84
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp120 = "\nThis program will read in a bunch of numbers an..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "\nThis program will read in a bunch of numbers and print them\n"
	  .text
	  la $t0, _string14	# load label
	# PushParam _tmp120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -12($fp)	# spill _tmp120 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp121 = "back out in sorted order.\n\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "back out in sorted order.\n\n"
	  .text
	  la $t0, _string15	# load label
	# PushParam _tmp121
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -16($fp)	# spill _tmp121 from $t0 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp122 = LCall _ReadArray
	  jal _ReadArray     	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# arr = _tmp122
	  move $t1, $t0		# copy value to register for arr
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _Sort
	  sw $t0, -20($fp)	# spill _tmp122 from $t0 to $fp-20
	  sw $t1, -8($fp)	# spill arr from $t1 to $fp-8
	  jal _Sort          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill arr to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	  jal _PrintArray    	# jump to function
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
