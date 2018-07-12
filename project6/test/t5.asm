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
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp0 from $t3 to $fp-12
	# i = _tmp0
	  lw $t3, -12($fp)	# fill _tmp0 to $t3 from $fp-12
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L0:
	# _tmp1 = *(names + -4)
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp2 = i < _tmp1
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -16($fp)	# spill _tmp1 from $t4 to $fp-16
	  sw $t6, -20($fp)	# spill _tmp2 from $t6 to $fp-20
	# IfZ _tmp2 Goto _L1
	  lw $t3, -20($fp)	# fill _tmp2 to $t3 from $fp-20
	  beqz $t3, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -24($fp)	# spill _tmp3 from $t4 to $fp-24
	# _tmp4 = i < _tmp3
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  lw $t5, -24($fp)	# fill _tmp3 to $t5 from $fp-24
	  slt $t6, $t4, $t5	
	  sw $t3, -20($fp)	# spill _tmp2 from $t3 to $fp-20
	  sw $t6, -28($fp)	# spill _tmp4 from $t6 to $fp-28
	# _tmp5 = *(names + -4)
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp6 = i < _tmp5
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -32($fp)	# spill _tmp5 from $t4 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp6 from $t6 to $fp-36
	# _tmp7 = _tmp6 == _tmp3
	  lw $t3, -36($fp)	# fill _tmp6 to $t3 from $fp-36
	  lw $t4, -24($fp)	# fill _tmp3 to $t4 from $fp-24
	  seq $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp7 from $t5 to $fp-40
	# _tmp8 = _tmp4 || _tmp7
	  lw $t3, -28($fp)	# fill _tmp4 to $t3 from $fp-28
	  lw $t4, -40($fp)	# fill _tmp7 to $t4 from $fp-40
	  or $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp8 from $t5 to $fp-44
	# IfZ _tmp8 Goto _L2
	  lw $t3, -44($fp)	# fill _tmp8 to $t3 from $fp-44
	  beqz $t3, _L2	# branch if _tmp8 is zero 
	# _tmp9 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -48($fp)	# spill _tmp9 from $t4 to $fp-48
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -48($fp)	# fill _tmp9 to $t4 from $fp-48
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -44($fp)	# spill _tmp8 from $t3 to $fp-44
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp10 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -52($fp)	# spill _tmp10 from $t3 to $fp-52
	# _tmp11 = _tmp10 * i
	  lw $t3, -52($fp)	# fill _tmp10 to $t3 from $fp-52
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -56($fp)	# spill _tmp11 from $t5 to $fp-56
	# _tmp12 = names + _tmp11
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  lw $t4, -56($fp)	# fill _tmp11 to $t4 from $fp-56
	  add $t5, $t3, $t4	
	  sw $t5, -60($fp)	# spill _tmp12 from $t5 to $fp-60
	# _tmp13 = *(_tmp12)
	  lw $t3, -60($fp)	# fill _tmp12 to $t3 from $fp-60
	  lw $t4, 0($t3) 	# load with offset
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, 8($fp)	# fill answer to $t5 from $fp+8
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, -64($fp)	# spill _tmp13 from $t4 to $fp-64
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -64($fp)	# fill _tmp13 to $t3 from $fp-64
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -68($fp)	# spill _tmp14 from $t3 to $fp-68
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp14 Goto _L3
	  lw $t3, -68($fp)	# fill _tmp14 to $t3 from $fp-68
	  beqz $t3, _L3	# branch if _tmp14 is zero 
	# _tmp15 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -72($fp)	# spill _tmp15 from $t4 to $fp-72
	# Return _tmp15
	  lw $t4, -72($fp)	# fill _tmp15 to $t4 from $fp-72
	  move $v0, $t4		# assign return value into $v0
	  sw $t3, -68($fp)	# spill _tmp14 from $t3 to $fp-68
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L3:
	# _tmp16 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -76($fp)	# spill _tmp16 from $t3 to $fp-76
	# _tmp17 = i + _tmp16
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -76($fp)	# fill _tmp16 to $t4 from $fp-76
	  add $t5, $t3, $t4	
	  sw $t5, -80($fp)	# spill _tmp17 from $t5 to $fp-80
	# i = _tmp17
	  lw $t3, -80($fp)	# fill _tmp17 to $t3 from $fp-80
	# Goto _L0
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L0		# unconditional branch
  _L1:
	# _tmp18 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -84($fp)	# spill _tmp18 from $t3 to $fp-84
	# Return _tmp18
	  lw $t3, -84($fp)	# fill _tmp18 to $t3 from $fp-84
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
	# BeginFunc 260
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 260	# decrement sp to make space for locals/temps
	# _tmp19 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -12($fp)	# spill _tmp19 from $t3 to $fp-12
	# _tmp20 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp20 from $t3 to $fp-16
	# _tmp21 = _tmp19 < _tmp20
	  lw $t3, -12($fp)	# fill _tmp19 to $t3 from $fp-12
	  lw $t4, -16($fp)	# fill _tmp20 to $t4 from $fp-16
	  slt $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp21 from $t5 to $fp-20
	# IfZ _tmp21 Goto _L4
	  lw $t3, -20($fp)	# fill _tmp21 to $t3 from $fp-20
	  beqz $t3, _L4	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string2	# load label
	  sw $t4, -24($fp)	# spill _tmp22 from $t4 to $fp-24
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -24($fp)	# fill _tmp22 to $t4 from $fp-24
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -20($fp)	# spill _tmp21 from $t3 to $fp-20
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp23 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -28($fp)	# spill _tmp23 from $t3 to $fp-28
	# _tmp24 = _tmp23 + _tmp19
	  lw $t3, -28($fp)	# fill _tmp23 to $t3 from $fp-28
	  lw $t4, -12($fp)	# fill _tmp19 to $t4 from $fp-12
	  add $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp24 from $t5 to $fp-32
	# _tmp25 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -36($fp)	# spill _tmp25 from $t3 to $fp-36
	# _tmp26 = _tmp24 * _tmp25
	  lw $t3, -32($fp)	# fill _tmp24 to $t3 from $fp-32
	  lw $t4, -36($fp)	# fill _tmp25 to $t4 from $fp-36
	  mul $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp26 from $t5 to $fp-40
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -40($fp)	# fill _tmp26 to $t3 from $fp-40
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -44($fp)	# spill _tmp27 from $t3 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	  lw $t3, -12($fp)	# fill _tmp19 to $t3 from $fp-12
	  lw $t4, -44($fp)	# fill _tmp27 to $t4 from $fp-44
	  sw $t3, 0($t4) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	  lw $t5, -36($fp)	# fill _tmp25 to $t5 from $fp-36
	  add $t6, $t4, $t5	
	  sw $t4, -44($fp)	# spill _tmp27 from $t4 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp28 from $t6 to $fp-48
	# names = _tmp28
	  lw $t3, -48($fp)	# fill _tmp28 to $t3 from $fp-48
	# _tmp29 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -52($fp)	# spill _tmp29 from $t4 to $fp-52
	# _tmp30 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -56($fp)	# spill _tmp30 from $t4 to $fp-56
	# _tmp31 = _tmp29 < _tmp30
	  lw $t4, -52($fp)	# fill _tmp29 to $t4 from $fp-52
	  lw $t5, -56($fp)	# fill _tmp30 to $t5 from $fp-56
	  slt $t6, $t4, $t5	
	  sw $t3, -8($fp)	# spill names from $t3 to $fp-8
	  sw $t6, -60($fp)	# spill _tmp31 from $t6 to $fp-60
	# _tmp32 = *(names + -4)
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	  lw $t5, -52($fp)	# fill _tmp29 to $t5 from $fp-52
	  slt $t6, $t5, $t4	
	  sw $t4, -64($fp)	# spill _tmp32 from $t4 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp33 from $t6 to $fp-68
	# _tmp34 = _tmp33 == _tmp30
	  lw $t3, -68($fp)	# fill _tmp33 to $t3 from $fp-68
	  lw $t4, -56($fp)	# fill _tmp30 to $t4 from $fp-56
	  seq $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp34 from $t5 to $fp-72
	# _tmp35 = _tmp31 || _tmp34
	  lw $t3, -60($fp)	# fill _tmp31 to $t3 from $fp-60
	  lw $t4, -72($fp)	# fill _tmp34 to $t4 from $fp-72
	  or $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp35 from $t5 to $fp-76
	# IfZ _tmp35 Goto _L5
	  lw $t3, -76($fp)	# fill _tmp35 to $t3 from $fp-76
	  beqz $t3, _L5	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string3	# load label
	  sw $t4, -80($fp)	# spill _tmp36 from $t4 to $fp-80
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -80($fp)	# fill _tmp36 to $t4 from $fp-80
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -76($fp)	# spill _tmp35 from $t3 to $fp-76
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp37 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -84($fp)	# spill _tmp37 from $t3 to $fp-84
	# _tmp38 = _tmp37 * _tmp29
	  lw $t3, -84($fp)	# fill _tmp37 to $t3 from $fp-84
	  lw $t4, -52($fp)	# fill _tmp29 to $t4 from $fp-52
	  mul $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp38 from $t5 to $fp-88
	# _tmp39 = names + _tmp38
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -88($fp)	# fill _tmp38 to $t4 from $fp-88
	  add $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp39 from $t5 to $fp-92
	# _tmp40 = "Brian"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Brian"
	  .text
	  la $t3, _string4	# load label
	  sw $t3, -96($fp)	# spill _tmp40 from $t3 to $fp-96
	# *(_tmp39) = _tmp40
	  lw $t3, -96($fp)	# fill _tmp40 to $t3 from $fp-96
	  lw $t4, -92($fp)	# fill _tmp39 to $t4 from $fp-92
	  sw $t3, 0($t4) 	# store with offset
	# _tmp41 = 1
	  li $t5, 1		# load constant value 1 into $t5
	  sw $t5, -100($fp)	# spill _tmp41 from $t5 to $fp-100
	# _tmp42 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -104($fp)	# spill _tmp42 from $t5 to $fp-104
	# _tmp43 = _tmp41 < _tmp42
	  lw $t5, -100($fp)	# fill _tmp41 to $t5 from $fp-100
	  lw $t6, -104($fp)	# fill _tmp42 to $t6 from $fp-104
	  slt $t7, $t5, $t6	
	  sw $t4, -92($fp)	# spill _tmp39 from $t4 to $fp-92
	  sw $t7, -108($fp)	# spill _tmp43 from $t7 to $fp-108
	# _tmp44 = *(names + -4)
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp45 = _tmp41 < _tmp44
	  lw $t5, -100($fp)	# fill _tmp41 to $t5 from $fp-100
	  slt $t6, $t5, $t4	
	  sw $t4, -112($fp)	# spill _tmp44 from $t4 to $fp-112
	  sw $t6, -116($fp)	# spill _tmp45 from $t6 to $fp-116
	# _tmp46 = _tmp45 == _tmp42
	  lw $t3, -116($fp)	# fill _tmp45 to $t3 from $fp-116
	  lw $t4, -104($fp)	# fill _tmp42 to $t4 from $fp-104
	  seq $t5, $t3, $t4	
	  sw $t5, -120($fp)	# spill _tmp46 from $t5 to $fp-120
	# _tmp47 = _tmp43 || _tmp46
	  lw $t3, -108($fp)	# fill _tmp43 to $t3 from $fp-108
	  lw $t4, -120($fp)	# fill _tmp46 to $t4 from $fp-120
	  or $t5, $t3, $t4	
	  sw $t5, -124($fp)	# spill _tmp47 from $t5 to $fp-124
	# IfZ _tmp47 Goto _L6
	  lw $t3, -124($fp)	# fill _tmp47 to $t3 from $fp-124
	  beqz $t3, _L6	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string5	# load label
	  sw $t4, -128($fp)	# spill _tmp48 from $t4 to $fp-128
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -128($fp)	# fill _tmp48 to $t4 from $fp-128
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -124($fp)	# spill _tmp47 from $t3 to $fp-124
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp49 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -132($fp)	# spill _tmp49 from $t3 to $fp-132
	# _tmp50 = _tmp49 * _tmp41
	  lw $t3, -132($fp)	# fill _tmp49 to $t3 from $fp-132
	  lw $t4, -100($fp)	# fill _tmp41 to $t4 from $fp-100
	  mul $t5, $t3, $t4	
	  sw $t5, -136($fp)	# spill _tmp50 from $t5 to $fp-136
	# _tmp51 = names + _tmp50
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -136($fp)	# fill _tmp50 to $t4 from $fp-136
	  add $t5, $t3, $t4	
	  sw $t5, -140($fp)	# spill _tmp51 from $t5 to $fp-140
	# _tmp52 = "Cam"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Cam"
	  .text
	  la $t3, _string6	# load label
	  sw $t3, -144($fp)	# spill _tmp52 from $t3 to $fp-144
	# *(_tmp51) = _tmp52
	  lw $t3, -144($fp)	# fill _tmp52 to $t3 from $fp-144
	  lw $t4, -140($fp)	# fill _tmp51 to $t4 from $fp-140
	  sw $t3, 0($t4) 	# store with offset
	# _tmp53 = 2
	  li $t5, 2		# load constant value 2 into $t5
	  sw $t5, -148($fp)	# spill _tmp53 from $t5 to $fp-148
	# _tmp54 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -152($fp)	# spill _tmp54 from $t5 to $fp-152
	# _tmp55 = _tmp53 < _tmp54
	  lw $t5, -148($fp)	# fill _tmp53 to $t5 from $fp-148
	  lw $t6, -152($fp)	# fill _tmp54 to $t6 from $fp-152
	  slt $t7, $t5, $t6	
	  sw $t4, -140($fp)	# spill _tmp51 from $t4 to $fp-140
	  sw $t7, -156($fp)	# spill _tmp55 from $t7 to $fp-156
	# _tmp56 = *(names + -4)
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp57 = _tmp53 < _tmp56
	  lw $t5, -148($fp)	# fill _tmp53 to $t5 from $fp-148
	  slt $t6, $t5, $t4	
	  sw $t4, -160($fp)	# spill _tmp56 from $t4 to $fp-160
	  sw $t6, -164($fp)	# spill _tmp57 from $t6 to $fp-164
	# _tmp58 = _tmp57 == _tmp54
	  lw $t3, -164($fp)	# fill _tmp57 to $t3 from $fp-164
	  lw $t4, -152($fp)	# fill _tmp54 to $t4 from $fp-152
	  seq $t5, $t3, $t4	
	  sw $t5, -168($fp)	# spill _tmp58 from $t5 to $fp-168
	# _tmp59 = _tmp55 || _tmp58
	  lw $t3, -156($fp)	# fill _tmp55 to $t3 from $fp-156
	  lw $t4, -168($fp)	# fill _tmp58 to $t4 from $fp-168
	  or $t5, $t3, $t4	
	  sw $t5, -172($fp)	# spill _tmp59 from $t5 to $fp-172
	# IfZ _tmp59 Goto _L7
	  lw $t3, -172($fp)	# fill _tmp59 to $t3 from $fp-172
	  beqz $t3, _L7	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string7	# load label
	  sw $t4, -176($fp)	# spill _tmp60 from $t4 to $fp-176
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -176($fp)	# fill _tmp60 to $t4 from $fp-176
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -172($fp)	# spill _tmp59 from $t3 to $fp-172
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp61 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -180($fp)	# spill _tmp61 from $t3 to $fp-180
	# _tmp62 = _tmp61 * _tmp53
	  lw $t3, -180($fp)	# fill _tmp61 to $t3 from $fp-180
	  lw $t4, -148($fp)	# fill _tmp53 to $t4 from $fp-148
	  mul $t5, $t3, $t4	
	  sw $t5, -184($fp)	# spill _tmp62 from $t5 to $fp-184
	# _tmp63 = names + _tmp62
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -184($fp)	# fill _tmp62 to $t4 from $fp-184
	  add $t5, $t3, $t4	
	  sw $t5, -188($fp)	# spill _tmp63 from $t5 to $fp-188
	# _tmp64 = "Gavan"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Gavan"
	  .text
	  la $t3, _string8	# load label
	  sw $t3, -192($fp)	# spill _tmp64 from $t3 to $fp-192
	# *(_tmp63) = _tmp64
	  lw $t3, -192($fp)	# fill _tmp64 to $t3 from $fp-192
	  lw $t4, -188($fp)	# fill _tmp63 to $t4 from $fp-188
	  sw $t3, 0($t4) 	# store with offset
	# _tmp65 = 3
	  li $t5, 3		# load constant value 3 into $t5
	  sw $t5, -196($fp)	# spill _tmp65 from $t5 to $fp-196
	# _tmp66 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -200($fp)	# spill _tmp66 from $t5 to $fp-200
	# _tmp67 = _tmp65 < _tmp66
	  lw $t5, -196($fp)	# fill _tmp65 to $t5 from $fp-196
	  lw $t6, -200($fp)	# fill _tmp66 to $t6 from $fp-200
	  slt $t7, $t5, $t6	
	  sw $t4, -188($fp)	# spill _tmp63 from $t4 to $fp-188
	  sw $t7, -204($fp)	# spill _tmp67 from $t7 to $fp-204
	# _tmp68 = *(names + -4)
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp69 = _tmp65 < _tmp68
	  lw $t5, -196($fp)	# fill _tmp65 to $t5 from $fp-196
	  slt $t6, $t5, $t4	
	  sw $t4, -208($fp)	# spill _tmp68 from $t4 to $fp-208
	  sw $t6, -212($fp)	# spill _tmp69 from $t6 to $fp-212
	# _tmp70 = _tmp69 == _tmp66
	  lw $t3, -212($fp)	# fill _tmp69 to $t3 from $fp-212
	  lw $t4, -200($fp)	# fill _tmp66 to $t4 from $fp-200
	  seq $t5, $t3, $t4	
	  sw $t5, -216($fp)	# spill _tmp70 from $t5 to $fp-216
	# _tmp71 = _tmp67 || _tmp70
	  lw $t3, -204($fp)	# fill _tmp67 to $t3 from $fp-204
	  lw $t4, -216($fp)	# fill _tmp70 to $t4 from $fp-216
	  or $t5, $t3, $t4	
	  sw $t5, -220($fp)	# spill _tmp71 from $t5 to $fp-220
	# IfZ _tmp71 Goto _L8
	  lw $t3, -220($fp)	# fill _tmp71 to $t3 from $fp-220
	  beqz $t3, _L8	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string9	# load label
	  sw $t4, -224($fp)	# spill _tmp72 from $t4 to $fp-224
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -224($fp)	# fill _tmp72 to $t4 from $fp-224
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -220($fp)	# spill _tmp71 from $t3 to $fp-220
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp73 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -228($fp)	# spill _tmp73 from $t3 to $fp-228
	# _tmp74 = _tmp73 * _tmp65
	  lw $t3, -228($fp)	# fill _tmp73 to $t3 from $fp-228
	  lw $t4, -196($fp)	# fill _tmp65 to $t4 from $fp-196
	  mul $t5, $t3, $t4	
	  sw $t5, -232($fp)	# spill _tmp74 from $t5 to $fp-232
	# _tmp75 = names + _tmp74
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  lw $t4, -232($fp)	# fill _tmp74 to $t4 from $fp-232
	  add $t5, $t3, $t4	
	  sw $t5, -236($fp)	# spill _tmp75 from $t5 to $fp-236
	# _tmp76 = "Julie"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Julie"
	  .text
	  la $t3, _string10	# load label
	  sw $t3, -240($fp)	# spill _tmp76 from $t3 to $fp-240
	# *(_tmp75) = _tmp76
	  lw $t3, -240($fp)	# fill _tmp76 to $t3 from $fp-240
	  lw $t4, -236($fp)	# fill _tmp75 to $t4 from $fp-236
	  sw $t3, 0($t4) 	# store with offset
	  sw $t4, -236($fp)	# spill _tmp75 from $t4 to $fp-236
  _L9:
	# _tmp77 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -244($fp)	# spill _tmp77 from $t3 to $fp-244
	# IfZ _tmp77 Goto _L10
	  lw $t3, -244($fp)	# fill _tmp77 to $t3 from $fp-244
	  beqz $t3, _L10	# branch if _tmp77 is zero 
	# _tmp78 = "\nWho is your favorite CS143 staff member? "
	  .data			# create string constant marked with label
	  _string11: .asciiz "\nWho is your favorite CS143 staff member? "
	  .text
	  la $t4, _string11	# load label
	  sw $t4, -248($fp)	# spill _tmp78 from $t4 to $fp-248
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -248($fp)	# fill _tmp78 to $t4 from $fp-248
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -244($fp)	# spill _tmp77 from $t3 to $fp-244
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -252($fp)	# spill _tmp79 from $t3 to $fp-252
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -252($fp)	# fill _tmp79 to $t3 from $fp-252
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam names
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill names to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp80 = LCall _Wild
	  jal _Wild          	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -256($fp)	# spill _tmp80 from $t3 to $fp-256
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp80 Goto _L11
	  lw $t3, -256($fp)	# fill _tmp80 to $t3 from $fp-256
	  beqz $t3, _L11	# branch if _tmp80 is zero 
	# _tmp81 = "You just earned 1000 bonus points!\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "You just earned 1000 bonus points!\n"
	  .text
	  la $t4, _string12	# load label
	  sw $t4, -260($fp)	# spill _tmp81 from $t4 to $fp-260
	# PushParam _tmp81
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -260($fp)	# fill _tmp81 to $t4 from $fp-260
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -256($fp)	# spill _tmp80 from $t3 to $fp-256
	# LCall _PrintString
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
	  la $t3, _string13	# load label
	  sw $t3, -264($fp)	# spill _tmp82 from $t3 to $fp-264
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -264($fp)	# fill _tmp82 to $t3 from $fp-264
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
