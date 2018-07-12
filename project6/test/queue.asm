	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _QueueItem.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = data
	  lw $t3, 8($fp)	# fill data to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# *(this + 8) = next
	  lw $t5, 12($fp)	# fill next to $t5 from $fp+12
	  sw $t5, 8($t4) 	# store with offset
	# *(next + 12) = this
	  sw $t4, 12($t5) 	# store with offset
	# *(this + 12) = prev
	  lw $t6, 16($fp)	# fill prev to $t6 from $fp+16
	  sw $t6, 12($t4) 	# store with offset
	# *(prev + 8) = this
	  sw $t4, 8($t6) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _QueueItem.GetData:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# Return _tmp0
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -8($fp)	# spill _tmp0 from $t4 to $fp-8
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
  _QueueItem.GetNext:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# Return _tmp1
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -8($fp)	# spill _tmp1 from $t4 to $fp-8
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
  _QueueItem.GetPrev:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp2 = *(this + 12)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# Return _tmp2
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -8($fp)	# spill _tmp2 from $t4 to $fp-8
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
  _QueueItem.SetNext:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = n
	  lw $t3, 8($fp)	# fill n to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _QueueItem.SetPrev:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 12) = p
	  lw $t3, 8($fp)	# fill p to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 12($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class QueueItem
	  .data
	  .align 2
	  QueueItem:		# label for class QueueItem vtable
	  .word _QueueItem.Init
	  .word _QueueItem.GetData
	  .word _QueueItem.GetNext
	  .word _QueueItem.GetPrev
	  .word _QueueItem.SetNext
	  .word _QueueItem.SetPrev
	  .text
  _Queue.Init:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp3 = 16
	  li $t3, 16		# load constant value 16 into $t3
	  sw $t3, -8($fp)	# spill _tmp3 from $t3 to $fp-8
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill _tmp3 to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -12($fp)	# spill _tmp4 from $t3 to $fp-12
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = QueueItem
	  la $t3, QueueItem	# load label
	  sw $t3, -16($fp)	# spill _tmp5 from $t3 to $fp-16
	# *(_tmp4) = _tmp5
	  lw $t3, -16($fp)	# fill _tmp5 to $t3 from $fp-16
	  lw $t4, -12($fp)	# fill _tmp4 to $t4 from $fp-12
	  sw $t3, 0($t4) 	# store with offset
	# *(this + 4) = _tmp4
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  sw $t4, 4($t5) 	# store with offset
	# _tmp6 = 0
	  li $t6, 0		# load constant value 0 into $t6
	  sw $t6, -20($fp)	# spill _tmp6 from $t6 to $fp-20
	# _tmp7 = *(this + 4)
	  lw $t6, 4($t5) 	# load with offset
	# _tmp8 = *(this + 4)
	  lw $t7, 4($t5) 	# load with offset
	# _tmp9 = *(this + 4)
	  lw $t8, 4($t5) 	# load with offset
	# _tmp10 = *(_tmp9)
	  lw $t9, 0($t8) 	# load with offset
	# _tmp11 = *(_tmp10)
	  lw $t0, 0($t9) 	# load with offset
	  sw $t0, -40($fp)	# spill _tmp11 from $t0 to $fp-40
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill _tmp4 from $t4 to $fp-12
	  sw $t5, 4($fp)	# spill this from $t5 to $fp+4
	  sw $t6, -24($fp)	# spill _tmp7 from $t6 to $fp-24
	  sw $t7, -28($fp)	# spill _tmp8 from $t7 to $fp-28
	  sw $t8, -32($fp)	# spill _tmp9 from $t8 to $fp-32
	  sw $t9, -36($fp)	# spill _tmp10 from $t9 to $fp-36
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -24($fp)	# fill _tmp7 to $t3 from $fp-24
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp6 to $t3 from $fp-20
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -32($fp)	# fill _tmp9 to $t3 from $fp-32
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $t3, -40($fp)	# fill _tmp11 to $t3 from $fp-40
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Queue.EnQueue:
	# BeginFunc 44
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 44	# decrement sp to make space for locals/temps
	# _tmp12 = 16
	  li $t3, 16		# load constant value 16 into $t3
	  sw $t3, -12($fp)	# spill _tmp12 from $t3 to $fp-12
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp12 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp13 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp13 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp14 = QueueItem
	  la $t3, QueueItem	# load label
	  sw $t3, -20($fp)	# spill _tmp14 from $t3 to $fp-20
	# *(_tmp13) = _tmp14
	  lw $t3, -20($fp)	# fill _tmp14 to $t3 from $fp-20
	  lw $t4, -16($fp)	# fill _tmp13 to $t4 from $fp-16
	  sw $t3, 0($t4) 	# store with offset
	# temp = _tmp13
	  sw $t4, -16($fp)	# spill _tmp13 from $t4 to $fp-16
	# _tmp15 = *(this + 4)
	  lw $t5, 4($fp)	# fill this to $t5 from $fp+4
	  lw $t6, 4($t5) 	# load with offset
	# _tmp16 = *(_tmp15)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp17 = *(_tmp16 + 8)
	  lw $t8, 8($t7) 	# load with offset
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill temp from $t4 to $fp-8
	  sw $t6, -24($fp)	# spill _tmp15 from $t6 to $fp-24
	  sw $t7, -28($fp)	# spill _tmp16 from $t7 to $fp-28
	  sw $t8, -32($fp)	# spill _tmp17 from $t8 to $fp-32
	# _tmp18 = ACall _tmp17
	  lw $t3, -32($fp)	# fill _tmp17 to $t3 from $fp-32
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -36($fp)	# spill _tmp18 from $t3 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp20 = *(temp)
	  lw $t5, -8($fp)	# fill temp to $t5 from $fp-8
	  lw $t6, 0($t5) 	# load with offset
	# _tmp21 = *(_tmp20)
	  lw $t7, 0($t6) 	# load with offset
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -40($fp)	# spill _tmp19 from $t4 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp20 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp21 from $t7 to $fp-48
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -36($fp)	# fill _tmp18 to $t3 from $fp-36
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill i to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill temp to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  lw $t3, -48($fp)	# fill _tmp21 to $t3 from $fp-48
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Queue.DeQueue:
	# BeginFunc 132
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 132	# decrement sp to make space for locals/temps
	# _tmp22 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp23 = *(_tmp22)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp24 = *(_tmp23 + 12)
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -12($fp)	# spill _tmp22 from $t4 to $fp-12
	  sw $t5, -16($fp)	# spill _tmp23 from $t5 to $fp-16
	  sw $t6, -20($fp)	# spill _tmp24 from $t6 to $fp-20
	# _tmp25 = ACall _tmp24
	  lw $t3, -20($fp)	# fill _tmp24 to $t3 from $fp-20
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -24($fp)	# spill _tmp25 from $t3 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp27 = _tmp25 == _tmp26
	  lw $t5, -24($fp)	# fill _tmp25 to $t5 from $fp-24
	  seq $t6, $t5, $t4	
	  sw $t4, -28($fp)	# spill _tmp26 from $t4 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp27 from $t6 to $fp-32
	# IfZ _tmp27 Goto _L0
	  lw $t3, -32($fp)	# fill _tmp27 to $t3 from $fp-32
	  beqz $t3, _L0	# branch if _tmp27 is zero 
	# _tmp28 = "Queue Is Empty"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Queue Is Empty"
	  .text
	  la $t4, _string1	# load label
	  sw $t4, -36($fp)	# spill _tmp28 from $t4 to $fp-36
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -36($fp)	# fill _tmp28 to $t4 from $fp-36
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -32($fp)	# spill _tmp27 from $t3 to $fp-32
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp29 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -40($fp)	# spill _tmp29 from $t3 to $fp-40
	# Return _tmp29
	  lw $t3, -40($fp)	# fill _tmp29 to $t3 from $fp-40
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# _tmp30 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp31 = *(_tmp30)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp32 = *(_tmp31 + 12)
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -48($fp)	# spill _tmp30 from $t4 to $fp-48
	  sw $t5, -52($fp)	# spill _tmp31 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp32 from $t6 to $fp-56
	# _tmp33 = ACall _tmp32
	  lw $t3, -56($fp)	# fill _tmp32 to $t3 from $fp-56
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp33 from $t3 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# temp = _tmp33
	  lw $t3, -60($fp)	# fill _tmp33 to $t3 from $fp-60
	# _tmp34 = *(temp)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp35 = *(_tmp34 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t3, -44($fp)	# spill temp from $t3 to $fp-44
	  sw $t4, -64($fp)	# spill _tmp34 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp35 from $t5 to $fp-68
	# _tmp36 = ACall _tmp35
	  lw $t3, -68($fp)	# fill _tmp35 to $t3 from $fp-68
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -72($fp)	# spill _tmp36 from $t3 to $fp-72
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# val = _tmp36
	  lw $t3, -72($fp)	# fill _tmp36 to $t3 from $fp-72
	# _tmp37 = *(temp)
	  lw $t4, -44($fp)	# fill temp to $t4 from $fp-44
	  lw $t5, 0($t4) 	# load with offset
	# _tmp38 = *(_tmp37 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -8($fp)	# spill val from $t3 to $fp-8
	  sw $t5, -76($fp)	# spill _tmp37 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp38 from $t6 to $fp-80
	# _tmp39 = ACall _tmp38
	  lw $t3, -80($fp)	# fill _tmp38 to $t3 from $fp-80
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -84($fp)	# spill _tmp39 from $t3 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp40 = *(temp)
	  lw $t3, -44($fp)	# fill temp to $t3 from $fp-44
	  lw $t4, 0($t3) 	# load with offset
	# _tmp41 = *(_tmp40 + 12)
	  lw $t5, 12($t4) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -88($fp)	# spill _tmp40 from $t4 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp41 from $t5 to $fp-92
	# _tmp42 = ACall _tmp41
	  lw $t3, -92($fp)	# fill _tmp41 to $t3 from $fp-92
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -96($fp)	# spill _tmp42 from $t3 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp43 = *(_tmp42)
	  lw $t3, -96($fp)	# fill _tmp42 to $t3 from $fp-96
	  lw $t4, 0($t3) 	# load with offset
	# _tmp44 = *(_tmp43 + 16)
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -84($fp)	# fill _tmp39 to $t6 from $fp-84
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -100($fp)	# spill _tmp43 from $t4 to $fp-100
	  sw $t5, -104($fp)	# spill _tmp44 from $t5 to $fp-104
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -96($fp)	# fill _tmp42 to $t3 from $fp-96
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp44
	  lw $t3, -104($fp)	# fill _tmp44 to $t3 from $fp-104
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp45 = *(temp)
	  lw $t3, -44($fp)	# fill temp to $t3 from $fp-44
	  lw $t4, 0($t3) 	# load with offset
	# _tmp46 = *(_tmp45 + 12)
	  lw $t5, 12($t4) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -108($fp)	# spill _tmp45 from $t4 to $fp-108
	  sw $t5, -112($fp)	# spill _tmp46 from $t5 to $fp-112
	# _tmp47 = ACall _tmp46
	  lw $t3, -112($fp)	# fill _tmp46 to $t3 from $fp-112
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -116($fp)	# spill _tmp47 from $t3 to $fp-116
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp48 = *(temp)
	  lw $t3, -44($fp)	# fill temp to $t3 from $fp-44
	  lw $t4, 0($t3) 	# load with offset
	# _tmp49 = *(_tmp48 + 8)
	  lw $t5, 8($t4) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -120($fp)	# spill _tmp48 from $t4 to $fp-120
	  sw $t5, -124($fp)	# spill _tmp49 from $t5 to $fp-124
	# _tmp50 = ACall _tmp49
	  lw $t3, -124($fp)	# fill _tmp49 to $t3 from $fp-124
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -128($fp)	# spill _tmp50 from $t3 to $fp-128
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp51 = *(_tmp50)
	  lw $t3, -128($fp)	# fill _tmp50 to $t3 from $fp-128
	  lw $t4, 0($t3) 	# load with offset
	# _tmp52 = *(_tmp51 + 20)
	  lw $t5, 20($t4) 	# load with offset
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, -116($fp)	# fill _tmp47 to $t6 from $fp-116
	  sw $t6, 4($sp)	# copy param value to stack
	  sw $t4, -132($fp)	# spill _tmp51 from $t4 to $fp-132
	  sw $t5, -136($fp)	# spill _tmp52 from $t5 to $fp-136
	# PushParam _tmp50
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -128($fp)	# fill _tmp50 to $t3 from $fp-128
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  lw $t3, -136($fp)	# fill _tmp52 to $t3 from $fp-136
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
  _L1:
	# Return val
	  lw $t3, -8($fp)	# fill val to $t3 from $fp-8
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
	# VTable for class Queue
	  .data
	  .align 2
	  Queue:		# label for class Queue vtable
	  .word _Queue.Init
	  .word _Queue.EnQueue
	  .word _Queue.DeQueue
	  .text
  main:
	# BeginFunc 196
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 196	# decrement sp to make space for locals/temps
	# _tmp53 = 8
	  li $t3, 8		# load constant value 8 into $t3
	  sw $t3, -16($fp)	# spill _tmp53 from $t3 to $fp-16
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp53 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp54 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp54 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = Queue
	  la $t3, Queue	# load label
	  sw $t3, -24($fp)	# spill _tmp55 from $t3 to $fp-24
	# *(_tmp54) = _tmp55
	  lw $t3, -24($fp)	# fill _tmp55 to $t3 from $fp-24
	  lw $t4, -20($fp)	# fill _tmp54 to $t4 from $fp-20
	  sw $t3, 0($t4) 	# store with offset
	# q = _tmp54
	  sw $t4, -20($fp)	# spill _tmp54 from $t4 to $fp-20
	# _tmp56 = *(q)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp57 = *(_tmp56)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill q from $t4 to $fp-8
	  sw $t5, -28($fp)	# spill _tmp56 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp57 from $t6 to $fp-32
	# ACall _tmp57
	  lw $t3, -32($fp)	# fill _tmp57 to $t3 from $fp-32
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp58 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -36($fp)	# spill _tmp58 from $t3 to $fp-36
	# i = _tmp58
	  lw $t3, -36($fp)	# fill _tmp58 to $t3 from $fp-36
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
  _L2:
	# _tmp59 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -40($fp)	# spill _tmp59 from $t3 to $fp-40
	# _tmp60 = i == _tmp59
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -40($fp)	# fill _tmp59 to $t4 from $fp-40
	  seq $t5, $t3, $t4	
	  sw $t5, -44($fp)	# spill _tmp60 from $t5 to $fp-44
	# _tmp61 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -48($fp)	# spill _tmp61 from $t3 to $fp-48
	# _tmp62 = _tmp60 == _tmp61
	  lw $t3, -44($fp)	# fill _tmp60 to $t3 from $fp-44
	  lw $t4, -48($fp)	# fill _tmp61 to $t4 from $fp-48
	  seq $t5, $t3, $t4	
	  sw $t5, -52($fp)	# spill _tmp62 from $t5 to $fp-52
	# IfZ _tmp62 Goto _L3
	  lw $t3, -52($fp)	# fill _tmp62 to $t3 from $fp-52
	  beqz $t3, _L3	# branch if _tmp62 is zero 
	# _tmp63 = *(q)
	  lw $t4, -8($fp)	# fill q to $t4 from $fp-8
	  lw $t5, 0($t4) 	# load with offset
	# _tmp64 = *(_tmp63 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -12($fp)	# fill i to $t7 from $fp-12
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t3, -52($fp)	# spill _tmp62 from $t3 to $fp-52
	  sw $t5, -56($fp)	# spill _tmp63 from $t5 to $fp-56
	  sw $t6, -60($fp)	# spill _tmp64 from $t6 to $fp-60
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill q to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp64
	  lw $t3, -60($fp)	# fill _tmp64 to $t3 from $fp-60
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp65 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -64($fp)	# spill _tmp65 from $t3 to $fp-64
	# _tmp66 = i + _tmp65
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -64($fp)	# fill _tmp65 to $t4 from $fp-64
	  add $t5, $t3, $t4	
	  sw $t5, -68($fp)	# spill _tmp66 from $t5 to $fp-68
	# i = _tmp66
	  lw $t3, -68($fp)	# fill _tmp66 to $t3 from $fp-68
	# Goto _L2
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
	  b _L2		# unconditional branch
  _L3:
	# _tmp67 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -72($fp)	# spill _tmp67 from $t3 to $fp-72
	# i = _tmp67
	  lw $t3, -72($fp)	# fill _tmp67 to $t3 from $fp-72
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
  _L4:
	# _tmp68 = 4
	  li $t3, 4		# load constant value 4 into $t3
	  sw $t3, -76($fp)	# spill _tmp68 from $t3 to $fp-76
	# _tmp69 = i == _tmp68
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -76($fp)	# fill _tmp68 to $t4 from $fp-76
	  seq $t5, $t3, $t4	
	  sw $t5, -80($fp)	# spill _tmp69 from $t5 to $fp-80
	# _tmp70 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -84($fp)	# spill _tmp70 from $t3 to $fp-84
	# _tmp71 = _tmp69 == _tmp70
	  lw $t3, -80($fp)	# fill _tmp69 to $t3 from $fp-80
	  lw $t4, -84($fp)	# fill _tmp70 to $t4 from $fp-84
	  seq $t5, $t3, $t4	
	  sw $t5, -88($fp)	# spill _tmp71 from $t5 to $fp-88
	# IfZ _tmp71 Goto _L5
	  lw $t3, -88($fp)	# fill _tmp71 to $t3 from $fp-88
	  beqz $t3, _L5	# branch if _tmp71 is zero 
	# _tmp72 = *(q)
	  lw $t4, -8($fp)	# fill q to $t4 from $fp-8
	  lw $t5, 0($t4) 	# load with offset
	# _tmp73 = *(_tmp72 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -88($fp)	# spill _tmp71 from $t3 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp72 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp73 from $t6 to $fp-96
	# _tmp74 = ACall _tmp73
	  lw $t3, -96($fp)	# fill _tmp73 to $t3 from $fp-96
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -100($fp)	# spill _tmp74 from $t3 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -100($fp)	# fill _tmp74 to $t3 from $fp-100
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp75 = " "
	  .data			# create string constant marked with label
	  _string2: .asciiz " "
	  .text
	  la $t3, _string2	# load label
	  sw $t3, -104($fp)	# spill _tmp75 from $t3 to $fp-104
	# PushParam _tmp75
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -104($fp)	# fill _tmp75 to $t3 from $fp-104
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp76 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -108($fp)	# spill _tmp76 from $t3 to $fp-108
	# _tmp77 = i + _tmp76
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -108($fp)	# fill _tmp76 to $t4 from $fp-108
	  add $t5, $t3, $t4	
	  sw $t5, -112($fp)	# spill _tmp77 from $t5 to $fp-112
	# i = _tmp77
	  lw $t3, -112($fp)	# fill _tmp77 to $t3 from $fp-112
	# Goto _L4
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
	  b _L4		# unconditional branch
  _L5:
	# _tmp78 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t3, _string3	# load label
	  sw $t3, -116($fp)	# spill _tmp78 from $t3 to $fp-116
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -116($fp)	# fill _tmp78 to $t3 from $fp-116
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -120($fp)	# spill _tmp79 from $t3 to $fp-120
	# i = _tmp79
	  lw $t3, -120($fp)	# fill _tmp79 to $t3 from $fp-120
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
  _L6:
	# _tmp80 = 10
	  li $t3, 10		# load constant value 10 into $t3
	  sw $t3, -124($fp)	# spill _tmp80 from $t3 to $fp-124
	# _tmp81 = i == _tmp80
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -124($fp)	# fill _tmp80 to $t4 from $fp-124
	  seq $t5, $t3, $t4	
	  sw $t5, -128($fp)	# spill _tmp81 from $t5 to $fp-128
	# _tmp82 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -132($fp)	# spill _tmp82 from $t3 to $fp-132
	# _tmp83 = _tmp81 == _tmp82
	  lw $t3, -128($fp)	# fill _tmp81 to $t3 from $fp-128
	  lw $t4, -132($fp)	# fill _tmp82 to $t4 from $fp-132
	  seq $t5, $t3, $t4	
	  sw $t5, -136($fp)	# spill _tmp83 from $t5 to $fp-136
	# IfZ _tmp83 Goto _L7
	  lw $t3, -136($fp)	# fill _tmp83 to $t3 from $fp-136
	  beqz $t3, _L7	# branch if _tmp83 is zero 
	# _tmp84 = *(q)
	  lw $t4, -8($fp)	# fill q to $t4 from $fp-8
	  lw $t5, 0($t4) 	# load with offset
	# _tmp85 = *(_tmp84 + 4)
	  lw $t6, 4($t5) 	# load with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -12($fp)	# fill i to $t7 from $fp-12
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t3, -136($fp)	# spill _tmp83 from $t3 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp84 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp85 from $t6 to $fp-144
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill q to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp85
	  lw $t3, -144($fp)	# fill _tmp85 to $t3 from $fp-144
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp86 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -148($fp)	# spill _tmp86 from $t3 to $fp-148
	# _tmp87 = i + _tmp86
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -148($fp)	# fill _tmp86 to $t4 from $fp-148
	  add $t5, $t3, $t4	
	  sw $t5, -152($fp)	# spill _tmp87 from $t5 to $fp-152
	# i = _tmp87
	  lw $t3, -152($fp)	# fill _tmp87 to $t3 from $fp-152
	# Goto _L6
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
	  b _L6		# unconditional branch
  _L7:
	# _tmp88 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -156($fp)	# spill _tmp88 from $t3 to $fp-156
	# i = _tmp88
	  lw $t3, -156($fp)	# fill _tmp88 to $t3 from $fp-156
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
  _L8:
	# _tmp89 = 17
	  li $t3, 17		# load constant value 17 into $t3
	  sw $t3, -160($fp)	# spill _tmp89 from $t3 to $fp-160
	# _tmp90 = i == _tmp89
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -160($fp)	# fill _tmp89 to $t4 from $fp-160
	  seq $t5, $t3, $t4	
	  sw $t5, -164($fp)	# spill _tmp90 from $t5 to $fp-164
	# _tmp91 = 0
	  li $t3, 0		# load constant value 0 into $t3
	  sw $t3, -168($fp)	# spill _tmp91 from $t3 to $fp-168
	# _tmp92 = _tmp90 == _tmp91
	  lw $t3, -164($fp)	# fill _tmp90 to $t3 from $fp-164
	  lw $t4, -168($fp)	# fill _tmp91 to $t4 from $fp-168
	  seq $t5, $t3, $t4	
	  sw $t5, -172($fp)	# spill _tmp92 from $t5 to $fp-172
	# IfZ _tmp92 Goto _L9
	  lw $t3, -172($fp)	# fill _tmp92 to $t3 from $fp-172
	  beqz $t3, _L9	# branch if _tmp92 is zero 
	# _tmp93 = *(q)
	  lw $t4, -8($fp)	# fill q to $t4 from $fp-8
	  lw $t5, 0($t4) 	# load with offset
	# _tmp94 = *(_tmp93 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t3, -172($fp)	# spill _tmp92 from $t3 to $fp-172
	  sw $t5, -176($fp)	# spill _tmp93 from $t5 to $fp-176
	  sw $t6, -180($fp)	# spill _tmp94 from $t6 to $fp-180
	# _tmp95 = ACall _tmp94
	  lw $t3, -180($fp)	# fill _tmp94 to $t3 from $fp-180
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -184($fp)	# spill _tmp95 from $t3 to $fp-184
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -184($fp)	# fill _tmp95 to $t3 from $fp-184
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp96 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $t3, _string4	# load label
	  sw $t3, -188($fp)	# spill _tmp96 from $t3 to $fp-188
	# PushParam _tmp96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -188($fp)	# fill _tmp96 to $t3 from $fp-188
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp97 = 1
	  li $t3, 1		# load constant value 1 into $t3
	  sw $t3, -192($fp)	# spill _tmp97 from $t3 to $fp-192
	# _tmp98 = i + _tmp97
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  lw $t4, -192($fp)	# fill _tmp97 to $t4 from $fp-192
	  add $t5, $t3, $t4	
	  sw $t5, -196($fp)	# spill _tmp98 from $t5 to $fp-196
	# i = _tmp98
	  lw $t3, -196($fp)	# fill _tmp98 to $t3 from $fp-196
	# Goto _L8
	  sw $t3, -12($fp)	# spill i from $t3 to $fp-12
	  b _L8		# unconditional branch
  _L9:
	# _tmp99 = "\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "\n"
	  .text
	  la $t3, _string5	# load label
	  sw $t3, -200($fp)	# spill _tmp99 from $t3 to $fp-200
	# PushParam _tmp99
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -200($fp)	# fill _tmp99 to $t3 from $fp-200
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
