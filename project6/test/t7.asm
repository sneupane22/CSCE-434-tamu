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
	  lw $t3, 8($fp)	# fill h to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 4($t4) 	# store with offset
	# *(this + 8) = mom
	  lw $t5, 12($fp)	# fill mom to $t5 from $fp+12
	  sw $t5, 8($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
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
  _Animal.GetMom:
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
	  lw $t3, 16($fp)	# fill spot to $t3 from $fp+16
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 12($t4) 	# store with offset
	# _tmp2 = *(this)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp3 = *(_tmp2)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, 12($fp)	# fill m to $t7 from $fp+12
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	  sw $t5, -8($fp)	# spill _tmp2 from $t5 to $fp-8
	  sw $t6, -12($fp)	# spill _tmp3 from $t6 to $fp-12
	# PushParam h
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 8($fp)	# fill h to $t3 from $fp+8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp3
	  lw $t3, -12($fp)	# fill _tmp3 to $t3 from $fp-12
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
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 12($t3) 	# load with offset
	# Return _tmp4
	  move $v0, $t4		# assign return value into $v0
	  sw $t4, -8($fp)	# spill _tmp4 from $t4 to $fp-8
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
	  li $t3, 16		# load constant value 16 into $t3
	  sw $t3, -16($fp)	# spill _tmp5 from $t3 to $fp-16
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -16($fp)	# fill _tmp5 to $t3 from $fp-16
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp6 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = Cow
	  la $t3, Cow	# load label
	  sw $t3, -24($fp)	# spill _tmp7 from $t3 to $fp-24
	# *(_tmp6) = _tmp7
	  lw $t3, -24($fp)	# fill _tmp7 to $t3 from $fp-24
	  lw $t4, -20($fp)	# fill _tmp6 to $t4 from $fp-20
	  sw $t3, 0($t4) 	# store with offset
	# betsy = _tmp6
	  sw $t4, -20($fp)	# spill _tmp6 from $t4 to $fp-20
	# _tmp8 = 5
	  li $t5, 5		# load constant value 5 into $t5
	  sw $t5, -28($fp)	# spill _tmp8 from $t5 to $fp-28
	# _tmp9 = 0
	  li $t5, 0		# load constant value 0 into $t5
	  sw $t5, -32($fp)	# spill _tmp9 from $t5 to $fp-32
	# _tmp10 = 1
	  li $t5, 1		# load constant value 1 into $t5
	  sw $t5, -36($fp)	# spill _tmp10 from $t5 to $fp-36
	# _tmp11 = *(betsy)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp12 = *(_tmp11 + 12)
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -36($fp)	# fill _tmp10 to $t7 from $fp-36
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill betsy from $t4 to $fp-8
	  sw $t5, -40($fp)	# spill _tmp11 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp12 from $t6 to $fp-44
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -32($fp)	# fill _tmp9 to $t3 from $fp-32
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -28($fp)	# fill _tmp8 to $t3 from $fp-28
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill betsy to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp12
	  lw $t3, -44($fp)	# fill _tmp12 to $t3 from $fp-44
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# b = betsy
	  lw $t3, -8($fp)	# fill betsy to $t3 from $fp-8
	# _tmp13 = *(b)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp14 = *(_tmp13 + 8)
	  lw $t5, 8($t4) 	# load with offset
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t3, -12($fp)	# spill b from $t3 to $fp-12
	  sw $t4, -48($fp)	# spill _tmp13 from $t4 to $fp-48
	  sw $t5, -52($fp)	# spill _tmp14 from $t5 to $fp-52
	# _tmp15 = ACall _tmp14
	  lw $t3, -52($fp)	# fill _tmp14 to $t3 from $fp-52
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -56($fp)	# spill _tmp15 from $t3 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "spots: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "spots: "
	  .text
	  la $t3, _string1	# load label
	  sw $t3, -60($fp)	# spill _tmp16 from $t3 to $fp-60
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -60($fp)	# fill _tmp16 to $t3 from $fp-60
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = *(betsy)
	  lw $t3, -8($fp)	# fill betsy to $t3 from $fp-8
	  lw $t4, 0($t3) 	# load with offset
	# _tmp18 = *(_tmp17 + 16)
	  lw $t5, 16($t4) 	# load with offset
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -64($fp)	# spill _tmp17 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp18 from $t5 to $fp-68
	# _tmp19 = ACall _tmp18
	  lw $t3, -68($fp)	# fill _tmp18 to $t3 from $fp-68
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -72($fp)	# spill _tmp19 from $t3 to $fp-72
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -72($fp)	# fill _tmp19 to $t3 from $fp-72
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintBool
	  jal _PrintBool     	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = "    height: "
	  .data			# create string constant marked with label
	  _string2: .asciiz "    height: "
	  .text
	  la $t3, _string2	# load label
	  sw $t3, -76($fp)	# spill _tmp20 from $t3 to $fp-76
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -76($fp)	# fill _tmp20 to $t3 from $fp-76
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = *(b)
	  lw $t3, -12($fp)	# fill b to $t3 from $fp-12
	  lw $t4, 0($t3) 	# load with offset
	# _tmp22 = *(_tmp21 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam b
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -80($fp)	# spill _tmp21 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp22 from $t5 to $fp-84
	# _tmp23 = ACall _tmp22
	  lw $t3, -84($fp)	# fill _tmp22 to $t3 from $fp-84
	  jalr $t3            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp23 from $t3 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -88($fp)	# fill _tmp23 to $t3 from $fp-88
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
