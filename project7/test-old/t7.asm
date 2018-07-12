	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Animal.InitAnimal:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = h
	  lw $t0, 8($fp)	# fill h to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = mom
	  lw $t2, 12($fp)	# fill mom to $t2 from $fp+12
	  sw $t2, 8($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Animal.GetHeight:
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
  _Animal.GetMom:
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
	# VTable for class Animal
	  .data
	  .align 2
	  Animal:		# label for class Animal vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .text
  _Cow.InitCow:
	# BeginFunc 8
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# *(this + 12) = spot
	  lw $t0, 16($fp)	# fill spot to $t0 from $fp+16
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 12($t1) 	# store with offset
	# _tmp2 = *(this)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp3 = *(_tmp2)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, 12($fp)	# fill m to $t4 from $fp+12
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam h
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, 8($fp)	# fill h to $t5 from $fp+8
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp3
	  sw $t2, -8($fp)	# spill _tmp2 from $t2 to $fp-8
	  sw $t3, -12($fp)	# spill _tmp3 from $t3 to $fp-12
	  jalr $t3            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.IsSpottedCow:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# Return _tmp4
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .word _Cow.InitCow
	  .word _Cow.IsSpottedCow
	  .text
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp5 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _Alloc
	  sw $t0, -16($fp)	# spill _tmp5 from $t0 to $fp-16
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = Cow
	  la $t1, Cow	# load label
	# *(_tmp6) = _tmp7
	  sw $t1, 0($t0) 	# store with offset
	# betsy = _tmp6
	  move $t2, $t0		# copy value to register for betsy
	# _tmp8 = 5
	  li $t3, 5		# load constant value 5 into $t3
	# _tmp9 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp10 = 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp11 = *(betsy)
	  lw $t6, 0($t2) 	# load with offset
	# _tmp12 = *(_tmp11 + 12)
	  lw $t9, 12($t6) 	# load with offset
	  sw $t9, -44($fp)	# spill _tmp12 from $t9 to $fp-44
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp12
	  lw $t7, -44($fp)	# fill _tmp12 to $t7 from $fp-44
	  sw $t0, -20($fp)	# spill _tmp6 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp7 from $t1 to $fp-24
	  sw $t2, -8($fp)	# spill betsy from $t2 to $fp-8
	  sw $t3, -28($fp)	# spill _tmp8 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp9 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp10 from $t5 to $fp-36
	  sw $t6, -40($fp)	# spill _tmp11 from $t6 to $fp-40
	  jalr $t7            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# b = betsy
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  move $t1, $t0		# copy value to register for b
	# _tmp13 = *(b)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp14 = *(_tmp13 + 8)
	  lw $t3, 8($t2) 	# load with offset
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp15 = ACall _tmp14
	  sw $t1, -12($fp)	# spill b from $t1 to $fp-12
	  sw $t2, -48($fp)	# spill _tmp13 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp14 from $t3 to $fp-52
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "spots: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "spots: "
	  .text
	  la $t1, _string1	# load label
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -56($fp)	# spill _tmp15 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp16 from $t1 to $fp-60
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = *(betsy)
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  lw $t1, 0($t0) 	# load with offset
	# _tmp18 = *(_tmp17 + 16)
	  lw $t2, 16($t1) 	# load with offset
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp19 = ACall _tmp18
	  sw $t1, -64($fp)	# spill _tmp17 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp18 from $t2 to $fp-68
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintBool
	  sw $t0, -72($fp)	# spill _tmp19 from $t0 to $fp-72
	  jal _PrintBool     	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = "    height: "
	  .data			# create string constant marked with label
	  _string2: .asciiz "    height: "
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t0, -76($fp)	# spill _tmp20 from $t0 to $fp-76
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = *(b)
	  lw $t0, -12($fp)	# fill b to $t0 from $fp-12
	  lw $t1, 0($t0) 	# load with offset
	# _tmp22 = *(_tmp21 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp23 = ACall _tmp22
	  sw $t1, -80($fp)	# spill _tmp21 from $t1 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp22 from $t2 to $fp-84
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  sw $t0, -88($fp)	# spill _tmp23 from $t0 to $fp-88
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
