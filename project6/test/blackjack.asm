	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Random.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = seedVal
	  lw $t3, 8($fp)	# fill seedVal to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Random.GenRandom:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 15625
	  li $t3, 15625		# load constant value 15625 into $t3
	  sw $t3, -8($fp)	# spill _tmp0 from $t3 to $fp-8
	# _tmp1 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp2 = 10000
	  li $t5, 10000		# load constant value 10000 into $t5
	  sw $t5, -16($fp)	# spill _tmp2 from $t5 to $fp-16
	# _tmp3 = _tmp1 % _tmp2
	  lw $t5, -16($fp)	# fill _tmp2 to $t5 from $fp-16
	  rem $t6, $t4, $t5	
	  sw $t4, -12($fp)	# spill _tmp1 from $t4 to $fp-12
	  sw $t6, -20($fp)	# spill _tmp3 from $t6 to $fp-20
	# _tmp4 = _tmp0 * _tmp3
	  lw $t3, -8($fp)	# fill _tmp0 to $t3 from $fp-8
	  lw $t4, -20($fp)	# fill _tmp3 to $t4 from $fp-20
	  mul $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp4 from $t5 to $fp-24
	# _tmp5 = 22221
	  li $t3, 22221		# load constant value 22221 into $t3
	  sw $t3, -28($fp)	# spill _tmp5 from $t3 to $fp-28
	# _tmp6 = _tmp4 + _tmp5
	  lw $t3, -24($fp)	# fill _tmp4 to $t3 from $fp-24
	  lw $t4, -28($fp)	# fill _tmp5 to $t4 from $fp-28
	  add $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp6 from $t5 to $fp-32
	# _tmp7 = 65536
	  li $t3, 65536		# load constant value 65536 into $t3
	  sw $t3, -36($fp)	# spill _tmp7 from $t3 to $fp-36
	# _tmp8 = _tmp6 % _tmp7
	  lw $t3, -32($fp)	# fill _tmp6 to $t3 from $fp-32
	  lw $t4, -36($fp)	# fill _tmp7 to $t4 from $fp-36
	  rem $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp8 from $t5 to $fp-40
	# *(this + 4) = _tmp8
	  lw $t3, -40($fp)	# fill _tmp8 to $t3 from $fp-40
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# _tmp9 = *(this + 4)
	  lw $t5, 4($t4) 	# load with offset
	# Return _tmp9
	  move $v0, $t5		# assign return value into $v0
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -44($fp)	# spill _tmp9 from $t5 to $fp-44
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
  _Random.RndInt:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp10 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp11 = *(_tmp10 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill _tmp10 from $t4 to $fp-8
	  sw $t5, -12($fp)	# spill _tmp11 from $t5 to $fp-12
	# _tmp12 = ACall _tmp11
	  lw $t3, -12($fp)	# fill _tmp11 to $t3 from $fp-12
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp12 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = _tmp12 % max
	  lw $t3, -16($fp)	# fill _tmp12 to $t3 from $fp-16
	  lw $t4, 8($fp)	# fill max to $t4 from $fp+8
	  rem $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp13 from $t5 to $fp-20
	# Return _tmp13
	  lw $t3, -20($fp)	# fill _tmp13 to $t3 from $fp-20
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
	# VTable for class Random
	  .data
	  .align 2
	  Random:		# label for class Random vtable
	  .word _Random.Init
	  .word _Random.GenRandom
	  .word _Random.RndInt
	  .text
  _Deck.Init:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp14 = 52
	  li $t3, 52		# load constant value 52 into $t3
	  sw $t3, -8($fp)	# spill _tmp14 from $t3 to $fp-8
	# _tmp15 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp15 from $t3 to $fp-12
	# _tmp16 = _tmp14 < _tmp15
	  lw $t3, -8($fp)	# fill _tmp14 to $t3 from $fp-8
	  lw $t4, -12($fp)	# fill _tmp15 to $t4 from $fp-12
	  slt $t5, $t3, $t4	
	  sw $t5, -16($fp)	# spill _tmp16 from $t5 to $fp-16
	# IfZ _tmp16 Goto _L0
	  lw $t3, -16($fp)	# fill _tmp16 to $t3 from $fp-16
	  beqz $t3, _L0	# branch if _tmp16 is zero 
	# _tmp17 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -20($fp)	# spill _tmp17 from $t4 to $fp-20
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -20($fp)	# fill _tmp17 to $t4 from $fp-20
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -16($fp)	# spill _tmp16 from $t3 to $fp-16
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp18 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -24($fp)	# spill _tmp18 from $t3 to $fp-24
	# _tmp19 = _tmp18 + _tmp14
	  lw $t3, -24($fp)	# fill _tmp18 to $t3 from $fp-24
	  lw $t4, -8($fp)	# fill _tmp14 to $t4 from $fp-8
	  add $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp19 from $t5 to $fp-28
	# _tmp20 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -32($fp)	# spill _tmp20 from $t3 to $fp-32
	# _tmp21 = _tmp19 * _tmp20
	  lw $t3, -28($fp)	# fill _tmp19 to $t3 from $fp-28
	  lw $t4, -32($fp)	# fill _tmp20 to $t4 from $fp-32
	  mul $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp21 from $t5 to $fp-36
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -36($fp)	# fill _tmp21 to $t3 from $fp-36
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp22 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -40($fp)	# spill _tmp22 from $t3 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp22) = _tmp14
	  lw $t3, -8($fp)	# fill _tmp14 to $t3 from $fp-8
	  lw $t4, -40($fp)	# fill _tmp22 to $t4 from $fp-40
	  sw $t3, 0($t4) 	# store with offset
	# _tmp23 = _tmp22 + _tmp20
	  lw $t5, -32($fp)	# fill _tmp20 to $t5 from $fp-32
	  add $t6, $t4, $t5	
	  sw $t4, -40($fp)	# spill _tmp22 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp23 from $t6 to $fp-44
	# *(this + 8) = _tmp23
	  lw $t3, -44($fp)	# fill _tmp23 to $t3 from $fp-44
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Deck.Shuffle:
	# BeginFunc 336
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 336	# decrement sp to make space for locals/temps
	# _tmp24 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -8($fp)	# spill _tmp24 from $t3 to $fp-8
	# *(this + 4) = _tmp24
	  lw $t3, -8($fp)	# fill _tmp24 to $t3 from $fp-8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
  _L1:
	# _tmp25 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp26 = 52
	  li $t5, 52		# load constant value 52 into $t5
	  sw $t5, -16($fp)	# spill _tmp26 from $t5 to $fp-16
	# _tmp27 = _tmp25 < _tmp26
	  lw $t5, -16($fp)	# fill _tmp26 to $t5 from $fp-16
	  slt $t6, $t4, $t5	
	  sw $t4, -12($fp)	# spill _tmp25 from $t4 to $fp-12
	  sw $t6, -20($fp)	# spill _tmp27 from $t6 to $fp-20
	# IfZ _tmp27 Goto _L2
	  lw $t3, -20($fp)	# fill _tmp27 to $t3 from $fp-20
	  beqz $t3, _L2	# branch if _tmp27 is zero 
	# _tmp28 = *(this + 8)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 8($t4) 	# load with offset
	# _tmp29 = *(this + 4)
	  lw $t6, 4($t4) 	# load with offset
	# _tmp30 = 0
	  li $t7, 0		# load constant value 0 into $t7
	  sw $t7, -32($fp)	# spill _tmp30 from $t7 to $fp-32
	# _tmp31 = _tmp29 < _tmp30
	  lw $t7, -32($fp)	# fill _tmp30 to $t7 from $fp-32
	  slt $t8, $t6, $t7	
	  sw $t3, -20($fp)	# spill _tmp27 from $t3 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp28 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp29 from $t6 to $fp-28
	  sw $t8, -36($fp)	# spill _tmp31 from $t8 to $fp-36
	# _tmp32 = *(_tmp28 + -4)
	  lw $t3, -24($fp)	# fill _tmp28 to $t3 from $fp-24
	  lw $t4, -4($t3) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	  lw $t5, -28($fp)	# fill _tmp29 to $t5 from $fp-28
	  slt $t6, $t5, $t4	
	  sw $t4, -40($fp)	# spill _tmp32 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp33 from $t6 to $fp-44
	# _tmp34 = _tmp33 == _tmp30
	  lw $t3, -44($fp)	# fill _tmp33 to $t3 from $fp-44
	  lw $t4, -32($fp)	# fill _tmp30 to $t4 from $fp-32
	  seq $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp34 from $t5 to $fp-48
	# _tmp35 = _tmp31 || _tmp34
	  lw $t3, -36($fp)	# fill _tmp31 to $t3 from $fp-36
	  lw $t4, -48($fp)	# fill _tmp34 to $t4 from $fp-48
	  or $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp35 from $t5 to $fp-52
	# IfZ _tmp35 Goto _L3
	  lw $t3, -52($fp)	# fill _tmp35 to $t3 from $fp-52
	  beqz $t3, _L3	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string2	# load label
	  sw $t4, -56($fp)	# spill _tmp36 from $t4 to $fp-56
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -56($fp)	# fill _tmp36 to $t4 from $fp-56
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp35 from $t3 to $fp-52
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp37 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -60($fp)	# spill _tmp37 from $t3 to $fp-60
	# _tmp38 = _tmp37 * _tmp29
	  lw $t3, -60($fp)	# fill _tmp37 to $t3 from $fp-60
	  lw $t4, -28($fp)	# fill _tmp29 to $t4 from $fp-28
	  mul $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp38 from $t5 to $fp-64
	# _tmp39 = _tmp28 + _tmp38
	  lw $t3, -24($fp)	# fill _tmp28 to $t3 from $fp-24
	  lw $t4, -64($fp)	# fill _tmp38 to $t4 from $fp-64
	  add $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp39 from $t5 to $fp-68
	# _tmp40 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp41 = 1
	  li $t5, 1		# load constant value 1 into $t5
	  sw $t5, -76($fp)	# spill _tmp41 from $t5 to $fp-76
	# _tmp42 = _tmp40 + _tmp41
	  lw $t5, -76($fp)	# fill _tmp41 to $t5 from $fp-76
	  add $t6, $t4, $t5	
	  sw $t4, -72($fp)	# spill _tmp40 from $t4 to $fp-72
	  sw $t6, -80($fp)	# spill _tmp42 from $t6 to $fp-80
	# _tmp43 = 13
	  li $t3, 13		# load constant value 13 into $t3
	  sw $t3, -84($fp)	# spill _tmp43 from $t3 to $fp-84
	# _tmp44 = _tmp42 % _tmp43
	  lw $t3, -80($fp)	# fill _tmp42 to $t3 from $fp-80
	  lw $t4, -84($fp)	# fill _tmp43 to $t4 from $fp-84
	  rem $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp44 from $t5 to $fp-88
	# *(_tmp39) = _tmp44
	  lw $t3, -88($fp)	# fill _tmp44 to $t3 from $fp-88
	  lw $t4, -68($fp)	# fill _tmp39 to $t4 from $fp-68
	  sw $t3, 0($t4) 	# store with offset
	# _tmp45 = *(this + 4)
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  lw $t6, 4($t5) 	# load with offset
	# _tmp46 = 1
	  li $t7, 1		# load constant value 1 into $t7
	  sw $t7, -96($fp)	# spill _tmp46 from $t7 to $fp-96
	# _tmp47 = _tmp45 + _tmp46
	  lw $t7, -96($fp)	# fill _tmp46 to $t7 from $fp-96
	  add $t8, $t6, $t7	
	  sw $t4, -68($fp)	# spill _tmp39 from $t4 to $fp-68
	  sw $t6, -92($fp)	# spill _tmp45 from $t6 to $fp-92
	  sw $t8, -100($fp)	# spill _tmp47 from $t8 to $fp-100
	# *(this + 4) = _tmp47
	  lw $t3, -100($fp)	# fill _tmp47 to $t3 from $fp-100
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# Goto _L1
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  b _L1		# unconditional branch
  _L2:
  _L4:
	# _tmp48 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp49 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -108($fp)	# spill _tmp49 from $t5 to $fp-108
	# _tmp50 = _tmp49 < _tmp48
	  lw $t5, -108($fp)	# fill _tmp49 to $t5 from $fp-108
	  slt $t6, $t5, $t4	
	  sw $t4, -104($fp)	# spill _tmp48 from $t4 to $fp-104
	  sw $t6, -112($fp)	# spill _tmp50 from $t6 to $fp-112
	# IfZ _tmp50 Goto _L5
	  lw $t3, -112($fp)	# fill _tmp50 to $t3 from $fp-112
	  beqz $t3, _L5	# branch if _tmp50 is zero 
	# _tmp51 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp52 = *(gRnd)
	  lw $t6, 0($gp)	# fill gRnd to $t6 from $gp+0
	  lw $t7, 0($t6) 	# load with offset
	# _tmp53 = *(_tmp52 + 8)
	  lw $t8, 8($t7) 	# load with offset
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -112($fp)	# spill _tmp50 from $t3 to $fp-112
	  sw $t5, -124($fp)	# spill _tmp51 from $t5 to $fp-124
	  sw $t7, -128($fp)	# spill _tmp52 from $t7 to $fp-128
	  sw $t8, -132($fp)	# spill _tmp53 from $t8 to $fp-132
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 0($gp)	# fill gRnd to $t3 from $gp+0
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp54 = ACall _tmp53
	  lw $t3, -132($fp)	# fill _tmp53 to $t3 from $fp-132
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -136($fp)	# spill _tmp54 from $t3 to $fp-136
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# r = _tmp54
	  lw $t3, -136($fp)	# fill _tmp54 to $t3 from $fp-136
	# _tmp55 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp56 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -144($fp)	# spill _tmp56 from $t6 to $fp-144
	# _tmp57 = _tmp55 - _tmp56
	  lw $t6, -144($fp)	# fill _tmp56 to $t6 from $fp-144
	  sub $t7, $t5, $t6	
	  sw $t3, -116($fp)	# spill r from $t3 to $fp-116
	  sw $t5, -140($fp)	# spill _tmp55 from $t5 to $fp-140
	  sw $t7, -148($fp)	# spill _tmp57 from $t7 to $fp-148
	# *(this + 4) = _tmp57
	  lw $t3, -148($fp)	# fill _tmp57 to $t3 from $fp-148
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# _tmp58 = *(this + 8)
	  lw $t5, 8($t4) 	# load with offset
	# _tmp59 = *(this + 4)
	  lw $t6, 4($t4) 	# load with offset
	# _tmp60 = 0
	  li $t7, 0		# load constant value 0 into $t7
	  sw $t7, -160($fp)	# spill _tmp60 from $t7 to $fp-160
	# _tmp61 = _tmp59 < _tmp60
	  lw $t7, -160($fp)	# fill _tmp60 to $t7 from $fp-160
	  slt $t8, $t6, $t7	
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -152($fp)	# spill _tmp58 from $t5 to $fp-152
	  sw $t6, -156($fp)	# spill _tmp59 from $t6 to $fp-156
	  sw $t8, -164($fp)	# spill _tmp61 from $t8 to $fp-164
	# _tmp62 = *(_tmp58 + -4)
	  lw $t3, -152($fp)	# fill _tmp58 to $t3 from $fp-152
	  lw $t4, -4($t3) 	# load with offset
	# _tmp63 = _tmp59 < _tmp62
	  lw $t5, -156($fp)	# fill _tmp59 to $t5 from $fp-156
	  slt $t6, $t5, $t4	
	  sw $t4, -168($fp)	# spill _tmp62 from $t4 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp63 from $t6 to $fp-172
	# _tmp64 = _tmp63 == _tmp60
	  lw $t3, -172($fp)	# fill _tmp63 to $t3 from $fp-172
	  lw $t4, -160($fp)	# fill _tmp60 to $t4 from $fp-160
	  seq $t5, $t3, $t4	
	  sw $t5, -176($fp)	# spill _tmp64 from $t5 to $fp-176
	# _tmp65 = _tmp61 || _tmp64
	  lw $t3, -164($fp)	# fill _tmp61 to $t3 from $fp-164
	  lw $t4, -176($fp)	# fill _tmp64 to $t4 from $fp-176
	  or $t5, $t3, $t4	
	  sw $t5, -180($fp)	# spill _tmp65 from $t5 to $fp-180
	# IfZ _tmp65 Goto _L6
	  lw $t3, -180($fp)	# fill _tmp65 to $t3 from $fp-180
	  beqz $t3, _L6	# branch if _tmp65 is zero 
	# _tmp66 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string3	# load label
	  sw $t4, -184($fp)	# spill _tmp66 from $t4 to $fp-184
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -184($fp)	# fill _tmp66 to $t4 from $fp-184
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -180($fp)	# spill _tmp65 from $t3 to $fp-180
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp67 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -188($fp)	# spill _tmp67 from $t3 to $fp-188
	# _tmp68 = _tmp67 * _tmp59
	  lw $t3, -188($fp)	# fill _tmp67 to $t3 from $fp-188
	  lw $t4, -156($fp)	# fill _tmp59 to $t4 from $fp-156
	  mul $t5, $t3, $t4	
	  sw $t5, -192($fp)	# spill _tmp68 from $t5 to $fp-192
	# _tmp69 = _tmp58 + _tmp68
	  lw $t3, -152($fp)	# fill _tmp58 to $t3 from $fp-152
	  lw $t4, -192($fp)	# fill _tmp68 to $t4 from $fp-192
	  add $t5, $t3, $t4	
	  sw $t5, -196($fp)	# spill _tmp69 from $t5 to $fp-196
	# _tmp70 = *(_tmp69)
	  lw $t3, -196($fp)	# fill _tmp69 to $t3 from $fp-196
	  lw $t4, 0($t3) 	# load with offset
	# temp = _tmp70
	  sw $t4, -200($fp)	# spill _tmp70 from $t4 to $fp-200
	# _tmp71 = *(this + 8)
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  lw $t6, 8($t5) 	# load with offset
	# _tmp72 = *(this + 4)
	  lw $t7, 4($t5) 	# load with offset
	# _tmp73 = 0
	  li $t8, 0		# load constant value 0 into $t8
	  sw $t8, -212($fp)	# spill _tmp73 from $t8 to $fp-212
	# _tmp74 = _tmp72 < _tmp73
	  lw $t8, -212($fp)	# fill _tmp73 to $t8 from $fp-212
	  slt $t9, $t7, $t8	
	  sw $t4, -120($fp)	# spill temp from $t4 to $fp-120
	  sw $t6, -204($fp)	# spill _tmp71 from $t6 to $fp-204
	  sw $t7, -208($fp)	# spill _tmp72 from $t7 to $fp-208
	  sw $t9, -216($fp)	# spill _tmp74 from $t9 to $fp-216
	# _tmp75 = *(_tmp71 + -4)
	  lw $t3, -204($fp)	# fill _tmp71 to $t3 from $fp-204
	  lw $t4, -4($t3) 	# load with offset
	# _tmp76 = _tmp72 < _tmp75
	  lw $t5, -208($fp)	# fill _tmp72 to $t5 from $fp-208
	  slt $t6, $t5, $t4	
	  sw $t4, -220($fp)	# spill _tmp75 from $t4 to $fp-220
	  sw $t6, -224($fp)	# spill _tmp76 from $t6 to $fp-224
	# _tmp77 = _tmp76 == _tmp73
	  lw $t3, -224($fp)	# fill _tmp76 to $t3 from $fp-224
	  lw $t4, -212($fp)	# fill _tmp73 to $t4 from $fp-212
	  seq $t5, $t3, $t4	
	  sw $t5, -228($fp)	# spill _tmp77 from $t5 to $fp-228
	# _tmp78 = _tmp74 || _tmp77
	  lw $t3, -216($fp)	# fill _tmp74 to $t3 from $fp-216
	  lw $t4, -228($fp)	# fill _tmp77 to $t4 from $fp-228
	  or $t5, $t3, $t4	
	  sw $t5, -232($fp)	# spill _tmp78 from $t5 to $fp-232
	# IfZ _tmp78 Goto _L7
	  lw $t3, -232($fp)	# fill _tmp78 to $t3 from $fp-232
	  beqz $t3, _L7	# branch if _tmp78 is zero 
	# _tmp79 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string4	# load label
	  sw $t4, -236($fp)	# spill _tmp79 from $t4 to $fp-236
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -236($fp)	# fill _tmp79 to $t4 from $fp-236
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -232($fp)	# spill _tmp78 from $t3 to $fp-232
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp80 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -240($fp)	# spill _tmp80 from $t3 to $fp-240
	# _tmp81 = _tmp80 * _tmp72
	  lw $t3, -240($fp)	# fill _tmp80 to $t3 from $fp-240
	  lw $t4, -208($fp)	# fill _tmp72 to $t4 from $fp-208
	  mul $t5, $t3, $t4	
	  sw $t5, -244($fp)	# spill _tmp81 from $t5 to $fp-244
	# _tmp82 = _tmp71 + _tmp81
	  lw $t3, -204($fp)	# fill _tmp71 to $t3 from $fp-204
	  lw $t4, -244($fp)	# fill _tmp81 to $t4 from $fp-244
	  add $t5, $t3, $t4	
	  sw $t5, -248($fp)	# spill _tmp82 from $t5 to $fp-248
	# _tmp83 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp84 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -256($fp)	# spill _tmp84 from $t5 to $fp-256
	# _tmp85 = r < _tmp84
	  lw $t5, -116($fp)	# fill r to $t5 from $fp-116
	  lw $t6, -256($fp)	# fill _tmp84 to $t6 from $fp-256
	  slt $t7, $t5, $t6	
	  sw $t4, -252($fp)	# spill _tmp83 from $t4 to $fp-252
	  sw $t7, -260($fp)	# spill _tmp85 from $t7 to $fp-260
	# _tmp86 = *(_tmp83 + -4)
	  lw $t3, -252($fp)	# fill _tmp83 to $t3 from $fp-252
	  lw $t4, -4($t3) 	# load with offset
	# _tmp87 = r < _tmp86
	  lw $t5, -116($fp)	# fill r to $t5 from $fp-116
	  slt $t6, $t5, $t4	
	  sw $t4, -264($fp)	# spill _tmp86 from $t4 to $fp-264
	  sw $t6, -268($fp)	# spill _tmp87 from $t6 to $fp-268
	# _tmp88 = _tmp87 == _tmp84
	  lw $t3, -268($fp)	# fill _tmp87 to $t3 from $fp-268
	  lw $t4, -256($fp)	# fill _tmp84 to $t4 from $fp-256
	  seq $t5, $t3, $t4	
	  sw $t5, -272($fp)	# spill _tmp88 from $t5 to $fp-272
	# _tmp89 = _tmp85 || _tmp88
	  lw $t3, -260($fp)	# fill _tmp85 to $t3 from $fp-260
	  lw $t4, -272($fp)	# fill _tmp88 to $t4 from $fp-272
	  or $t5, $t3, $t4	
	  sw $t5, -276($fp)	# spill _tmp89 from $t5 to $fp-276
	# IfZ _tmp89 Goto _L8
	  lw $t3, -276($fp)	# fill _tmp89 to $t3 from $fp-276
	  beqz $t3, _L8	# branch if _tmp89 is zero 
	# _tmp90 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string5	# load label
	  sw $t4, -280($fp)	# spill _tmp90 from $t4 to $fp-280
	# PushParam _tmp90
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -280($fp)	# fill _tmp90 to $t4 from $fp-280
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -276($fp)	# spill _tmp89 from $t3 to $fp-276
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp91 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -284($fp)	# spill _tmp91 from $t3 to $fp-284
	# _tmp92 = _tmp91 * r
	  lw $t3, -284($fp)	# fill _tmp91 to $t3 from $fp-284
	  lw $t4, -116($fp)	# fill r to $t4 from $fp-116
	  mul $t5, $t3, $t4	
	  sw $t5, -288($fp)	# spill _tmp92 from $t5 to $fp-288
	# _tmp93 = _tmp83 + _tmp92
	  lw $t3, -252($fp)	# fill _tmp83 to $t3 from $fp-252
	  lw $t4, -288($fp)	# fill _tmp92 to $t4 from $fp-288
	  add $t5, $t3, $t4	
	  sw $t5, -292($fp)	# spill _tmp93 from $t5 to $fp-292
	# _tmp94 = *(_tmp93)
	  lw $t3, -292($fp)	# fill _tmp93 to $t3 from $fp-292
	  lw $t4, 0($t3) 	# load with offset
	# *(_tmp82) = _tmp94
	  lw $t5, -248($fp)	# fill _tmp82 to $t5 from $fp-248
	  sw $t4, 0($t5) 	# store with offset
	# _tmp95 = *(this + 8)
	  lw $t6, 4($fp)	# fill this to $t6 from $fp+4
	  lw $t7, 8($t6) 	# load with offset
	# _tmp96 = 0
	  li $t8, 0		# load constant value 0 into $t8
	  sw $t8, -304($fp)	# spill _tmp96 from $t8 to $fp-304
	# _tmp97 = r < _tmp96
	  lw $t8, -116($fp)	# fill r to $t8 from $fp-116
	  lw $t9, -304($fp)	# fill _tmp96 to $t9 from $fp-304
	  slt $t0, $t8, $t9	
	  sw $t0, -308($fp)	# spill _tmp97 from $t0 to $fp-308
	  sw $t4, -296($fp)	# spill _tmp94 from $t4 to $fp-296
	  sw $t5, -248($fp)	# spill _tmp82 from $t5 to $fp-248
	  sw $t7, -300($fp)	# spill _tmp95 from $t7 to $fp-300
	# _tmp98 = *(_tmp95 + -4)
	  lw $t3, -300($fp)	# fill _tmp95 to $t3 from $fp-300
	  lw $t4, -4($t3) 	# load with offset
	# _tmp99 = r < _tmp98
	  lw $t5, -116($fp)	# fill r to $t5 from $fp-116
	  slt $t6, $t5, $t4	
	  sw $t4, -312($fp)	# spill _tmp98 from $t4 to $fp-312
	  sw $t6, -316($fp)	# spill _tmp99 from $t6 to $fp-316
	# _tmp100 = _tmp99 == _tmp96
	  lw $t3, -316($fp)	# fill _tmp99 to $t3 from $fp-316
	  lw $t4, -304($fp)	# fill _tmp96 to $t4 from $fp-304
	  seq $t5, $t3, $t4	
	  sw $t5, -320($fp)	# spill _tmp100 from $t5 to $fp-320
	# _tmp101 = _tmp97 || _tmp100
	  lw $t3, -308($fp)	# fill _tmp97 to $t3 from $fp-308
	  lw $t4, -320($fp)	# fill _tmp100 to $t4 from $fp-320
	  or $t5, $t3, $t4	
	  sw $t5, -324($fp)	# spill _tmp101 from $t5 to $fp-324
	# IfZ _tmp101 Goto _L9
	  lw $t3, -324($fp)	# fill _tmp101 to $t3 from $fp-324
	  beqz $t3, _L9	# branch if _tmp101 is zero 
	# _tmp102 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string6	# load label
	  sw $t4, -328($fp)	# spill _tmp102 from $t4 to $fp-328
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -328($fp)	# fill _tmp102 to $t4 from $fp-328
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -324($fp)	# spill _tmp101 from $t3 to $fp-324
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp103 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -332($fp)	# spill _tmp103 from $t3 to $fp-332
	# _tmp104 = _tmp103 * r
	  lw $t3, -332($fp)	# fill _tmp103 to $t3 from $fp-332
	  lw $t4, -116($fp)	# fill r to $t4 from $fp-116
	  mul $t5, $t3, $t4	
	  sw $t5, -336($fp)	# spill _tmp104 from $t5 to $fp-336
	# _tmp105 = _tmp95 + _tmp104
	  lw $t3, -300($fp)	# fill _tmp95 to $t3 from $fp-300
	  lw $t4, -336($fp)	# fill _tmp104 to $t4 from $fp-336
	  add $t5, $t3, $t4	
	  sw $t5, -340($fp)	# spill _tmp105 from $t5 to $fp-340
	# *(_tmp105) = temp
	  lw $t3, -120($fp)	# fill temp to $t3 from $fp-120
	  lw $t4, -340($fp)	# fill _tmp105 to $t4 from $fp-340
	  sw $t3, 0($t4) 	# store with offset
	# Goto _L4
	  sw $t4, -340($fp)	# spill _tmp105 from $t4 to $fp-340
	  b _L4		# unconditional branch
  _L5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Deck.GetCard:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp106 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp107 = 52
	  li $t5, 52		# load constant value 52 into $t5
	  sw $t5, -16($fp)	# spill _tmp107 from $t5 to $fp-16
	# _tmp108 = _tmp107 < _tmp106
	  lw $t5, -16($fp)	# fill _tmp107 to $t5 from $fp-16
	  slt $t6, $t5, $t4	
	  sw $t4, -12($fp)	# spill _tmp106 from $t4 to $fp-12
	  sw $t6, -20($fp)	# spill _tmp108 from $t6 to $fp-20
	# _tmp109 = _tmp107 == _tmp106
	  lw $t3, -16($fp)	# fill _tmp107 to $t3 from $fp-16
	  lw $t4, -12($fp)	# fill _tmp106 to $t4 from $fp-12
	  seq $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp109 from $t5 to $fp-24
	# _tmp110 = _tmp108 || _tmp109
	  lw $t3, -20($fp)	# fill _tmp108 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp109 to $t4 from $fp-24
	  or $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp110 from $t5 to $fp-28
	# IfZ _tmp110 Goto _L10
	  lw $t3, -28($fp)	# fill _tmp110 to $t3 from $fp-28
	  beqz $t3, _L10	# branch if _tmp110 is zero 
	# _tmp111 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -32($fp)	# spill _tmp111 from $t4 to $fp-32
	# Return _tmp111
	  lw $t4, -32($fp)	# fill _tmp111 to $t4 from $fp-32
	  move $v0, $t4		# assign return value into $v0
	  sw $t3, -28($fp)	# spill _tmp110 from $t3 to $fp-28
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L10:
	# _tmp112 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp113 = *(this + 4)
	  lw $t5, 4($t3) 	# load with offset
	# _tmp114 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -44($fp)	# spill _tmp114 from $t6 to $fp-44
	# _tmp115 = _tmp113 < _tmp114
	  lw $t6, -44($fp)	# fill _tmp114 to $t6 from $fp-44
	  slt $t7, $t5, $t6	
	  sw $t4, -36($fp)	# spill _tmp112 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp113 from $t5 to $fp-40
	  sw $t7, -48($fp)	# spill _tmp115 from $t7 to $fp-48
	# _tmp116 = *(_tmp112 + -4)
	  lw $t3, -36($fp)	# fill _tmp112 to $t3 from $fp-36
	  lw $t4, -4($t3) 	# load with offset
	# _tmp117 = _tmp113 < _tmp116
	  lw $t5, -40($fp)	# fill _tmp113 to $t5 from $fp-40
	  slt $t6, $t5, $t4	
	  sw $t4, -52($fp)	# spill _tmp116 from $t4 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp117 from $t6 to $fp-56
	# _tmp118 = _tmp117 == _tmp114
	  lw $t3, -56($fp)	# fill _tmp117 to $t3 from $fp-56
	  lw $t4, -44($fp)	# fill _tmp114 to $t4 from $fp-44
	  seq $t5, $t3, $t4	
	  sw $t5, -60($fp)	# spill _tmp118 from $t5 to $fp-60
	# _tmp119 = _tmp115 || _tmp118
	  lw $t3, -48($fp)	# fill _tmp115 to $t3 from $fp-48
	  lw $t4, -60($fp)	# fill _tmp118 to $t4 from $fp-60
	  or $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp119 from $t5 to $fp-64
	# IfZ _tmp119 Goto _L11
	  lw $t3, -64($fp)	# fill _tmp119 to $t3 from $fp-64
	  beqz $t3, _L11	# branch if _tmp119 is zero 
	# _tmp120 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string7	# load label
	  sw $t4, -68($fp)	# spill _tmp120 from $t4 to $fp-68
	# PushParam _tmp120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -68($fp)	# fill _tmp120 to $t4 from $fp-68
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -64($fp)	# spill _tmp119 from $t3 to $fp-64
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp121 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -72($fp)	# spill _tmp121 from $t3 to $fp-72
	# _tmp122 = _tmp121 * _tmp113
	  lw $t3, -72($fp)	# fill _tmp121 to $t3 from $fp-72
	  lw $t4, -40($fp)	# fill _tmp113 to $t4 from $fp-40
	  mul $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp122 from $t5 to $fp-76
	# _tmp123 = _tmp112 + _tmp122
	  lw $t3, -36($fp)	# fill _tmp112 to $t3 from $fp-36
	  lw $t4, -76($fp)	# fill _tmp122 to $t4 from $fp-76
	  add $t5, $t3, $t4	
	  sw $t5, -80($fp)	# spill _tmp123 from $t5 to $fp-80
	# _tmp124 = *(_tmp123)
	  lw $t3, -80($fp)	# fill _tmp123 to $t3 from $fp-80
	  lw $t4, 0($t3) 	# load with offset
	# result = _tmp124
	  sw $t4, -84($fp)	# spill _tmp124 from $t4 to $fp-84
	# _tmp125 = *(this + 4)
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  lw $t6, 4($t5) 	# load with offset
	# _tmp126 = 1
	  li $t7, 1		# load constant value 1 into $t7
	  sw $t7, -92($fp)	# spill _tmp126 from $t7 to $fp-92
	# _tmp127 = _tmp125 + _tmp126
	  lw $t7, -92($fp)	# fill _tmp126 to $t7 from $fp-92
	  add $t8, $t6, $t7	
	  sw $t4, -8($fp)	# spill result from $t4 to $fp-8
	  sw $t6, -88($fp)	# spill _tmp125 from $t6 to $fp-88
	  sw $t8, -96($fp)	# spill _tmp127 from $t8 to $fp-96
	# *(this + 4) = _tmp127
	  lw $t3, -96($fp)	# fill _tmp127 to $t3 from $fp-96
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# Return result
	  lw $t5, -8($fp)	# fill result to $t5 from $fp-8
	  move $v0, $t5		# assign return value into $v0
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
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
	# VTable for class Deck
	  .data
	  .align 2
	  Deck:		# label for class Deck vtable
	  .word _Deck.Init
	  .word _Deck.Shuffle
	  .word _Deck.GetCard
	  .text
  _BJDeck.Init:
	# BeginFunc 176
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 176	# decrement sp to make space for locals/temps
	# _tmp128 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -12($fp)	# spill _tmp128 from $t3 to $fp-12
	# _tmp129 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp129 from $t3 to $fp-16
	# _tmp130 = _tmp128 < _tmp129
	  lw $t3, -12($fp)	# fill _tmp128 to $t3 from $fp-12
	  lw $t4, -16($fp)	# fill _tmp129 to $t4 from $fp-16
	  slt $t5, $t3, $t4	
	  sw $t5, -20($fp)	# spill _tmp130 from $t5 to $fp-20
	# IfZ _tmp130 Goto _L12
	  lw $t3, -20($fp)	# fill _tmp130 to $t3 from $fp-20
	  beqz $t3, _L12	# branch if _tmp130 is zero 
	# _tmp131 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string8	# load label
	  sw $t4, -24($fp)	# spill _tmp131 from $t4 to $fp-24
	# PushParam _tmp131
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -24($fp)	# fill _tmp131 to $t4 from $fp-24
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -20($fp)	# spill _tmp130 from $t3 to $fp-20
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp132 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -28($fp)	# spill _tmp132 from $t3 to $fp-28
	# _tmp133 = _tmp132 + _tmp128
	  lw $t3, -28($fp)	# fill _tmp132 to $t3 from $fp-28
	  lw $t4, -12($fp)	# fill _tmp128 to $t4 from $fp-12
	  add $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp133 from $t5 to $fp-32
	# _tmp134 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -36($fp)	# spill _tmp134 from $t3 to $fp-36
	# _tmp135 = _tmp133 * _tmp134
	  lw $t3, -32($fp)	# fill _tmp133 to $t3 from $fp-32
	  lw $t4, -36($fp)	# fill _tmp134 to $t4 from $fp-36
	  mul $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp135 from $t5 to $fp-40
	# PushParam _tmp135
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -40($fp)	# fill _tmp135 to $t3 from $fp-40
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp136 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -44($fp)	# spill _tmp136 from $t3 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp136) = _tmp128
	  lw $t3, -12($fp)	# fill _tmp128 to $t3 from $fp-12
	  lw $t4, -44($fp)	# fill _tmp136 to $t4 from $fp-44
	  sw $t3, 0($t4) 	# store with offset
	# _tmp137 = _tmp136 + _tmp134
	  lw $t5, -36($fp)	# fill _tmp134 to $t5 from $fp-36
	  add $t6, $t4, $t5	
	  sw $t4, -44($fp)	# spill _tmp136 from $t4 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp137 from $t6 to $fp-48
	# *(this + 4) = _tmp137
	  lw $t3, -48($fp)	# fill _tmp137 to $t3 from $fp-48
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# _tmp138 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -52($fp)	# spill _tmp138 from $t5 to $fp-52
	# i = _tmp138
	  lw $t5, -52($fp)	# fill _tmp138 to $t5 from $fp-52
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -8($fp)	# spill i from $t5 to $fp-8
  _L13:
	# _tmp139 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -56($fp)	# spill _tmp139 from $t3 to $fp-56
	# _tmp140 = i < _tmp139
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -56($fp)	# fill _tmp139 to $t4 from $fp-56
	  slt $t5, $t3, $t4	
	  sw $t5, -60($fp)	# spill _tmp140 from $t5 to $fp-60
	# IfZ _tmp140 Goto _L14
	  lw $t3, -60($fp)	# fill _tmp140 to $t3 from $fp-60
	  beqz $t3, _L14	# branch if _tmp140 is zero 
	# _tmp141 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp142 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -68($fp)	# spill _tmp142 from $t6 to $fp-68
	# _tmp143 = i < _tmp142
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -68($fp)	# fill _tmp142 to $t7 from $fp-68
	  slt $t8, $t6, $t7	
	  sw $t3, -60($fp)	# spill _tmp140 from $t3 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp141 from $t5 to $fp-64
	  sw $t8, -72($fp)	# spill _tmp143 from $t8 to $fp-72
	# _tmp144 = *(_tmp141 + -4)
	  lw $t3, -64($fp)	# fill _tmp141 to $t3 from $fp-64
	  lw $t4, -4($t3) 	# load with offset
	# _tmp145 = i < _tmp144
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -76($fp)	# spill _tmp144 from $t4 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp145 from $t6 to $fp-80
	# _tmp146 = _tmp145 == _tmp142
	  lw $t3, -80($fp)	# fill _tmp145 to $t3 from $fp-80
	  lw $t4, -68($fp)	# fill _tmp142 to $t4 from $fp-68
	  seq $t5, $t3, $t4	
	  sw $t5, -84($fp)	# spill _tmp146 from $t5 to $fp-84
	# _tmp147 = _tmp143 || _tmp146
	  lw $t3, -72($fp)	# fill _tmp143 to $t3 from $fp-72
	  lw $t4, -84($fp)	# fill _tmp146 to $t4 from $fp-84
	  or $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp147 from $t5 to $fp-88
	# IfZ _tmp147 Goto _L15
	  lw $t3, -88($fp)	# fill _tmp147 to $t3 from $fp-88
	  beqz $t3, _L15	# branch if _tmp147 is zero 
	# _tmp148 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string9	# load label
	  sw $t4, -92($fp)	# spill _tmp148 from $t4 to $fp-92
	# PushParam _tmp148
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -92($fp)	# fill _tmp148 to $t4 from $fp-92
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -88($fp)	# spill _tmp147 from $t3 to $fp-88
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L15:
	# _tmp149 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -96($fp)	# spill _tmp149 from $t3 to $fp-96
	# _tmp150 = _tmp149 * i
	  lw $t3, -96($fp)	# fill _tmp149 to $t3 from $fp-96
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -100($fp)	# spill _tmp150 from $t5 to $fp-100
	# _tmp151 = _tmp141 + _tmp150
	  lw $t3, -64($fp)	# fill _tmp141 to $t3 from $fp-64
	  lw $t4, -100($fp)	# fill _tmp150 to $t4 from $fp-100
	  add $t5, $t3, $t4	
	  sw $t5, -104($fp)	# spill _tmp151 from $t5 to $fp-104
	# _tmp152 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -108($fp)	# spill _tmp152 from $t3 to $fp-108
	# PushParam _tmp152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -108($fp)	# fill _tmp152 to $t3 from $fp-108
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp153 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -112($fp)	# spill _tmp153 from $t3 to $fp-112
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp154 = Deck
	  la $t3, Deck	# load label
	  sw $t3, -116($fp)	# spill _tmp154 from $t3 to $fp-116
	# *(_tmp153) = _tmp154
	  lw $t3, -116($fp)	# fill _tmp154 to $t3 from $fp-116
	  lw $t4, -112($fp)	# fill _tmp153 to $t4 from $fp-112
	  sw $t3, 0($t4) 	# store with offset
	# *(_tmp151) = _tmp153
	  lw $t5, -104($fp)	# fill _tmp151 to $t5 from $fp-104
	  sw $t4, 0($t5) 	# store with offset
	# _tmp155 = *(this + 4)
	  lw $t6, 4($fp)	# fill this to $t6 from $fp+4
	  lw $t7, 4($t6) 	# load with offset
	# _tmp156 = 0
	  li $t8, 0		# load constant value 0 into $t8
	  sw $t8, -124($fp)	# spill _tmp156 from $t8 to $fp-124
	# _tmp157 = i < _tmp156
	  lw $t8, -8($fp)	# fill i to $t8 from $fp-8
	  lw $t9, -124($fp)	# fill _tmp156 to $t9 from $fp-124
	  slt $t0, $t8, $t9	
	  sw $t0, -128($fp)	# spill _tmp157 from $t0 to $fp-128
	  sw $t4, -112($fp)	# spill _tmp153 from $t4 to $fp-112
	  sw $t5, -104($fp)	# spill _tmp151 from $t5 to $fp-104
	  sw $t7, -120($fp)	# spill _tmp155 from $t7 to $fp-120
	# _tmp158 = *(_tmp155 + -4)
	  lw $t3, -120($fp)	# fill _tmp155 to $t3 from $fp-120
	  lw $t4, -4($t3) 	# load with offset
	# _tmp159 = i < _tmp158
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -132($fp)	# spill _tmp158 from $t4 to $fp-132
	  sw $t6, -136($fp)	# spill _tmp159 from $t6 to $fp-136
	# _tmp160 = _tmp159 == _tmp156
	  lw $t3, -136($fp)	# fill _tmp159 to $t3 from $fp-136
	  lw $t4, -124($fp)	# fill _tmp156 to $t4 from $fp-124
	  seq $t5, $t3, $t4	
	  sw $t5, -140($fp)	# spill _tmp160 from $t5 to $fp-140
	# _tmp161 = _tmp157 || _tmp160
	  lw $t3, -128($fp)	# fill _tmp157 to $t3 from $fp-128
	  lw $t4, -140($fp)	# fill _tmp160 to $t4 from $fp-140
	  or $t5, $t3, $t4	
	  sw $t5, -144($fp)	# spill _tmp161 from $t5 to $fp-144
	# IfZ _tmp161 Goto _L16
	  lw $t3, -144($fp)	# fill _tmp161 to $t3 from $fp-144
	  beqz $t3, _L16	# branch if _tmp161 is zero 
	# _tmp162 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string10	# load label
	  sw $t4, -148($fp)	# spill _tmp162 from $t4 to $fp-148
	# PushParam _tmp162
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -148($fp)	# fill _tmp162 to $t4 from $fp-148
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -144($fp)	# spill _tmp161 from $t3 to $fp-144
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp163 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -152($fp)	# spill _tmp163 from $t3 to $fp-152
	# _tmp164 = _tmp163 * i
	  lw $t3, -152($fp)	# fill _tmp163 to $t3 from $fp-152
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -156($fp)	# spill _tmp164 from $t5 to $fp-156
	# _tmp165 = _tmp155 + _tmp164
	  lw $t3, -120($fp)	# fill _tmp155 to $t3 from $fp-120
	  lw $t4, -156($fp)	# fill _tmp164 to $t4 from $fp-156
	  add $t5, $t3, $t4	
	  sw $t5, -160($fp)	# spill _tmp165 from $t5 to $fp-160
	# _tmp166 = *(_tmp165)
	  lw $t3, -160($fp)	# fill _tmp165 to $t3 from $fp-160
	  lw $t4, 0($t3) 	# load with offset
	# _tmp167 = *(_tmp166)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp168 = *(_tmp167)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam _tmp166
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -164($fp)	# spill _tmp166 from $t4 to $fp-164
	  sw $t5, -168($fp)	# spill _tmp167 from $t5 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp168 from $t6 to $fp-172
	# ACall _tmp168
	  lw $t3, -172($fp)	# fill _tmp168 to $t3 from $fp-172
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp169 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -176($fp)	# spill _tmp169 from $t3 to $fp-176
	# _tmp170 = i + _tmp169
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -176($fp)	# fill _tmp169 to $t4 from $fp-176
	  add $t5, $t3, $t4	
	  sw $t5, -180($fp)	# spill _tmp170 from $t5 to $fp-180
	# i = _tmp170
	  lw $t3, -180($fp)	# fill _tmp170 to $t3 from $fp-180
	# Goto _L13
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L13		# unconditional branch
  _L14:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _BJDeck.DealCard:
	# BeginFunc 164
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 164	# decrement sp to make space for locals/temps
	# _tmp171 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp171 from $t3 to $fp-12
	# c = _tmp171
	  lw $t3, -12($fp)	# fill _tmp171 to $t3 from $fp-12
	# _tmp172 = *(this + 8)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 8($t4) 	# load with offset
	# _tmp173 = 8
	  li $t6, 8		# load constant value 8 into $t6
	  sw $t6, -20($fp)	# spill _tmp173 from $t6 to $fp-20
	# _tmp174 = 52
	  li $t6, 52		# load constant value 52 into $t6
	  sw $t6, -24($fp)	# spill _tmp174 from $t6 to $fp-24
	# _tmp175 = _tmp173 * _tmp174
	  lw $t6, -20($fp)	# fill _tmp173 to $t6 from $fp-20
	  lw $t7, -24($fp)	# fill _tmp174 to $t7 from $fp-24
	  mul $t8, $t6, $t7	
	  sw $t3, -8($fp)	# spill c from $t3 to $fp-8
	  sw $t5, -16($fp)	# spill _tmp172 from $t5 to $fp-16
	  sw $t8, -28($fp)	# spill _tmp175 from $t8 to $fp-28
	# _tmp176 = _tmp175 < _tmp172
	  lw $t3, -28($fp)	# fill _tmp175 to $t3 from $fp-28
	  lw $t4, -16($fp)	# fill _tmp172 to $t4 from $fp-16
	  slt $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp176 from $t5 to $fp-32
	# _tmp177 = _tmp175 == _tmp172
	  lw $t3, -28($fp)	# fill _tmp175 to $t3 from $fp-28
	  lw $t4, -16($fp)	# fill _tmp172 to $t4 from $fp-16
	  seq $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp177 from $t5 to $fp-36
	# _tmp178 = _tmp176 || _tmp177
	  lw $t3, -32($fp)	# fill _tmp176 to $t3 from $fp-32
	  lw $t4, -36($fp)	# fill _tmp177 to $t4 from $fp-36
	  or $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp178 from $t5 to $fp-40
	# IfZ _tmp178 Goto _L17
	  lw $t3, -40($fp)	# fill _tmp178 to $t3 from $fp-40
	  beqz $t3, _L17	# branch if _tmp178 is zero 
	# _tmp179 = 11
	  li $t4, 11		# load constant value 11 into $t4
	  sw $t4, -44($fp)	# spill _tmp179 from $t4 to $fp-44
	# Return _tmp179
	  lw $t4, -44($fp)	# fill _tmp179 to $t4 from $fp-44
	  move $v0, $t4		# assign return value into $v0
	  sw $t3, -40($fp)	# spill _tmp178 from $t3 to $fp-40
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L17:
  _L18:
	# _tmp180 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -48($fp)	# spill _tmp180 from $t3 to $fp-48
	# _tmp181 = c == _tmp180
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -48($fp)	# fill _tmp180 to $t4 from $fp-48
	  seq $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp181 from $t5 to $fp-52
	# IfZ _tmp181 Goto _L19
	  lw $t3, -52($fp)	# fill _tmp181 to $t3 from $fp-52
	  beqz $t3, _L19	# branch if _tmp181 is zero 
	# _tmp182 = 8
	  li $t4, 8		# load constant value 8 into $t4
	  sw $t4, -60($fp)	# spill _tmp182 from $t4 to $fp-60
	# _tmp183 = *(gRnd)
	  lw $t4, 0($gp)	# fill gRnd to $t4 from $gp+0
	  lw $t5, 0($t4) 	# load with offset
	# _tmp184 = *(_tmp183 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam _tmp182
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -60($fp)	# fill _tmp182 to $t7 from $fp-60
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp181 from $t3 to $fp-52
	  sw $t5, -64($fp)	# spill _tmp183 from $t5 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp184 from $t6 to $fp-68
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 0($gp)	# fill gRnd to $t3 from $gp+0
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp185 = ACall _tmp184
	  lw $t3, -68($fp)	# fill _tmp184 to $t3 from $fp-68
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -72($fp)	# spill _tmp185 from $t3 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# d = _tmp185
	  lw $t3, -72($fp)	# fill _tmp185 to $t3 from $fp-72
	# _tmp186 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp187 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -80($fp)	# spill _tmp187 from $t6 to $fp-80
	# _tmp188 = d < _tmp187
	  lw $t6, -80($fp)	# fill _tmp187 to $t6 from $fp-80
	  slt $t7, $t3, $t6	
	  sw $t3, -56($fp)	# spill d from $t3 to $fp-56
	  sw $t5, -76($fp)	# spill _tmp186 from $t5 to $fp-76
	  sw $t7, -84($fp)	# spill _tmp188 from $t7 to $fp-84
	# _tmp189 = *(_tmp186 + -4)
	  lw $t3, -76($fp)	# fill _tmp186 to $t3 from $fp-76
	  lw $t4, -4($t3) 	# load with offset
	# _tmp190 = d < _tmp189
	  lw $t5, -56($fp)	# fill d to $t5 from $fp-56
	  slt $t6, $t5, $t4	
	  sw $t4, -88($fp)	# spill _tmp189 from $t4 to $fp-88
	  sw $t6, -92($fp)	# spill _tmp190 from $t6 to $fp-92
	# _tmp191 = _tmp190 == _tmp187
	  lw $t3, -92($fp)	# fill _tmp190 to $t3 from $fp-92
	  lw $t4, -80($fp)	# fill _tmp187 to $t4 from $fp-80
	  seq $t5, $t3, $t4	
	  sw $t5, -96($fp)	# spill _tmp191 from $t5 to $fp-96
	# _tmp192 = _tmp188 || _tmp191
	  lw $t3, -84($fp)	# fill _tmp188 to $t3 from $fp-84
	  lw $t4, -96($fp)	# fill _tmp191 to $t4 from $fp-96
	  or $t5, $t3, $t4	
	  sw $t5, -100($fp)	# spill _tmp192 from $t5 to $fp-100
	# IfZ _tmp192 Goto _L20
	  lw $t3, -100($fp)	# fill _tmp192 to $t3 from $fp-100
	  beqz $t3, _L20	# branch if _tmp192 is zero 
	# _tmp193 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string11	# load label
	  sw $t4, -104($fp)	# spill _tmp193 from $t4 to $fp-104
	# PushParam _tmp193
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -104($fp)	# fill _tmp193 to $t4 from $fp-104
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -100($fp)	# spill _tmp192 from $t3 to $fp-100
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp194 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -108($fp)	# spill _tmp194 from $t3 to $fp-108
	# _tmp195 = _tmp194 * d
	  lw $t3, -108($fp)	# fill _tmp194 to $t3 from $fp-108
	  lw $t4, -56($fp)	# fill d to $t4 from $fp-56
	  mul $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp195 from $t5 to $fp-112
	# _tmp196 = _tmp186 + _tmp195
	  lw $t3, -76($fp)	# fill _tmp186 to $t3 from $fp-76
	  lw $t4, -112($fp)	# fill _tmp195 to $t4 from $fp-112
	  add $t5, $t3, $t4	
	  sw $t5, -116($fp)	# spill _tmp196 from $t5 to $fp-116
	# _tmp197 = *(_tmp196)
	  lw $t3, -116($fp)	# fill _tmp196 to $t3 from $fp-116
	  lw $t4, 0($t3) 	# load with offset
	# _tmp198 = *(_tmp197)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp199 = *(_tmp198 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam _tmp197
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -120($fp)	# spill _tmp197 from $t4 to $fp-120
	  sw $t5, -124($fp)	# spill _tmp198 from $t5 to $fp-124
	  sw $t6, -128($fp)	# spill _tmp199 from $t6 to $fp-128
	# _tmp200 = ACall _tmp199
	  lw $t3, -128($fp)	# fill _tmp199 to $t3 from $fp-128
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -132($fp)	# spill _tmp200 from $t3 to $fp-132
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# c = _tmp200
	  lw $t3, -132($fp)	# fill _tmp200 to $t3 from $fp-132
	# Goto _L18
	  sw $t3, -8($fp)	# spill c from $t3 to $fp-8
	  b _L18		# unconditional branch
  _L19:
	# _tmp201 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -136($fp)	# spill _tmp201 from $t3 to $fp-136
	# _tmp202 = _tmp201 < c
	  lw $t3, -136($fp)	# fill _tmp201 to $t3 from $fp-136
	  lw $t4, -8($fp)	# fill c to $t4 from $fp-8
	  slt $t5, $t3, $t4	
	  sw $t5, -140($fp)	# spill _tmp202 from $t5 to $fp-140
	# IfZ _tmp202 Goto _L21
	  lw $t3, -140($fp)	# fill _tmp202 to $t3 from $fp-140
	  beqz $t3, _L21	# branch if _tmp202 is zero 
	# _tmp203 = 10
	  li $t4, 10		# load constant value 10 into $t4
	  sw $t4, -144($fp)	# spill _tmp203 from $t4 to $fp-144
	# c = _tmp203
	  lw $t4, -144($fp)	# fill _tmp203 to $t4 from $fp-144
	# Goto _L22
	  sw $t3, -140($fp)	# spill _tmp202 from $t3 to $fp-140
	  sw $t4, -8($fp)	# spill c from $t4 to $fp-8
	  b _L22		# unconditional branch
  _L21:
	# _tmp204 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -148($fp)	# spill _tmp204 from $t3 to $fp-148
	# _tmp205 = c == _tmp204
	  lw $t3, -8($fp)	# fill c to $t3 from $fp-8
	  lw $t4, -148($fp)	# fill _tmp204 to $t4 from $fp-148
	  seq $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp205 from $t5 to $fp-152
	# IfZ _tmp205 Goto _L23
	  lw $t3, -152($fp)	# fill _tmp205 to $t3 from $fp-152
	  beqz $t3, _L23	# branch if _tmp205 is zero 
	# _tmp206 = 11
	  li $t4, 11		# load constant value 11 into $t4
	  sw $t4, -156($fp)	# spill _tmp206 from $t4 to $fp-156
	# c = _tmp206
	  lw $t4, -156($fp)	# fill _tmp206 to $t4 from $fp-156
	  sw $t3, -152($fp)	# spill _tmp205 from $t3 to $fp-152
	  sw $t4, -8($fp)	# spill c from $t4 to $fp-8
  _L23:
  _L22:
	# _tmp207 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp208 = 1
	  li $t5, 1		# load constant value 1 into $t5
	  sw $t5, -164($fp)	# spill _tmp208 from $t5 to $fp-164
	# _tmp209 = _tmp207 + _tmp208
	  lw $t5, -164($fp)	# fill _tmp208 to $t5 from $fp-164
	  add $t6, $t4, $t5	
	  sw $t4, -160($fp)	# spill _tmp207 from $t4 to $fp-160
	  sw $t6, -168($fp)	# spill _tmp209 from $t6 to $fp-168
	# *(this + 8) = _tmp209
	  lw $t3, -168($fp)	# fill _tmp209 to $t3 from $fp-168
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# Return c
	  lw $t5, -8($fp)	# fill c to $t5 from $fp-8
	  move $v0, $t5		# assign return value into $v0
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
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
  _BJDeck.Shuffle:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp210 = "Shuffling..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Shuffling..."
	  .text
	  la $t3, _string12	# load label
	  sw $t3, -12($fp)	# spill _tmp210 from $t3 to $fp-12
	# PushParam _tmp210
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp210 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp211 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp211 from $t3 to $fp-16
	# i = _tmp211
	  lw $t3, -16($fp)	# fill _tmp211 to $t3 from $fp-16
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L24:
	# _tmp212 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -20($fp)	# spill _tmp212 from $t3 to $fp-20
	# _tmp213 = i < _tmp212
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -20($fp)	# fill _tmp212 to $t4 from $fp-20
	  slt $t5, $t3, $t4	
	  sw $t5, -24($fp)	# spill _tmp213 from $t5 to $fp-24
	# IfZ _tmp213 Goto _L25
	  lw $t3, -24($fp)	# fill _tmp213 to $t3 from $fp-24
	  beqz $t3, _L25	# branch if _tmp213 is zero 
	# _tmp214 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp215 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -32($fp)	# spill _tmp215 from $t6 to $fp-32
	# _tmp216 = i < _tmp215
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -32($fp)	# fill _tmp215 to $t7 from $fp-32
	  slt $t8, $t6, $t7	
	  sw $t3, -24($fp)	# spill _tmp213 from $t3 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp214 from $t5 to $fp-28
	  sw $t8, -36($fp)	# spill _tmp216 from $t8 to $fp-36
	# _tmp217 = *(_tmp214 + -4)
	  lw $t3, -28($fp)	# fill _tmp214 to $t3 from $fp-28
	  lw $t4, -4($t3) 	# load with offset
	# _tmp218 = i < _tmp217
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -40($fp)	# spill _tmp217 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp218 from $t6 to $fp-44
	# _tmp219 = _tmp218 == _tmp215
	  lw $t3, -44($fp)	# fill _tmp218 to $t3 from $fp-44
	  lw $t4, -32($fp)	# fill _tmp215 to $t4 from $fp-32
	  seq $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp219 from $t5 to $fp-48
	# _tmp220 = _tmp216 || _tmp219
	  lw $t3, -36($fp)	# fill _tmp216 to $t3 from $fp-36
	  lw $t4, -48($fp)	# fill _tmp219 to $t4 from $fp-48
	  or $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp220 from $t5 to $fp-52
	# IfZ _tmp220 Goto _L26
	  lw $t3, -52($fp)	# fill _tmp220 to $t3 from $fp-52
	  beqz $t3, _L26	# branch if _tmp220 is zero 
	# _tmp221 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string13	# load label
	  sw $t4, -56($fp)	# spill _tmp221 from $t4 to $fp-56
	# PushParam _tmp221
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -56($fp)	# fill _tmp221 to $t4 from $fp-56
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp220 from $t3 to $fp-52
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp222 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -60($fp)	# spill _tmp222 from $t3 to $fp-60
	# _tmp223 = _tmp222 * i
	  lw $t3, -60($fp)	# fill _tmp222 to $t3 from $fp-60
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp223 from $t5 to $fp-64
	# _tmp224 = _tmp214 + _tmp223
	  lw $t3, -28($fp)	# fill _tmp214 to $t3 from $fp-28
	  lw $t4, -64($fp)	# fill _tmp223 to $t4 from $fp-64
	  add $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp224 from $t5 to $fp-68
	# _tmp225 = *(_tmp224)
	  lw $t3, -68($fp)	# fill _tmp224 to $t3 from $fp-68
	  lw $t4, 0($t3) 	# load with offset
	# _tmp226 = *(_tmp225)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp227 = *(_tmp226 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam _tmp225
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -72($fp)	# spill _tmp225 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp226 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp227 from $t6 to $fp-80
	# ACall _tmp227
	  lw $t3, -80($fp)	# fill _tmp227 to $t3 from $fp-80
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp228 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -84($fp)	# spill _tmp228 from $t3 to $fp-84
	# _tmp229 = i + _tmp228
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -84($fp)	# fill _tmp228 to $t4 from $fp-84
	  add $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp229 from $t5 to $fp-88
	# i = _tmp229
	  lw $t3, -88($fp)	# fill _tmp229 to $t3 from $fp-88
	# Goto _L24
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L24		# unconditional branch
  _L25:
	# _tmp230 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -92($fp)	# spill _tmp230 from $t3 to $fp-92
	# *(this + 8) = _tmp230
	  lw $t3, -92($fp)	# fill _tmp230 to $t3 from $fp-92
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# _tmp231 = "done.\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "done.\n"
	  .text
	  la $t5, _string14	# load label
	  sw $t5, -96($fp)	# spill _tmp231 from $t5 to $fp-96
	# PushParam _tmp231
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -96($fp)	# fill _tmp231 to $t5 from $fp-96
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
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
  _BJDeck.NumCardsRemaining:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp232 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -8($fp)	# spill _tmp232 from $t3 to $fp-8
	# _tmp233 = 52
	  li $t3, 52		# load constant value 52 into $t3
	  sw $t3, -12($fp)	# spill _tmp233 from $t3 to $fp-12
	# _tmp234 = _tmp232 * _tmp233
	  lw $t3, -8($fp)	# fill _tmp232 to $t3 from $fp-8
	  lw $t4, -12($fp)	# fill _tmp233 to $t4 from $fp-12
	  mul $t5, $t3, $t4	
	  sw $t5, -16($fp)	# spill _tmp234 from $t5 to $fp-16
	# _tmp235 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp236 = _tmp234 - _tmp235
	  lw $t5, -16($fp)	# fill _tmp234 to $t5 from $fp-16
	  sub $t6, $t5, $t4	
	  sw $t4, -20($fp)	# spill _tmp235 from $t4 to $fp-20
	  sw $t6, -24($fp)	# spill _tmp236 from $t6 to $fp-24
	# Return _tmp236
	  lw $t3, -24($fp)	# fill _tmp236 to $t3 from $fp-24
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
	# VTable for class BJDeck
	  .data
	  .align 2
	  BJDeck:		# label for class BJDeck vtable
	  .word _BJDeck.Init
	  .word _BJDeck.DealCard
	  .word _BJDeck.Shuffle
	  .word _BJDeck.NumCardsRemaining
	  .text
  _Player.Init:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp237 = 1000
	  li $t3, 1000		# load constant value 1000 into $t3
	  sw $t3, -8($fp)	# spill _tmp237 from $t3 to $fp-8
	# *(this + 12) = _tmp237
	  lw $t3, -8($fp)	# fill _tmp237 to $t3 from $fp-8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 12($t4) 	# store with offset
	# _tmp238 = "What is the name of player #"
	  .data			# create string constant marked with label
	  _string15: .asciiz "What is the name of player #"
	  .text
	  la $t5, _string15	# load label
	  sw $t5, -12($fp)	# spill _tmp238 from $t5 to $fp-12
	# PushParam _tmp238
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -12($fp)	# fill _tmp238 to $t5 from $fp-12
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam num
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill num to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp239 = "? "
	  .data			# create string constant marked with label
	  _string16: .asciiz "? "
	  .text
	  la $t3, _string16	# load label
	  sw $t3, -16($fp)	# spill _tmp239 from $t3 to $fp-16
	# PushParam _tmp239
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp239 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp240 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp240 from $t3 to $fp-20
	# *(this + 16) = _tmp240
	  lw $t3, -20($fp)	# fill _tmp240 to $t3 from $fp-20
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 16($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.Hit:
	# BeginFunc 120
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 120	# decrement sp to make space for locals/temps
	# _tmp241 = *(deck)
	  lw $t3, 8($fp)	# fill deck to $t3 from $fp+8
	  lw $t4, 0($t3) 	# load with offset
	# _tmp242 = *(_tmp241 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill _tmp241 from $t4 to $fp-12
	  sw $t5, -16($fp)	# spill _tmp242 from $t5 to $fp-16
	# _tmp243 = ACall _tmp242
	  lw $t3, -16($fp)	# fill _tmp242 to $t3 from $fp-16
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp243 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp243
	  lw $t3, -20($fp)	# fill _tmp243 to $t3 from $fp-20
	# _tmp244 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp244
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill card from $t3 to $fp-8
	  sw $t5, -24($fp)	# spill _tmp244 from $t5 to $fp-24
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp245 = " was dealt a "
	  .data			# create string constant marked with label
	  _string17: .asciiz " was dealt a "
	  .text
	  la $t3, _string17	# load label
	  sw $t3, -28($fp)	# spill _tmp245 from $t3 to $fp-28
	# PushParam _tmp245
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -28($fp)	# fill _tmp245 to $t3 from $fp-28
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill card to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp246 = ".\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz ".\n"
	  .text
	  la $t3, _string18	# load label
	  sw $t3, -32($fp)	# spill _tmp246 from $t3 to $fp-32
	# PushParam _tmp246
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -32($fp)	# fill _tmp246 to $t3 from $fp-32
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp247 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp248 = _tmp247 + card
	  lw $t5, -8($fp)	# fill card to $t5 from $fp-8
	  add $t6, $t4, $t5	
	  sw $t4, -36($fp)	# spill _tmp247 from $t4 to $fp-36
	  sw $t6, -40($fp)	# spill _tmp248 from $t6 to $fp-40
	# *(this + 24) = _tmp248
	  lw $t3, -40($fp)	# fill _tmp248 to $t3 from $fp-40
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 24($t4) 	# store with offset
	# _tmp249 = *(this + 20)
	  lw $t5, 20($t4) 	# load with offset
	# _tmp250 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -48($fp)	# spill _tmp250 from $t6 to $fp-48
	# _tmp251 = _tmp249 + _tmp250
	  lw $t6, -48($fp)	# fill _tmp250 to $t6 from $fp-48
	  add $t7, $t5, $t6	
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -44($fp)	# spill _tmp249 from $t5 to $fp-44
	  sw $t7, -52($fp)	# spill _tmp251 from $t7 to $fp-52
	# *(this + 20) = _tmp251
	  lw $t3, -52($fp)	# fill _tmp251 to $t3 from $fp-52
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 20($t4) 	# store with offset
	# _tmp252 = 11
	  li $t5, 11		# load constant value 11 into $t5
	  sw $t5, -56($fp)	# spill _tmp252 from $t5 to $fp-56
	# _tmp253 = card == _tmp252
	  lw $t5, -8($fp)	# fill card to $t5 from $fp-8
	  lw $t6, -56($fp)	# fill _tmp252 to $t6 from $fp-56
	  seq $t7, $t5, $t6	
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t7, -60($fp)	# spill _tmp253 from $t7 to $fp-60
	# IfZ _tmp253 Goto _L27
	  lw $t3, -60($fp)	# fill _tmp253 to $t3 from $fp-60
	  beqz $t3, _L27	# branch if _tmp253 is zero 
	# _tmp254 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp255 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -68($fp)	# spill _tmp255 from $t6 to $fp-68
	# _tmp256 = _tmp254 + _tmp255
	  lw $t6, -68($fp)	# fill _tmp255 to $t6 from $fp-68
	  add $t7, $t5, $t6	
	  sw $t3, -60($fp)	# spill _tmp253 from $t3 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp254 from $t5 to $fp-64
	  sw $t7, -72($fp)	# spill _tmp256 from $t7 to $fp-72
	# *(this + 4) = _tmp256
	  lw $t3, -72($fp)	# fill _tmp256 to $t3 from $fp-72
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
  _L27:
  _L28:
	# _tmp257 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp258 = 21
	  li $t5, 21		# load constant value 21 into $t5
	  sw $t5, -80($fp)	# spill _tmp258 from $t5 to $fp-80
	# _tmp259 = _tmp258 < _tmp257
	  lw $t5, -80($fp)	# fill _tmp258 to $t5 from $fp-80
	  slt $t6, $t5, $t4	
	  sw $t4, -76($fp)	# spill _tmp257 from $t4 to $fp-76
	  sw $t6, -84($fp)	# spill _tmp259 from $t6 to $fp-84
	# _tmp260 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp261 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -92($fp)	# spill _tmp261 from $t5 to $fp-92
	# _tmp262 = _tmp261 < _tmp260
	  lw $t5, -92($fp)	# fill _tmp261 to $t5 from $fp-92
	  slt $t6, $t5, $t4	
	  sw $t4, -88($fp)	# spill _tmp260 from $t4 to $fp-88
	  sw $t6, -96($fp)	# spill _tmp262 from $t6 to $fp-96
	# _tmp263 = _tmp259 && _tmp262
	  lw $t3, -84($fp)	# fill _tmp259 to $t3 from $fp-84
	  lw $t4, -96($fp)	# fill _tmp262 to $t4 from $fp-96
	  and $t5, $t3, $t4	
	  sw $t5, -100($fp)	# spill _tmp263 from $t5 to $fp-100
	# IfZ _tmp263 Goto _L29
	  lw $t3, -100($fp)	# fill _tmp263 to $t3 from $fp-100
	  beqz $t3, _L29	# branch if _tmp263 is zero 
	# _tmp264 = *(this + 24)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 24($t4) 	# load with offset
	# _tmp265 = 10
	  li $t6, 10		# load constant value 10 into $t6
	  sw $t6, -108($fp)	# spill _tmp265 from $t6 to $fp-108
	# _tmp266 = _tmp264 - _tmp265
	  lw $t6, -108($fp)	# fill _tmp265 to $t6 from $fp-108
	  sub $t7, $t5, $t6	
	  sw $t3, -100($fp)	# spill _tmp263 from $t3 to $fp-100
	  sw $t5, -104($fp)	# spill _tmp264 from $t5 to $fp-104
	  sw $t7, -112($fp)	# spill _tmp266 from $t7 to $fp-112
	# *(this + 24) = _tmp266
	  lw $t3, -112($fp)	# fill _tmp266 to $t3 from $fp-112
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 24($t4) 	# store with offset
	# _tmp267 = *(this + 4)
	  lw $t5, 4($t4) 	# load with offset
	# _tmp268 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -120($fp)	# spill _tmp268 from $t6 to $fp-120
	# _tmp269 = _tmp267 - _tmp268
	  lw $t6, -120($fp)	# fill _tmp268 to $t6 from $fp-120
	  sub $t7, $t5, $t6	
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -116($fp)	# spill _tmp267 from $t5 to $fp-116
	  sw $t7, -124($fp)	# spill _tmp269 from $t7 to $fp-124
	# *(this + 4) = _tmp269
	  lw $t3, -124($fp)	# fill _tmp269 to $t3 from $fp-124
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# Goto _L28
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  b _L28		# unconditional branch
  _L29:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.DoubleDown:
	# BeginFunc 104
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 104	# decrement sp to make space for locals/temps
	# _tmp270 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp271 = 10
	  li $t5, 10		# load constant value 10 into $t5
	  sw $t5, -16($fp)	# spill _tmp271 from $t5 to $fp-16
	# _tmp272 = _tmp270 == _tmp271
	  lw $t5, -16($fp)	# fill _tmp271 to $t5 from $fp-16
	  seq $t6, $t4, $t5	
	  sw $t4, -12($fp)	# spill _tmp270 from $t4 to $fp-12
	  sw $t6, -20($fp)	# spill _tmp272 from $t6 to $fp-20
	# _tmp273 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -24($fp)	# spill _tmp273 from $t3 to $fp-24
	# _tmp274 = _tmp272 == _tmp273
	  lw $t3, -20($fp)	# fill _tmp272 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp273 to $t4 from $fp-24
	  seq $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp274 from $t5 to $fp-28
	# _tmp275 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp276 = 11
	  li $t5, 11		# load constant value 11 into $t5
	  sw $t5, -36($fp)	# spill _tmp276 from $t5 to $fp-36
	# _tmp277 = _tmp275 == _tmp276
	  lw $t5, -36($fp)	# fill _tmp276 to $t5 from $fp-36
	  seq $t6, $t4, $t5	
	  sw $t4, -32($fp)	# spill _tmp275 from $t4 to $fp-32
	  sw $t6, -40($fp)	# spill _tmp277 from $t6 to $fp-40
	# _tmp278 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -44($fp)	# spill _tmp278 from $t3 to $fp-44
	# _tmp279 = _tmp277 == _tmp278
	  lw $t3, -40($fp)	# fill _tmp277 to $t3 from $fp-40
	  lw $t4, -44($fp)	# fill _tmp278 to $t4 from $fp-44
	  seq $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp279 from $t5 to $fp-48
	# _tmp280 = _tmp274 && _tmp279
	  lw $t3, -28($fp)	# fill _tmp274 to $t3 from $fp-28
	  lw $t4, -48($fp)	# fill _tmp279 to $t4 from $fp-48
	  and $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp280 from $t5 to $fp-52
	# IfZ _tmp280 Goto _L30
	  lw $t3, -52($fp)	# fill _tmp280 to $t3 from $fp-52
	  beqz $t3, _L30	# branch if _tmp280 is zero 
	# _tmp281 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -56($fp)	# spill _tmp281 from $t4 to $fp-56
	# Return _tmp281
	  lw $t4, -56($fp)	# fill _tmp281 to $t4 from $fp-56
	  move $v0, $t4		# assign return value into $v0
	  sw $t3, -52($fp)	# spill _tmp280 from $t3 to $fp-52
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L30:
	# _tmp282 = "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string19: .asciiz "Would you like to double down?"
	  .text
	  la $t3, _string19	# load label
	  sw $t3, -60($fp)	# spill _tmp282 from $t3 to $fp-60
	# PushParam _tmp282
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -60($fp)	# fill _tmp282 to $t3 from $fp-60
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp283 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -64($fp)	# spill _tmp283 from $t3 to $fp-64
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp283 Goto _L31
	  lw $t3, -64($fp)	# fill _tmp283 to $t3 from $fp-64
	  beqz $t3, _L31	# branch if _tmp283 is zero 
	# _tmp284 = *(this + 8)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 8($t4) 	# load with offset
	# _tmp285 = 2
	  li $t6, 2		# load constant value 2 into $t6
	  sw $t6, -72($fp)	# spill _tmp285 from $t6 to $fp-72
	# _tmp286 = _tmp284 * _tmp285
	  lw $t6, -72($fp)	# fill _tmp285 to $t6 from $fp-72
	  mul $t7, $t5, $t6	
	  sw $t3, -64($fp)	# spill _tmp283 from $t3 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp284 from $t5 to $fp-68
	  sw $t7, -76($fp)	# spill _tmp286 from $t7 to $fp-76
	# *(this + 8) = _tmp286
	  lw $t3, -76($fp)	# fill _tmp286 to $t3 from $fp-76
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# _tmp287 = *(this)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp288 = *(_tmp287 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, 8($fp)	# fill deck to $t7 from $fp+8
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -80($fp)	# spill _tmp287 from $t5 to $fp-80
	  sw $t6, -84($fp)	# spill _tmp288 from $t6 to $fp-84
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp288
	  lw $t3, -84($fp)	# fill _tmp288 to $t3 from $fp-84
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp289 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp289
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -88($fp)	# spill _tmp289 from $t4 to $fp-88
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = ", your total is "
	  .data			# create string constant marked with label
	  _string20: .asciiz ", your total is "
	  .text
	  la $t3, _string20	# load label
	  sw $t3, -92($fp)	# spill _tmp290 from $t3 to $fp-92
	# PushParam _tmp290
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -92($fp)	# fill _tmp290 to $t3 from $fp-92
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp291 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp291
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -96($fp)	# spill _tmp291 from $t4 to $fp-96
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp292 = ".\n"
	  .data			# create string constant marked with label
	  _string21: .asciiz ".\n"
	  .text
	  la $t3, _string21	# load label
	  sw $t3, -100($fp)	# spill _tmp292 from $t3 to $fp-100
	# PushParam _tmp292
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -100($fp)	# fill _tmp292 to $t3 from $fp-100
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp293 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -104($fp)	# spill _tmp293 from $t3 to $fp-104
	# Return _tmp293
	  lw $t3, -104($fp)	# fill _tmp293 to $t3 from $fp-104
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L31:
	# _tmp294 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -108($fp)	# spill _tmp294 from $t3 to $fp-108
	# Return _tmp294
	  lw $t3, -108($fp)	# fill _tmp294 to $t3 from $fp-108
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
  _Player.TakeTurn:
	# BeginFunc 168
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp295 = "\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz "\n"
	  .text
	  la $t3, _string22	# load label
	  sw $t3, -12($fp)	# spill _tmp295 from $t3 to $fp-12
	# PushParam _tmp295
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp295 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp296 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp296
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -16($fp)	# spill _tmp296 from $t4 to $fp-16
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp297 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "'s turn.\n"
	  .text
	  la $t3, _string23	# load label
	  sw $t3, -20($fp)	# spill _tmp297 from $t3 to $fp-20
	# PushParam _tmp297
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp297 to $t3 from $fp-20
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp298 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -24($fp)	# spill _tmp298 from $t3 to $fp-24
	# *(this + 24) = _tmp298
	  lw $t3, -24($fp)	# fill _tmp298 to $t3 from $fp-24
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 24($t4) 	# store with offset
	# _tmp299 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -28($fp)	# spill _tmp299 from $t5 to $fp-28
	# *(this + 4) = _tmp299
	  lw $t5, -28($fp)	# fill _tmp299 to $t5 from $fp-28
	  sw $t5, 4($t4) 	# store with offset
	# _tmp300 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -32($fp)	# spill _tmp300 from $t6 to $fp-32
	# *(this + 20) = _tmp300
	  lw $t6, -32($fp)	# fill _tmp300 to $t6 from $fp-32
	  sw $t6, 20($t4) 	# store with offset
	# _tmp301 = *(this)
	  lw $t7, 0($t4) 	# load with offset
	# _tmp302 = *(_tmp301 + 4)
	  lw $t8, 4($t7) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t9, 8($fp)	# fill deck to $t9 from $fp+8
	  sw $t9, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t7, -36($fp)	# spill _tmp301 from $t7 to $fp-36
	  sw $t8, -40($fp)	# spill _tmp302 from $t8 to $fp-40
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp302
	  lw $t3, -40($fp)	# fill _tmp302 to $t3 from $fp-40
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp303 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp304 = *(_tmp303 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, 8($fp)	# fill deck to $t6 from $fp+8
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -44($fp)	# spill _tmp303 from $t4 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp304 from $t5 to $fp-48
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp304
	  lw $t3, -48($fp)	# fill _tmp304 to $t3 from $fp-48
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp305 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp306 = *(_tmp305 + 8)
	  lw $t5, 8($t4) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, 8($fp)	# fill deck to $t6 from $fp+8
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -52($fp)	# spill _tmp305 from $t4 to $fp-52
	  sw $t5, -56($fp)	# spill _tmp306 from $t5 to $fp-56
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp307 = ACall _tmp306
	  lw $t3, -56($fp)	# fill _tmp306 to $t3 from $fp-56
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp307 from $t3 to $fp-60
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp308 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -64($fp)	# spill _tmp308 from $t3 to $fp-64
	# _tmp309 = _tmp307 == _tmp308
	  lw $t3, -60($fp)	# fill _tmp307 to $t3 from $fp-60
	  lw $t4, -64($fp)	# fill _tmp308 to $t4 from $fp-64
	  seq $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp309 from $t5 to $fp-68
	# IfZ _tmp309 Goto _L32
	  lw $t3, -68($fp)	# fill _tmp309 to $t3 from $fp-68
	  beqz $t3, _L32	# branch if _tmp309 is zero 
	# _tmp310 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -72($fp)	# spill _tmp310 from $t4 to $fp-72
	# stillGoing = _tmp310
	  lw $t4, -72($fp)	# fill _tmp310 to $t4 from $fp-72
	  sw $t3, -68($fp)	# spill _tmp309 from $t3 to $fp-68
	  sw $t4, -8($fp)	# spill stillGoing from $t4 to $fp-8
  _L33:
	# _tmp311 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp312 = 21
	  li $t5, 21		# load constant value 21 into $t5
	  sw $t5, -80($fp)	# spill _tmp312 from $t5 to $fp-80
	# _tmp313 = _tmp311 < _tmp312
	  lw $t5, -80($fp)	# fill _tmp312 to $t5 from $fp-80
	  slt $t6, $t4, $t5	
	  sw $t4, -76($fp)	# spill _tmp311 from $t4 to $fp-76
	  sw $t6, -84($fp)	# spill _tmp313 from $t6 to $fp-84
	# _tmp314 = _tmp311 == _tmp312
	  lw $t3, -76($fp)	# fill _tmp311 to $t3 from $fp-76
	  lw $t4, -80($fp)	# fill _tmp312 to $t4 from $fp-80
	  seq $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp314 from $t5 to $fp-88
	# _tmp315 = _tmp313 || _tmp314
	  lw $t3, -84($fp)	# fill _tmp313 to $t3 from $fp-84
	  lw $t4, -88($fp)	# fill _tmp314 to $t4 from $fp-88
	  or $t5, $t3, $t4	
	  sw $t5, -92($fp)	# spill _tmp315 from $t5 to $fp-92
	# _tmp316 = _tmp315 && stillGoing
	  lw $t3, -92($fp)	# fill _tmp315 to $t3 from $fp-92
	  lw $t4, -8($fp)	# fill stillGoing to $t4 from $fp-8
	  and $t5, $t3, $t4	
	  sw $t5, -96($fp)	# spill _tmp316 from $t5 to $fp-96
	# IfZ _tmp316 Goto _L34
	  lw $t3, -96($fp)	# fill _tmp316 to $t3 from $fp-96
	  beqz $t3, _L34	# branch if _tmp316 is zero 
	# _tmp317 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp317
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -96($fp)	# spill _tmp316 from $t3 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp317 from $t5 to $fp-100
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp318 = ", your total is "
	  .data			# create string constant marked with label
	  _string24: .asciiz ", your total is "
	  .text
	  la $t3, _string24	# load label
	  sw $t3, -104($fp)	# spill _tmp318 from $t3 to $fp-104
	# PushParam _tmp318
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -104($fp)	# fill _tmp318 to $t3 from $fp-104
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp319 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp319
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -108($fp)	# spill _tmp319 from $t4 to $fp-108
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp320 = ".\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz ".\n"
	  .text
	  la $t3, _string25	# load label
	  sw $t3, -112($fp)	# spill _tmp320 from $t3 to $fp-112
	# PushParam _tmp320
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -112($fp)	# fill _tmp320 to $t3 from $fp-112
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp321 = "Would you like a hit?"
	  .data			# create string constant marked with label
	  _string26: .asciiz "Would you like a hit?"
	  .text
	  la $t3, _string26	# load label
	  sw $t3, -116($fp)	# spill _tmp321 from $t3 to $fp-116
	# PushParam _tmp321
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -116($fp)	# fill _tmp321 to $t3 from $fp-116
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp322 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -120($fp)	# spill _tmp322 from $t3 to $fp-120
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# stillGoing = _tmp322
	  lw $t3, -120($fp)	# fill _tmp322 to $t3 from $fp-120
	# IfZ stillGoing Goto _L35
	  beqz $t3, _L35	# branch if stillGoing is zero 
	# _tmp323 = *(this)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 0($t4) 	# load with offset
	# _tmp324 = *(_tmp323 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, 8($fp)	# fill deck to $t7 from $fp+8
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill stillGoing from $t3 to $fp-8
	  sw $t5, -124($fp)	# spill _tmp323 from $t5 to $fp-124
	  sw $t6, -128($fp)	# spill _tmp324 from $t6 to $fp-128
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp324
	  lw $t3, -128($fp)	# fill _tmp324 to $t3 from $fp-128
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
  _L35:
	# Goto _L33
	  b _L33		# unconditional branch
  _L34:
  _L32:
	# _tmp325 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp326 = 21
	  li $t5, 21		# load constant value 21 into $t5
	  sw $t5, -136($fp)	# spill _tmp326 from $t5 to $fp-136
	# _tmp327 = _tmp326 < _tmp325
	  lw $t5, -136($fp)	# fill _tmp326 to $t5 from $fp-136
	  slt $t6, $t5, $t4	
	  sw $t4, -132($fp)	# spill _tmp325 from $t4 to $fp-132
	  sw $t6, -140($fp)	# spill _tmp327 from $t6 to $fp-140
	# IfZ _tmp327 Goto _L36
	  lw $t3, -140($fp)	# fill _tmp327 to $t3 from $fp-140
	  beqz $t3, _L36	# branch if _tmp327 is zero 
	# _tmp328 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp328
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -140($fp)	# spill _tmp327 from $t3 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp328 from $t5 to $fp-144
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp329 = " busts with the big "
	  .data			# create string constant marked with label
	  _string27: .asciiz " busts with the big "
	  .text
	  la $t3, _string27	# load label
	  sw $t3, -148($fp)	# spill _tmp329 from $t3 to $fp-148
	# PushParam _tmp329
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -148($fp)	# fill _tmp329 to $t3 from $fp-148
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp330 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp330
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -152($fp)	# spill _tmp330 from $t4 to $fp-152
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp331 = "!\n"
	  .data			# create string constant marked with label
	  _string28: .asciiz "!\n"
	  .text
	  la $t3, _string28	# load label
	  sw $t3, -156($fp)	# spill _tmp331 from $t3 to $fp-156
	# PushParam _tmp331
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -156($fp)	# fill _tmp331 to $t3 from $fp-156
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L37
	  b _L37		# unconditional branch
  _L36:
	# _tmp332 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp332
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -160($fp)	# spill _tmp332 from $t4 to $fp-160
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp333 = " stays at "
	  .data			# create string constant marked with label
	  _string29: .asciiz " stays at "
	  .text
	  la $t3, _string29	# load label
	  sw $t3, -164($fp)	# spill _tmp333 from $t3 to $fp-164
	# PushParam _tmp333
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -164($fp)	# fill _tmp333 to $t3 from $fp-164
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp334 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp334
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -168($fp)	# spill _tmp334 from $t4 to $fp-168
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp335 = ".\n"
	  .data			# create string constant marked with label
	  _string30: .asciiz ".\n"
	  .text
	  la $t3, _string30	# load label
	  sw $t3, -172($fp)	# spill _tmp335 from $t3 to $fp-172
	# PushParam _tmp335
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -172($fp)	# fill _tmp335 to $t3 from $fp-172
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L37:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.HasMoney:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp336 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# _tmp337 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -12($fp)	# spill _tmp337 from $t5 to $fp-12
	# _tmp338 = _tmp337 < _tmp336
	  lw $t5, -12($fp)	# fill _tmp337 to $t5 from $fp-12
	  slt $t6, $t5, $t4	
	  sw $t4, -8($fp)	# spill _tmp336 from $t4 to $fp-8
	  sw $t6, -16($fp)	# spill _tmp338 from $t6 to $fp-16
	# Return _tmp338
	  lw $t3, -16($fp)	# fill _tmp338 to $t3 from $fp-16
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
  _Player.PrintMoney:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp339 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp339
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill _tmp339 from $t4 to $fp-8
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp340 = ", you have $"
	  .data			# create string constant marked with label
	  _string31: .asciiz ", you have $"
	  .text
	  la $t3, _string31	# load label
	  sw $t3, -12($fp)	# spill _tmp340 from $t3 to $fp-12
	# PushParam _tmp340
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp340 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp341 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp341
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -16($fp)	# spill _tmp341 from $t4 to $fp-16
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp342 = ".\n"
	  .data			# create string constant marked with label
	  _string32: .asciiz ".\n"
	  .text
	  la $t3, _string32	# load label
	  sw $t3, -20($fp)	# spill _tmp342 from $t3 to $fp-20
	# PushParam _tmp342
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp342 to $t3 from $fp-20
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
  _Player.PlaceBet:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp343 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -8($fp)	# spill _tmp343 from $t3 to $fp-8
	# *(this + 8) = _tmp343
	  lw $t3, -8($fp)	# fill _tmp343 to $t3 from $fp-8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# _tmp344 = *(this)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp345 = *(_tmp344 + 20)
	  lw $t6, 20($t5) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -12($fp)	# spill _tmp344 from $t5 to $fp-12
	  sw $t6, -16($fp)	# spill _tmp345 from $t6 to $fp-16
	# ACall _tmp345
	  lw $t3, -16($fp)	# fill _tmp345 to $t3 from $fp-16
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L38:
	# _tmp346 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp347 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -24($fp)	# spill _tmp347 from $t5 to $fp-24
	# _tmp348 = _tmp346 < _tmp347
	  lw $t5, -24($fp)	# fill _tmp347 to $t5 from $fp-24
	  slt $t6, $t4, $t5	
	  sw $t4, -20($fp)	# spill _tmp346 from $t4 to $fp-20
	  sw $t6, -28($fp)	# spill _tmp348 from $t6 to $fp-28
	# _tmp349 = _tmp346 == _tmp347
	  lw $t3, -20($fp)	# fill _tmp346 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp347 to $t4 from $fp-24
	  seq $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp349 from $t5 to $fp-32
	# _tmp350 = _tmp348 || _tmp349
	  lw $t3, -28($fp)	# fill _tmp348 to $t3 from $fp-28
	  lw $t4, -32($fp)	# fill _tmp349 to $t4 from $fp-32
	  or $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp350 from $t5 to $fp-36
	# _tmp351 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp352 = *(this + 12)
	  lw $t5, 12($t3) 	# load with offset
	# _tmp353 = _tmp352 < _tmp351
	  slt $t6, $t5, $t4	
	  sw $t4, -40($fp)	# spill _tmp351 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp352 from $t5 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp353 from $t6 to $fp-48
	# _tmp354 = _tmp350 || _tmp353
	  lw $t3, -36($fp)	# fill _tmp350 to $t3 from $fp-36
	  lw $t4, -48($fp)	# fill _tmp353 to $t4 from $fp-48
	  or $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp354 from $t5 to $fp-52
	# IfZ _tmp354 Goto _L39
	  lw $t3, -52($fp)	# fill _tmp354 to $t3 from $fp-52
	  beqz $t3, _L39	# branch if _tmp354 is zero 
	# _tmp355 = "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string33: .asciiz "How much would you like to bet? "
	  .text
	  la $t4, _string33	# load label
	  sw $t4, -56($fp)	# spill _tmp355 from $t4 to $fp-56
	# PushParam _tmp355
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -56($fp)	# fill _tmp355 to $t4 from $fp-56
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp354 from $t3 to $fp-52
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp356 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp356 from $t3 to $fp-60
	# *(this + 8) = _tmp356
	  lw $t3, -60($fp)	# fill _tmp356 to $t3 from $fp-60
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# Goto _L38
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  b _L38		# unconditional branch
  _L39:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.GetTotal:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp357 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# Return _tmp357
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -8($fp)	# spill _tmp357 from $t4 to $fp-8
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
  _Player.Resolve:
	# BeginFunc 200
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 200	# decrement sp to make space for locals/temps
	# _tmp358 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp358 from $t3 to $fp-16
	# win = _tmp358
	  lw $t3, -16($fp)	# fill _tmp358 to $t3 from $fp-16
	# _tmp359 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -20($fp)	# spill _tmp359 from $t4 to $fp-20
	# lose = _tmp359
	  lw $t4, -20($fp)	# fill _tmp359 to $t4 from $fp-20
	# _tmp360 = *(this + 24)
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  lw $t6, 24($t5) 	# load with offset
	# _tmp361 = 21
	  li $t7, 21		# load constant value 21 into $t7
	  sw $t7, -28($fp)	# spill _tmp361 from $t7 to $fp-28
	# _tmp362 = _tmp360 == _tmp361
	  lw $t7, -28($fp)	# fill _tmp361 to $t7 from $fp-28
	  seq $t8, $t6, $t7	
	  sw $t3, -8($fp)	# spill win from $t3 to $fp-8
	  sw $t4, -12($fp)	# spill lose from $t4 to $fp-12
	  sw $t6, -24($fp)	# spill _tmp360 from $t6 to $fp-24
	  sw $t8, -32($fp)	# spill _tmp362 from $t8 to $fp-32
	# _tmp363 = *(this + 20)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 20($t3) 	# load with offset
	# _tmp364 = 2
	  li $t5, 2		# load constant value 2 into $t5
	  sw $t5, -40($fp)	# spill _tmp364 from $t5 to $fp-40
	# _tmp365 = _tmp363 == _tmp364
	  lw $t5, -40($fp)	# fill _tmp364 to $t5 from $fp-40
	  seq $t6, $t4, $t5	
	  sw $t4, -36($fp)	# spill _tmp363 from $t4 to $fp-36
	  sw $t6, -44($fp)	# spill _tmp365 from $t6 to $fp-44
	# _tmp366 = _tmp362 && _tmp365
	  lw $t3, -32($fp)	# fill _tmp362 to $t3 from $fp-32
	  lw $t4, -44($fp)	# fill _tmp365 to $t4 from $fp-44
	  and $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp366 from $t5 to $fp-48
	# IfZ _tmp366 Goto _L40
	  lw $t3, -48($fp)	# fill _tmp366 to $t3 from $fp-48
	  beqz $t3, _L40	# branch if _tmp366 is zero 
	# _tmp367 = 2
	  li $t4, 2		# load constant value 2 into $t4
	  sw $t4, -52($fp)	# spill _tmp367 from $t4 to $fp-52
	# win = _tmp367
	  lw $t4, -52($fp)	# fill _tmp367 to $t4 from $fp-52
	# Goto _L41
	  sw $t3, -48($fp)	# spill _tmp366 from $t3 to $fp-48
	  sw $t4, -8($fp)	# spill win from $t4 to $fp-8
	  b _L41		# unconditional branch
  _L40:
	# _tmp368 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp369 = 21
	  li $t5, 21		# load constant value 21 into $t5
	  sw $t5, -60($fp)	# spill _tmp369 from $t5 to $fp-60
	# _tmp370 = _tmp369 < _tmp368
	  lw $t5, -60($fp)	# fill _tmp369 to $t5 from $fp-60
	  slt $t6, $t5, $t4	
	  sw $t4, -56($fp)	# spill _tmp368 from $t4 to $fp-56
	  sw $t6, -64($fp)	# spill _tmp370 from $t6 to $fp-64
	# IfZ _tmp370 Goto _L42
	  lw $t3, -64($fp)	# fill _tmp370 to $t3 from $fp-64
	  beqz $t3, _L42	# branch if _tmp370 is zero 
	# _tmp371 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -68($fp)	# spill _tmp371 from $t4 to $fp-68
	# lose = _tmp371
	  lw $t4, -68($fp)	# fill _tmp371 to $t4 from $fp-68
	# Goto _L43
	  sw $t3, -64($fp)	# spill _tmp370 from $t3 to $fp-64
	  sw $t4, -12($fp)	# spill lose from $t4 to $fp-12
	  b _L43		# unconditional branch
  _L42:
	# _tmp372 = 21
	  li $t3, 21		# load constant value 21 into $t3
	  sw $t3, -72($fp)	# spill _tmp372 from $t3 to $fp-72
	# _tmp373 = _tmp372 < dealer
	  lw $t3, -72($fp)	# fill _tmp372 to $t3 from $fp-72
	  lw $t4, 8($fp)	# fill dealer to $t4 from $fp+8
	  slt $t5, $t3, $t4	
	  sw $t5, -76($fp)	# spill _tmp373 from $t5 to $fp-76
	# IfZ _tmp373 Goto _L44
	  lw $t3, -76($fp)	# fill _tmp373 to $t3 from $fp-76
	  beqz $t3, _L44	# branch if _tmp373 is zero 
	# _tmp374 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -80($fp)	# spill _tmp374 from $t4 to $fp-80
	# win = _tmp374
	  lw $t4, -80($fp)	# fill _tmp374 to $t4 from $fp-80
	# Goto _L45
	  sw $t3, -76($fp)	# spill _tmp373 from $t3 to $fp-76
	  sw $t4, -8($fp)	# spill win from $t4 to $fp-8
	  b _L45		# unconditional branch
  _L44:
	# _tmp375 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp376 = dealer < _tmp375
	  lw $t5, 8($fp)	# fill dealer to $t5 from $fp+8
	  slt $t6, $t5, $t4	
	  sw $t4, -84($fp)	# spill _tmp375 from $t4 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp376 from $t6 to $fp-88
	# IfZ _tmp376 Goto _L46
	  lw $t3, -88($fp)	# fill _tmp376 to $t3 from $fp-88
	  beqz $t3, _L46	# branch if _tmp376 is zero 
	# _tmp377 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -92($fp)	# spill _tmp377 from $t4 to $fp-92
	# win = _tmp377
	  lw $t4, -92($fp)	# fill _tmp377 to $t4 from $fp-92
	# Goto _L47
	  sw $t3, -88($fp)	# spill _tmp376 from $t3 to $fp-88
	  sw $t4, -8($fp)	# spill win from $t4 to $fp-8
	  b _L47		# unconditional branch
  _L46:
	# _tmp378 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp379 = _tmp378 < dealer
	  lw $t5, 8($fp)	# fill dealer to $t5 from $fp+8
	  slt $t6, $t4, $t5	
	  sw $t4, -96($fp)	# spill _tmp378 from $t4 to $fp-96
	  sw $t6, -100($fp)	# spill _tmp379 from $t6 to $fp-100
	# IfZ _tmp379 Goto _L48
	  lw $t3, -100($fp)	# fill _tmp379 to $t3 from $fp-100
	  beqz $t3, _L48	# branch if _tmp379 is zero 
	# _tmp380 = 1
	  li $t4, 1		# load constant value 1 into $t4
	  sw $t4, -104($fp)	# spill _tmp380 from $t4 to $fp-104
	# lose = _tmp380
	  lw $t4, -104($fp)	# fill _tmp380 to $t4 from $fp-104
	  sw $t3, -100($fp)	# spill _tmp379 from $t3 to $fp-100
	  sw $t4, -12($fp)	# spill lose from $t4 to $fp-12
  _L48:
  _L47:
  _L45:
  _L43:
  _L41:
	# _tmp381 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -108($fp)	# spill _tmp381 from $t3 to $fp-108
	# _tmp382 = _tmp381 < win
	  lw $t3, -108($fp)	# fill _tmp381 to $t3 from $fp-108
	  lw $t4, -8($fp)	# fill win to $t4 from $fp-8
	  slt $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp382 from $t5 to $fp-112
	# _tmp383 = _tmp381 == win
	  lw $t3, -108($fp)	# fill _tmp381 to $t3 from $fp-108
	  lw $t4, -8($fp)	# fill win to $t4 from $fp-8
	  seq $t5, $t3, $t4	
	  sw $t5, -116($fp)	# spill _tmp383 from $t5 to $fp-116
	# _tmp384 = _tmp382 || _tmp383
	  lw $t3, -112($fp)	# fill _tmp382 to $t3 from $fp-112
	  lw $t4, -116($fp)	# fill _tmp383 to $t4 from $fp-116
	  or $t5, $t3, $t4	
	  sw $t5, -120($fp)	# spill _tmp384 from $t5 to $fp-120
	# IfZ _tmp384 Goto _L49
	  lw $t3, -120($fp)	# fill _tmp384 to $t3 from $fp-120
	  beqz $t3, _L49	# branch if _tmp384 is zero 
	# _tmp385 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp385
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -120($fp)	# spill _tmp384 from $t3 to $fp-120
	  sw $t5, -124($fp)	# spill _tmp385 from $t5 to $fp-124
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp386 = ", you won $"
	  .data			# create string constant marked with label
	  _string34: .asciiz ", you won $"
	  .text
	  la $t3, _string34	# load label
	  sw $t3, -128($fp)	# spill _tmp386 from $t3 to $fp-128
	# PushParam _tmp386
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -128($fp)	# fill _tmp386 to $t3 from $fp-128
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp387 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp387
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -132($fp)	# spill _tmp387 from $t4 to $fp-132
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp388 = ".\n"
	  .data			# create string constant marked with label
	  _string35: .asciiz ".\n"
	  .text
	  la $t3, _string35	# load label
	  sw $t3, -136($fp)	# spill _tmp388 from $t3 to $fp-136
	# PushParam _tmp388
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -136($fp)	# fill _tmp388 to $t3 from $fp-136
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L50
	  b _L50		# unconditional branch
  _L49:
	# _tmp389 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -140($fp)	# spill _tmp389 from $t3 to $fp-140
	# _tmp390 = _tmp389 < lose
	  lw $t3, -140($fp)	# fill _tmp389 to $t3 from $fp-140
	  lw $t4, -12($fp)	# fill lose to $t4 from $fp-12
	  slt $t5, $t3, $t4	
	  sw $t5, -144($fp)	# spill _tmp390 from $t5 to $fp-144
	# _tmp391 = _tmp389 == lose
	  lw $t3, -140($fp)	# fill _tmp389 to $t3 from $fp-140
	  lw $t4, -12($fp)	# fill lose to $t4 from $fp-12
	  seq $t5, $t3, $t4	
	  sw $t5, -148($fp)	# spill _tmp391 from $t5 to $fp-148
	# _tmp392 = _tmp390 || _tmp391
	  lw $t3, -144($fp)	# fill _tmp390 to $t3 from $fp-144
	  lw $t4, -148($fp)	# fill _tmp391 to $t4 from $fp-148
	  or $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp392 from $t5 to $fp-152
	# IfZ _tmp392 Goto _L51
	  lw $t3, -152($fp)	# fill _tmp392 to $t3 from $fp-152
	  beqz $t3, _L51	# branch if _tmp392 is zero 
	# _tmp393 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp393
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -152($fp)	# spill _tmp392 from $t3 to $fp-152
	  sw $t5, -156($fp)	# spill _tmp393 from $t5 to $fp-156
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp394 = ", you lost $"
	  .data			# create string constant marked with label
	  _string36: .asciiz ", you lost $"
	  .text
	  la $t3, _string36	# load label
	  sw $t3, -160($fp)	# spill _tmp394 from $t3 to $fp-160
	# PushParam _tmp394
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -160($fp)	# fill _tmp394 to $t3 from $fp-160
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp395 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp395
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -164($fp)	# spill _tmp395 from $t4 to $fp-164
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp396 = ".\n"
	  .data			# create string constant marked with label
	  _string37: .asciiz ".\n"
	  .text
	  la $t3, _string37	# load label
	  sw $t3, -168($fp)	# spill _tmp396 from $t3 to $fp-168
	# PushParam _tmp396
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -168($fp)	# fill _tmp396 to $t3 from $fp-168
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L52
	  b _L52		# unconditional branch
  _L51:
	# _tmp397 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp397
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -172($fp)	# spill _tmp397 from $t4 to $fp-172
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp398 = ", you push!\n"
	  .data			# create string constant marked with label
	  _string38: .asciiz ", you push!\n"
	  .text
	  la $t3, _string38	# load label
	  sw $t3, -176($fp)	# spill _tmp398 from $t3 to $fp-176
	# PushParam _tmp398
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -176($fp)	# fill _tmp398 to $t3 from $fp-176
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L52:
  _L50:
	# _tmp399 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp400 = win * _tmp399
	  lw $t5, -8($fp)	# fill win to $t5 from $fp-8
	  mul $t6, $t5, $t4	
	  sw $t4, -180($fp)	# spill _tmp399 from $t4 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp400 from $t6 to $fp-184
	# win = _tmp400
	  lw $t3, -184($fp)	# fill _tmp400 to $t3 from $fp-184
	# _tmp401 = *(this + 8)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 8($t4) 	# load with offset
	# _tmp402 = lose * _tmp401
	  lw $t6, -12($fp)	# fill lose to $t6 from $fp-12
	  mul $t7, $t6, $t5	
	  sw $t3, -8($fp)	# spill win from $t3 to $fp-8
	  sw $t5, -188($fp)	# spill _tmp401 from $t5 to $fp-188
	  sw $t7, -192($fp)	# spill _tmp402 from $t7 to $fp-192
	# lose = _tmp402
	  lw $t3, -192($fp)	# fill _tmp402 to $t3 from $fp-192
	# _tmp403 = *(this + 12)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 12($t4) 	# load with offset
	# _tmp404 = _tmp403 + win
	  lw $t6, -8($fp)	# fill win to $t6 from $fp-8
	  add $t7, $t5, $t6	
	  sw $t3, -12($fp)	# spill lose from $t3 to $fp-12
	  sw $t5, -196($fp)	# spill _tmp403 from $t5 to $fp-196
	  sw $t7, -200($fp)	# spill _tmp404 from $t7 to $fp-200
	# _tmp405 = _tmp404 - lose
	  lw $t3, -200($fp)	# fill _tmp404 to $t3 from $fp-200
	  lw $t4, -12($fp)	# fill lose to $t4 from $fp-12
	  sub $t5, $t3, $t4	
	  sw $t5, -204($fp)	# spill _tmp405 from $t5 to $fp-204
	# *(this + 12) = _tmp405
	  lw $t3, -204($fp)	# fill _tmp405 to $t3 from $fp-204
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 12($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word _Player.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Player.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
  _Dealer.Init:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp406 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -8($fp)	# spill _tmp406 from $t3 to $fp-8
	# *(this + 24) = _tmp406
	  lw $t3, -8($fp)	# fill _tmp406 to $t3 from $fp-8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 24($t4) 	# store with offset
	# _tmp407 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -12($fp)	# spill _tmp407 from $t5 to $fp-12
	# *(this + 4) = _tmp407
	  lw $t5, -12($fp)	# fill _tmp407 to $t5 from $fp-12
	  sw $t5, 4($t4) 	# store with offset
	# _tmp408 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -16($fp)	# spill _tmp408 from $t6 to $fp-16
	# *(this + 20) = _tmp408
	  lw $t6, -16($fp)	# fill _tmp408 to $t6 from $fp-16
	  sw $t6, 20($t4) 	# store with offset
	# _tmp409 = "Dealer"
	  .data			# create string constant marked with label
	  _string39: .asciiz "Dealer"
	  .text
	  la $t7, _string39	# load label
	  sw $t7, -20($fp)	# spill _tmp409 from $t7 to $fp-20
	# *(this + 16) = _tmp409
	  lw $t7, -20($fp)	# fill _tmp409 to $t7 from $fp-20
	  sw $t7, 16($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Dealer.TakeTurn:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp410 = "\n"
	  .data			# create string constant marked with label
	  _string40: .asciiz "\n"
	  .text
	  la $t3, _string40	# load label
	  sw $t3, -8($fp)	# spill _tmp410 from $t3 to $fp-8
	# PushParam _tmp410
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp410 to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp411 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp411
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill _tmp411 from $t4 to $fp-12
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp412 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string41: .asciiz "'s turn.\n"
	  .text
	  la $t3, _string41	# load label
	  sw $t3, -16($fp)	# spill _tmp412 from $t3 to $fp-16
	# PushParam _tmp412
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp412 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L53:
	# _tmp413 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp414 = 16
	  li $t5, 16		# load constant value 16 into $t5
	  sw $t5, -24($fp)	# spill _tmp414 from $t5 to $fp-24
	# _tmp415 = _tmp413 < _tmp414
	  lw $t5, -24($fp)	# fill _tmp414 to $t5 from $fp-24
	  slt $t6, $t4, $t5	
	  sw $t4, -20($fp)	# spill _tmp413 from $t4 to $fp-20
	  sw $t6, -28($fp)	# spill _tmp415 from $t6 to $fp-28
	# _tmp416 = _tmp413 == _tmp414
	  lw $t3, -20($fp)	# fill _tmp413 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp414 to $t4 from $fp-24
	  seq $t5, $t3, $t4	
	  sw $t5, -32($fp)	# spill _tmp416 from $t5 to $fp-32
	# _tmp417 = _tmp415 || _tmp416
	  lw $t3, -28($fp)	# fill _tmp415 to $t3 from $fp-28
	  lw $t4, -32($fp)	# fill _tmp416 to $t4 from $fp-32
	  or $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp417 from $t5 to $fp-36
	# IfZ _tmp417 Goto _L54
	  lw $t3, -36($fp)	# fill _tmp417 to $t3 from $fp-36
	  beqz $t3, _L54	# branch if _tmp417 is zero 
	# _tmp418 = *(this)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 0($t4) 	# load with offset
	# _tmp419 = *(_tmp418 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, 8($fp)	# fill deck to $t7 from $fp+8
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t3, -36($fp)	# spill _tmp417 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp418 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp419 from $t6 to $fp-44
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp419
	  lw $t3, -44($fp)	# fill _tmp419 to $t3 from $fp-44
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L53
	  b _L53		# unconditional branch
  _L54:
	# _tmp420 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# _tmp421 = 21
	  li $t5, 21		# load constant value 21 into $t5
	  sw $t5, -52($fp)	# spill _tmp421 from $t5 to $fp-52
	# _tmp422 = _tmp421 < _tmp420
	  lw $t5, -52($fp)	# fill _tmp421 to $t5 from $fp-52
	  slt $t6, $t5, $t4	
	  sw $t4, -48($fp)	# spill _tmp420 from $t4 to $fp-48
	  sw $t6, -56($fp)	# spill _tmp422 from $t6 to $fp-56
	# IfZ _tmp422 Goto _L55
	  lw $t3, -56($fp)	# fill _tmp422 to $t3 from $fp-56
	  beqz $t3, _L55	# branch if _tmp422 is zero 
	# _tmp423 = *(this + 16)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp423
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -56($fp)	# spill _tmp422 from $t3 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp423 from $t5 to $fp-60
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp424 = " busts with the big "
	  .data			# create string constant marked with label
	  _string42: .asciiz " busts with the big "
	  .text
	  la $t3, _string42	# load label
	  sw $t3, -64($fp)	# spill _tmp424 from $t3 to $fp-64
	# PushParam _tmp424
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -64($fp)	# fill _tmp424 to $t3 from $fp-64
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp425 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp425
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -68($fp)	# spill _tmp425 from $t4 to $fp-68
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp426 = "!\n"
	  .data			# create string constant marked with label
	  _string43: .asciiz "!\n"
	  .text
	  la $t3, _string43	# load label
	  sw $t3, -72($fp)	# spill _tmp426 from $t3 to $fp-72
	# PushParam _tmp426
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -72($fp)	# fill _tmp426 to $t3 from $fp-72
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L56
	  b _L56		# unconditional branch
  _L55:
	# _tmp427 = *(this + 16)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp427
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -76($fp)	# spill _tmp427 from $t4 to $fp-76
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp428 = " stays at "
	  .data			# create string constant marked with label
	  _string44: .asciiz " stays at "
	  .text
	  la $t3, _string44	# load label
	  sw $t3, -80($fp)	# spill _tmp428 from $t3 to $fp-80
	# PushParam _tmp428
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -80($fp)	# fill _tmp428 to $t3 from $fp-80
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp429 = *(this + 24)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp429
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -84($fp)	# spill _tmp429 from $t4 to $fp-84
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp430 = ".\n"
	  .data			# create string constant marked with label
	  _string45: .asciiz ".\n"
	  .text
	  la $t3, _string45	# load label
	  sw $t3, -88($fp)	# spill _tmp430 from $t3 to $fp-88
	# PushParam _tmp430
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -88($fp)	# fill _tmp430 to $t3 from $fp-88
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L56:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Dealer
	  .data
	  .align 2
	  Dealer:		# label for class Dealer vtable
	  .word _Dealer.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Dealer.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
  _House.SetupGame:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp431 = "\nWelcome to CS143 BlackJack!\n"
	  .data			# create string constant marked with label
	  _string46: .asciiz "\nWelcome to CS143 BlackJack!\n"
	  .text
	  la $t3, _string46	# load label
	  sw $t3, -8($fp)	# spill _tmp431 from $t3 to $fp-8
	# PushParam _tmp431
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp431 to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp432 = "---------------------------\n"
	  .data			# create string constant marked with label
	  _string47: .asciiz "---------------------------\n"
	  .text
	  la $t3, _string47	# load label
	  sw $t3, -12($fp)	# spill _tmp432 from $t3 to $fp-12
	# PushParam _tmp432
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp432 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp433 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -16($fp)	# spill _tmp433 from $t3 to $fp-16
	# PushParam _tmp433
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp433 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp434 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp434 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp435 = Random
	  la $t3, Random	# load label
	  sw $t3, -24($fp)	# spill _tmp435 from $t3 to $fp-24
	# *(_tmp434) = _tmp435
	  lw $t3, -24($fp)	# fill _tmp435 to $t3 from $fp-24
	  lw $t4, -20($fp)	# fill _tmp434 to $t4 from $fp-20
	  sw $t3, 0($t4) 	# store with offset
	# gRnd = _tmp434
	  sw $t4, -20($fp)	# spill _tmp434 from $t4 to $fp-20
	# _tmp436 = "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string48: .asciiz "Please enter a random number seed: "
	  .text
	  la $t5, _string48	# load label
	  sw $t5, -28($fp)	# spill _tmp436 from $t5 to $fp-28
	# PushParam _tmp436
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -28($fp)	# fill _tmp436 to $t5 from $fp-28
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t4, 0($gp)	# spill gRnd from $t4 to $gp+0
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp437 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -32($fp)	# spill _tmp437 from $t3 to $fp-32
	# _tmp438 = *(gRnd)
	  lw $t3, 0($gp)	# fill gRnd to $t3 from $gp+0
	  lw $t4, 0($t3) 	# load with offset
	# _tmp439 = *(_tmp438)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp437
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -32($fp)	# fill _tmp437 to $t6 from $fp-32
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -36($fp)	# spill _tmp438 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp439 from $t5 to $fp-40
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 0($gp)	# fill gRnd to $t3 from $gp+0
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp439
	  lw $t3, -40($fp)	# fill _tmp439 to $t3 from $fp-40
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp440 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -44($fp)	# spill _tmp440 from $t3 to $fp-44
	# PushParam _tmp440
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -44($fp)	# fill _tmp440 to $t3 from $fp-44
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp441 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -48($fp)	# spill _tmp441 from $t3 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp442 = BJDeck
	  la $t3, BJDeck	# load label
	  sw $t3, -52($fp)	# spill _tmp442 from $t3 to $fp-52
	# *(_tmp441) = _tmp442
	  lw $t3, -52($fp)	# fill _tmp442 to $t3 from $fp-52
	  lw $t4, -48($fp)	# fill _tmp441 to $t4 from $fp-48
	  sw $t3, 0($t4) 	# store with offset
	# *(this + 12) = _tmp441
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  sw $t4, 12($t5) 	# store with offset
	# _tmp443 = 28
	  li $t6, 28		# load constant value 28 into $t6
	  sw $t6, -56($fp)	# spill _tmp443 from $t6 to $fp-56
	# PushParam _tmp443
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -56($fp)	# fill _tmp443 to $t6 from $fp-56
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -48($fp)	# spill _tmp441 from $t4 to $fp-48
	  sw $t5, 4($fp)	# spill this from $t5 to $fp+4
	# _tmp444 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp444 from $t3 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp445 = Dealer
	  la $t3, Dealer	# load label
	  sw $t3, -64($fp)	# spill _tmp445 from $t3 to $fp-64
	# *(_tmp444) = _tmp445
	  lw $t3, -64($fp)	# fill _tmp445 to $t3 from $fp-64
	  lw $t4, -60($fp)	# fill _tmp444 to $t4 from $fp-60
	  sw $t3, 0($t4) 	# store with offset
	# *(this + 8) = _tmp444
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  sw $t4, 8($t5) 	# store with offset
	# _tmp446 = *(this + 12)
	  lw $t6, 12($t5) 	# load with offset
	# _tmp447 = *(_tmp446)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp448 = *(_tmp447)
	  lw $t8, 0($t7) 	# load with offset
	# PushParam _tmp446
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -60($fp)	# spill _tmp444 from $t4 to $fp-60
	  sw $t5, 4($fp)	# spill this from $t5 to $fp+4
	  sw $t6, -68($fp)	# spill _tmp446 from $t6 to $fp-68
	  sw $t7, -72($fp)	# spill _tmp447 from $t7 to $fp-72
	  sw $t8, -76($fp)	# spill _tmp448 from $t8 to $fp-76
	# ACall _tmp448
	  lw $t3, -76($fp)	# fill _tmp448 to $t3 from $fp-76
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp449 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# _tmp450 = *(_tmp449)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp451 = *(_tmp450 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam _tmp449
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -80($fp)	# spill _tmp449 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp450 from $t5 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp451 from $t6 to $fp-88
	# ACall _tmp451
	  lw $t3, -88($fp)	# fill _tmp451 to $t3 from $fp-88
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.SetupPlayers:
	# BeginFunc 196
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 196	# decrement sp to make space for locals/temps
	# _tmp452 = "How many players do we have today? "
	  .data			# create string constant marked with label
	  _string49: .asciiz "How many players do we have today? "
	  .text
	  la $t3, _string49	# load label
	  sw $t3, -16($fp)	# spill _tmp452 from $t3 to $fp-16
	# PushParam _tmp452
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp452 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp453 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp453 from $t3 to $fp-20
	# numPlayers = _tmp453
	  lw $t3, -20($fp)	# fill _tmp453 to $t3 from $fp-20
	# _tmp454 = 0
	  li $t4, 0		# load constant value 0 into $t4
	  sw $t4, -24($fp)	# spill _tmp454 from $t4 to $fp-24
	# _tmp455 = numPlayers < _tmp454
	  lw $t4, -24($fp)	# fill _tmp454 to $t4 from $fp-24
	  slt $t5, $t3, $t4	
	  sw $t3, -12($fp)	# spill numPlayers from $t3 to $fp-12
	  sw $t5, -28($fp)	# spill _tmp455 from $t5 to $fp-28
	# IfZ _tmp455 Goto _L57
	  lw $t3, -28($fp)	# fill _tmp455 to $t3 from $fp-28
	  beqz $t3, _L57	# branch if _tmp455 is zero 
	# _tmp456 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string50: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t4, _string50	# load label
	  sw $t4, -32($fp)	# spill _tmp456 from $t4 to $fp-32
	# PushParam _tmp456
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -32($fp)	# fill _tmp456 to $t4 from $fp-32
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -28($fp)	# spill _tmp455 from $t3 to $fp-28
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L57:
	# _tmp457 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -36($fp)	# spill _tmp457 from $t3 to $fp-36
	# _tmp458 = _tmp457 + numPlayers
	  lw $t3, -36($fp)	# fill _tmp457 to $t3 from $fp-36
	  lw $t4, -12($fp)	# fill numPlayers to $t4 from $fp-12
	  add $t5, $t3, $t4	
	  sw $t5, -40($fp)	# spill _tmp458 from $t5 to $fp-40
	# _tmp459 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -44($fp)	# spill _tmp459 from $t3 to $fp-44
	# _tmp460 = _tmp458 * _tmp459
	  lw $t3, -40($fp)	# fill _tmp458 to $t3 from $fp-40
	  lw $t4, -44($fp)	# fill _tmp459 to $t4 from $fp-44
	  mul $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp460 from $t5 to $fp-48
	# PushParam _tmp460
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -48($fp)	# fill _tmp460 to $t3 from $fp-48
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp461 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -52($fp)	# spill _tmp461 from $t3 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp461) = numPlayers
	  lw $t3, -12($fp)	# fill numPlayers to $t3 from $fp-12
	  lw $t4, -52($fp)	# fill _tmp461 to $t4 from $fp-52
	  sw $t3, 0($t4) 	# store with offset
	# _tmp462 = _tmp461 + _tmp459
	  lw $t5, -44($fp)	# fill _tmp459 to $t5 from $fp-44
	  add $t6, $t4, $t5	
	  sw $t4, -52($fp)	# spill _tmp461 from $t4 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp462 from $t6 to $fp-56
	# *(this + 4) = _tmp462
	  lw $t3, -56($fp)	# fill _tmp462 to $t3 from $fp-56
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# _tmp463 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -60($fp)	# spill _tmp463 from $t5 to $fp-60
	# i = _tmp463
	  lw $t5, -60($fp)	# fill _tmp463 to $t5 from $fp-60
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -8($fp)	# spill i from $t5 to $fp-8
  _L58:
	# _tmp464 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp465 = *(_tmp464 + -4)
	  lw $t5, -4($t4) 	# load with offset
	# _tmp466 = i < _tmp465
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  slt $t7, $t6, $t5	
	  sw $t4, -64($fp)	# spill _tmp464 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp465 from $t5 to $fp-68
	  sw $t7, -72($fp)	# spill _tmp466 from $t7 to $fp-72
	# IfZ _tmp466 Goto _L59
	  lw $t3, -72($fp)	# fill _tmp466 to $t3 from $fp-72
	  beqz $t3, _L59	# branch if _tmp466 is zero 
	# _tmp467 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp468 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -80($fp)	# spill _tmp468 from $t6 to $fp-80
	# _tmp469 = i < _tmp468
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -80($fp)	# fill _tmp468 to $t7 from $fp-80
	  slt $t8, $t6, $t7	
	  sw $t3, -72($fp)	# spill _tmp466 from $t3 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp467 from $t5 to $fp-76
	  sw $t8, -84($fp)	# spill _tmp469 from $t8 to $fp-84
	# _tmp470 = *(_tmp467 + -4)
	  lw $t3, -76($fp)	# fill _tmp467 to $t3 from $fp-76
	  lw $t4, -4($t3) 	# load with offset
	# _tmp471 = i < _tmp470
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -88($fp)	# spill _tmp470 from $t4 to $fp-88
	  sw $t6, -92($fp)	# spill _tmp471 from $t6 to $fp-92
	# _tmp472 = _tmp471 == _tmp468
	  lw $t3, -92($fp)	# fill _tmp471 to $t3 from $fp-92
	  lw $t4, -80($fp)	# fill _tmp468 to $t4 from $fp-80
	  seq $t5, $t3, $t4	
	  sw $t5, -96($fp)	# spill _tmp472 from $t5 to $fp-96
	# _tmp473 = _tmp469 || _tmp472
	  lw $t3, -84($fp)	# fill _tmp469 to $t3 from $fp-84
	  lw $t4, -96($fp)	# fill _tmp472 to $t4 from $fp-96
	  or $t5, $t3, $t4	
	  sw $t5, -100($fp)	# spill _tmp473 from $t5 to $fp-100
	# IfZ _tmp473 Goto _L60
	  lw $t3, -100($fp)	# fill _tmp473 to $t3 from $fp-100
	  beqz $t3, _L60	# branch if _tmp473 is zero 
	# _tmp474 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string51: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string51	# load label
	  sw $t4, -104($fp)	# spill _tmp474 from $t4 to $fp-104
	# PushParam _tmp474
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -104($fp)	# fill _tmp474 to $t4 from $fp-104
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -100($fp)	# spill _tmp473 from $t3 to $fp-100
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L60:
	# _tmp475 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -108($fp)	# spill _tmp475 from $t3 to $fp-108
	# _tmp476 = _tmp475 * i
	  lw $t3, -108($fp)	# fill _tmp475 to $t3 from $fp-108
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp476 from $t5 to $fp-112
	# _tmp477 = _tmp467 + _tmp476
	  lw $t3, -76($fp)	# fill _tmp467 to $t3 from $fp-76
	  lw $t4, -112($fp)	# fill _tmp476 to $t4 from $fp-112
	  add $t5, $t3, $t4	
	  sw $t5, -116($fp)	# spill _tmp477 from $t5 to $fp-116
	# _tmp478 = 28
	  li $t3, 28		# load constant value 28 into $t3
	  sw $t3, -120($fp)	# spill _tmp478 from $t3 to $fp-120
	# PushParam _tmp478
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -120($fp)	# fill _tmp478 to $t3 from $fp-120
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp479 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -124($fp)	# spill _tmp479 from $t3 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp480 = Player
	  la $t3, Player	# load label
	  sw $t3, -128($fp)	# spill _tmp480 from $t3 to $fp-128
	# *(_tmp479) = _tmp480
	  lw $t3, -128($fp)	# fill _tmp480 to $t3 from $fp-128
	  lw $t4, -124($fp)	# fill _tmp479 to $t4 from $fp-124
	  sw $t3, 0($t4) 	# store with offset
	# *(_tmp477) = _tmp479
	  lw $t5, -116($fp)	# fill _tmp477 to $t5 from $fp-116
	  sw $t4, 0($t5) 	# store with offset
	# _tmp481 = 1
	  li $t6, 1		# load constant value 1 into $t6
	  sw $t6, -132($fp)	# spill _tmp481 from $t6 to $fp-132
	# _tmp482 = i + _tmp481
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -132($fp)	# fill _tmp481 to $t7 from $fp-132
	  add $t8, $t6, $t7	
	  sw $t4, -124($fp)	# spill _tmp479 from $t4 to $fp-124
	  sw $t5, -116($fp)	# spill _tmp477 from $t5 to $fp-116
	  sw $t8, -136($fp)	# spill _tmp482 from $t8 to $fp-136
	# _tmp483 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp484 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -144($fp)	# spill _tmp484 from $t5 to $fp-144
	# _tmp485 = i < _tmp484
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  lw $t6, -144($fp)	# fill _tmp484 to $t6 from $fp-144
	  slt $t7, $t5, $t6	
	  sw $t4, -140($fp)	# spill _tmp483 from $t4 to $fp-140
	  sw $t7, -148($fp)	# spill _tmp485 from $t7 to $fp-148
	# _tmp486 = *(_tmp483 + -4)
	  lw $t3, -140($fp)	# fill _tmp483 to $t3 from $fp-140
	  lw $t4, -4($t3) 	# load with offset
	# _tmp487 = i < _tmp486
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -152($fp)	# spill _tmp486 from $t4 to $fp-152
	  sw $t6, -156($fp)	# spill _tmp487 from $t6 to $fp-156
	# _tmp488 = _tmp487 == _tmp484
	  lw $t3, -156($fp)	# fill _tmp487 to $t3 from $fp-156
	  lw $t4, -144($fp)	# fill _tmp484 to $t4 from $fp-144
	  seq $t5, $t3, $t4	
	  sw $t5, -160($fp)	# spill _tmp488 from $t5 to $fp-160
	# _tmp489 = _tmp485 || _tmp488
	  lw $t3, -148($fp)	# fill _tmp485 to $t3 from $fp-148
	  lw $t4, -160($fp)	# fill _tmp488 to $t4 from $fp-160
	  or $t5, $t3, $t4	
	  sw $t5, -164($fp)	# spill _tmp489 from $t5 to $fp-164
	# IfZ _tmp489 Goto _L61
	  lw $t3, -164($fp)	# fill _tmp489 to $t3 from $fp-164
	  beqz $t3, _L61	# branch if _tmp489 is zero 
	# _tmp490 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string52: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string52	# load label
	  sw $t4, -168($fp)	# spill _tmp490 from $t4 to $fp-168
	# PushParam _tmp490
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -168($fp)	# fill _tmp490 to $t4 from $fp-168
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -164($fp)	# spill _tmp489 from $t3 to $fp-164
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L61:
	# _tmp491 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -172($fp)	# spill _tmp491 from $t3 to $fp-172
	# _tmp492 = _tmp491 * i
	  lw $t3, -172($fp)	# fill _tmp491 to $t3 from $fp-172
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -176($fp)	# spill _tmp492 from $t5 to $fp-176
	# _tmp493 = _tmp483 + _tmp492
	  lw $t3, -140($fp)	# fill _tmp483 to $t3 from $fp-140
	  lw $t4, -176($fp)	# fill _tmp492 to $t4 from $fp-176
	  add $t5, $t3, $t4	
	  sw $t5, -180($fp)	# spill _tmp493 from $t5 to $fp-180
	# _tmp494 = *(_tmp493)
	  lw $t3, -180($fp)	# fill _tmp493 to $t3 from $fp-180
	  lw $t4, 0($t3) 	# load with offset
	# _tmp495 = *(_tmp494)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp496 = *(_tmp495)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam _tmp482
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -136($fp)	# fill _tmp482 to $t7 from $fp-136
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -184($fp)	# spill _tmp494 from $t4 to $fp-184
	  sw $t5, -188($fp)	# spill _tmp495 from $t5 to $fp-188
	  sw $t6, -192($fp)	# spill _tmp496 from $t6 to $fp-192
	# PushParam _tmp494
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -184($fp)	# fill _tmp494 to $t3 from $fp-184
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp496
	  lw $t3, -192($fp)	# fill _tmp496 to $t3 from $fp-192
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp497 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -196($fp)	# spill _tmp497 from $t3 to $fp-196
	# _tmp498 = i + _tmp497
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -196($fp)	# fill _tmp497 to $t4 from $fp-196
	  add $t5, $t3, $t4	
	  sw $t5, -200($fp)	# spill _tmp498 from $t5 to $fp-200
	# i = _tmp498
	  lw $t3, -200($fp)	# fill _tmp498 to $t3 from $fp-200
	# Goto _L58
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L58		# unconditional branch
  _L59:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.TakeAllBets:
	# BeginFunc 148
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 148	# decrement sp to make space for locals/temps
	# _tmp499 = "\nFirst, let's take bets.\n"
	  .data			# create string constant marked with label
	  _string53: .asciiz "\nFirst, let's take bets.\n"
	  .text
	  la $t3, _string53	# load label
	  sw $t3, -12($fp)	# spill _tmp499 from $t3 to $fp-12
	# PushParam _tmp499
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp499 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp500 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp500 from $t3 to $fp-16
	# i = _tmp500
	  lw $t3, -16($fp)	# fill _tmp500 to $t3 from $fp-16
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L62:
	# _tmp501 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp502 = *(_tmp501 + -4)
	  lw $t5, -4($t4) 	# load with offset
	# _tmp503 = i < _tmp502
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  slt $t7, $t6, $t5	
	  sw $t4, -20($fp)	# spill _tmp501 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp502 from $t5 to $fp-24
	  sw $t7, -28($fp)	# spill _tmp503 from $t7 to $fp-28
	# IfZ _tmp503 Goto _L63
	  lw $t3, -28($fp)	# fill _tmp503 to $t3 from $fp-28
	  beqz $t3, _L63	# branch if _tmp503 is zero 
	# _tmp504 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp505 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -36($fp)	# spill _tmp505 from $t6 to $fp-36
	# _tmp506 = i < _tmp505
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -36($fp)	# fill _tmp505 to $t7 from $fp-36
	  slt $t8, $t6, $t7	
	  sw $t3, -28($fp)	# spill _tmp503 from $t3 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp504 from $t5 to $fp-32
	  sw $t8, -40($fp)	# spill _tmp506 from $t8 to $fp-40
	# _tmp507 = *(_tmp504 + -4)
	  lw $t3, -32($fp)	# fill _tmp504 to $t3 from $fp-32
	  lw $t4, -4($t3) 	# load with offset
	# _tmp508 = i < _tmp507
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -44($fp)	# spill _tmp507 from $t4 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp508 from $t6 to $fp-48
	# _tmp509 = _tmp508 == _tmp505
	  lw $t3, -48($fp)	# fill _tmp508 to $t3 from $fp-48
	  lw $t4, -36($fp)	# fill _tmp505 to $t4 from $fp-36
	  seq $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp509 from $t5 to $fp-52
	# _tmp510 = _tmp506 || _tmp509
	  lw $t3, -40($fp)	# fill _tmp506 to $t3 from $fp-40
	  lw $t4, -52($fp)	# fill _tmp509 to $t4 from $fp-52
	  or $t5, $t3, $t4	
	  sw $t5, -56($fp)	# spill _tmp510 from $t5 to $fp-56
	# IfZ _tmp510 Goto _L64
	  lw $t3, -56($fp)	# fill _tmp510 to $t3 from $fp-56
	  beqz $t3, _L64	# branch if _tmp510 is zero 
	# _tmp511 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string54: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string54	# load label
	  sw $t4, -60($fp)	# spill _tmp511 from $t4 to $fp-60
	# PushParam _tmp511
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -60($fp)	# fill _tmp511 to $t4 from $fp-60
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -56($fp)	# spill _tmp510 from $t3 to $fp-56
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L64:
	# _tmp512 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -64($fp)	# spill _tmp512 from $t3 to $fp-64
	# _tmp513 = _tmp512 * i
	  lw $t3, -64($fp)	# fill _tmp512 to $t3 from $fp-64
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp513 from $t5 to $fp-68
	# _tmp514 = _tmp504 + _tmp513
	  lw $t3, -32($fp)	# fill _tmp504 to $t3 from $fp-32
	  lw $t4, -68($fp)	# fill _tmp513 to $t4 from $fp-68
	  add $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp514 from $t5 to $fp-72
	# _tmp515 = *(_tmp514)
	  lw $t3, -72($fp)	# fill _tmp514 to $t3 from $fp-72
	  lw $t4, 0($t3) 	# load with offset
	# _tmp516 = *(_tmp515)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp517 = *(_tmp516 + 16)
	  lw $t6, 16($t5) 	# load with offset
	# PushParam _tmp515
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -76($fp)	# spill _tmp515 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp516 from $t5 to $fp-80
	  sw $t6, -84($fp)	# spill _tmp517 from $t6 to $fp-84
	# _tmp518 = ACall _tmp517
	  lw $t3, -84($fp)	# fill _tmp517 to $t3 from $fp-84
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp518 from $t3 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp518 Goto _L65
	  lw $t3, -88($fp)	# fill _tmp518 to $t3 from $fp-88
	  beqz $t3, _L65	# branch if _tmp518 is zero 
	# _tmp519 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp520 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -96($fp)	# spill _tmp520 from $t6 to $fp-96
	# _tmp521 = i < _tmp520
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -96($fp)	# fill _tmp520 to $t7 from $fp-96
	  slt $t8, $t6, $t7	
	  sw $t3, -88($fp)	# spill _tmp518 from $t3 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp519 from $t5 to $fp-92
	  sw $t8, -100($fp)	# spill _tmp521 from $t8 to $fp-100
	# _tmp522 = *(_tmp519 + -4)
	  lw $t3, -92($fp)	# fill _tmp519 to $t3 from $fp-92
	  lw $t4, -4($t3) 	# load with offset
	# _tmp523 = i < _tmp522
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -104($fp)	# spill _tmp522 from $t4 to $fp-104
	  sw $t6, -108($fp)	# spill _tmp523 from $t6 to $fp-108
	# _tmp524 = _tmp523 == _tmp520
	  lw $t3, -108($fp)	# fill _tmp523 to $t3 from $fp-108
	  lw $t4, -96($fp)	# fill _tmp520 to $t4 from $fp-96
	  seq $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp524 from $t5 to $fp-112
	# _tmp525 = _tmp521 || _tmp524
	  lw $t3, -100($fp)	# fill _tmp521 to $t3 from $fp-100
	  lw $t4, -112($fp)	# fill _tmp524 to $t4 from $fp-112
	  or $t5, $t3, $t4	
	  sw $t5, -116($fp)	# spill _tmp525 from $t5 to $fp-116
	# IfZ _tmp525 Goto _L66
	  lw $t3, -116($fp)	# fill _tmp525 to $t3 from $fp-116
	  beqz $t3, _L66	# branch if _tmp525 is zero 
	# _tmp526 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string55: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string55	# load label
	  sw $t4, -120($fp)	# spill _tmp526 from $t4 to $fp-120
	# PushParam _tmp526
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -120($fp)	# fill _tmp526 to $t4 from $fp-120
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -116($fp)	# spill _tmp525 from $t3 to $fp-116
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L66:
	# _tmp527 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -124($fp)	# spill _tmp527 from $t3 to $fp-124
	# _tmp528 = _tmp527 * i
	  lw $t3, -124($fp)	# fill _tmp527 to $t3 from $fp-124
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp528 from $t5 to $fp-128
	# _tmp529 = _tmp519 + _tmp528
	  lw $t3, -92($fp)	# fill _tmp519 to $t3 from $fp-92
	  lw $t4, -128($fp)	# fill _tmp528 to $t4 from $fp-128
	  add $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp529 from $t5 to $fp-132
	# _tmp530 = *(_tmp529)
	  lw $t3, -132($fp)	# fill _tmp529 to $t3 from $fp-132
	  lw $t4, 0($t3) 	# load with offset
	# _tmp531 = *(_tmp530)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp532 = *(_tmp531 + 24)
	  lw $t6, 24($t5) 	# load with offset
	# PushParam _tmp530
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -136($fp)	# spill _tmp530 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp531 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp532 from $t6 to $fp-144
	# ACall _tmp532
	  lw $t3, -144($fp)	# fill _tmp532 to $t3 from $fp-144
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L65:
	# _tmp533 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -148($fp)	# spill _tmp533 from $t3 to $fp-148
	# _tmp534 = i + _tmp533
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -148($fp)	# fill _tmp533 to $t4 from $fp-148
	  add $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp534 from $t5 to $fp-152
	# i = _tmp534
	  lw $t3, -152($fp)	# fill _tmp534 to $t3 from $fp-152
	# Goto _L62
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L62		# unconditional branch
  _L63:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.TakeAllTurns:
	# BeginFunc 148
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 148	# decrement sp to make space for locals/temps
	# _tmp535 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp535 from $t3 to $fp-12
	# i = _tmp535
	  lw $t3, -12($fp)	# fill _tmp535 to $t3 from $fp-12
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L67:
	# _tmp536 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp537 = *(_tmp536 + -4)
	  lw $t5, -4($t4) 	# load with offset
	# _tmp538 = i < _tmp537
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  slt $t7, $t6, $t5	
	  sw $t4, -16($fp)	# spill _tmp536 from $t4 to $fp-16
	  sw $t5, -20($fp)	# spill _tmp537 from $t5 to $fp-20
	  sw $t7, -24($fp)	# spill _tmp538 from $t7 to $fp-24
	# IfZ _tmp538 Goto _L68
	  lw $t3, -24($fp)	# fill _tmp538 to $t3 from $fp-24
	  beqz $t3, _L68	# branch if _tmp538 is zero 
	# _tmp539 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp540 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -32($fp)	# spill _tmp540 from $t6 to $fp-32
	# _tmp541 = i < _tmp540
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -32($fp)	# fill _tmp540 to $t7 from $fp-32
	  slt $t8, $t6, $t7	
	  sw $t3, -24($fp)	# spill _tmp538 from $t3 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp539 from $t5 to $fp-28
	  sw $t8, -36($fp)	# spill _tmp541 from $t8 to $fp-36
	# _tmp542 = *(_tmp539 + -4)
	  lw $t3, -28($fp)	# fill _tmp539 to $t3 from $fp-28
	  lw $t4, -4($t3) 	# load with offset
	# _tmp543 = i < _tmp542
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -40($fp)	# spill _tmp542 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp543 from $t6 to $fp-44
	# _tmp544 = _tmp543 == _tmp540
	  lw $t3, -44($fp)	# fill _tmp543 to $t3 from $fp-44
	  lw $t4, -32($fp)	# fill _tmp540 to $t4 from $fp-32
	  seq $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp544 from $t5 to $fp-48
	# _tmp545 = _tmp541 || _tmp544
	  lw $t3, -36($fp)	# fill _tmp541 to $t3 from $fp-36
	  lw $t4, -48($fp)	# fill _tmp544 to $t4 from $fp-48
	  or $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp545 from $t5 to $fp-52
	# IfZ _tmp545 Goto _L69
	  lw $t3, -52($fp)	# fill _tmp545 to $t3 from $fp-52
	  beqz $t3, _L69	# branch if _tmp545 is zero 
	# _tmp546 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string56: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string56	# load label
	  sw $t4, -56($fp)	# spill _tmp546 from $t4 to $fp-56
	# PushParam _tmp546
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -56($fp)	# fill _tmp546 to $t4 from $fp-56
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp545 from $t3 to $fp-52
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L69:
	# _tmp547 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -60($fp)	# spill _tmp547 from $t3 to $fp-60
	# _tmp548 = _tmp547 * i
	  lw $t3, -60($fp)	# fill _tmp547 to $t3 from $fp-60
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp548 from $t5 to $fp-64
	# _tmp549 = _tmp539 + _tmp548
	  lw $t3, -28($fp)	# fill _tmp539 to $t3 from $fp-28
	  lw $t4, -64($fp)	# fill _tmp548 to $t4 from $fp-64
	  add $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp549 from $t5 to $fp-68
	# _tmp550 = *(_tmp549)
	  lw $t3, -68($fp)	# fill _tmp549 to $t3 from $fp-68
	  lw $t4, 0($t3) 	# load with offset
	# _tmp551 = *(_tmp550)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp552 = *(_tmp551 + 16)
	  lw $t6, 16($t5) 	# load with offset
	# PushParam _tmp550
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -72($fp)	# spill _tmp550 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp551 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp552 from $t6 to $fp-80
	# _tmp553 = ACall _tmp552
	  lw $t3, -80($fp)	# fill _tmp552 to $t3 from $fp-80
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -84($fp)	# spill _tmp553 from $t3 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp553 Goto _L70
	  lw $t3, -84($fp)	# fill _tmp553 to $t3 from $fp-84
	  beqz $t3, _L70	# branch if _tmp553 is zero 
	# _tmp554 = *(this + 12)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 12($t4) 	# load with offset
	# _tmp555 = *(this + 4)
	  lw $t6, 4($t4) 	# load with offset
	# _tmp556 = 0
	  li $t7, 0		# load constant value 0 into $t7
	  sw $t7, -96($fp)	# spill _tmp556 from $t7 to $fp-96
	# _tmp557 = i < _tmp556
	  lw $t7, -8($fp)	# fill i to $t7 from $fp-8
	  lw $t8, -96($fp)	# fill _tmp556 to $t8 from $fp-96
	  slt $t9, $t7, $t8	
	  sw $t3, -84($fp)	# spill _tmp553 from $t3 to $fp-84
	  sw $t5, -88($fp)	# spill _tmp554 from $t5 to $fp-88
	  sw $t6, -92($fp)	# spill _tmp555 from $t6 to $fp-92
	  sw $t9, -100($fp)	# spill _tmp557 from $t9 to $fp-100
	# _tmp558 = *(_tmp555 + -4)
	  lw $t3, -92($fp)	# fill _tmp555 to $t3 from $fp-92
	  lw $t4, -4($t3) 	# load with offset
	# _tmp559 = i < _tmp558
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -104($fp)	# spill _tmp558 from $t4 to $fp-104
	  sw $t6, -108($fp)	# spill _tmp559 from $t6 to $fp-108
	# _tmp560 = _tmp559 == _tmp556
	  lw $t3, -108($fp)	# fill _tmp559 to $t3 from $fp-108
	  lw $t4, -96($fp)	# fill _tmp556 to $t4 from $fp-96
	  seq $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp560 from $t5 to $fp-112
	# _tmp561 = _tmp557 || _tmp560
	  lw $t3, -100($fp)	# fill _tmp557 to $t3 from $fp-100
	  lw $t4, -112($fp)	# fill _tmp560 to $t4 from $fp-112
	  or $t5, $t3, $t4	
	  sw $t5, -116($fp)	# spill _tmp561 from $t5 to $fp-116
	# IfZ _tmp561 Goto _L71
	  lw $t3, -116($fp)	# fill _tmp561 to $t3 from $fp-116
	  beqz $t3, _L71	# branch if _tmp561 is zero 
	# _tmp562 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string57: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string57	# load label
	  sw $t4, -120($fp)	# spill _tmp562 from $t4 to $fp-120
	# PushParam _tmp562
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -120($fp)	# fill _tmp562 to $t4 from $fp-120
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -116($fp)	# spill _tmp561 from $t3 to $fp-116
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L71:
	# _tmp563 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -124($fp)	# spill _tmp563 from $t3 to $fp-124
	# _tmp564 = _tmp563 * i
	  lw $t3, -124($fp)	# fill _tmp563 to $t3 from $fp-124
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp564 from $t5 to $fp-128
	# _tmp565 = _tmp555 + _tmp564
	  lw $t3, -92($fp)	# fill _tmp555 to $t3 from $fp-92
	  lw $t4, -128($fp)	# fill _tmp564 to $t4 from $fp-128
	  add $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp565 from $t5 to $fp-132
	# _tmp566 = *(_tmp565)
	  lw $t3, -132($fp)	# fill _tmp565 to $t3 from $fp-132
	  lw $t4, 0($t3) 	# load with offset
	# _tmp567 = *(_tmp566)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp568 = *(_tmp567 + 12)
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -88($fp)	# fill _tmp554 to $t7 from $fp-88
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -136($fp)	# spill _tmp566 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp567 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp568 from $t6 to $fp-144
	# PushParam _tmp566
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -136($fp)	# fill _tmp566 to $t3 from $fp-136
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp568
	  lw $t3, -144($fp)	# fill _tmp568 to $t3 from $fp-144
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
  _L70:
	# _tmp569 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -148($fp)	# spill _tmp569 from $t3 to $fp-148
	# _tmp570 = i + _tmp569
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -148($fp)	# fill _tmp569 to $t4 from $fp-148
	  add $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp570 from $t5 to $fp-152
	# i = _tmp570
	  lw $t3, -152($fp)	# fill _tmp570 to $t3 from $fp-152
	# Goto _L67
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L67		# unconditional branch
  _L68:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.ResolveAllPlayers:
	# BeginFunc 164
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 164	# decrement sp to make space for locals/temps
	# _tmp571 = "\nTime to resolve bets.\n"
	  .data			# create string constant marked with label
	  _string58: .asciiz "\nTime to resolve bets.\n"
	  .text
	  la $t3, _string58	# load label
	  sw $t3, -12($fp)	# spill _tmp571 from $t3 to $fp-12
	# PushParam _tmp571
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp571 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp572 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -16($fp)	# spill _tmp572 from $t3 to $fp-16
	# i = _tmp572
	  lw $t3, -16($fp)	# fill _tmp572 to $t3 from $fp-16
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L72:
	# _tmp573 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp574 = *(_tmp573 + -4)
	  lw $t5, -4($t4) 	# load with offset
	# _tmp575 = i < _tmp574
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  slt $t7, $t6, $t5	
	  sw $t4, -20($fp)	# spill _tmp573 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp574 from $t5 to $fp-24
	  sw $t7, -28($fp)	# spill _tmp575 from $t7 to $fp-28
	# IfZ _tmp575 Goto _L73
	  lw $t3, -28($fp)	# fill _tmp575 to $t3 from $fp-28
	  beqz $t3, _L73	# branch if _tmp575 is zero 
	# _tmp576 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp577 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -36($fp)	# spill _tmp577 from $t6 to $fp-36
	# _tmp578 = i < _tmp577
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -36($fp)	# fill _tmp577 to $t7 from $fp-36
	  slt $t8, $t6, $t7	
	  sw $t3, -28($fp)	# spill _tmp575 from $t3 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp576 from $t5 to $fp-32
	  sw $t8, -40($fp)	# spill _tmp578 from $t8 to $fp-40
	# _tmp579 = *(_tmp576 + -4)
	  lw $t3, -32($fp)	# fill _tmp576 to $t3 from $fp-32
	  lw $t4, -4($t3) 	# load with offset
	# _tmp580 = i < _tmp579
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -44($fp)	# spill _tmp579 from $t4 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp580 from $t6 to $fp-48
	# _tmp581 = _tmp580 == _tmp577
	  lw $t3, -48($fp)	# fill _tmp580 to $t3 from $fp-48
	  lw $t4, -36($fp)	# fill _tmp577 to $t4 from $fp-36
	  seq $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp581 from $t5 to $fp-52
	# _tmp582 = _tmp578 || _tmp581
	  lw $t3, -40($fp)	# fill _tmp578 to $t3 from $fp-40
	  lw $t4, -52($fp)	# fill _tmp581 to $t4 from $fp-52
	  or $t5, $t3, $t4	
	  sw $t5, -56($fp)	# spill _tmp582 from $t5 to $fp-56
	# IfZ _tmp582 Goto _L74
	  lw $t3, -56($fp)	# fill _tmp582 to $t3 from $fp-56
	  beqz $t3, _L74	# branch if _tmp582 is zero 
	# _tmp583 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string59: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string59	# load label
	  sw $t4, -60($fp)	# spill _tmp583 from $t4 to $fp-60
	# PushParam _tmp583
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -60($fp)	# fill _tmp583 to $t4 from $fp-60
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -56($fp)	# spill _tmp582 from $t3 to $fp-56
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L74:
	# _tmp584 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -64($fp)	# spill _tmp584 from $t3 to $fp-64
	# _tmp585 = _tmp584 * i
	  lw $t3, -64($fp)	# fill _tmp584 to $t3 from $fp-64
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp585 from $t5 to $fp-68
	# _tmp586 = _tmp576 + _tmp585
	  lw $t3, -32($fp)	# fill _tmp576 to $t3 from $fp-32
	  lw $t4, -68($fp)	# fill _tmp585 to $t4 from $fp-68
	  add $t5, $t3, $t4	
	  sw $t5, -72($fp)	# spill _tmp586 from $t5 to $fp-72
	# _tmp587 = *(_tmp586)
	  lw $t3, -72($fp)	# fill _tmp586 to $t3 from $fp-72
	  lw $t4, 0($t3) 	# load with offset
	# _tmp588 = *(_tmp587)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp589 = *(_tmp588 + 16)
	  lw $t6, 16($t5) 	# load with offset
	# PushParam _tmp587
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -76($fp)	# spill _tmp587 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp588 from $t5 to $fp-80
	  sw $t6, -84($fp)	# spill _tmp589 from $t6 to $fp-84
	# _tmp590 = ACall _tmp589
	  lw $t3, -84($fp)	# fill _tmp589 to $t3 from $fp-84
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp590 from $t3 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp590 Goto _L75
	  lw $t3, -88($fp)	# fill _tmp590 to $t3 from $fp-88
	  beqz $t3, _L75	# branch if _tmp590 is zero 
	# _tmp591 = *(this + 8)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 8($t4) 	# load with offset
	# _tmp592 = *(_tmp591)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp593 = *(_tmp592 + 28)
	  lw $t7, 28($t6) 	# load with offset
	# PushParam _tmp591
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -88($fp)	# spill _tmp590 from $t3 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp591 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp592 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp593 from $t7 to $fp-100
	# _tmp594 = ACall _tmp593
	  lw $t3, -100($fp)	# fill _tmp593 to $t3 from $fp-100
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -104($fp)	# spill _tmp594 from $t3 to $fp-104
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp595 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp596 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -112($fp)	# spill _tmp596 from $t5 to $fp-112
	# _tmp597 = i < _tmp596
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  lw $t6, -112($fp)	# fill _tmp596 to $t6 from $fp-112
	  slt $t7, $t5, $t6	
	  sw $t4, -108($fp)	# spill _tmp595 from $t4 to $fp-108
	  sw $t7, -116($fp)	# spill _tmp597 from $t7 to $fp-116
	# _tmp598 = *(_tmp595 + -4)
	  lw $t3, -108($fp)	# fill _tmp595 to $t3 from $fp-108
	  lw $t4, -4($t3) 	# load with offset
	# _tmp599 = i < _tmp598
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -120($fp)	# spill _tmp598 from $t4 to $fp-120
	  sw $t6, -124($fp)	# spill _tmp599 from $t6 to $fp-124
	# _tmp600 = _tmp599 == _tmp596
	  lw $t3, -124($fp)	# fill _tmp599 to $t3 from $fp-124
	  lw $t4, -112($fp)	# fill _tmp596 to $t4 from $fp-112
	  seq $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp600 from $t5 to $fp-128
	# _tmp601 = _tmp597 || _tmp600
	  lw $t3, -116($fp)	# fill _tmp597 to $t3 from $fp-116
	  lw $t4, -128($fp)	# fill _tmp600 to $t4 from $fp-128
	  or $t5, $t3, $t4	
	  sw $t5, -132($fp)	# spill _tmp601 from $t5 to $fp-132
	# IfZ _tmp601 Goto _L76
	  lw $t3, -132($fp)	# fill _tmp601 to $t3 from $fp-132
	  beqz $t3, _L76	# branch if _tmp601 is zero 
	# _tmp602 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string60: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string60	# load label
	  sw $t4, -136($fp)	# spill _tmp602 from $t4 to $fp-136
	# PushParam _tmp602
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -136($fp)	# fill _tmp602 to $t4 from $fp-136
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -132($fp)	# spill _tmp601 from $t3 to $fp-132
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L76:
	# _tmp603 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -140($fp)	# spill _tmp603 from $t3 to $fp-140
	# _tmp604 = _tmp603 * i
	  lw $t3, -140($fp)	# fill _tmp603 to $t3 from $fp-140
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -144($fp)	# spill _tmp604 from $t5 to $fp-144
	# _tmp605 = _tmp595 + _tmp604
	  lw $t3, -108($fp)	# fill _tmp595 to $t3 from $fp-108
	  lw $t4, -144($fp)	# fill _tmp604 to $t4 from $fp-144
	  add $t5, $t3, $t4	
	  sw $t5, -148($fp)	# spill _tmp605 from $t5 to $fp-148
	# _tmp606 = *(_tmp605)
	  lw $t3, -148($fp)	# fill _tmp605 to $t3 from $fp-148
	  lw $t4, 0($t3) 	# load with offset
	# _tmp607 = *(_tmp606)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp608 = *(_tmp607 + 32)
	  lw $t6, 32($t5) 	# load with offset
	# PushParam _tmp594
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -104($fp)	# fill _tmp594 to $t7 from $fp-104
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -152($fp)	# spill _tmp606 from $t4 to $fp-152
	  sw $t5, -156($fp)	# spill _tmp607 from $t5 to $fp-156
	  sw $t6, -160($fp)	# spill _tmp608 from $t6 to $fp-160
	# PushParam _tmp606
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -152($fp)	# fill _tmp606 to $t3 from $fp-152
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp608
	  lw $t3, -160($fp)	# fill _tmp608 to $t3 from $fp-160
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
  _L75:
	# _tmp609 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -164($fp)	# spill _tmp609 from $t3 to $fp-164
	# _tmp610 = i + _tmp609
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -164($fp)	# fill _tmp609 to $t4 from $fp-164
	  add $t5, $t3, $t4	
	  sw $t5, -168($fp)	# spill _tmp610 from $t5 to $fp-168
	# i = _tmp610
	  lw $t3, -168($fp)	# fill _tmp610 to $t3 from $fp-168
	# Goto _L72
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L72		# unconditional branch
  _L73:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.PrintAllMoney:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp611 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -12($fp)	# spill _tmp611 from $t3 to $fp-12
	# i = _tmp611
	  lw $t3, -12($fp)	# fill _tmp611 to $t3 from $fp-12
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
  _L77:
	# _tmp612 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp613 = *(_tmp612 + -4)
	  lw $t5, -4($t4) 	# load with offset
	# _tmp614 = i < _tmp613
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  slt $t7, $t6, $t5	
	  sw $t4, -16($fp)	# spill _tmp612 from $t4 to $fp-16
	  sw $t5, -20($fp)	# spill _tmp613 from $t5 to $fp-20
	  sw $t7, -24($fp)	# spill _tmp614 from $t7 to $fp-24
	# IfZ _tmp614 Goto _L78
	  lw $t3, -24($fp)	# fill _tmp614 to $t3 from $fp-24
	  beqz $t3, _L78	# branch if _tmp614 is zero 
	# _tmp615 = *(this + 4)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 4($t4) 	# load with offset
	# _tmp616 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -32($fp)	# spill _tmp616 from $t6 to $fp-32
	# _tmp617 = i < _tmp616
	  lw $t6, -8($fp)	# fill i to $t6 from $fp-8
	  lw $t7, -32($fp)	# fill _tmp616 to $t7 from $fp-32
	  slt $t8, $t6, $t7	
	  sw $t3, -24($fp)	# spill _tmp614 from $t3 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp615 from $t5 to $fp-28
	  sw $t8, -36($fp)	# spill _tmp617 from $t8 to $fp-36
	# _tmp618 = *(_tmp615 + -4)
	  lw $t3, -28($fp)	# fill _tmp615 to $t3 from $fp-28
	  lw $t4, -4($t3) 	# load with offset
	# _tmp619 = i < _tmp618
	  lw $t5, -8($fp)	# fill i to $t5 from $fp-8
	  slt $t6, $t5, $t4	
	  sw $t4, -40($fp)	# spill _tmp618 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp619 from $t6 to $fp-44
	# _tmp620 = _tmp619 == _tmp616
	  lw $t3, -44($fp)	# fill _tmp619 to $t3 from $fp-44
	  lw $t4, -32($fp)	# fill _tmp616 to $t4 from $fp-32
	  seq $t5, $t3, $t4	
	  sw $t5, -48($fp)	# spill _tmp620 from $t5 to $fp-48
	# _tmp621 = _tmp617 || _tmp620
	  lw $t3, -36($fp)	# fill _tmp617 to $t3 from $fp-36
	  lw $t4, -48($fp)	# fill _tmp620 to $t4 from $fp-48
	  or $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp621 from $t5 to $fp-52
	# IfZ _tmp621 Goto _L79
	  lw $t3, -52($fp)	# fill _tmp621 to $t3 from $fp-52
	  beqz $t3, _L79	# branch if _tmp621 is zero 
	# _tmp622 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string61: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t4, _string61	# load label
	  sw $t4, -56($fp)	# spill _tmp622 from $t4 to $fp-56
	# PushParam _tmp622
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -56($fp)	# fill _tmp622 to $t4 from $fp-56
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp621 from $t3 to $fp-52
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L79:
	# _tmp623 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -60($fp)	# spill _tmp623 from $t3 to $fp-60
	# _tmp624 = _tmp623 * i
	  lw $t3, -60($fp)	# fill _tmp623 to $t3 from $fp-60
	  lw $t4, -8($fp)	# fill i to $t4 from $fp-8
	  mul $t5, $t3, $t4	
	  sw $t5, -64($fp)	# spill _tmp624 from $t5 to $fp-64
	# _tmp625 = _tmp615 + _tmp624
	  lw $t3, -28($fp)	# fill _tmp615 to $t3 from $fp-28
	  lw $t4, -64($fp)	# fill _tmp624 to $t4 from $fp-64
	  add $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp625 from $t5 to $fp-68
	# _tmp626 = *(_tmp625)
	  lw $t3, -68($fp)	# fill _tmp625 to $t3 from $fp-68
	  lw $t4, 0($t3) 	# load with offset
	# _tmp627 = *(_tmp626)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp628 = *(_tmp627 + 20)
	  lw $t6, 20($t5) 	# load with offset
	# PushParam _tmp626
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -72($fp)	# spill _tmp626 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp627 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp628 from $t6 to $fp-80
	# ACall _tmp628
	  lw $t3, -80($fp)	# fill _tmp628 to $t3 from $fp-80
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp629 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -84($fp)	# spill _tmp629 from $t3 to $fp-84
	# _tmp630 = i + _tmp629
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  lw $t4, -84($fp)	# fill _tmp629 to $t4 from $fp-84
	  add $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp630 from $t5 to $fp-88
	# i = _tmp630
	  lw $t3, -88($fp)	# fill _tmp630 to $t3 from $fp-88
	# Goto _L77
	  sw $t3, -8($fp)	# spill i from $t3 to $fp-8
	  b _L77		# unconditional branch
  _L78:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.PlayOneGame:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp631 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# _tmp632 = *(_tmp631)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp633 = *(_tmp632 + 12)
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp631
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill _tmp631 from $t4 to $fp-8
	  sw $t5, -12($fp)	# spill _tmp632 from $t5 to $fp-12
	  sw $t6, -16($fp)	# spill _tmp633 from $t6 to $fp-16
	# _tmp634 = ACall _tmp633
	  lw $t3, -16($fp)	# fill _tmp633 to $t3 from $fp-16
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp634 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp635 = 26
	  li $t3, 26		# load constant value 26 into $t3
	  sw $t3, -24($fp)	# spill _tmp635 from $t3 to $fp-24
	# _tmp636 = _tmp634 < _tmp635
	  lw $t3, -20($fp)	# fill _tmp634 to $t3 from $fp-20
	  lw $t4, -24($fp)	# fill _tmp635 to $t4 from $fp-24
	  slt $t5, $t3, $t4	
	  sw $t5, -28($fp)	# spill _tmp636 from $t5 to $fp-28
	# IfZ _tmp636 Goto _L80
	  lw $t3, -28($fp)	# fill _tmp636 to $t3 from $fp-28
	  beqz $t3, _L80	# branch if _tmp636 is zero 
	# _tmp637 = *(this + 12)
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t5, 12($t4) 	# load with offset
	# _tmp638 = *(_tmp637)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp639 = *(_tmp638 + 8)
	  lw $t7, 8($t6) 	# load with offset
	# PushParam _tmp637
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	  sw $t3, -28($fp)	# spill _tmp636 from $t3 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp637 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp638 from $t6 to $fp-36
	  sw $t7, -40($fp)	# spill _tmp639 from $t7 to $fp-40
	# ACall _tmp639
	  lw $t3, -40($fp)	# fill _tmp639 to $t3 from $fp-40
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L80:
	# _tmp640 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp641 = *(_tmp640 + 8)
	  lw $t5, 8($t4) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -44($fp)	# spill _tmp640 from $t4 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp641 from $t5 to $fp-48
	# ACall _tmp641
	  lw $t3, -48($fp)	# fill _tmp641 to $t3 from $fp-48
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp642 = "\nDealer starts. "
	  .data			# create string constant marked with label
	  _string62: .asciiz "\nDealer starts. "
	  .text
	  la $t3, _string62	# load label
	  sw $t3, -52($fp)	# spill _tmp642 from $t3 to $fp-52
	# PushParam _tmp642
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -52($fp)	# fill _tmp642 to $t3 from $fp-52
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp643 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -56($fp)	# spill _tmp643 from $t3 to $fp-56
	# _tmp644 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# _tmp645 = *(_tmp644)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp646 = *(_tmp645)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam _tmp643
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -56($fp)	# fill _tmp643 to $t7 from $fp-56
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -60($fp)	# spill _tmp644 from $t4 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp645 from $t5 to $fp-64
	  sw $t6, -68($fp)	# spill _tmp646 from $t6 to $fp-68
	# PushParam _tmp644
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -60($fp)	# fill _tmp644 to $t3 from $fp-60
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp646
	  lw $t3, -68($fp)	# fill _tmp646 to $t3 from $fp-68
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp647 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# _tmp648 = *(this + 8)
	  lw $t5, 8($t3) 	# load with offset
	# _tmp649 = *(_tmp648)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp650 = *(_tmp649 + 4)
	  lw $t7, 4($t6) 	# load with offset
	# PushParam _tmp647
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -72($fp)	# spill _tmp647 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp648 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp649 from $t6 to $fp-80
	  sw $t7, -84($fp)	# spill _tmp650 from $t7 to $fp-84
	# PushParam _tmp648
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -76($fp)	# fill _tmp648 to $t3 from $fp-76
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp650
	  lw $t3, -84($fp)	# fill _tmp650 to $t3 from $fp-84
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp651 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp652 = *(_tmp651 + 12)
	  lw $t5, 12($t4) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -88($fp)	# spill _tmp651 from $t4 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp652 from $t5 to $fp-92
	# ACall _tmp652
	  lw $t3, -92($fp)	# fill _tmp652 to $t3 from $fp-92
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp653 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# _tmp654 = *(this + 8)
	  lw $t5, 8($t3) 	# load with offset
	# _tmp655 = *(_tmp654)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp656 = *(_tmp655 + 12)
	  lw $t7, 12($t6) 	# load with offset
	# PushParam _tmp653
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -96($fp)	# spill _tmp653 from $t4 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp654 from $t5 to $fp-100
	  sw $t6, -104($fp)	# spill _tmp655 from $t6 to $fp-104
	  sw $t7, -108($fp)	# spill _tmp656 from $t7 to $fp-108
	# PushParam _tmp654
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -100($fp)	# fill _tmp654 to $t3 from $fp-100
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp656
	  lw $t3, -108($fp)	# fill _tmp656 to $t3 from $fp-108
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp657 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp658 = *(_tmp657 + 16)
	  lw $t5, 16($t4) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -112($fp)	# spill _tmp657 from $t4 to $fp-112
	  sw $t5, -116($fp)	# spill _tmp658 from $t5 to $fp-116
	# ACall _tmp658
	  lw $t3, -116($fp)	# fill _tmp658 to $t3 from $fp-116
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class House
	  .data
	  .align 2
	  House:		# label for class House vtable
	  .word _House.SetupGame
	  .word _House.SetupPlayers
	  .word _House.TakeAllBets
	  .word _House.TakeAllTurns
	  .word _House.ResolveAllPlayers
	  .word _House.PrintAllMoney
	  .word _House.PlayOneGame
	  .text
  _GetYesOrNo:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# PushParam prompt
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill prompt to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp659 = " (y/n) "
	  .data			# create string constant marked with label
	  _string63: .asciiz " (y/n) "
	  .text
	  la $t3, _string63	# load label
	  sw $t3, -12($fp)	# spill _tmp659 from $t3 to $fp-12
	# PushParam _tmp659
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp659 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp660 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp660 from $t3 to $fp-16
	# answer = _tmp660
	  lw $t3, -16($fp)	# fill _tmp660 to $t3 from $fp-16
	# _tmp661 = "y"
	  .data			# create string constant marked with label
	  _string64: .asciiz "y"
	  .text
	  la $t4, _string64	# load label
	  sw $t4, -20($fp)	# spill _tmp661 from $t4 to $fp-20
	# PushParam _tmp661
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -20($fp)	# fill _tmp661 to $t4 from $fp-20
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill answer from $t3 to $fp-8
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill answer to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp662 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -24($fp)	# spill _tmp662 from $t3 to $fp-24
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp663 = "Y"
	  .data			# create string constant marked with label
	  _string65: .asciiz "Y"
	  .text
	  la $t3, _string65	# load label
	  sw $t3, -28($fp)	# spill _tmp663 from $t3 to $fp-28
	# PushParam _tmp663
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -28($fp)	# fill _tmp663 to $t3 from $fp-28
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill answer to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp664 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -32($fp)	# spill _tmp664 from $t3 to $fp-32
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp665 = _tmp662 || _tmp664
	  lw $t3, -24($fp)	# fill _tmp662 to $t3 from $fp-24
	  lw $t4, -32($fp)	# fill _tmp664 to $t4 from $fp-32
	  or $t5, $t3, $t4	
	  sw $t5, -36($fp)	# spill _tmp665 from $t5 to $fp-36
	# Return _tmp665
	  lw $t3, -36($fp)	# fill _tmp665 to $t3 from $fp-36
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
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp666 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -16($fp)	# spill _tmp666 from $t3 to $fp-16
	# keepPlaying = _tmp666
	  lw $t3, -16($fp)	# fill _tmp666 to $t3 from $fp-16
	# _tmp667 = 16
	  li $t4, 16		# load constant value 16 into $t4
	  sw $t4, -20($fp)	# spill _tmp667 from $t4 to $fp-20
	# PushParam _tmp667
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -20($fp)	# fill _tmp667 to $t4 from $fp-20
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill keepPlaying from $t3 to $fp-8
	# _tmp668 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -24($fp)	# spill _tmp668 from $t3 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp669 = House
	  la $t3, House	# load label
	  sw $t3, -28($fp)	# spill _tmp669 from $t3 to $fp-28
	# *(_tmp668) = _tmp669
	  lw $t3, -28($fp)	# fill _tmp669 to $t3 from $fp-28
	  lw $t4, -24($fp)	# fill _tmp668 to $t4 from $fp-24
	  sw $t3, 0($t4) 	# store with offset
	# house = _tmp668
	  sw $t4, -24($fp)	# spill _tmp668 from $t4 to $fp-24
	# _tmp670 = *(house)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp671 = *(_tmp670)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill house from $t4 to $fp-12
	  sw $t5, -32($fp)	# spill _tmp670 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp671 from $t6 to $fp-36
	# ACall _tmp671
	  lw $t3, -36($fp)	# fill _tmp671 to $t3 from $fp-36
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp672 = *(house)
	  lw $t3, -12($fp)	# fill house to $t3 from $fp-12
	  lw $t4, 0($t3) 	# load with offset
	# _tmp673 = *(_tmp672 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -40($fp)	# spill _tmp672 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp673 from $t5 to $fp-44
	# ACall _tmp673
	  lw $t3, -44($fp)	# fill _tmp673 to $t3 from $fp-44
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L81:
	# IfZ keepPlaying Goto _L82
	  lw $t3, -8($fp)	# fill keepPlaying to $t3 from $fp-8
	  beqz $t3, _L82	# branch if keepPlaying is zero 
	# _tmp674 = *(house)
	  lw $t4, -12($fp)	# fill house to $t4 from $fp-12
	  lw $t5, 0($t4) 	# load with offset
	# _tmp675 = *(_tmp674 + 24)
	  lw $t6, 24($t5) 	# load with offset
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill keepPlaying from $t3 to $fp-8
	  sw $t5, -48($fp)	# spill _tmp674 from $t5 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp675 from $t6 to $fp-52
	# ACall _tmp675
	  lw $t3, -52($fp)	# fill _tmp675 to $t3 from $fp-52
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp676 = "\nDo you want to play another hand?"
	  .data			# create string constant marked with label
	  _string66: .asciiz "\nDo you want to play another hand?"
	  .text
	  la $t3, _string66	# load label
	  sw $t3, -56($fp)	# spill _tmp676 from $t3 to $fp-56
	# PushParam _tmp676
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -56($fp)	# fill _tmp676 to $t3 from $fp-56
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp677 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp677 from $t3 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# keepPlaying = _tmp677
	  lw $t3, -60($fp)	# fill _tmp677 to $t3 from $fp-60
	# Goto _L81
	  sw $t3, -8($fp)	# spill keepPlaying from $t3 to $fp-8
	  b _L81		# unconditional branch
  _L82:
	# _tmp678 = *(house)
	  lw $t3, -12($fp)	# fill house to $t3 from $fp-12
	  lw $t4, 0($t3) 	# load with offset
	# _tmp679 = *(_tmp678 + 20)
	  lw $t5, 20($t4) 	# load with offset
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -64($fp)	# spill _tmp678 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp679 from $t5 to $fp-68
	# ACall _tmp679
	  lw $t3, -68($fp)	# fill _tmp679 to $t3 from $fp-68
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp680 = "Thank you for playing...come again soon.\n"
	  .data			# create string constant marked with label
	  _string67: .asciiz "Thank you for playing...come again soon.\n"
	  .text
	  la $t3, _string67	# load label
	  sw $t3, -72($fp)	# spill _tmp680 from $t3 to $fp-72
	# PushParam _tmp680
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -72($fp)	# fill _tmp680 to $t3 from $fp-72
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp681 = "\nCS143 BlackJack Copyright (c) 1999 by Peter Mor..."
	  .data			# create string constant marked with label
	  _string68: .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .text
	  la $t3, _string68	# load label
	  sw $t3, -76($fp)	# spill _tmp681 from $t3 to $fp-76
	# PushParam _tmp681
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -76($fp)	# fill _tmp681 to $t3 from $fp-76
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp682 = "(2001 mods by jdz)\n"
	  .data			# create string constant marked with label
	  _string69: .asciiz "(2001 mods by jdz)\n"
	  .text
	  la $t3, _string69	# load label
	  sw $t3, -80($fp)	# spill _tmp682 from $t3 to $fp-80
	# PushParam _tmp682
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -80($fp)	# fill _tmp682 to $t3 from $fp-80
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
