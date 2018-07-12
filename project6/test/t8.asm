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
	  la $t3, _string1	# load label
	  sw $t3, -8($fp)	# spill _tmp0 from $t3 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp0 to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -12($fp)	# spill _tmp1 from $t3 to $fp-12
	# _tmp2 = 5
	  li $t3, 5		# load constant value 5 into $t3
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	# _tmp3 = _tmp1 * _tmp2
	  lw $t3, -12($fp)	# fill _tmp1 to $t3 from $fp-12
	  lw $t4, -16($fp)	# fill _tmp2 to $t4 from $fp-16
	  mul $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp3 from $t5 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp3 to $t3 from $fp-20
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
	  li $t3, 5		# load constant value 5 into $t3
	  sw $t3, -16($fp)	# spill _tmp4 from $t3 to $fp-16
	# _tmp5 = 2
	  li $t3, 2		# load constant value 2 into $t3
	  sw $t3, -20($fp)	# spill _tmp5 from $t3 to $fp-20
	# _tmp6 = _tmp4 % _tmp5
	  lw $t3, -16($fp)	# fill _tmp4 to $t3 from $fp-16
	  lw $t4, -20($fp)	# fill _tmp5 to $t4 from $fp-20
	  rem $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp6 from $t5 to $fp-24
	# *(this + 4) = _tmp6
	  lw $t3, -24($fp)	# fill _tmp6 to $t3 from $fp-24
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# _tmp7 = "Yum! "
	  .data			# create string constant marked with label
	  _string2: .asciiz "Yum! "
	  .text
	  la $t5, _string2	# load label
	  sw $t5, -28($fp)	# spill _tmp7 from $t5 to $fp-28
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -28($fp)	# fill _tmp7 to $t5 from $fp-28
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -32($fp)	# spill _tmp8 from $t4 to $fp-32
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t3, _string3	# load label
	  sw $t3, -36($fp)	# spill _tmp9 from $t3 to $fp-36
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -36($fp)	# fill _tmp9 to $t3 from $fp-36
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = *(veg)
	  lw $t3, 8($fp)	# fill veg to $t3 from $fp+8
	  lw $t4, 0($t3) 	# load with offset
	# _tmp11 = *(_tmp10 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam w
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -12($fp)	# fill w to $t6 from $fp-12
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -40($fp)	# spill _tmp10 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp11 from $t5 to $fp-44
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill s to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam veg
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill veg to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $t3, -44($fp)	# fill _tmp11 to $t3 from $fp-44
	  jalr $t3            	# jump to function
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
	  la $t3, _string4	# load label
	  sw $t3, -8($fp)	# spill _tmp12 from $t3 to $fp-8
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp12 to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp14 = *(_tmp13)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill _tmp13 from $t4 to $fp-12
	  sw $t5, -16($fp)	# spill _tmp14 from $t5 to $fp-16
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp14
	  lw $t3, -16($fp)	# fill _tmp14 to $t3 from $fp-16
	  jalr $t3            	# jump to function
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
	  la $t3, _string5	# load label
	  sw $t3, -8($fp)	# spill _tmp15 from $t3 to $fp-8
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp15 to $t3 from $fp-8
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
	  li $t3, 2		# load constant value 2 into $t3
	  sw $t3, -12($fp)	# spill _tmp16 from $t3 to $fp-12
	# _tmp17 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp17 from $t3 to $fp-16
	# _tmp18 = _tmp16 < _tmp17
	  lw $t3, -12($fp)	# fill _tmp16 to $t3 from $fp-12
	  lw $t4, -16($fp)	# fill _tmp17 to $t4 from $fp-16
	  slt $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp18 from $t5 to $fp-20
	# IfZ _tmp18 Goto _L0
	  lw $t3, -20($fp)	# fill _tmp18 to $t3 from $fp-20
	  beqz $t3, _L0	# branch if _tmp18 is zero 
	# _tmp19 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string6	# load label
	  sw $t4, -24($fp)	# spill _tmp19 from $t4 to $fp-24
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -24($fp)	# fill _tmp19 to $t4 from $fp-24
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -20($fp)	# spill _tmp18 from $t3 to $fp-20
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp20 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -28($fp)	# spill _tmp20 from $t3 to $fp-28
	# _tmp21 = _tmp20 + _tmp16
	  lw $t3, -28($fp)	# fill _tmp20 to $t3 from $fp-28
	  lw $t4, -12($fp)	# fill _tmp16 to $t4 from $fp-12
	  add $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp21 from $t5 to $fp-32
	# _tmp22 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -36($fp)	# spill _tmp22 from $t3 to $fp-36
	# _tmp23 = _tmp21 * _tmp22
	  lw $t3, -32($fp)	# fill _tmp21 to $t3 from $fp-32
	  lw $t4, -36($fp)	# fill _tmp22 to $t4 from $fp-36
	  mul $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp23 from $t5 to $fp-40
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -40($fp)	# fill _tmp23 to $t3 from $fp-40
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp24 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -44($fp)	# spill _tmp24 from $t3 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp24) = _tmp16
	  lw $t3, -12($fp)	# fill _tmp16 to $t3 from $fp-12
	  lw $t4, -44($fp)	# fill _tmp24 to $t4 from $fp-44
	  sw $t3, 0($t4) 	# store with offset
	# _tmp25 = _tmp24 + _tmp22
	  lw $t5, -36($fp)	# fill _tmp22 to $t5 from $fp-36
	  add $t6, $t4, $t5	
	  sw $t4, -44($fp)	# spill _tmp24 from $t4 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp25 from $t6 to $fp-48
	# veggies = _tmp25
	  lw $t3, -48($fp)	# fill _tmp25 to $t3 from $fp-48
	# _tmp26 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -52($fp)	# spill _tmp26 from $t4 to $fp-52
	# _tmp27 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -56($fp)	# spill _tmp27 from $t4 to $fp-56
	# _tmp28 = _tmp26 < _tmp27
	  lw $t4, -52($fp)	# fill _tmp26 to $t4 from $fp-52
	  lw $t5, -56($fp)	# fill _tmp27 to $t5 from $fp-56
	  slt $t6, $t4, $t5	
	  sw $t3, -8($fp)	# spill veggies from $t3 to $fp-8
	  sw $t6, -60($fp)	# spill _tmp28 from $t6 to $fp-60
	# _tmp29 = *(veggies + -4)
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp30 = _tmp26 < _tmp29
	  lw $t5, -52($fp)	# fill _tmp26 to $t5 from $fp-52
	  slt $t6, $t5, $t4	
	  sw $t4, -64($fp)	# spill _tmp29 from $t4 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp30 from $t6 to $fp-68
	# _tmp31 = _tmp30 == _tmp27
	  lw $t3, -68($fp)	# fill _tmp30 to $t3 from $fp-68
	  lw $t4, -56($fp)	# fill _tmp27 to $t4 from $fp-56
	  seq $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp31 from $t5 to $fp-72
	# _tmp32 = _tmp28 || _tmp31
	  lw $t3, -60($fp)	# fill _tmp28 to $t3 from $fp-60
	  lw $t4, -72($fp)	# fill _tmp31 to $t4 from $fp-72
	  or $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp32 from $t5 to $fp-76
	# IfZ _tmp32 Goto _L1
	  lw $t3, -76($fp)	# fill _tmp32 to $t3 from $fp-76
	  beqz $t3, _L1	# branch if _tmp32 is zero 
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string7	# load label
	  sw $t4, -80($fp)	# spill _tmp33 from $t4 to $fp-80
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -80($fp)	# fill _tmp33 to $t4 from $fp-80
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -76($fp)	# spill _tmp32 from $t3 to $fp-76
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp34 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -84($fp)	# spill _tmp34 from $t3 to $fp-84
	# _tmp35 = _tmp34 * _tmp26
	  lw $t3, -84($fp)	# fill _tmp34 to $t3 from $fp-84
	  lw $t4, -52($fp)	# fill _tmp26 to $t4 from $fp-52
	  mul $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp35 from $t5 to $fp-88
	# _tmp36 = veggies + _tmp35
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -88($fp)	# fill _tmp35 to $t4 from $fp-88
	  add $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp36 from $t5 to $fp-92
	# _tmp37 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -96($fp)	# spill _tmp37 from $t3 to $fp-96
	# PushParam _tmp37
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -96($fp)	# fill _tmp37 to $t3 from $fp-96
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp38 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -100($fp)	# spill _tmp38 from $t3 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = Squash
	  la $t3, Squash	# load label
	  sw $t3, -104($fp)	# spill _tmp39 from $t3 to $fp-104
	# *(_tmp38) = _tmp39
	  lw $t3, -104($fp)	# fill _tmp39 to $t3 from $fp-104
	  lw $t4, -100($fp)	# fill _tmp38 to $t4 from $fp-100
	  sw $t3, 0($t4) 	# store with offset
	# *(_tmp36) = _tmp38
	  lw $t5, -92($fp)	# fill _tmp36 to $t5 from $fp-92
	  sw $t4, 0($t5) 	# store with offset
	# _tmp40 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -108($fp)	# spill _tmp40 from $t6 to $fp-108
	# _tmp41 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -112($fp)	# spill _tmp41 from $t6 to $fp-112
	# _tmp42 = _tmp40 < _tmp41
	  lw $t6, -108($fp)	# fill _tmp40 to $t6 from $fp-108
	  lw $t7, -112($fp)	# fill _tmp41 to $t7 from $fp-112
	  slt $t8, $t6, $t7	
	  sw $t4, -100($fp)	# spill _tmp38 from $t4 to $fp-100
	  sw $t5, -92($fp)	# spill _tmp36 from $t5 to $fp-92
	  sw $t8, -116($fp)	# spill _tmp42 from $t8 to $fp-116
	# _tmp43 = *(veggies + -4)
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp44 = _tmp40 < _tmp43
	  lw $t5, -108($fp)	# fill _tmp40 to $t5 from $fp-108
	  slt $t6, $t5, $t4	
	  sw $t4, -120($fp)	# spill _tmp43 from $t4 to $fp-120
	  sw $t6, -124($fp)	# spill _tmp44 from $t6 to $fp-124
	# _tmp45 = _tmp44 == _tmp41
	  lw $t3, -124($fp)	# fill _tmp44 to $t3 from $fp-124
	  lw $t4, -112($fp)	# fill _tmp41 to $t4 from $fp-112
	  seq $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp45 from $t5 to $fp-128
	# _tmp46 = _tmp42 || _tmp45
	  lw $t3, -116($fp)	# fill _tmp42 to $t3 from $fp-116
	  lw $t4, -128($fp)	# fill _tmp45 to $t4 from $fp-128
	  or $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp46 from $t5 to $fp-132
	# IfZ _tmp46 Goto _L2
	  lw $t3, -132($fp)	# fill _tmp46 to $t3 from $fp-132
	  beqz $t3, _L2	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string8	# load label
	  sw $t4, -136($fp)	# spill _tmp47 from $t4 to $fp-136
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -136($fp)	# fill _tmp47 to $t4 from $fp-136
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -132($fp)	# spill _tmp46 from $t3 to $fp-132
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp48 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -140($fp)	# spill _tmp48 from $t3 to $fp-140
	# _tmp49 = _tmp48 * _tmp40
	  lw $t3, -140($fp)	# fill _tmp48 to $t3 from $fp-140
	  lw $t4, -108($fp)	# fill _tmp40 to $t4 from $fp-108
	  mul $t5, $t3, $t4	
	  sw $t5, -144($fp)	# spill _tmp49 from $t5 to $fp-144
	# _tmp50 = veggies + _tmp49
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -144($fp)	# fill _tmp49 to $t4 from $fp-144
	  add $t5, $t3, $t4	
	  sw $t5, -148($fp)	# spill _tmp50 from $t5 to $fp-148
	# _tmp51 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -152($fp)	# spill _tmp51 from $t3 to $fp-152
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -152($fp)	# fill _tmp51 to $t3 from $fp-152
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -156($fp)	# spill _tmp52 from $t3 to $fp-156
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = Vegetable
	  la $t3, Vegetable	# load label
	  sw $t3, -160($fp)	# spill _tmp53 from $t3 to $fp-160
	# *(_tmp52) = _tmp53
	  lw $t3, -160($fp)	# fill _tmp53 to $t3 from $fp-160
	  lw $t4, -156($fp)	# fill _tmp52 to $t4 from $fp-156
	  sw $t3, 0($t4) 	# store with offset
	# *(_tmp50) = _tmp52
	  lw $t5, -148($fp)	# fill _tmp50 to $t5 from $fp-148
	  sw $t4, 0($t5) 	# store with offset
	# _tmp54 = 10
	  li $t6, 10		# load constant value 10 into $t6
	  sw $t6, -164($fp)	# spill _tmp54 from $t6 to $fp-164
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -164($fp)	# fill _tmp54 to $t6 from $fp-164
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -156($fp)	# spill _tmp52 from $t4 to $fp-156
	  sw $t5, -148($fp)	# spill _tmp50 from $t5 to $fp-148
	# LCall _Grow
	  jal _Grow          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -168($fp)	# spill _tmp55 from $t3 to $fp-168
	# _tmp56 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -172($fp)	# spill _tmp56 from $t3 to $fp-172
	# _tmp57 = _tmp55 < _tmp56
	  lw $t3, -168($fp)	# fill _tmp55 to $t3 from $fp-168
	  lw $t4, -172($fp)	# fill _tmp56 to $t4 from $fp-172
	  slt $t5, $t3, $t4	
	  sw $t5, -176($fp)	# spill _tmp57 from $t5 to $fp-176
	# _tmp58 = *(veggies + -4)
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp59 = _tmp55 < _tmp58
	  lw $t5, -168($fp)	# fill _tmp55 to $t5 from $fp-168
	  slt $t6, $t5, $t4	
	  sw $t4, -180($fp)	# spill _tmp58 from $t4 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp59 from $t6 to $fp-184
	# _tmp60 = _tmp59 == _tmp56
	  lw $t3, -184($fp)	# fill _tmp59 to $t3 from $fp-184
	  lw $t4, -172($fp)	# fill _tmp56 to $t4 from $fp-172
	  seq $t5, $t3, $t4	
	  sw $t5, -188($fp)	# spill _tmp60 from $t5 to $fp-188
	# _tmp61 = _tmp57 || _tmp60
	  lw $t3, -176($fp)	# fill _tmp57 to $t3 from $fp-176
	  lw $t4, -188($fp)	# fill _tmp60 to $t4 from $fp-188
	  or $t5, $t3, $t4	
	  sw $t5, -192($fp)	# spill _tmp61 from $t5 to $fp-192
	# IfZ _tmp61 Goto _L3
	  lw $t3, -192($fp)	# fill _tmp61 to $t3 from $fp-192
	  beqz $t3, _L3	# branch if _tmp61 is zero 
	# _tmp62 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string9	# load label
	  sw $t4, -196($fp)	# spill _tmp62 from $t4 to $fp-196
	# PushParam _tmp62
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -196($fp)	# fill _tmp62 to $t4 from $fp-196
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -192($fp)	# spill _tmp61 from $t3 to $fp-192
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp63 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -200($fp)	# spill _tmp63 from $t3 to $fp-200
	# _tmp64 = _tmp63 * _tmp55
	  lw $t3, -200($fp)	# fill _tmp63 to $t3 from $fp-200
	  lw $t4, -168($fp)	# fill _tmp55 to $t4 from $fp-168
	  mul $t5, $t3, $t4	
	  sw $t5, -204($fp)	# spill _tmp64 from $t5 to $fp-204
	# _tmp65 = veggies + _tmp64
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -204($fp)	# fill _tmp64 to $t4 from $fp-204
	  add $t5, $t3, $t4	
	  sw $t5, -208($fp)	# spill _tmp65 from $t5 to $fp-208
	# _tmp66 = *(_tmp65)
	  lw $t3, -208($fp)	# fill _tmp65 to $t3 from $fp-208
	  lw $t4, 0($t3) 	# load with offset
	# _tmp67 = 1
	  li $t5, 1		# load constant value 1 into $t5
	  sw $t5, -216($fp)	# spill _tmp67 from $t5 to $fp-216
	# _tmp68 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -220($fp)	# spill _tmp68 from $t5 to $fp-220
	# _tmp69 = _tmp67 < _tmp68
	  lw $t5, -216($fp)	# fill _tmp67 to $t5 from $fp-216
	  lw $t6, -220($fp)	# fill _tmp68 to $t6 from $fp-220
	  slt $t7, $t5, $t6	
	  sw $t4, -212($fp)	# spill _tmp66 from $t4 to $fp-212
	  sw $t7, -224($fp)	# spill _tmp69 from $t7 to $fp-224
	# _tmp70 = *(veggies + -4)
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -4($t3) 	# load with offset
	# _tmp71 = _tmp67 < _tmp70
	  lw $t5, -216($fp)	# fill _tmp67 to $t5 from $fp-216
	  slt $t6, $t5, $t4	
	  sw $t4, -228($fp)	# spill _tmp70 from $t4 to $fp-228
	  sw $t6, -232($fp)	# spill _tmp71 from $t6 to $fp-232
	# _tmp72 = _tmp71 == _tmp68
	  lw $t3, -232($fp)	# fill _tmp71 to $t3 from $fp-232
	  lw $t4, -220($fp)	# fill _tmp68 to $t4 from $fp-220
	  seq $t5, $t3, $t4	
	  sw $t5, -236($fp)	# spill _tmp72 from $t5 to $fp-236
	# _tmp73 = _tmp69 || _tmp72
	  lw $t3, -224($fp)	# fill _tmp69 to $t3 from $fp-224
	  lw $t4, -236($fp)	# fill _tmp72 to $t4 from $fp-236
	  or $t5, $t3, $t4	
	  sw $t5, -240($fp)	# spill _tmp73 from $t5 to $fp-240
	# IfZ _tmp73 Goto _L4
	  lw $t3, -240($fp)	# fill _tmp73 to $t3 from $fp-240
	  beqz $t3, _L4	# branch if _tmp73 is zero 
	# _tmp74 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string10	# load label
	  sw $t4, -244($fp)	# spill _tmp74 from $t4 to $fp-244
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -244($fp)	# fill _tmp74 to $t4 from $fp-244
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -240($fp)	# spill _tmp73 from $t3 to $fp-240
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp75 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -248($fp)	# spill _tmp75 from $t3 to $fp-248
	# _tmp76 = _tmp75 * _tmp67
	  lw $t3, -248($fp)	# fill _tmp75 to $t3 from $fp-248
	  lw $t4, -216($fp)	# fill _tmp67 to $t4 from $fp-216
	  mul $t5, $t3, $t4	
	  sw $t5, -252($fp)	# spill _tmp76 from $t5 to $fp-252
	# _tmp77 = veggies + _tmp76
	  lw $t3, -8($fp)	# fill veggies to $t3 from $fp-8
	  lw $t4, -252($fp)	# fill _tmp76 to $t4 from $fp-252
	  add $t5, $t3, $t4	
	  sw $t5, -256($fp)	# spill _tmp77 from $t5 to $fp-256
	# _tmp78 = *(_tmp77)
	  lw $t3, -256($fp)	# fill _tmp77 to $t3 from $fp-256
	  lw $t4, 0($t3) 	# load with offset
	# _tmp79 = *(_tmp78)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp80 = *(_tmp79)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -212($fp)	# fill _tmp66 to $t7 from $fp-212
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -260($fp)	# spill _tmp78 from $t4 to $fp-260
	  sw $t5, -264($fp)	# spill _tmp79 from $t5 to $fp-264
	  sw $t6, -268($fp)	# spill _tmp80 from $t6 to $fp-268
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -260($fp)	# fill _tmp78 to $t3 from $fp-260
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp80
	  lw $t3, -268($fp)	# fill _tmp80 to $t3 from $fp-268
	  jalr $t3            	# jump to function
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
