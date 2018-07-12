	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _tester:
	# BeginFunc 216
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 216	# decrement sp to make space for locals/temps
	# _tmp0 = "Value of sz is "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Value of sz is "
	  .text
	  la $t3, _string1	# load label
	  sw $t3, -16($fp)	# spill _tmp0 from $t3 to $fp-16
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp0 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam sz
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill sz to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t3, _string2	# load label
	  sw $t3, -20($fp)	# spill _tmp1 from $t3 to $fp-20
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp1 to $t3 from $fp-20
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -24($fp)	# spill _tmp2 from $t3 to $fp-24
	# _tmp3 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -28($fp)	# spill _tmp3 from $t3 to $fp-28
	# _tmp4 = _tmp2 < _tmp3
	  lw $t3, -24($fp)	# fill _tmp2 to $t3 from $fp-24
	  lw $t4, -28($fp)	# fill _tmp3 to $t4 from $fp-28
	  slt $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp4 from $t5 to $fp-32
	# IfZ _tmp4 Goto _L0
	  lw $t3, -32($fp)	# fill _tmp4 to $t3 from $fp-32
	  beqz $t3, _L0	# branch if _tmp4 is zero 
	# _tmp5 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string3	# load label
	  sw $t4, -36($fp)	# spill _tmp5 from $t4 to $fp-36
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -36($fp)	# fill _tmp5 to $t4 from $fp-36
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -32($fp)	# spill _tmp4 from $t3 to $fp-32
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp6 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -40($fp)	# spill _tmp6 from $t3 to $fp-40
	# _tmp7 = _tmp6 + _tmp2
	  lw $t3, -40($fp)	# fill _tmp6 to $t3 from $fp-40
	  lw $t4, -24($fp)	# fill _tmp2 to $t4 from $fp-24
	  add $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp7 from $t5 to $fp-44
	# _tmp8 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -48($fp)	# spill _tmp8 from $t3 to $fp-48
	# _tmp9 = _tmp7 * _tmp8
	  lw $t3, -44($fp)	# fill _tmp7 to $t3 from $fp-44
	  lw $t4, -48($fp)	# fill _tmp8 to $t4 from $fp-48
	  mul $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp9 from $t5 to $fp-52
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -52($fp)	# fill _tmp9 to $t3 from $fp-52
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp10 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -56($fp)	# spill _tmp10 from $t3 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp10) = _tmp2
	  lw $t3, -24($fp)	# fill _tmp2 to $t3 from $fp-24
	  lw $t4, -56($fp)	# fill _tmp10 to $t4 from $fp-56
	  sw $t3, 0($t4) 	# store with offset
	# _tmp11 = _tmp10 + _tmp8
	  lw $t5, -48($fp)	# fill _tmp8 to $t5 from $fp-48
	  add $t6, $t4, $t5	
	  sw $t4, -56($fp)	# spill _tmp10 from $t4 to $fp-56
	  sw $t6, -60($fp)	# spill _tmp11 from $t6 to $fp-60
	# b = _tmp11
	  lw $t3, -60($fp)	# fill _tmp11 to $t3 from $fp-60
	# _tmp12 = "After b\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "After b\n"
	  .text
	  la $t4, _string4	# load label
	  sw $t4, -64($fp)	# spill _tmp12 from $t4 to $fp-64
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -64($fp)	# fill _tmp12 to $t4 from $fp-64
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, 4($gp)	# spill b from $t3 to $gp+4
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -68($fp)	# spill _tmp13 from $t3 to $fp-68
	# _tmp14 = sz < _tmp13
	  lw $t3, 4($fp)	# fill sz to $t3 from $fp+4
	  lw $t4, -68($fp)	# fill _tmp13 to $t4 from $fp-68
	  slt $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp14 from $t5 to $fp-72
	# IfZ _tmp14 Goto _L1
	  lw $t3, -72($fp)	# fill _tmp14 to $t3 from $fp-72
	  beqz $t3, _L1	# branch if _tmp14 is zero 
	# _tmp15 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string5	# load label
	  sw $t4, -76($fp)	# spill _tmp15 from $t4 to $fp-76
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -76($fp)	# fill _tmp15 to $t4 from $fp-76
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -72($fp)	# spill _tmp14 from $t3 to $fp-72
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp16 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -80($fp)	# spill _tmp16 from $t3 to $fp-80
	# _tmp17 = _tmp16 + sz
	  lw $t3, -80($fp)	# fill _tmp16 to $t3 from $fp-80
	  lw $t4, 4($fp)	# fill sz to $t4 from $fp+4
	  add $t5, $t3, $t4	
	  sw $t5, -84($fp)	# spill _tmp17 from $t5 to $fp-84
	# _tmp18 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -88($fp)	# spill _tmp18 from $t3 to $fp-88
	# _tmp19 = _tmp17 * _tmp18
	  lw $t3, -84($fp)	# fill _tmp17 to $t3 from $fp-84
	  lw $t4, -88($fp)	# fill _tmp18 to $t4 from $fp-88
	  mul $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp19 from $t5 to $fp-92
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -92($fp)	# fill _tmp19 to $t3 from $fp-92
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp20 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -96($fp)	# spill _tmp20 from $t3 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp20) = sz
	  lw $t3, 4($fp)	# fill sz to $t3 from $fp+4
	  lw $t4, -96($fp)	# fill _tmp20 to $t4 from $fp-96
	  sw $t3, 0($t4) 	# store with offset
	# _tmp21 = _tmp20 + _tmp18
	  lw $t5, -88($fp)	# fill _tmp18 to $t5 from $fp-88
	  add $t6, $t4, $t5	
	  sw $t4, -96($fp)	# spill _tmp20 from $t4 to $fp-96
	  sw $t6, -100($fp)	# spill _tmp21 from $t6 to $fp-100
	# result = _tmp21
	  lw $t3, -100($fp)	# fill _tmp21 to $t3 from $fp-100
	# _tmp22 = "After Result\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "After Result\n"
	  .text
	  la $t4, _string6	# load label
	  sw $t4, -104($fp)	# spill _tmp22 from $t4 to $fp-104
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -104($fp)	# fill _tmp22 to $t4 from $fp-104
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -12($fp)	# spill result from $t3 to $fp-12
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp23 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -108($fp)	# spill _tmp23 from $t3 to $fp-108
	# i = _tmp23
	  lw $t3, -108($fp)	# fill _tmp23 to $t3 from $fp-108
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L2:
	# _tmp24 = i < sz
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, 4($fp)	# fill sz to $t4 from $fp+4
	  slt $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp24 from $t5 to $fp-112
	# IfZ _tmp24 Goto _L3
	  lw $t3, -112($fp)	# fill _tmp24 to $t3 from $fp-112
	  beqz $t3, _L3	# branch if _tmp24 is zero 
	# _tmp25 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -116($fp)	# spill _tmp25 from $t4 to $fp-116
	# _tmp26 = i < _tmp25
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  lw $t5, -116($fp)	# fill _tmp25 to $t5 from $fp-116
	  slt $t6, $t4, $t5	
	  sw $t3, -112($fp)	# spill _tmp24 from $t3 to $fp-112
	  sw $t6, -120($fp)	# spill _tmp26 from $t6 to $fp-120
	# _tmp27 = *(result + -4)
	  lw $t3, -12($fp)	# fill result to $t3 from $fp-12
	  lw $t4, -4($t3) 	# load with offset
	# _tmp28 = i < _tmp27
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -124($fp)	# spill _tmp27 from $t4 to $fp-124
	  sw $t6, -128($fp)	# spill _tmp28 from $t6 to $fp-128
	# _tmp29 = _tmp28 == _tmp25
	  lw $t3, -128($fp)	# fill _tmp28 to $t3 from $fp-128
	  lw $t4, -116($fp)	# fill _tmp25 to $t4 from $fp-116
	  seq $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp29 from $t5 to $fp-132
	# _tmp30 = _tmp26 || _tmp29
	  lw $t3, -120($fp)	# fill _tmp26 to $t3 from $fp-120
	  lw $t4, -132($fp)	# fill _tmp29 to $t4 from $fp-132
	  or $t5, $t3, $t4	
	  sw $t5, -136($fp)	# spill _tmp30 from $t5 to $fp-136
	# IfZ _tmp30 Goto _L4
	  lw $t3, -136($fp)	# fill _tmp30 to $t3 from $fp-136
	  beqz $t3, _L4	# branch if _tmp30 is zero 
	# _tmp31 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string7	# load label
	  sw $t4, -140($fp)	# spill _tmp31 from $t4 to $fp-140
	# PushParam _tmp31
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -140($fp)	# fill _tmp31 to $t4 from $fp-140
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -136($fp)	# spill _tmp30 from $t3 to $fp-136
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp32 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -144($fp)	# spill _tmp32 from $t3 to $fp-144
	# _tmp33 = _tmp32 * i
	  lw $t3, -144($fp)	# fill _tmp32 to $t3 from $fp-144
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -148($fp)	# spill _tmp33 from $t5 to $fp-148
	# _tmp34 = result + _tmp33
	  lw $t3, -12($fp)	# fill result to $t3 from $fp-12
	  lw $t4, -148($fp)	# fill _tmp33 to $t4 from $fp-148
	  add $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp34 from $t5 to $fp-152
	# *(_tmp34) = i
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -152($fp)	# fill _tmp34 to $t4 from $fp-152
	  sw $t3, 0($t4) 	# store with offset
	# _tmp35 = "Done with an incrument\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Done with an incrument\n"
	  .text
	  la $t5, _string8	# load label
	  sw $t5, -156($fp)	# spill _tmp35 from $t5 to $fp-156
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -156($fp)	# fill _tmp35 to $t5 from $fp-156
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, -152($fp)	# spill _tmp34 from $t4 to $fp-152
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp36 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -160($fp)	# spill _tmp36 from $t3 to $fp-160
	# _tmp37 = i + _tmp36
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -160($fp)	# fill _tmp36 to $t4 from $fp-160
	  add $t5, $t3, $t4	
	  sw $t5, -164($fp)	# spill _tmp37 from $t5 to $fp-164
	# i = _tmp37
	  lw $t3, -164($fp)	# fill _tmp37 to $t3 from $fp-164
	# Goto _L2
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L2		# unconditional branch
  _L3:
	# _tmp38 = "Done with loop\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Done with loop\n"
	  .text
	  la $t3, _string9	# load label
	  sw $t3, -168($fp)	# spill _tmp38 from $t3 to $fp-168
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -168($fp)	# fill _tmp38 to $t3 from $fp-168
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -172($fp)	# spill _tmp39 from $t3 to $fp-172
	# _tmp40 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -176($fp)	# spill _tmp40 from $t3 to $fp-176
	# _tmp41 = _tmp39 < _tmp40
	  lw $t3, -172($fp)	# fill _tmp39 to $t3 from $fp-172
	  lw $t4, -176($fp)	# fill _tmp40 to $t4 from $fp-176
	  slt $t5, $t3, $t4	
	  sw $t5, -180($fp)	# spill _tmp41 from $t5 to $fp-180
	# _tmp42 = *(b + -4)
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp43 = _tmp39 < _tmp42
	  lw $t5, -172($fp)	# fill _tmp39 to $t5 from $fp-172
	  slt $t6, $t5, $t4	
	  sw $t4, -184($fp)	# spill _tmp42 from $t4 to $fp-184
	  sw $t6, -188($fp)	# spill _tmp43 from $t6 to $fp-188
	# _tmp44 = _tmp43 == _tmp40
	  lw $t3, -188($fp)	# fill _tmp43 to $t3 from $fp-188
	  lw $t4, -176($fp)	# fill _tmp40 to $t4 from $fp-176
	  seq $t5, $t3, $t4	
	  sw $t5, -192($fp)	# spill _tmp44 from $t5 to $fp-192
	# _tmp45 = _tmp41 || _tmp44
	  lw $t3, -180($fp)	# fill _tmp41 to $t3 from $fp-180
	  lw $t4, -192($fp)	# fill _tmp44 to $t4 from $fp-192
	  or $t5, $t3, $t4	
	  sw $t5, -196($fp)	# spill _tmp45 from $t5 to $fp-196
	# IfZ _tmp45 Goto _L5
	  lw $t3, -196($fp)	# fill _tmp45 to $t3 from $fp-196
	  beqz $t3, _L5	# branch if _tmp45 is zero 
	# _tmp46 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string10	# load label
	  sw $t4, -200($fp)	# spill _tmp46 from $t4 to $fp-200
	# PushParam _tmp46
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -200($fp)	# fill _tmp46 to $t4 from $fp-200
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -196($fp)	# spill _tmp45 from $t3 to $fp-196
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp47 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -204($fp)	# spill _tmp47 from $t3 to $fp-204
	# _tmp48 = _tmp47 * _tmp39
	  lw $t3, -204($fp)	# fill _tmp47 to $t3 from $fp-204
	  lw $t4, -172($fp)	# fill _tmp39 to $t4 from $fp-172
	  mul $t5, $t3, $t4	
	  sw $t5, -208($fp)	# spill _tmp48 from $t5 to $fp-208
	# _tmp49 = b + _tmp48
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -208($fp)	# fill _tmp48 to $t4 from $fp-208
	  add $t5, $t3, $t4	
	  sw $t5, -212($fp)	# spill _tmp49 from $t5 to $fp-212
	# _tmp50 = "Done"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Done"
	  .text
	  la $t3, _string11	# load label
	  sw $t3, -216($fp)	# spill _tmp50 from $t3 to $fp-216
	# *(_tmp49) = _tmp50
	  lw $t3, -216($fp)	# fill _tmp50 to $t3 from $fp-216
	  lw $t4, -212($fp)	# fill _tmp49 to $t4 from $fp-212
	  sw $t3, 0($t4) 	# store with offset
	# _tmp51 = "Done with setting b\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Done with setting b\n"
	  .text
	  la $t5, _string12	# load label
	  sw $t5, -220($fp)	# spill _tmp51 from $t5 to $fp-220
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -220($fp)	# fill _tmp51 to $t5 from $fp-220
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, -212($fp)	# spill _tmp49 from $t4 to $fp-212
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return result
	  lw $t3, -12($fp)	# fill result to $t3 from $fp-12
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
	# BeginFunc 168
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp52 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -12($fp)	# spill _tmp52 from $t3 to $fp-12
	# PushParam _tmp52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp52 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp53 = LCall _tester
	  jal _tester        	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp53 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp53
	  lw $t3, -16($fp)	# fill _tmp53 to $t3 from $fp-16
	# _tmp54 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -20($fp)	# spill _tmp54 from $t4 to $fp-20
	# _tmp55 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -24($fp)	# spill _tmp55 from $t4 to $fp-24
	# _tmp56 = _tmp54 < _tmp55
	  lw $t4, -20($fp)	# fill _tmp54 to $t4 from $fp-20
	  lw $t5, -24($fp)	# fill _tmp55 to $t5 from $fp-24
	  slt $t6, $t4, $t5	
	  sw $t3, -8($fp)	# spill d from $t3 to $fp-8
	  sw $t6, -28($fp)	# spill _tmp56 from $t6 to $fp-28
	# _tmp57 = *(d + -4)
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp58 = _tmp54 < _tmp57
	  lw $t5, -20($fp)	# fill _tmp54 to $t5 from $fp-20
	  slt $t6, $t5, $t4	
	  sw $t4, -32($fp)	# spill _tmp57 from $t4 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp58 from $t6 to $fp-36
	# _tmp59 = _tmp58 == _tmp55
	  lw $t3, -36($fp)	# fill _tmp58 to $t3 from $fp-36
	  lw $t4, -24($fp)	# fill _tmp55 to $t4 from $fp-24
	  seq $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp59 from $t5 to $fp-40
	# _tmp60 = _tmp56 || _tmp59
	  lw $t3, -28($fp)	# fill _tmp56 to $t3 from $fp-28
	  lw $t4, -40($fp)	# fill _tmp59 to $t4 from $fp-40
	  or $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp60 from $t5 to $fp-44
	# IfZ _tmp60 Goto _L6
	  lw $t3, -44($fp)	# fill _tmp60 to $t3 from $fp-44
	  beqz $t3, _L6	# branch if _tmp60 is zero 
	# _tmp61 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string13	# load label
	  sw $t4, -48($fp)	# spill _tmp61 from $t4 to $fp-48
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -48($fp)	# fill _tmp61 to $t4 from $fp-48
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -44($fp)	# spill _tmp60 from $t3 to $fp-44
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp62 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -52($fp)	# spill _tmp62 from $t3 to $fp-52
	# _tmp63 = _tmp62 * _tmp54
	  lw $t3, -52($fp)	# fill _tmp62 to $t3 from $fp-52
	  lw $t4, -20($fp)	# fill _tmp54 to $t4 from $fp-20
	  mul $t5, $t3, $t4	
	  sw $t5, -56($fp)	# spill _tmp63 from $t5 to $fp-56
	# _tmp64 = d + _tmp63
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  lw $t4, -56($fp)	# fill _tmp63 to $t4 from $fp-56
	  add $t5, $t3, $t4	
	  sw $t5, -60($fp)	# spill _tmp64 from $t5 to $fp-60
	# _tmp65 = *(_tmp64)
	  lw $t3, -60($fp)	# fill _tmp64 to $t3 from $fp-60
	  lw $t4, 0($t3) 	# load with offset
	# _tmp66 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -68($fp)	# spill _tmp66 from $t5 to $fp-68
	# _tmp67 = _tmp65 < _tmp66
	  lw $t5, -68($fp)	# fill _tmp66 to $t5 from $fp-68
	  slt $t6, $t4, $t5	
	  sw $t4, -64($fp)	# spill _tmp65 from $t4 to $fp-64
	  sw $t6, -72($fp)	# spill _tmp67 from $t6 to $fp-72
	# _tmp68 = *(d + -4)
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp69 = _tmp65 < _tmp68
	  lw $t5, -64($fp)	# fill _tmp65 to $t5 from $fp-64
	  slt $t6, $t5, $t4	
	  sw $t4, -76($fp)	# spill _tmp68 from $t4 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp69 from $t6 to $fp-80
	# _tmp70 = _tmp69 == _tmp66
	  lw $t3, -80($fp)	# fill _tmp69 to $t3 from $fp-80
	  lw $t4, -68($fp)	# fill _tmp66 to $t4 from $fp-68
	  seq $t5, $t3, $t4	
	  sw $t5, -84($fp)	# spill _tmp70 from $t5 to $fp-84
	# _tmp71 = _tmp67 || _tmp70
	  lw $t3, -72($fp)	# fill _tmp67 to $t3 from $fp-72
	  lw $t4, -84($fp)	# fill _tmp70 to $t4 from $fp-84
	  or $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp71 from $t5 to $fp-88
	# IfZ _tmp71 Goto _L7
	  lw $t3, -88($fp)	# fill _tmp71 to $t3 from $fp-88
	  beqz $t3, _L7	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string14	# load label
	  sw $t4, -92($fp)	# spill _tmp72 from $t4 to $fp-92
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -92($fp)	# fill _tmp72 to $t4 from $fp-92
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -88($fp)	# spill _tmp71 from $t3 to $fp-88
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp73 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -96($fp)	# spill _tmp73 from $t3 to $fp-96
	# _tmp74 = _tmp73 * _tmp65
	  lw $t3, -96($fp)	# fill _tmp73 to $t3 from $fp-96
	  lw $t4, -64($fp)	# fill _tmp65 to $t4 from $fp-64
	  mul $t5, $t3, $t4	
	  sw $t5, -100($fp)	# spill _tmp74 from $t5 to $fp-100
	# _tmp75 = d + _tmp74
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  lw $t4, -100($fp)	# fill _tmp74 to $t4 from $fp-100
	  add $t5, $t3, $t4	
	  sw $t5, -104($fp)	# spill _tmp75 from $t5 to $fp-104
	# _tmp76 = *(_tmp75)
	  lw $t3, -104($fp)	# fill _tmp75 to $t3 from $fp-104
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -108($fp)	# spill _tmp76 from $t4 to $fp-108
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp77 = "\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "\n"
	  .text
	  la $t3, _string15	# load label
	  sw $t3, -112($fp)	# spill _tmp77 from $t3 to $fp-112
	# PushParam _tmp77
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -112($fp)	# fill _tmp77 to $t3 from $fp-112
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp78 = *(d + -4)
	  lw $t3, -8($fp)	# fill d to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -116($fp)	# spill _tmp78 from $t4 to $fp-116
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = "\n"
	  .data			# create string constant marked with label
	  _string16: .asciiz "\n"
	  .text
	  la $t3, _string16	# load label
	  sw $t3, -120($fp)	# spill _tmp79 from $t3 to $fp-120
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -120($fp)	# fill _tmp79 to $t3 from $fp-120
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp80 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -124($fp)	# spill _tmp80 from $t3 to $fp-124
	# _tmp81 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -128($fp)	# spill _tmp81 from $t3 to $fp-128
	# _tmp82 = _tmp80 < _tmp81
	  lw $t3, -124($fp)	# fill _tmp80 to $t3 from $fp-124
	  lw $t4, -128($fp)	# fill _tmp81 to $t4 from $fp-128
	  slt $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp82 from $t5 to $fp-132
	# _tmp83 = *(b + -4)
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp84 = _tmp80 < _tmp83
	  lw $t5, -124($fp)	# fill _tmp80 to $t5 from $fp-124
	  slt $t6, $t5, $t4	
	  sw $t4, -136($fp)	# spill _tmp83 from $t4 to $fp-136
	  sw $t6, -140($fp)	# spill _tmp84 from $t6 to $fp-140
	# _tmp85 = _tmp84 == _tmp81
	  lw $t3, -140($fp)	# fill _tmp84 to $t3 from $fp-140
	  lw $t4, -128($fp)	# fill _tmp81 to $t4 from $fp-128
	  seq $t5, $t3, $t4	
	  sw $t5, -144($fp)	# spill _tmp85 from $t5 to $fp-144
	# _tmp86 = _tmp82 || _tmp85
	  lw $t3, -132($fp)	# fill _tmp82 to $t3 from $fp-132
	  lw $t4, -144($fp)	# fill _tmp85 to $t4 from $fp-144
	  or $t5, $t3, $t4	
	  sw $t5, -148($fp)	# spill _tmp86 from $t5 to $fp-148
	# IfZ _tmp86 Goto _L8
	  lw $t3, -148($fp)	# fill _tmp86 to $t3 from $fp-148
	  beqz $t3, _L8	# branch if _tmp86 is zero 
	# _tmp87 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string17: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string17	# load label
	  sw $t4, -152($fp)	# spill _tmp87 from $t4 to $fp-152
	# PushParam _tmp87
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -152($fp)	# fill _tmp87 to $t4 from $fp-152
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -148($fp)	# spill _tmp86 from $t3 to $fp-148
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp88 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -156($fp)	# spill _tmp88 from $t3 to $fp-156
	# _tmp89 = _tmp88 * _tmp80
	  lw $t3, -156($fp)	# fill _tmp88 to $t3 from $fp-156
	  lw $t4, -124($fp)	# fill _tmp80 to $t4 from $fp-124
	  mul $t5, $t3, $t4	
	  sw $t5, -160($fp)	# spill _tmp89 from $t5 to $fp-160
	# _tmp90 = b + _tmp89
	  lw $t3, 4($gp)	# fill b to $t3 from $gp+4
	  lw $t4, -160($fp)	# fill _tmp89 to $t4 from $fp-160
	  add $t5, $t3, $t4	
	  sw $t5, -164($fp)	# spill _tmp90 from $t5 to $fp-164
	# _tmp91 = *(_tmp90)
	  lw $t3, -164($fp)	# fill _tmp90 to $t3 from $fp-164
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp91
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -168($fp)	# spill _tmp91 from $t4 to $fp-168
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp92 = "\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "\n"
	  .text
	  la $t3, _string18	# load label
	  sw $t3, -172($fp)	# spill _tmp92 from $t3 to $fp-172
	# PushParam _tmp92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -172($fp)	# fill _tmp92 to $t3 from $fp-172
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
