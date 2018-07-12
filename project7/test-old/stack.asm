	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Stack.Init:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 100
	  li $t0, 100		# load constant value 100 into $t0
	# _tmp1 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp2 = _tmp0 < _tmp1
	  slt $t2, $t0, $t1	
	# IfZ _tmp2 Goto _L0
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t1, -12($fp)	# spill _tmp1 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	  beqz $t2, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -20($fp)	# spill _tmp3 from $t0 to $fp-20
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp5 = _tmp4 + _tmp0
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  add $t2, $t0, $t1	
	# _tmp6 = 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp7 = _tmp5 * _tmp6
	  mul $t4, $t2, $t3	
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  sw $t0, -24($fp)	# spill _tmp4 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp6 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp7 from $t4 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  sw $t1, 0($t0) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $t2, -32($fp)	# fill _tmp6 to $t2 from $fp-32
	  add $t3, $t0, $t2	
	# *(this + 8) = _tmp9
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# _tmp10 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# *(this + 4) = _tmp10
	  sw $t5, 4($t4) 	# store with offset
	# _tmp11 = 3
	  li $t6, 3		# load constant value 3 into $t6
	# _tmp12 = *(this)
	  lw $t9, 0($t4) 	# load with offset
	  sw $t9, -56($fp)	# spill _tmp12 from $t9 to $fp-56
	# _tmp13 = *(_tmp12 + 4)
	  lw $t7, -56($fp)	# fill _tmp12 to $t7 from $fp-56
	  lw $t9, 4($t7) 	# load with offset
	  sw $t9, -60($fp)	# spill _tmp13 from $t9 to $fp-60
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp13
	  lw $t7, -60($fp)	# fill _tmp13 to $t7 from $fp-60
	  sw $t0, -40($fp)	# spill _tmp8 from $t0 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp9 from $t3 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp10 from $t5 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp11 from $t6 to $fp-52
	  jalr $t7            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Push:
	# BeginFunc 60
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 60	# decrement sp to make space for locals/temps
	# _tmp14 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp15 = *(this + 4)
	  lw $t2, 4($t0) 	# load with offset
	# _tmp16 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp17 = _tmp15 < _tmp16
	  slt $t4, $t2, $t3	
	# _tmp18 = *(_tmp14 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp19 = _tmp15 < _tmp18
	  slt $t6, $t2, $t5	
	# _tmp20 = _tmp19 == _tmp16
	  seq $t9, $t6, $t3	
	  sw $t9, -32($fp)	# spill _tmp20 from $t9 to $fp-32
	# _tmp21 = _tmp17 || _tmp20
	  lw $t8, -32($fp)	# fill _tmp20 to $t8 from $fp-32
	  or $t9, $t4, $t8	
	  sw $t9, -36($fp)	# spill _tmp21 from $t9 to $fp-36
	# IfZ _tmp21 Goto _L1
	  lw $t7, -36($fp)	# fill _tmp21 to $t7 from $fp-36
	  sw $t1, -8($fp)	# spill _tmp14 from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp15 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp16 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp17 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp18 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp19 from $t6 to $fp-28
	  beqz $t7, _L1	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -40($fp)	# spill _tmp22 from $t0 to $fp-40
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp23 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp24 = _tmp23 * _tmp15
	  lw $t1, -12($fp)	# fill _tmp15 to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp25 = _tmp14 + _tmp24
	  lw $t3, -8($fp)	# fill _tmp14 to $t3 from $fp-8
	  add $t4, $t3, $t2	
	# *(_tmp25) = i
	  lw $t5, 8($fp)	# fill i to $t5 from $fp+8
	  sw $t5, 0($t4) 	# store with offset
	# _tmp26 = *(this + 4)
	  lw $t6, 4($fp)	# fill this to $t6 from $fp+4
	  lw $t9, 4($t6) 	# load with offset
	  sw $t9, -56($fp)	# spill _tmp26 from $t9 to $fp-56
	# _tmp27 = 1
	  li $t9, 1		# load constant value 1 into $t9
	  sw $t9, -60($fp)	# spill _tmp27 from $t9 to $fp-60
	# _tmp28 = _tmp26 + _tmp27
	  lw $t7, -56($fp)	# fill _tmp26 to $t7 from $fp-56
	  lw $t8, -60($fp)	# fill _tmp27 to $t8 from $fp-60
	  add $t9, $t7, $t8	
	  sw $t9, -64($fp)	# spill _tmp28 from $t9 to $fp-64
	# *(this + 4) = _tmp28
	  lw $t7, -64($fp)	# fill _tmp28 to $t7 from $fp-64
	  sw $t7, 4($t6) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Pop:
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp29 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp30 = *(this + 4)
	  lw $t2, 4($t0) 	# load with offset
	# _tmp31 = 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp32 = _tmp30 - _tmp31
	  sub $t4, $t2, $t3	
	# _tmp33 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp34 = _tmp32 < _tmp33
	  slt $t6, $t4, $t5	
	# _tmp35 = *(_tmp29 + -4)
	  lw $t9, -4($t1) 	# load with offset
	  sw $t9, -36($fp)	# spill _tmp35 from $t9 to $fp-36
	# _tmp36 = _tmp32 < _tmp35
	  lw $t8, -36($fp)	# fill _tmp35 to $t8 from $fp-36
	  slt $t9, $t4, $t8	
	  sw $t9, -40($fp)	# spill _tmp36 from $t9 to $fp-40
	# _tmp37 = _tmp36 == _tmp33
	  lw $t7, -40($fp)	# fill _tmp36 to $t7 from $fp-40
	  seq $t9, $t7, $t5	
	  sw $t9, -44($fp)	# spill _tmp37 from $t9 to $fp-44
	# _tmp38 = _tmp34 || _tmp37
	  lw $t8, -44($fp)	# fill _tmp37 to $t8 from $fp-44
	  or $t9, $t6, $t8	
	  sw $t9, -48($fp)	# spill _tmp38 from $t9 to $fp-48
	# IfZ _tmp38 Goto _L2
	  lw $t7, -48($fp)	# fill _tmp38 to $t7 from $fp-48
	  sw $t1, -12($fp)	# spill _tmp29 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp30 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp31 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp32 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp33 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp34 from $t6 to $fp-32
	  beqz $t7, _L2	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -52($fp)	# spill _tmp39 from $t0 to $fp-52
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp40 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp41 = _tmp40 * _tmp32
	  lw $t1, -24($fp)	# fill _tmp32 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	# _tmp42 = _tmp29 + _tmp41
	  lw $t3, -12($fp)	# fill _tmp29 to $t3 from $fp-12
	  add $t4, $t3, $t2	
	# _tmp43 = *(_tmp42)
	  lw $t5, 0($t4) 	# load with offset
	# val = _tmp43
	  move $t6, $t5		# copy value to register for val
	# _tmp44 = *(this + 4)
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t9, 4($t7) 	# load with offset
	  sw $t9, -72($fp)	# spill _tmp44 from $t9 to $fp-72
	# _tmp45 = 1
	  li $t9, 1		# load constant value 1 into $t9
	  sw $t9, -76($fp)	# spill _tmp45 from $t9 to $fp-76
	# _tmp46 = _tmp44 - _tmp45
	  lw $t7, -72($fp)	# fill _tmp44 to $t7 from $fp-72
	  lw $t8, -76($fp)	# fill _tmp45 to $t8 from $fp-76
	  sub $t9, $t7, $t8	
	  sw $t9, -80($fp)	# spill _tmp46 from $t9 to $fp-80
	# *(this + 4) = _tmp46
	  lw $t7, -80($fp)	# fill _tmp46 to $t7 from $fp-80
	  lw $t9, 4($fp)	# fill this to $t9 from $fp+4
	  sw $t7, 4($t9) 	# store with offset
	# Return val
	  move $v0, $t6		# assign return value into $v0
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
  _Stack.NumElems:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp47 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# Return _tmp47
	  move $v0, $t1		# assign return value into $v0
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
	# VTable for class Stack
	  .data
	  .align 2
	  Stack:		# label for class Stack vtable
	  .word _Stack.Init
	  .word _Stack.Push
	  .word _Stack.Pop
	  .word _Stack.NumElems
	  .text
  main:
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp48 = 12
	  li $t0, 12		# load constant value 12 into $t0
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp49 = LCall _Alloc
	  sw $t0, -12($fp)	# spill _tmp48 from $t0 to $fp-12
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp50 = Stack
	  la $t1, Stack	# load label
	# *(_tmp49) = _tmp50
	  sw $t1, 0($t0) 	# store with offset
	# s = _tmp49
	  move $t2, $t0		# copy value to register for s
	# _tmp51 = *(s)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp52 = *(_tmp51)
	  lw $t4, 0($t3) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  sw $t0, -16($fp)	# spill _tmp49 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp50 from $t1 to $fp-20
	  sw $t2, -8($fp)	# spill s from $t2 to $fp-8
	  sw $t3, -24($fp)	# spill _tmp51 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp52 from $t4 to $fp-28
	  jalr $t4            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = 3
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp54 = *(s)
	  lw $t1, -8($fp)	# fill s to $t1 from $fp-8
	  lw $t2, 0($t1) 	# load with offset
	# _tmp55 = *(_tmp54 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp55
	  sw $t0, -32($fp)	# spill _tmp53 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp54 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp55 from $t3 to $fp-40
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp56 = 7
	  li $t0, 7		# load constant value 7 into $t0
	# _tmp57 = *(s)
	  lw $t1, -8($fp)	# fill s to $t1 from $fp-8
	  lw $t2, 0($t1) 	# load with offset
	# _tmp58 = *(_tmp57 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp58
	  sw $t0, -44($fp)	# spill _tmp56 from $t0 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp57 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp58 from $t3 to $fp-52
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp59 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp60 = *(s)
	  lw $t1, -8($fp)	# fill s to $t1 from $fp-8
	  lw $t2, 0($t1) 	# load with offset
	# _tmp61 = *(_tmp60 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp61
	  sw $t0, -56($fp)	# spill _tmp59 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp60 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp61 from $t3 to $fp-64
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp62 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp63 = *(_tmp62 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp64 = ACall _tmp63
	  sw $t1, -68($fp)	# spill _tmp62 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp63 from $t2 to $fp-72
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -76($fp)	# spill _tmp64 from $t0 to $fp-76
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp65 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -80($fp)	# spill _tmp65 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp66 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp67 = *(_tmp66 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp68 = ACall _tmp67
	  sw $t1, -84($fp)	# spill _tmp66 from $t1 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp67 from $t2 to $fp-88
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -92($fp)	# spill _tmp68 from $t0 to $fp-92
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp69 = " "
	  .data			# create string constant marked with label
	  _string5: .asciiz " "
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -96($fp)	# spill _tmp69 from $t0 to $fp-96
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp71 = *(_tmp70 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp72 = ACall _tmp71
	  sw $t1, -100($fp)	# spill _tmp70 from $t1 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp71 from $t2 to $fp-104
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -108($fp)	# spill _tmp72 from $t0 to $fp-108
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = " "
	  .data			# create string constant marked with label
	  _string6: .asciiz " "
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -112($fp)	# spill _tmp73 from $t0 to $fp-112
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp74 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp75 = *(_tmp74 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp76 = ACall _tmp75
	  sw $t1, -116($fp)	# spill _tmp74 from $t1 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp75 from $t2 to $fp-120
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -124($fp)	# spill _tmp76 from $t0 to $fp-124
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp77 = " "
	  .data			# create string constant marked with label
	  _string7: .asciiz " "
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp77
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -128($fp)	# spill _tmp77 from $t0 to $fp-128
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp78 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp79 = *(_tmp78 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp80 = ACall _tmp79
	  sw $t1, -132($fp)	# spill _tmp78 from $t1 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp79 from $t2 to $fp-136
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -140($fp)	# spill _tmp80 from $t0 to $fp-140
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
