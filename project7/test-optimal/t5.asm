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
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp0
	  move $t1, $t0		# copy value to register for i
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L0:
	# _tmp1 = *(names + -4)
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp2 = i < _tmp1
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp2 Goto _L1
	  sw $t3, -20($fp)	# spill _tmp2 from $t3 to $fp-20
	  beqz $t3, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp4 = i < _tmp3
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp5 = *(names + -4)
	  lw $t3, 4($fp)	# fill names to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp6 = i < _tmp5
	  slt $t5, $t1, $t4	
	# _tmp7 = _tmp6 == _tmp3
	  seq $t4, $t5, $t0	
	# _tmp8 = _tmp4 || _tmp7
	  or $t0, $t2, $t4	
	# IfZ _tmp8 Goto _L2
	  sw $t0, -44($fp)	# spill _tmp8 from $t0 to $fp-44
	  beqz $t0, _L2	# branch if _tmp8 is zero 
	# _tmp9 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp10 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp11 = _tmp10 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp12 = names + _tmp11
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  add $t3, $t0, $t2	
	# _tmp13 = *(_tmp12)
	  lw $t2, 0($t3) 	# load with offset
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill answer to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp14 Goto _L3
	  sw $t0, -68($fp)	# spill _tmp14 from $t0 to $fp-68
	  beqz $t0, _L3	# branch if _tmp14 is zero 
	# _tmp15 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp15
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L3:
	# _tmp16 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp17 = i + _tmp16
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp17
	  move $t1, $t2		# copy value to register for i
	# Goto _L0
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L0		# unconditional branch
  _L1:
	# _tmp18 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp18
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
  main:
	# BeginFunc 260
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 260	# decrement sp to make space for locals/temps
	# _tmp19 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp20 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp21 = _tmp19 < _tmp20
	  slt $t2, $t0, $t1	
	# IfZ _tmp21 Goto _L4
	  sw $t0, -12($fp)	# spill _tmp19 from $t0 to $fp-12
	  sw $t2, -20($fp)	# spill _tmp21 from $t2 to $fp-20
	  beqz $t2, _L4	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
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
  _L4:
	# _tmp23 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp24 = _tmp23 + _tmp19
	  lw $t1, -12($fp)	# fill _tmp19 to $t1 from $fp-12
	  add $t2, $t0, $t1	
	# _tmp25 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp26 = _tmp24 * _tmp25
	  mul $t3, $t2, $t0	
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	  sw $t0, -36($fp)	# spill _tmp25 from $t0 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	  lw $t1, -12($fp)	# fill _tmp19 to $t1 from $fp-12
	  sw $t1, 0($t0) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	  lw $t1, -36($fp)	# fill _tmp25 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	# names = _tmp28
	  move $t0, $t2		# copy value to register for names
	# _tmp29 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp30 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp31 = _tmp29 < _tmp30
	  slt $t3, $t1, $t2	
	# _tmp32 = *(names + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	  slt $t5, $t1, $t4	
	# _tmp34 = _tmp33 == _tmp30
	  seq $t4, $t5, $t2	
	# _tmp35 = _tmp31 || _tmp34
	  or $t2, $t3, $t4	
	# IfZ _tmp35 Goto _L5
	  sw $t0, -8($fp)	# spill names from $t0 to $fp-8
	  sw $t1, -52($fp)	# spill _tmp29 from $t1 to $fp-52
	  sw $t2, -76($fp)	# spill _tmp35 from $t2 to $fp-76
	  beqz $t2, _L5	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp37 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp38 = _tmp37 * _tmp29
	  lw $t1, -52($fp)	# fill _tmp29 to $t1 from $fp-52
	  mul $t2, $t0, $t1	
	# _tmp39 = names + _tmp38
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp40 = "Brian"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Brian"
	  .text
	  la $t2, _string4	# load label
	# *(_tmp39) = _tmp40
	  sw $t2, 0($t1) 	# store with offset
	# _tmp41 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp42 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp43 = _tmp41 < _tmp42
	  slt $t3, $t1, $t2	
	# _tmp44 = *(names + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp45 = _tmp41 < _tmp44
	  slt $t5, $t1, $t4	
	# _tmp46 = _tmp45 == _tmp42
	  seq $t4, $t5, $t2	
	# _tmp47 = _tmp43 || _tmp46
	  or $t2, $t3, $t4	
	# IfZ _tmp47 Goto _L6
	  sw $t1, -100($fp)	# spill _tmp41 from $t1 to $fp-100
	  sw $t2, -124($fp)	# spill _tmp47 from $t2 to $fp-124
	  beqz $t2, _L6	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp49 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp50 = _tmp49 * _tmp41
	  lw $t1, -100($fp)	# fill _tmp41 to $t1 from $fp-100
	  mul $t2, $t0, $t1	
	# _tmp51 = names + _tmp50
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp52 = "Cam"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Cam"
	  .text
	  la $t2, _string6	# load label
	# *(_tmp51) = _tmp52
	  sw $t2, 0($t1) 	# store with offset
	# _tmp53 = 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp54 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp55 = _tmp53 < _tmp54
	  slt $t3, $t1, $t2	
	# _tmp56 = *(names + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp57 = _tmp53 < _tmp56
	  slt $t5, $t1, $t4	
	# _tmp58 = _tmp57 == _tmp54
	  seq $t4, $t5, $t2	
	# _tmp59 = _tmp55 || _tmp58
	  or $t2, $t3, $t4	
	# IfZ _tmp59 Goto _L7
	  sw $t1, -148($fp)	# spill _tmp53 from $t1 to $fp-148
	  sw $t2, -172($fp)	# spill _tmp59 from $t2 to $fp-172
	  beqz $t2, _L7	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp61 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp62 = _tmp61 * _tmp53
	  lw $t1, -148($fp)	# fill _tmp53 to $t1 from $fp-148
	  mul $t2, $t0, $t1	
	# _tmp63 = names + _tmp62
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp64 = "Gavan"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Gavan"
	  .text
	  la $t2, _string8	# load label
	# *(_tmp63) = _tmp64
	  sw $t2, 0($t1) 	# store with offset
	# _tmp65 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# _tmp66 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp67 = _tmp65 < _tmp66
	  slt $t3, $t1, $t2	
	# _tmp68 = *(names + -4)
	  lw $t4, -4($t0) 	# load with offset
	# _tmp69 = _tmp65 < _tmp68
	  slt $t5, $t1, $t4	
	# _tmp70 = _tmp69 == _tmp66
	  seq $t4, $t5, $t2	
	# _tmp71 = _tmp67 || _tmp70
	  or $t2, $t3, $t4	
	# IfZ _tmp71 Goto _L8
	  sw $t1, -196($fp)	# spill _tmp65 from $t1 to $fp-196
	  sw $t2, -220($fp)	# spill _tmp71 from $t2 to $fp-220
	  beqz $t2, _L8	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp73 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp74 = _tmp73 * _tmp65
	  lw $t1, -196($fp)	# fill _tmp65 to $t1 from $fp-196
	  mul $t2, $t0, $t1	
	# _tmp75 = names + _tmp74
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp76 = "Julie"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Julie"
	  .text
	  la $t2, _string10	# load label
	# *(_tmp75) = _tmp76
	  sw $t2, 0($t1) 	# store with offset
  _L9:
	# _tmp77 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# IfZ _tmp77 Goto _L10
	  sw $t0, -244($fp)	# spill _tmp77 from $t0 to $fp-244
	  beqz $t0, _L10	# branch if _tmp77 is zero 
	# _tmp78 = "\nWho is your favorite CS143 staff member? "
	  .data			# create string constant marked with label
	  _string11: .asciiz "\nWho is your favorite CS143 staff member? "
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam names
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp80 = LCall _Wild
	  jal _Wild          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp80 Goto _L11
	  sw $t0, -256($fp)	# spill _tmp80 from $t0 to $fp-256
	  beqz $t0, _L11	# branch if _tmp80 is zero 
	# _tmp81 = "You just earned 1000 bonus points!\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "You just earned 1000 bonus points!\n"
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp81
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
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
	  la $t0, _string13	# load label
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
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
