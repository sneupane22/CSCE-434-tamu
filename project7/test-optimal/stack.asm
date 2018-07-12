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
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp7 = _tmp5 * _tmp6
	  mul $t3, $t2, $t0	
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	  sw $t0, -32($fp)	# spill _tmp6 from $t0 to $fp-32
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  sw $t1, 0($t0) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	  lw $t1, -32($fp)	# fill _tmp6 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	# *(this + 8) = _tmp9
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t2, 8($t0) 	# store with offset
	# _tmp10 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# *(this + 4) = _tmp10
	  sw $t1, 4($t0) 	# store with offset
	# _tmp11 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# _tmp12 = *(this)
	  lw $t2, 0($t0) 	# load with offset
	# _tmp13 = *(_tmp12 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp13
	  sw $t3, -60($fp)	# spill _tmp13 from $t3 to $fp-60
	  jalr $t3            	# jump to function
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
	  seq $t5, $t6, $t3	
	# _tmp21 = _tmp17 || _tmp20
	  or $t3, $t4, $t5	
	# IfZ _tmp21 Goto _L1
	  sw $t1, -8($fp)	# spill _tmp14 from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp15 from $t2 to $fp-12
	  sw $t3, -36($fp)	# spill _tmp21 from $t3 to $fp-36
	  beqz $t3, _L1	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# *(_tmp25) = i
	  lw $t0, 8($fp)	# fill i to $t0 from $fp+8
	  sw $t0, 0($t1) 	# store with offset
	# _tmp26 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp27 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp28 = _tmp26 + _tmp27
	  add $t3, $t1, $t2	
	# *(this + 4) = _tmp28
	  sw $t3, 4($t0) 	# store with offset
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
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp34 = _tmp32 < _tmp33
	  slt $t3, $t4, $t2	
	# _tmp35 = *(_tmp29 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp36 = _tmp32 < _tmp35
	  slt $t6, $t4, $t5	
	# _tmp37 = _tmp36 == _tmp33
	  seq $t5, $t6, $t2	
	# _tmp38 = _tmp34 || _tmp37
	  or $t2, $t3, $t5	
	# IfZ _tmp38 Goto _L2
	  sw $t1, -12($fp)	# spill _tmp29 from $t1 to $fp-12
	  sw $t2, -48($fp)	# spill _tmp38 from $t2 to $fp-48
	  sw $t4, -24($fp)	# spill _tmp32 from $t4 to $fp-24
	  beqz $t2, _L2	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
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
	  lw $t0, -12($fp)	# fill _tmp29 to $t0 from $fp-12
	  add $t1, $t0, $t2	
	# _tmp43 = *(_tmp42)
	  lw $t0, 0($t1) 	# load with offset
	# val = _tmp43
	  move $t1, $t0		# copy value to register for val
	# _tmp44 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	# _tmp45 = 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp46 = _tmp44 - _tmp45
	  sub $t4, $t2, $t3	
	# *(this + 4) = _tmp46
	  sw $t4, 4($t0) 	# store with offset
	# Return val
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
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp50 = Stack
	  la $t1, Stack	# load label
	# *(_tmp49) = _tmp50
	  sw $t1, 0($t0) 	# store with offset
	# s = _tmp49
	  move $t1, $t0		# copy value to register for s
	# _tmp51 = *(s)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp52 = *(_tmp51)
	  lw $t2, 0($t0) 	# load with offset
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  sw $t1, -8($fp)	# spill s from $t1 to $fp-8
	  sw $t2, -28($fp)	# spill _tmp52 from $t2 to $fp-28
	  jalr $t2            	# jump to function
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
	  sw $t2, -72($fp)	# spill _tmp63 from $t2 to $fp-72
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
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
	  sw $t2, -88($fp)	# spill _tmp67 from $t2 to $fp-88
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
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
	  sw $t2, -104($fp)	# spill _tmp71 from $t2 to $fp-104
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
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
	  sw $t2, -120($fp)	# spill _tmp75 from $t2 to $fp-120
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
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
	  sw $t2, -136($fp)	# spill _tmp79 from $t2 to $fp-136
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
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
