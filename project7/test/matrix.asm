	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Matrix.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Set:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Get:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.PrintMatrix:
	# BeginFunc 68
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 68	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp0
	  move $t1, $t0		# copy value to register for i
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L0:
	# _tmp1 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp2 = i < _tmp1
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# IfZ _tmp2 Goto _L1
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	  beqz $t2, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# j = _tmp3
	  move $t1, $t0		# copy value to register for j
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
  _L2:
	# _tmp4 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp5 = j < _tmp4
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# IfZ _tmp5 Goto _L3
	  sw $t2, -36($fp)	# spill _tmp5 from $t2 to $fp-36
	  beqz $t2, _L3	# branch if _tmp5 is zero 
	# _tmp6 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp7 = *(_tmp6 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = ACall _tmp7
	  sw $t2, -44($fp)	# spill _tmp7 from $t2 to $fp-44
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -48($fp)	# spill _tmp8 from $t0 to $fp-48
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\t"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\t"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp11 = j + _tmp10
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# j = _tmp11
	  move $t1, $t2		# copy value to register for j
	# Goto _L2
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
	  b _L2		# unconditional branch
  _L3:
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp14 = i + _tmp13
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp14
	  move $t1, $t2		# copy value to register for i
	# Goto _L0
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L0		# unconditional branch
	  sw $t0, -68($fp)	# spill _tmp13 from $t0 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp14 from $t2 to $fp-72
  _L1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.SeedMatrix:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp15 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp15
	  move $t1, $t0		# copy value to register for i
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L4:
	# _tmp16 = 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp17 = i < _tmp16
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# IfZ _tmp17 Goto _L5
	  sw $t2, -24($fp)	# spill _tmp17 from $t2 to $fp-24
	  beqz $t2, _L5	# branch if _tmp17 is zero 
	# _tmp18 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# j = _tmp18
	  move $t1, $t0		# copy value to register for j
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
  _L6:
	# _tmp19 = 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp20 = j < _tmp19
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# IfZ _tmp20 Goto _L7
	  sw $t2, -36($fp)	# spill _tmp20 from $t2 to $fp-36
	  beqz $t2, _L7	# branch if _tmp20 is zero 
	# _tmp21 = i + j
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t0, $t1	
	# _tmp22 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp23 = *(_tmp22 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp23
	  sw $t5, -48($fp)	# spill _tmp23 from $t5 to $fp-48
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp24 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp25 = j + _tmp24
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# j = _tmp25
	  move $t1, $t2		# copy value to register for j
	# Goto _L6
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
	  b _L6		# unconditional branch
  _L7:
	# _tmp26 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp27 = i + _tmp26
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp27
	  move $t1, $t2		# copy value to register for i
	# Goto _L4
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L4		# unconditional branch
  _L5:
	# _tmp28 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp29 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# _tmp30 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp31 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp32 = *(_tmp31 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp32
	  sw $t5, -84($fp)	# spill _tmp32 from $t5 to $fp-84
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp33 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp34 = 6
	  li $t1, 6		# load constant value 6 into $t1
	# _tmp35 = 2
	  li $t2, 2		# load constant value 2 into $t2
	# _tmp36 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp37 = *(_tmp36 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp37
	  sw $t5, -104($fp)	# spill _tmp37 from $t5 to $fp-104
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp38 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp39 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# _tmp40 = 5
	  li $t2, 5		# load constant value 5 into $t2
	# _tmp41 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp42 = *(_tmp41 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp42
	  sw $t5, -124($fp)	# spill _tmp42 from $t5 to $fp-124
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp43 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp44 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp45 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp46 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp47 = *(_tmp46 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp47
	  sw $t5, -144($fp)	# spill _tmp47 from $t5 to $fp-144
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp48 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp49 = 6
	  li $t1, 6		# load constant value 6 into $t1
	# _tmp50 = 3
	  li $t2, 3		# load constant value 3 into $t2
	# _tmp51 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp52 = *(_tmp51 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp50
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp49
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  sw $t5, -164($fp)	# spill _tmp52 from $t5 to $fp-164
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp53 = 7
	  li $t0, 7		# load constant value 7 into $t0
	# _tmp54 = 7
	  li $t1, 7		# load constant value 7 into $t1
	# _tmp55 = 7
	  li $t2, 7		# load constant value 7 into $t2
	# _tmp56 = *(this)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 0($t3) 	# load with offset
	# _tmp57 = *(_tmp56 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp55
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp57
	  sw $t5, -184($fp)	# spill _tmp57 from $t5 to $fp-184
	  jalr $t5            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Matrix
	  .data
	  .align 2
	  Matrix:		# label for class Matrix vtable
	  .word _Matrix.Init
	  .word _Matrix.Set
	  .word _Matrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _DenseMatrix.Init:
	# BeginFunc 284
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 284	# decrement sp to make space for locals/temps
	# _tmp58 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp59 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp60 = _tmp58 < _tmp59
	  slt $t2, $t0, $t1	
	# IfZ _tmp60 Goto _L8
	  sw $t0, -16($fp)	# spill _tmp58 from $t0 to $fp-16
	  sw $t2, -24($fp)	# spill _tmp60 from $t2 to $fp-24
	  beqz $t2, _L8	# branch if _tmp60 is zero 
	# _tmp61 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp62 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp63 = _tmp62 + _tmp58
	  lw $t1, -16($fp)	# fill _tmp58 to $t1 from $fp-16
	  add $t2, $t0, $t1	
	# _tmp64 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp65 = _tmp63 * _tmp64
	  mul $t3, $t2, $t0	
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp66 = LCall _Alloc
	  sw $t0, -40($fp)	# spill _tmp64 from $t0 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp66) = _tmp58
	  lw $t1, -16($fp)	# fill _tmp58 to $t1 from $fp-16
	  sw $t1, 0($t0) 	# store with offset
	# _tmp67 = _tmp66 + _tmp64
	  lw $t1, -40($fp)	# fill _tmp64 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	# *(this + 4) = _tmp67
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t2, 4($t0) 	# store with offset
	# _tmp68 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp68
	  move $t2, $t1		# copy value to register for i
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L9:
	# _tmp69 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp70 = i < _tmp69
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# IfZ _tmp70 Goto _L10
	  sw $t2, -64($fp)	# spill _tmp70 from $t2 to $fp-64
	  beqz $t2, _L10	# branch if _tmp70 is zero 
	# _tmp71 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp72 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp73 = i < _tmp72
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp74 = *(_tmp71 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp75 = i < _tmp74
	  slt $t6, $t3, $t5	
	# _tmp76 = _tmp75 == _tmp72
	  seq $t5, $t6, $t2	
	# _tmp77 = _tmp73 || _tmp76
	  or $t2, $t4, $t5	
	# IfZ _tmp77 Goto _L11
	  sw $t1, -68($fp)	# spill _tmp71 from $t1 to $fp-68
	  sw $t2, -92($fp)	# spill _tmp77 from $t2 to $fp-92
	  beqz $t2, _L11	# branch if _tmp77 is zero 
	# _tmp78 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp79 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp80 = _tmp79 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp81 = _tmp71 + _tmp80
	  lw $t0, -68($fp)	# fill _tmp71 to $t0 from $fp-68
	  add $t3, $t0, $t2	
	# _tmp82 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp83 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp84 = _tmp82 < _tmp83
	  slt $t4, $t0, $t2	
	# IfZ _tmp84 Goto _L12
	  sw $t0, -112($fp)	# spill _tmp82 from $t0 to $fp-112
	  sw $t3, -108($fp)	# spill _tmp81 from $t3 to $fp-108
	  sw $t4, -120($fp)	# spill _tmp84 from $t4 to $fp-120
	  beqz $t4, _L12	# branch if _tmp84 is zero 
	# _tmp85 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp85
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp86 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp87 = _tmp86 + _tmp82
	  lw $t1, -112($fp)	# fill _tmp82 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	# _tmp88 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp89 = _tmp87 * _tmp88
	  mul $t3, $t2, $t0	
	# PushParam _tmp89
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp90 = LCall _Alloc
	  sw $t0, -136($fp)	# spill _tmp88 from $t0 to $fp-136
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp90) = _tmp82
	  lw $t1, -112($fp)	# fill _tmp82 to $t1 from $fp-112
	  sw $t1, 0($t0) 	# store with offset
	# _tmp91 = _tmp90 + _tmp88
	  lw $t1, -136($fp)	# fill _tmp88 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	# *(_tmp81) = _tmp91
	  lw $t1, -108($fp)	# fill _tmp81 to $t1 from $fp-108
	  sw $t2, 0($t1) 	# store with offset
	# _tmp92 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp93 = i + _tmp92
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  add $t3, $t2, $t1	
	# i = _tmp93
	  move $t2, $t3		# copy value to register for i
	# Goto _L9
	  sw $t0, -144($fp)	# spill _tmp90 from $t0 to $fp-144
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  b _L9		# unconditional branch
  _L10:
	# _tmp94 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp94
	  move $t1, $t0		# copy value to register for i
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L13:
	# _tmp95 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp96 = i < _tmp95
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# IfZ _tmp96 Goto _L14
	  sw $t2, -168($fp)	# spill _tmp96 from $t2 to $fp-168
	  beqz $t2, _L14	# branch if _tmp96 is zero 
	# _tmp97 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# j = _tmp97
	  move $t1, $t0		# copy value to register for j
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
  _L15:
	# _tmp98 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp99 = j < _tmp98
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# IfZ _tmp99 Goto _L16
	  sw $t2, -180($fp)	# spill _tmp99 from $t2 to $fp-180
	  beqz $t2, _L16	# branch if _tmp99 is zero 
	# _tmp100 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp101 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp102 = i < _tmp101
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp103 = *(_tmp100 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp104 = i < _tmp103
	  slt $t6, $t3, $t5	
	# _tmp105 = _tmp104 == _tmp101
	  seq $t5, $t6, $t2	
	# _tmp106 = _tmp102 || _tmp105
	  or $t2, $t4, $t5	
	# IfZ _tmp106 Goto _L17
	  sw $t1, -184($fp)	# spill _tmp100 from $t1 to $fp-184
	  sw $t2, -208($fp)	# spill _tmp106 from $t2 to $fp-208
	  beqz $t2, _L17	# branch if _tmp106 is zero 
	# _tmp107 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp107
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp108 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp109 = _tmp108 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp110 = _tmp100 + _tmp109
	  lw $t0, -184($fp)	# fill _tmp100 to $t0 from $fp-184
	  add $t3, $t0, $t2	
	# _tmp111 = *(_tmp110)
	  lw $t0, 0($t3) 	# load with offset
	# _tmp112 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp113 = j < _tmp112
	  lw $t3, -12($fp)	# fill j to $t3 from $fp-12
	  slt $t4, $t3, $t2	
	# _tmp114 = *(_tmp111 + -4)
	  lw $t5, -4($t0) 	# load with offset
	# _tmp115 = j < _tmp114
	  slt $t6, $t3, $t5	
	# _tmp116 = _tmp115 == _tmp112
	  seq $t5, $t6, $t2	
	# _tmp117 = _tmp113 || _tmp116
	  or $t2, $t4, $t5	
	# IfZ _tmp117 Goto _L18
	  sw $t0, -228($fp)	# spill _tmp111 from $t0 to $fp-228
	  sw $t2, -252($fp)	# spill _tmp117 from $t2 to $fp-252
	  beqz $t2, _L18	# branch if _tmp117 is zero 
	# _tmp118 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp118
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp119 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp120 = _tmp119 * j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp121 = _tmp111 + _tmp120
	  lw $t0, -228($fp)	# fill _tmp111 to $t0 from $fp-228
	  add $t3, $t0, $t2	
	# _tmp122 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# *(_tmp121) = _tmp122
	  sw $t0, 0($t3) 	# store with offset
	# _tmp123 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp124 = j + _tmp123
	  add $t2, $t1, $t0	
	# j = _tmp124
	  move $t1, $t2		# copy value to register for j
	# Goto _L15
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
	  b _L15		# unconditional branch
  _L16:
	# _tmp125 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp126 = i + _tmp125
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp126
	  move $t1, $t2		# copy value to register for i
	# Goto _L13
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L13		# unconditional branch
	  sw $t0, -284($fp)	# spill _tmp125 from $t0 to $fp-284
	  sw $t2, -288($fp)	# spill _tmp126 from $t2 to $fp-288
	  sw $t3, -268($fp)	# spill _tmp121 from $t3 to $fp-268
	  sw $t4, -236($fp)	# spill _tmp113 from $t4 to $fp-236
	  sw $t5, -248($fp)	# spill _tmp116 from $t5 to $fp-248
	  sw $t6, -244($fp)	# spill _tmp115 from $t6 to $fp-244
  _L14:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Set:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp127 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp128 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp129 = x < _tmp128
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp130 = *(_tmp127 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp131 = x < _tmp130
	  slt $t5, $t2, $t4	
	# _tmp132 = _tmp131 == _tmp128
	  seq $t4, $t5, $t0	
	# _tmp133 = _tmp129 || _tmp132
	  or $t0, $t3, $t4	
	# IfZ _tmp133 Goto _L19
	  sw $t0, -32($fp)	# spill _tmp133 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill _tmp127 from $t1 to $fp-8
	  beqz $t0, _L19	# branch if _tmp133 is zero 
	# _tmp134 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp134
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L19:
	# _tmp135 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp136 = _tmp135 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp137 = _tmp127 + _tmp136
	  lw $t0, -8($fp)	# fill _tmp127 to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp138 = *(_tmp137)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp139 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp140 = y < _tmp139
	  lw $t2, 12($fp)	# fill y to $t2 from $fp+12
	  slt $t3, $t2, $t1	
	# _tmp141 = *(_tmp138 + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp142 = y < _tmp141
	  slt $t5, $t2, $t4	
	# _tmp143 = _tmp142 == _tmp139
	  seq $t4, $t5, $t1	
	# _tmp144 = _tmp140 || _tmp143
	  or $t1, $t3, $t4	
	# IfZ _tmp144 Goto _L20
	  sw $t0, -52($fp)	# spill _tmp138 from $t0 to $fp-52
	  sw $t1, -76($fp)	# spill _tmp144 from $t1 to $fp-76
	  beqz $t1, _L20	# branch if _tmp144 is zero 
	# _tmp145 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp145
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp146 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp147 = _tmp146 * y
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  mul $t2, $t0, $t1	
	# _tmp148 = _tmp138 + _tmp147
	  lw $t0, -52($fp)	# fill _tmp138 to $t0 from $fp-52
	  add $t1, $t0, $t2	
	# *(_tmp148) = value
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  sw $t0, 0($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Get:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp149 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp150 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp151 = x < _tmp150
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp152 = *(_tmp149 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp153 = x < _tmp152
	  slt $t5, $t2, $t4	
	# _tmp154 = _tmp153 == _tmp150
	  seq $t4, $t5, $t0	
	# _tmp155 = _tmp151 || _tmp154
	  or $t0, $t3, $t4	
	# IfZ _tmp155 Goto _L21
	  sw $t0, -32($fp)	# spill _tmp155 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill _tmp149 from $t1 to $fp-8
	  beqz $t0, _L21	# branch if _tmp155 is zero 
	# _tmp156 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp157 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp158 = _tmp157 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp159 = _tmp149 + _tmp158
	  lw $t0, -8($fp)	# fill _tmp149 to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp160 = *(_tmp159)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp161 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp162 = y < _tmp161
	  lw $t2, 12($fp)	# fill y to $t2 from $fp+12
	  slt $t3, $t2, $t1	
	# _tmp163 = *(_tmp160 + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp164 = y < _tmp163
	  slt $t5, $t2, $t4	
	# _tmp165 = _tmp164 == _tmp161
	  seq $t4, $t5, $t1	
	# _tmp166 = _tmp162 || _tmp165
	  or $t1, $t3, $t4	
	# IfZ _tmp166 Goto _L22
	  sw $t0, -52($fp)	# spill _tmp160 from $t0 to $fp-52
	  sw $t1, -76($fp)	# spill _tmp166 from $t1 to $fp-76
	  beqz $t1, _L22	# branch if _tmp166 is zero 
	# _tmp167 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp167
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp168 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp169 = _tmp168 * y
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  mul $t2, $t0, $t1	
	# _tmp170 = _tmp160 + _tmp169
	  lw $t0, -52($fp)	# fill _tmp160 to $t0 from $fp-52
	  add $t1, $t0, $t2	
	# _tmp171 = *(_tmp170)
	  lw $t0, 0($t1) 	# load with offset
	# Return _tmp171
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
	# VTable for class DenseMatrix
	  .data
	  .align 2
	  DenseMatrix:		# label for class DenseMatrix vtable
	  .word _DenseMatrix.Init
	  .word _DenseMatrix.Set
	  .word _DenseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _SparseItem.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = d
	  lw $t0, 8($fp)	# fill d to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = y
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 8($t1) 	# store with offset
	# *(this + 12) = next
	  lw $t0, 16($fp)	# fill next to $t0 from $fp+16
	  sw $t0, 12($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseItem.GetNext:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp172 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# Return _tmp172
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
  _SparseItem.GetY:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp173 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# Return _tmp173
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
  _SparseItem.GetData:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp174 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# Return _tmp174
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
  _SparseItem.SetData:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = val
	  lw $t0, 8($fp)	# fill val to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseItem
	  .data
	  .align 2
	  SparseItem:		# label for class SparseItem vtable
	  .word _SparseItem.Init
	  .word _SparseItem.GetNext
	  .word _SparseItem.GetY
	  .word _SparseItem.GetData
	  .word _SparseItem.SetData
	  .text
  _SparseMatrix.Init:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp175 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp176 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp177 = _tmp175 < _tmp176
	  slt $t2, $t0, $t1	
	# IfZ _tmp177 Goto _L23
	  sw $t0, -12($fp)	# spill _tmp175 from $t0 to $fp-12
	  sw $t2, -20($fp)	# spill _tmp177 from $t2 to $fp-20
	  beqz $t2, _L23	# branch if _tmp177 is zero 
	# _tmp178 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp178
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L23:
	# _tmp179 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp180 = _tmp179 + _tmp175
	  lw $t1, -12($fp)	# fill _tmp175 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	# _tmp181 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp182 = _tmp180 * _tmp181
	  mul $t3, $t2, $t0	
	# PushParam _tmp182
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp183 = LCall _Alloc
	  sw $t0, -36($fp)	# spill _tmp181 from $t0 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp183) = _tmp175
	  lw $t1, -12($fp)	# fill _tmp175 to $t1 from $fp-12
	  sw $t1, 0($t0) 	# store with offset
	# _tmp184 = _tmp183 + _tmp181
	  lw $t1, -36($fp)	# fill _tmp181 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	# *(this + 4) = _tmp184
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t2, 4($t0) 	# store with offset
	# _tmp185 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp185
	  move $t2, $t1		# copy value to register for i
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L24:
	# _tmp186 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp187 = i < _tmp186
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# IfZ _tmp187 Goto _L25
	  sw $t2, -60($fp)	# spill _tmp187 from $t2 to $fp-60
	  beqz $t2, _L25	# branch if _tmp187 is zero 
	# _tmp188 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp189 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp190 = i < _tmp189
	  lw $t3, -8($fp)	# fill i to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp191 = *(_tmp188 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp192 = i < _tmp191
	  slt $t6, $t3, $t5	
	# _tmp193 = _tmp192 == _tmp189
	  seq $t5, $t6, $t2	
	# _tmp194 = _tmp190 || _tmp193
	  or $t2, $t4, $t5	
	# IfZ _tmp194 Goto _L26
	  sw $t1, -64($fp)	# spill _tmp188 from $t1 to $fp-64
	  sw $t2, -88($fp)	# spill _tmp194 from $t2 to $fp-88
	  beqz $t2, _L26	# branch if _tmp194 is zero 
	# _tmp195 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp195
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp196 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp197 = _tmp196 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp198 = _tmp188 + _tmp197
	  lw $t0, -64($fp)	# fill _tmp188 to $t0 from $fp-64
	  add $t3, $t0, $t2	
	# _tmp199 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# *(_tmp198) = _tmp199
	  sw $t0, 0($t3) 	# store with offset
	# _tmp200 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp201 = i + _tmp200
	  add $t2, $t1, $t0	
	# i = _tmp201
	  move $t1, $t2		# copy value to register for i
	# Goto _L24
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L24		# unconditional branch
	  sw $t0, -112($fp)	# spill _tmp200 from $t0 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp201 from $t2 to $fp-116
	  sw $t3, -104($fp)	# spill _tmp198 from $t3 to $fp-104
	  sw $t4, -72($fp)	# spill _tmp190 from $t4 to $fp-72
	  sw $t5, -84($fp)	# spill _tmp193 from $t5 to $fp-84
	  sw $t6, -80($fp)	# spill _tmp192 from $t6 to $fp-80
  _L25:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Find:
	# BeginFunc 100
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 100	# decrement sp to make space for locals/temps
	# _tmp202 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp203 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp204 = x < _tmp203
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp205 = *(_tmp202 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp206 = x < _tmp205
	  slt $t5, $t2, $t4	
	# _tmp207 = _tmp206 == _tmp203
	  seq $t4, $t5, $t0	
	# _tmp208 = _tmp204 || _tmp207
	  or $t0, $t3, $t4	
	# IfZ _tmp208 Goto _L27
	  sw $t0, -36($fp)	# spill _tmp208 from $t0 to $fp-36
	  sw $t1, -12($fp)	# spill _tmp202 from $t1 to $fp-12
	  beqz $t0, _L27	# branch if _tmp208 is zero 
	# _tmp209 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string14	# load label
	# PushParam _tmp209
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L27:
	# _tmp210 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp211 = _tmp210 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp212 = _tmp202 + _tmp211
	  lw $t0, -12($fp)	# fill _tmp202 to $t0 from $fp-12
	  add $t1, $t0, $t2	
	# _tmp213 = *(_tmp212)
	  lw $t0, 0($t1) 	# load with offset
	# elem = _tmp213
	  move $t1, $t0		# copy value to register for elem
	  sw $t1, -8($fp)	# spill elem from $t1 to $fp-8
  _L28:
	# _tmp214 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp215 = elem == _tmp214
	  lw $t1, -8($fp)	# fill elem to $t1 from $fp-8
	  seq $t2, $t1, $t0	
	# _tmp216 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp217 = _tmp215 == _tmp216
	  seq $t3, $t2, $t0	
	# IfZ _tmp217 Goto _L29
	  sw $t3, -72($fp)	# spill _tmp217 from $t3 to $fp-72
	  beqz $t3, _L29	# branch if _tmp217 is zero 
	# _tmp218 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp219 = *(_tmp218 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp220 = ACall _tmp219
	  sw $t2, -80($fp)	# spill _tmp219 from $t2 to $fp-80
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp221 = _tmp220 == y
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  seq $t2, $t0, $t1	
	# IfZ _tmp221 Goto _L30
	  sw $t0, -84($fp)	# spill _tmp220 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp221 from $t2 to $fp-88
	  beqz $t2, _L30	# branch if _tmp221 is zero 
	# Return elem
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L30:
	# _tmp222 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp223 = *(_tmp222 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp224 = ACall _tmp223
	  sw $t2, -96($fp)	# spill _tmp223 from $t2 to $fp-96
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# elem = _tmp224
	  move $t1, $t0		# copy value to register for elem
	# Goto _L28
	  sw $t0, -100($fp)	# spill _tmp224 from $t0 to $fp-100
	  sw $t1, -8($fp)	# spill elem from $t1 to $fp-8
	  b _L28		# unconditional branch
	  sw $t4, -32($fp)	# spill _tmp207 from $t4 to $fp-32
	  sw $t5, -28($fp)	# spill _tmp206 from $t5 to $fp-28
  _L29:
	# _tmp225 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp225
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
  _SparseMatrix.Set:
	# BeginFunc 152
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp226 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp227 = *(_tmp226 + 20)
	  lw $t2, 20($t1) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill x to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp228 = ACall _tmp227
	  sw $t2, -16($fp)	# spill _tmp227 from $t2 to $fp-16
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp228
	  move $t1, $t0		# copy value to register for elem
	# _tmp229 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp230 = elem == _tmp229
	  seq $t2, $t1, $t0	
	# _tmp231 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp232 = _tmp230 == _tmp231
	  seq $t3, $t2, $t0	
	# IfZ _tmp232 Goto _L31
	  sw $t1, -8($fp)	# spill elem from $t1 to $fp-8
	  sw $t3, -36($fp)	# spill _tmp232 from $t3 to $fp-36
	  beqz $t3, _L31	# branch if _tmp232 is zero 
	# _tmp233 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp234 = *(_tmp233 + 16)
	  lw $t2, 16($t1) 	# load with offset
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 16($fp)	# fill value to $t1 from $fp+16
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp234
	  sw $t2, -44($fp)	# spill _tmp234 from $t2 to $fp-44
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L32
	  b _L32		# unconditional branch
  _L31:
	# _tmp235 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp235
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp236 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp237 = SparseItem
	  la $t1, SparseItem	# load label
	# *(_tmp236) = _tmp237
	  sw $t1, 0($t0) 	# store with offset
	# elem = _tmp236
	  move $t1, $t0		# copy value to register for elem
	# _tmp238 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	# _tmp239 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp240 = x < _tmp239
	  lw $t4, 8($fp)	# fill x to $t4 from $fp+8
	  slt $t5, $t4, $t3	
	# _tmp241 = *(_tmp238 + -4)
	  lw $t6, -4($t2) 	# load with offset
	# _tmp242 = x < _tmp241
	  slt $t7, $t4, $t6	
	# _tmp243 = _tmp242 == _tmp239
	  seq $t6, $t7, $t3	
	# _tmp244 = _tmp240 || _tmp243
	  or $t3, $t5, $t6	
	# IfZ _tmp244 Goto _L33
	  sw $t1, -8($fp)	# spill elem from $t1 to $fp-8
	  sw $t2, -60($fp)	# spill _tmp238 from $t2 to $fp-60
	  sw $t3, -84($fp)	# spill _tmp244 from $t3 to $fp-84
	  beqz $t3, _L33	# branch if _tmp244 is zero 
	# _tmp245 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string15	# load label
	# PushParam _tmp245
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L33:
	# _tmp246 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp247 = _tmp246 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp248 = _tmp238 + _tmp247
	  lw $t0, -60($fp)	# fill _tmp238 to $t0 from $fp-60
	  add $t3, $t0, $t2	
	# _tmp249 = *(_tmp248)
	  lw $t0, 0($t3) 	# load with offset
	# _tmp250 = *(elem)
	  lw $t2, -8($fp)	# fill elem to $t2 from $fp-8
	  lw $t3, 0($t2) 	# load with offset
	# _tmp251 = *(_tmp250)
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp249
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp251
	  sw $t4, -112($fp)	# spill _tmp251 from $t4 to $fp-112
	  jalr $t4            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp252 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp253 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp254 = x < _tmp253
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp255 = *(_tmp252 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp256 = x < _tmp255
	  slt $t5, $t2, $t4	
	# _tmp257 = _tmp256 == _tmp253
	  seq $t4, $t5, $t0	
	# _tmp258 = _tmp254 || _tmp257
	  or $t0, $t3, $t4	
	# IfZ _tmp258 Goto _L34
	  sw $t0, -140($fp)	# spill _tmp258 from $t0 to $fp-140
	  sw $t1, -116($fp)	# spill _tmp252 from $t1 to $fp-116
	  beqz $t0, _L34	# branch if _tmp258 is zero 
	# _tmp259 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string16: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string16	# load label
	# PushParam _tmp259
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L34:
	# _tmp260 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp261 = _tmp260 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp262 = _tmp252 + _tmp261
	  lw $t0, -116($fp)	# fill _tmp252 to $t0 from $fp-116
	  add $t1, $t0, $t2	
	# *(_tmp262) = elem
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 0($t1) 	# store with offset
	  sw $t1, -156($fp)	# spill _tmp262 from $t1 to $fp-156
	  sw $t2, -152($fp)	# spill _tmp261 from $t2 to $fp-152
	  sw $t3, -124($fp)	# spill _tmp254 from $t3 to $fp-124
	  sw $t4, -136($fp)	# spill _tmp257 from $t4 to $fp-136
	  sw $t5, -132($fp)	# spill _tmp256 from $t5 to $fp-132
	  sw $t6, -80($fp)	# spill _tmp243 from $t6 to $fp-80
	  sw $t7, -76($fp)	# spill _tmp242 from $t7 to $fp-76
  _L32:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Get:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp263 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp264 = *(_tmp263 + 20)
	  lw $t2, 20($t1) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp265 = ACall _tmp264
	  sw $t2, -16($fp)	# spill _tmp264 from $t2 to $fp-16
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp265
	  move $t1, $t0		# copy value to register for elem
	# _tmp266 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp267 = elem == _tmp266
	  seq $t2, $t1, $t0	
	# _tmp268 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp269 = _tmp267 == _tmp268
	  seq $t3, $t2, $t0	
	# IfZ _tmp269 Goto _L35
	  sw $t1, -8($fp)	# spill elem from $t1 to $fp-8
	  sw $t3, -36($fp)	# spill _tmp269 from $t3 to $fp-36
	  beqz $t3, _L35	# branch if _tmp269 is zero 
	# _tmp270 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp271 = *(_tmp270 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp272 = ACall _tmp271
	  sw $t2, -44($fp)	# spill _tmp271 from $t2 to $fp-44
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp272
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L36
	  sw $t1, -40($fp)	# spill _tmp270 from $t1 to $fp-40
	  b _L36		# unconditional branch
  _L35:
	# _tmp273 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp273
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L36:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseMatrix
	  .data
	  .align 2
	  SparseMatrix:		# label for class SparseMatrix vtable
	  .word _SparseMatrix.Init
	  .word _SparseMatrix.Set
	  .word _SparseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .word _SparseMatrix.Find
	  .text
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp274 = "Dense Rep \n"
	  .data			# create string constant marked with label
	  _string17: .asciiz "Dense Rep \n"
	  .text
	  la $t0, _string17	# load label
	# PushParam _tmp274
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp275 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp275
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp276 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp277 = DenseMatrix
	  la $t1, DenseMatrix	# load label
	# *(_tmp276) = _tmp277
	  sw $t1, 0($t0) 	# store with offset
	# m = _tmp276
	  move $t1, $t0		# copy value to register for m
	# _tmp278 = *(m)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp279 = *(_tmp278)
	  lw $t2, 0($t0) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp279
	  sw $t1, -8($fp)	# spill m from $t1 to $fp-8
	  sw $t2, -32($fp)	# spill _tmp279 from $t2 to $fp-32
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp280 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp281 = *(_tmp280 + 16)
	  lw $t2, 16($t1) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp281
	  sw $t2, -40($fp)	# spill _tmp281 from $t2 to $fp-40
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp282 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp283 = *(_tmp282 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp283
	  sw $t2, -48($fp)	# spill _tmp283 from $t2 to $fp-48
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp284 = "Sparse Rep \n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "Sparse Rep \n"
	  .text
	  la $t0, _string18	# load label
	# PushParam _tmp284
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp285 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp285
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp286 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp287 = SparseMatrix
	  la $t1, SparseMatrix	# load label
	# *(_tmp286) = _tmp287
	  sw $t1, 0($t0) 	# store with offset
	# m = _tmp286
	  move $t1, $t0		# copy value to register for m
	# _tmp288 = *(m)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp289 = *(_tmp288)
	  lw $t2, 0($t0) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp289
	  sw $t1, -8($fp)	# spill m from $t1 to $fp-8
	  sw $t2, -72($fp)	# spill _tmp289 from $t2 to $fp-72
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp291 = *(_tmp290 + 16)
	  lw $t2, 16($t1) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp291
	  sw $t2, -80($fp)	# spill _tmp291 from $t2 to $fp-80
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp292 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp293 = *(_tmp292 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp293
	  sw $t2, -88($fp)	# spill _tmp293 from $t2 to $fp-88
	  jalr $t2            	# jump to function
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
