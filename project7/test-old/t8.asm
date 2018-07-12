	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Squash.Grow:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = "But I don't like squash\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "But I don't like squash\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp2 = 5
	  li $t1, 5		# load constant value 5 into $t1
	# _tmp3 = _tmp1 * _tmp2
	  mul $t2, $t0, $t1	
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -12($fp)	# spill _tmp1 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp2 from $t1 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Squash
	  .data
	  .align 2
	  Squash:		# label for class Squash vtable
	  .word _Vegetable.Eat
	  .word _Squash.Grow
	  .text
  _Vegetable.Eat:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp4 = 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp5 = 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp6 = _tmp4 % _tmp5
	  rem $t2, $t0, $t1	
	# *(this + 4) = _tmp6
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t2, 4($t3) 	# store with offset
	# _tmp7 = "Yum! "
	  .data			# create string constant marked with label
	  _string2: .asciiz "Yum! "
	  .text
	  la $t4, _string2	# load label
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -16($fp)	# spill _tmp4 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp5 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp6 from $t2 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp7 from $t4 to $fp-28
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t1, -32($fp)	# spill _tmp8 from $t1 to $fp-32
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -36($fp)	# spill _tmp9 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = *(veg)
	  lw $t0, 8($fp)	# fill veg to $t0 from $fp+8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp11 = *(_tmp10 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam w
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill w to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -8($fp)	# fill s to $t4 from $fp-8
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam veg
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  sw $t1, -40($fp)	# spill _tmp10 from $t1 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp11 from $t2 to $fp-44
	  jalr $t2            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# Return 
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
  _Vegetable.Grow:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp12 = "Grow, little vegetables, grow!\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Grow, little vegetables, grow!\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -8($fp)	# spill _tmp12 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp14 = *(_tmp13)
	  lw $t2, 0($t1) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp14
	  sw $t1, -12($fp)	# spill _tmp13 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp14 from $t2 to $fp-16
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Vegetable
	  .data
	  .align 2
	  Vegetable:		# label for class Vegetable vtable
	  .word _Vegetable.Eat
	  .word _Vegetable.Grow
	  .text
  _Grow:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp15 = "mmm... veggies!\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "mmm... veggies!\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -8($fp)	# spill _tmp15 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Seeds
	  .data
	  .align 2
	  Seeds:		# label for class Seeds vtable
	  .text
  main:
	# BeginFunc 264
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 264	# decrement sp to make space for locals/temps
	# _tmp16 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp17 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp18 = _tmp16 < _tmp17
	  slt $t2, $t0, $t1	
	# IfZ _tmp18 Goto _L0
	  sw $t0, -12($fp)	# spill _tmp16 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp17 from $t1 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp18 from $t2 to $fp-20
	  beqz $t2, _L0	# branch if _tmp18 is zero 
	# _tmp19 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -24($fp)	# spill _tmp19 from $t0 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp20 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp21 = _tmp20 + _tmp16
	  lw $t1, -12($fp)	# fill _tmp16 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	# _tmp22 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp23 = _tmp21 * _tmp22
	  mul $t4, $t2, $t3	
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp24 = LCall _Alloc
	  sw $t0, -28($fp)	# spill _tmp20 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp21 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp22 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp23 from $t4 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp24) = _tmp16
	  lw $t1, -12($fp)	# fill _tmp16 to $t1 from $fp-12
	  sw $t1, 0($t0) 	# store with offset
	# _tmp25 = _tmp24 + _tmp22
	  lw $t2, -36($fp)	# fill _tmp22 to $t2 from $fp-36
	  add $t3, $t0, $t2	
	# veggies = _tmp25
	  move $t4, $t3		# copy value to register for veggies
	# _tmp26 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp27 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp28 = _tmp26 < _tmp27
	  slt $t9, $t5, $t6	
	  sw $t9, -60($fp)	# spill _tmp28 from $t9 to $fp-60
	# _tmp29 = *(veggies + -4)
	  lw $t9, -4($t4) 	# load with offset
	  sw $t9, -64($fp)	# spill _tmp29 from $t9 to $fp-64
	# _tmp30 = _tmp26 < _tmp29
	  lw $t8, -64($fp)	# fill _tmp29 to $t8 from $fp-64
	  slt $t9, $t5, $t8	
	  sw $t9, -68($fp)	# spill _tmp30 from $t9 to $fp-68
	# _tmp31 = _tmp30 == _tmp27
	  lw $t7, -68($fp)	# fill _tmp30 to $t7 from $fp-68
	  seq $t9, $t7, $t6	
	  sw $t9, -72($fp)	# spill _tmp31 from $t9 to $fp-72
	# _tmp32 = _tmp28 || _tmp31
	  lw $t7, -60($fp)	# fill _tmp28 to $t7 from $fp-60
	  lw $t8, -72($fp)	# fill _tmp31 to $t8 from $fp-72
	  or $t9, $t7, $t8	
	  sw $t9, -76($fp)	# spill _tmp32 from $t9 to $fp-76
	# IfZ _tmp32 Goto _L1
	  lw $t7, -76($fp)	# fill _tmp32 to $t7 from $fp-76
	  sw $t0, -44($fp)	# spill _tmp24 from $t0 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp25 from $t3 to $fp-48
	  sw $t4, -8($fp)	# spill veggies from $t4 to $fp-8
	  sw $t5, -52($fp)	# spill _tmp26 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp27 from $t6 to $fp-56
	  beqz $t7, _L1	# branch if _tmp32 is zero 
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -80($fp)	# spill _tmp33 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp34 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp35 = _tmp34 * _tmp26
	  lw $t1, -52($fp)	# fill _tmp26 to $t1 from $fp-52
	  mul $t2, $t0, $t1	
	# _tmp36 = veggies + _tmp35
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp37 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp38 = LCall _Alloc
	  sw $t0, -84($fp)	# spill _tmp34 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp35 from $t2 to $fp-88
	  sw $t4, -92($fp)	# spill _tmp36 from $t4 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp37 from $t5 to $fp-96
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = Squash
	  la $t1, Squash	# load label
	# *(_tmp38) = _tmp39
	  sw $t1, 0($t0) 	# store with offset
	# *(_tmp36) = _tmp38
	  lw $t2, -92($fp)	# fill _tmp36 to $t2 from $fp-92
	  sw $t0, 0($t2) 	# store with offset
	# _tmp40 = 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp41 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp42 = _tmp40 < _tmp41
	  slt $t5, $t3, $t4	
	# _tmp43 = *(veggies + -4)
	  lw $t6, -8($fp)	# fill veggies to $t6 from $fp-8
	  lw $t9, -4($t6) 	# load with offset
	  sw $t9, -120($fp)	# spill _tmp43 from $t9 to $fp-120
	# _tmp44 = _tmp40 < _tmp43
	  lw $t8, -120($fp)	# fill _tmp43 to $t8 from $fp-120
	  slt $t9, $t3, $t8	
	  sw $t9, -124($fp)	# spill _tmp44 from $t9 to $fp-124
	# _tmp45 = _tmp44 == _tmp41
	  lw $t7, -124($fp)	# fill _tmp44 to $t7 from $fp-124
	  seq $t9, $t7, $t4	
	  sw $t9, -128($fp)	# spill _tmp45 from $t9 to $fp-128
	# _tmp46 = _tmp42 || _tmp45
	  lw $t8, -128($fp)	# fill _tmp45 to $t8 from $fp-128
	  or $t9, $t5, $t8	
	  sw $t9, -132($fp)	# spill _tmp46 from $t9 to $fp-132
	# IfZ _tmp46 Goto _L2
	  lw $t7, -132($fp)	# fill _tmp46 to $t7 from $fp-132
	  sw $t0, -100($fp)	# spill _tmp38 from $t0 to $fp-100
	  sw $t1, -104($fp)	# spill _tmp39 from $t1 to $fp-104
	  sw $t3, -108($fp)	# spill _tmp40 from $t3 to $fp-108
	  sw $t4, -112($fp)	# spill _tmp41 from $t4 to $fp-112
	  sw $t5, -116($fp)	# spill _tmp42 from $t5 to $fp-116
	  beqz $t7, _L2	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -136($fp)	# spill _tmp47 from $t0 to $fp-136
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp48 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp49 = _tmp48 * _tmp40
	  lw $t1, -108($fp)	# fill _tmp40 to $t1 from $fp-108
	  mul $t2, $t0, $t1	
	# _tmp50 = veggies + _tmp49
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp51 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  sw $t0, -140($fp)	# spill _tmp48 from $t0 to $fp-140
	  sw $t2, -144($fp)	# spill _tmp49 from $t2 to $fp-144
	  sw $t4, -148($fp)	# spill _tmp50 from $t4 to $fp-148
	  sw $t5, -152($fp)	# spill _tmp51 from $t5 to $fp-152
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = Vegetable
	  la $t1, Vegetable	# load label
	# *(_tmp52) = _tmp53
	  sw $t1, 0($t0) 	# store with offset
	# *(_tmp50) = _tmp52
	  lw $t2, -148($fp)	# fill _tmp50 to $t2 from $fp-148
	  sw $t0, 0($t2) 	# store with offset
	# _tmp54 = 10
	  li $t3, 10		# load constant value 10 into $t3
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _Grow
	  sw $t0, -156($fp)	# spill _tmp52 from $t0 to $fp-156
	  sw $t1, -160($fp)	# spill _tmp53 from $t1 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp54 from $t3 to $fp-164
	  jal _Grow          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp56 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp57 = _tmp55 < _tmp56
	  slt $t2, $t0, $t1	
	# _tmp58 = *(veggies + -4)
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp59 = _tmp55 < _tmp58
	  slt $t5, $t0, $t4	
	# _tmp60 = _tmp59 == _tmp56
	  seq $t6, $t5, $t1	
	# _tmp61 = _tmp57 || _tmp60
	  or $t9, $t2, $t6	
	  sw $t9, -192($fp)	# spill _tmp61 from $t9 to $fp-192
	# IfZ _tmp61 Goto _L3
	  lw $t7, -192($fp)	# fill _tmp61 to $t7 from $fp-192
	  sw $t0, -168($fp)	# spill _tmp55 from $t0 to $fp-168
	  sw $t1, -172($fp)	# spill _tmp56 from $t1 to $fp-172
	  sw $t2, -176($fp)	# spill _tmp57 from $t2 to $fp-176
	  sw $t4, -180($fp)	# spill _tmp58 from $t4 to $fp-180
	  sw $t5, -184($fp)	# spill _tmp59 from $t5 to $fp-184
	  sw $t6, -188($fp)	# spill _tmp60 from $t6 to $fp-188
	  beqz $t7, _L3	# branch if _tmp61 is zero 
	# _tmp62 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp62
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -196($fp)	# spill _tmp62 from $t0 to $fp-196
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp63 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp64 = _tmp63 * _tmp55
	  lw $t1, -168($fp)	# fill _tmp55 to $t1 from $fp-168
	  mul $t2, $t0, $t1	
	# _tmp65 = veggies + _tmp64
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp66 = *(_tmp65)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp67 = 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp68 = 0
	  li $t9, 0		# load constant value 0 into $t9
	  sw $t9, -220($fp)	# spill _tmp68 from $t9 to $fp-220
	# _tmp69 = _tmp67 < _tmp68
	  lw $t8, -220($fp)	# fill _tmp68 to $t8 from $fp-220
	  slt $t9, $t6, $t8	
	  sw $t9, -224($fp)	# spill _tmp69 from $t9 to $fp-224
	# _tmp70 = *(veggies + -4)
	  lw $t9, -4($t3) 	# load with offset
	  sw $t9, -228($fp)	# spill _tmp70 from $t9 to $fp-228
	# _tmp71 = _tmp67 < _tmp70
	  lw $t8, -228($fp)	# fill _tmp70 to $t8 from $fp-228
	  slt $t9, $t6, $t8	
	  sw $t9, -232($fp)	# spill _tmp71 from $t9 to $fp-232
	# _tmp72 = _tmp71 == _tmp68
	  lw $t7, -232($fp)	# fill _tmp71 to $t7 from $fp-232
	  lw $t8, -220($fp)	# fill _tmp68 to $t8 from $fp-220
	  seq $t9, $t7, $t8	
	  sw $t9, -236($fp)	# spill _tmp72 from $t9 to $fp-236
	# _tmp73 = _tmp69 || _tmp72
	  lw $t7, -224($fp)	# fill _tmp69 to $t7 from $fp-224
	  lw $t8, -236($fp)	# fill _tmp72 to $t8 from $fp-236
	  or $t9, $t7, $t8	
	  sw $t9, -240($fp)	# spill _tmp73 from $t9 to $fp-240
	# IfZ _tmp73 Goto _L4
	  lw $t7, -240($fp)	# fill _tmp73 to $t7 from $fp-240
	  sw $t0, -200($fp)	# spill _tmp63 from $t0 to $fp-200
	  sw $t2, -204($fp)	# spill _tmp64 from $t2 to $fp-204
	  sw $t4, -208($fp)	# spill _tmp65 from $t4 to $fp-208
	  sw $t5, -212($fp)	# spill _tmp66 from $t5 to $fp-212
	  sw $t6, -216($fp)	# spill _tmp67 from $t6 to $fp-216
	  beqz $t7, _L4	# branch if _tmp73 is zero 
	# _tmp74 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -244($fp)	# spill _tmp74 from $t0 to $fp-244
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp75 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp76 = _tmp75 * _tmp67
	  lw $t1, -216($fp)	# fill _tmp67 to $t1 from $fp-216
	  mul $t2, $t0, $t1	
	# _tmp77 = veggies + _tmp76
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# _tmp78 = *(_tmp77)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp79 = *(_tmp78)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp80 = *(_tmp79)
	  lw $t9, 0($t6) 	# load with offset
	  sw $t9, -268($fp)	# spill _tmp80 from $t9 to $fp-268
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -212($fp)	# fill _tmp66 to $t7 from $fp-212
	  sw $t7, 4($sp)	# copy param value to stack
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# ACall _tmp80
	  lw $t7, -268($fp)	# fill _tmp80 to $t7 from $fp-268
	  sw $t0, -248($fp)	# spill _tmp75 from $t0 to $fp-248
	  sw $t2, -252($fp)	# spill _tmp76 from $t2 to $fp-252
	  sw $t4, -256($fp)	# spill _tmp77 from $t4 to $fp-256
	  sw $t5, -260($fp)	# spill _tmp78 from $t5 to $fp-260
	  sw $t6, -264($fp)	# spill _tmp79 from $t6 to $fp-264
	  jalr $t7            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
