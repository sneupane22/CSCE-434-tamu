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
	  lw $t0, 8($fp)	# fill data to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = next
	  lw $t2, 12($fp)	# fill next to $t2 from $fp+12
	  sw $t2, 8($t1) 	# store with offset
	# *(next + 12) = this
	  sw $t1, 12($t2) 	# store with offset
	# *(this + 12) = prev
	  lw $t3, 16($fp)	# fill prev to $t3 from $fp+16
	  sw $t3, 12($t1) 	# store with offset
	# *(prev + 8) = this
	  sw $t1, 8($t3) 	# store with offset
	# EndFunc
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
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# Return _tmp0
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
  _QueueItem.GetNext:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# Return _tmp1
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
  _QueueItem.GetPrev:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp2 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# Return _tmp2
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
  _QueueItem.SetNext:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = n
	  lw $t0, 8($fp)	# fill n to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 8($t1) 	# store with offset
	# EndFunc
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
	  lw $t0, 8($fp)	# fill p to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 12($t1) 	# store with offset
	# EndFunc
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
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _Alloc
	  sw $t0, -8($fp)	# spill _tmp3 from $t0 to $fp-8
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = QueueItem
	  la $t1, QueueItem	# load label
	# *(_tmp4) = _tmp5
	  sw $t1, 0($t0) 	# store with offset
	# *(this + 4) = _tmp4
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp6 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp7 = *(this + 4)
	  lw $t4, 4($t2) 	# load with offset
	# _tmp8 = *(this + 4)
	  lw $t5, 4($t2) 	# load with offset
	# _tmp9 = *(this + 4)
	  lw $t6, 4($t2) 	# load with offset
	# _tmp10 = *(_tmp9)
	  lw $t9, 0($t6) 	# load with offset
	  sw $t9, -36($fp)	# spill _tmp10 from $t9 to $fp-36
	# _tmp11 = *(_tmp10)
	  lw $t7, -36($fp)	# fill _tmp10 to $t7 from $fp-36
	  lw $t9, 0($t7) 	# load with offset
	  sw $t9, -40($fp)	# spill _tmp11 from $t9 to $fp-40
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# ACall _tmp11
	  lw $t7, -40($fp)	# fill _tmp11 to $t7 from $fp-40
	  sw $t0, -12($fp)	# spill _tmp4 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp5 from $t1 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp6 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp7 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp8 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp9 from $t6 to $fp-32
	  jalr $t7            	# jump to function
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
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp13 = LCall _Alloc
	  sw $t0, -12($fp)	# spill _tmp12 from $t0 to $fp-12
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp14 = QueueItem
	  la $t1, QueueItem	# load label
	# *(_tmp13) = _tmp14
	  sw $t1, 0($t0) 	# store with offset
	# temp = _tmp13
	  move $t2, $t0		# copy value to register for temp
	# _tmp15 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp16 = *(_tmp15)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp17 = *(_tmp16 + 8)
	  lw $t6, 8($t5) 	# load with offset
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp18 = ACall _tmp17
	  sw $t0, -16($fp)	# spill _tmp13 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp14 from $t1 to $fp-20
	  sw $t2, -8($fp)	# spill temp from $t2 to $fp-8
	  sw $t4, -24($fp)	# spill _tmp15 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp16 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp17 from $t6 to $fp-32
	  jalr $t6            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = *(this + 4)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 4($t1) 	# load with offset
	# _tmp20 = *(temp)
	  lw $t3, -8($fp)	# fill temp to $t3 from $fp-8
	  lw $t4, 0($t3) 	# load with offset
	# _tmp21 = *(_tmp20)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t6, 8($fp)	# fill i to $t6 from $fp+8
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp21
	  sw $t0, -36($fp)	# spill _tmp18 from $t0 to $fp-36
	  sw $t2, -40($fp)	# spill _tmp19 from $t2 to $fp-40
	  sw $t4, -44($fp)	# spill _tmp20 from $t4 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp21 from $t5 to $fp-48
	  jalr $t5            	# jump to function
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
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp23 = *(_tmp22)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp24 = *(_tmp23 + 12)
	  lw $t3, 12($t2) 	# load with offset
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp25 = ACall _tmp24
	  sw $t1, -12($fp)	# spill _tmp22 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp23 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp24 from $t3 to $fp-20
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = *(this + 4)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 4($t1) 	# load with offset
	# _tmp27 = _tmp25 == _tmp26
	  seq $t3, $t0, $t2	
	# IfZ _tmp27 Goto _L0
	  sw $t0, -24($fp)	# spill _tmp25 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp26 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp27 from $t3 to $fp-32
	  beqz $t3, _L0	# branch if _tmp27 is zero 
	# _tmp28 = "Queue Is Empty"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Queue Is Empty"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -36($fp)	# spill _tmp28 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp29 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp29
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# _tmp30 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp31 = *(_tmp30)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp32 = *(_tmp31 + 12)
	  lw $t3, 12($t2) 	# load with offset
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp33 = ACall _tmp32
	  sw $t1, -48($fp)	# spill _tmp30 from $t1 to $fp-48
	  sw $t2, -52($fp)	# spill _tmp31 from $t2 to $fp-52
	  sw $t3, -56($fp)	# spill _tmp32 from $t3 to $fp-56
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# temp = _tmp33
	  move $t1, $t0		# copy value to register for temp
	# _tmp34 = *(temp)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp35 = *(_tmp34 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp36 = ACall _tmp35
	  sw $t0, -60($fp)	# spill _tmp33 from $t0 to $fp-60
	  sw $t1, -44($fp)	# spill temp from $t1 to $fp-44
	  sw $t2, -64($fp)	# spill _tmp34 from $t2 to $fp-64
	  sw $t3, -68($fp)	# spill _tmp35 from $t3 to $fp-68
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# val = _tmp36
	  move $t1, $t0		# copy value to register for val
	# _tmp37 = *(temp)
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  lw $t3, 0($t2) 	# load with offset
	# _tmp38 = *(_tmp37 + 8)
	  lw $t4, 8($t3) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp39 = ACall _tmp38
	  sw $t0, -72($fp)	# spill _tmp36 from $t0 to $fp-72
	  sw $t1, -8($fp)	# spill val from $t1 to $fp-8
	  sw $t3, -76($fp)	# spill _tmp37 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp38 from $t4 to $fp-80
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp40 = *(temp)
	  lw $t1, -44($fp)	# fill temp to $t1 from $fp-44
	  lw $t2, 0($t1) 	# load with offset
	# _tmp41 = *(_tmp40 + 12)
	  lw $t3, 12($t2) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp42 = ACall _tmp41
	  sw $t0, -84($fp)	# spill _tmp39 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp40 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp41 from $t3 to $fp-92
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp43 = *(_tmp42)
	  lw $t1, 0($t0) 	# load with offset
	# _tmp44 = *(_tmp43 + 16)
	  lw $t2, 16($t1) 	# load with offset
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -84($fp)	# fill _tmp39 to $t3 from $fp-84
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp44
	  sw $t0, -96($fp)	# spill _tmp42 from $t0 to $fp-96
	  sw $t1, -100($fp)	# spill _tmp43 from $t1 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp44 from $t2 to $fp-104
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp45 = *(temp)
	  lw $t0, -44($fp)	# fill temp to $t0 from $fp-44
	  lw $t1, 0($t0) 	# load with offset
	# _tmp46 = *(_tmp45 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp47 = ACall _tmp46
	  sw $t1, -108($fp)	# spill _tmp45 from $t1 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp46 from $t2 to $fp-112
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp48 = *(temp)
	  lw $t1, -44($fp)	# fill temp to $t1 from $fp-44
	  lw $t2, 0($t1) 	# load with offset
	# _tmp49 = *(_tmp48 + 8)
	  lw $t3, 8($t2) 	# load with offset
	# PushParam temp
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp50 = ACall _tmp49
	  sw $t0, -116($fp)	# spill _tmp47 from $t0 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp48 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp49 from $t3 to $fp-124
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp51 = *(_tmp50)
	  lw $t1, 0($t0) 	# load with offset
	# _tmp52 = *(_tmp51 + 20)
	  lw $t2, 20($t1) 	# load with offset
	# PushParam _tmp47
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -116($fp)	# fill _tmp47 to $t3 from $fp-116
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp50
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp52
	  sw $t0, -128($fp)	# spill _tmp50 from $t0 to $fp-128
	  sw $t1, -132($fp)	# spill _tmp51 from $t1 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp52 from $t2 to $fp-136
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
  _L1:
	# Return val
	  lw $t0, -8($fp)	# fill val to $t0 from $fp-8
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
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp54 = LCall _Alloc
	  sw $t0, -16($fp)	# spill _tmp53 from $t0 to $fp-16
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = Queue
	  la $t1, Queue	# load label
	# *(_tmp54) = _tmp55
	  sw $t1, 0($t0) 	# store with offset
	# q = _tmp54
	  move $t2, $t0		# copy value to register for q
	# _tmp56 = *(q)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp57 = *(_tmp56)
	  lw $t4, 0($t3) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp57
	  sw $t0, -20($fp)	# spill _tmp54 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp55 from $t1 to $fp-24
	  sw $t2, -8($fp)	# spill q from $t2 to $fp-8
	  sw $t3, -28($fp)	# spill _tmp56 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp57 from $t4 to $fp-32
	  jalr $t4            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp58 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp58
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -36($fp)	# spill _tmp58 from $t0 to $fp-36
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
  _L2:
	# _tmp59 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp60 = i == _tmp59
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  seq $t2, $t1, $t0	
	# _tmp61 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp62 = _tmp60 == _tmp61
	  seq $t4, $t2, $t3	
	# IfZ _tmp62 Goto _L3
	  sw $t0, -40($fp)	# spill _tmp59 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp60 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp61 from $t3 to $fp-48
	  sw $t4, -52($fp)	# spill _tmp62 from $t4 to $fp-52
	  beqz $t4, _L3	# branch if _tmp62 is zero 
	# _tmp63 = *(q)
	  lw $t0, -8($fp)	# fill q to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp64 = *(_tmp63 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp64
	  sw $t1, -56($fp)	# spill _tmp63 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp64 from $t2 to $fp-60
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp65 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp66 = i + _tmp65
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# i = _tmp66
	  move $t1, $t2		# copy value to register for i
	# Goto _L2
	  sw $t0, -64($fp)	# spill _tmp65 from $t0 to $fp-64
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
	  sw $t2, -68($fp)	# spill _tmp66 from $t2 to $fp-68
	  b _L2		# unconditional branch
  _L3:
	# _tmp67 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp67
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -72($fp)	# spill _tmp67 from $t0 to $fp-72
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
  _L4:
	# _tmp68 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp69 = i == _tmp68
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  seq $t2, $t1, $t0	
	# _tmp70 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp71 = _tmp69 == _tmp70
	  seq $t4, $t2, $t3	
	# IfZ _tmp71 Goto _L5
	  sw $t0, -76($fp)	# spill _tmp68 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp69 from $t2 to $fp-80
	  sw $t3, -84($fp)	# spill _tmp70 from $t3 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp71 from $t4 to $fp-88
	  beqz $t4, _L5	# branch if _tmp71 is zero 
	# _tmp72 = *(q)
	  lw $t0, -8($fp)	# fill q to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp73 = *(_tmp72 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp74 = ACall _tmp73
	  sw $t1, -92($fp)	# spill _tmp72 from $t1 to $fp-92
	  sw $t2, -96($fp)	# spill _tmp73 from $t2 to $fp-96
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -100($fp)	# spill _tmp74 from $t0 to $fp-100
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp75 = " "
	  .data			# create string constant marked with label
	  _string2: .asciiz " "
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp75
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -104($fp)	# spill _tmp75 from $t0 to $fp-104
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp76 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp77 = i + _tmp76
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# i = _tmp77
	  move $t1, $t2		# copy value to register for i
	# Goto _L4
	  sw $t0, -108($fp)	# spill _tmp76 from $t0 to $fp-108
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
	  sw $t2, -112($fp)	# spill _tmp77 from $t2 to $fp-112
	  b _L4		# unconditional branch
  _L5:
	# _tmp78 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -116($fp)	# spill _tmp78 from $t0 to $fp-116
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp79
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -120($fp)	# spill _tmp79 from $t0 to $fp-120
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
  _L6:
	# _tmp80 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp81 = i == _tmp80
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  seq $t2, $t1, $t0	
	# _tmp82 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp83 = _tmp81 == _tmp82
	  seq $t4, $t2, $t3	
	# IfZ _tmp83 Goto _L7
	  sw $t0, -124($fp)	# spill _tmp80 from $t0 to $fp-124
	  sw $t2, -128($fp)	# spill _tmp81 from $t2 to $fp-128
	  sw $t3, -132($fp)	# spill _tmp82 from $t3 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp83 from $t4 to $fp-136
	  beqz $t4, _L7	# branch if _tmp83 is zero 
	# _tmp84 = *(q)
	  lw $t0, -8($fp)	# fill q to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp85 = *(_tmp84 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill i to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp85
	  sw $t1, -140($fp)	# spill _tmp84 from $t1 to $fp-140
	  sw $t2, -144($fp)	# spill _tmp85 from $t2 to $fp-144
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp86 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp87 = i + _tmp86
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# i = _tmp87
	  move $t1, $t2		# copy value to register for i
	# Goto _L6
	  sw $t0, -148($fp)	# spill _tmp86 from $t0 to $fp-148
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
	  sw $t2, -152($fp)	# spill _tmp87 from $t2 to $fp-152
	  b _L6		# unconditional branch
  _L7:
	# _tmp88 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp88
	  move $t1, $t0		# copy value to register for i
	  sw $t0, -156($fp)	# spill _tmp88 from $t0 to $fp-156
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
  _L8:
	# _tmp89 = 17
	  li $t0, 17		# load constant value 17 into $t0
	# _tmp90 = i == _tmp89
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  seq $t2, $t1, $t0	
	# _tmp91 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp92 = _tmp90 == _tmp91
	  seq $t4, $t2, $t3	
	# IfZ _tmp92 Goto _L9
	  sw $t0, -160($fp)	# spill _tmp89 from $t0 to $fp-160
	  sw $t2, -164($fp)	# spill _tmp90 from $t2 to $fp-164
	  sw $t3, -168($fp)	# spill _tmp91 from $t3 to $fp-168
	  sw $t4, -172($fp)	# spill _tmp92 from $t4 to $fp-172
	  beqz $t4, _L9	# branch if _tmp92 is zero 
	# _tmp93 = *(q)
	  lw $t0, -8($fp)	# fill q to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp94 = *(_tmp93 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam q
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp95 = ACall _tmp94
	  sw $t1, -176($fp)	# spill _tmp93 from $t1 to $fp-176
	  sw $t2, -180($fp)	# spill _tmp94 from $t2 to $fp-180
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -184($fp)	# spill _tmp95 from $t0 to $fp-184
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp96 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -188($fp)	# spill _tmp96 from $t0 to $fp-188
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp97 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp98 = i + _tmp97
	  lw $t1, -12($fp)	# fill i to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# i = _tmp98
	  move $t1, $t2		# copy value to register for i
	# Goto _L8
	  sw $t0, -192($fp)	# spill _tmp97 from $t0 to $fp-192
	  sw $t1, -12($fp)	# spill i from $t1 to $fp-12
	  sw $t2, -196($fp)	# spill _tmp98 from $t2 to $fp-196
	  b _L8		# unconditional branch
  _L9:
	# _tmp99 = "\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp99
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -200($fp)	# spill _tmp99 from $t0 to $fp-200
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
