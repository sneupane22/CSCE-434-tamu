	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 12
	  li $t3, 12		# load constant value 12 into $t3
	  sw $t3, -12($fp)	# spill _tmp0 from $t3 to $fp-12
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp0 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp1 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp1 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = Cow
	  la $t3, Cow	# load label
	  sw $t3, -20($fp)	# spill _tmp2 from $t3 to $fp-20
	# *(_tmp1) = _tmp2
	  lw $t3, -20($fp)	# fill _tmp2 to $t3 from $fp-20
	  lw $t4, -16($fp)	# fill _tmp1 to $t4 from $fp-16
	  sw $t3, 0($t4) 	# store with offset
	# betsy = _tmp1
	  sw $t4, -16($fp)	# spill _tmp1 from $t4 to $fp-16
	# _tmp3 = 100
	  li $t5, 100		# load constant value 100 into $t5
	  sw $t5, -24($fp)	# spill _tmp3 from $t5 to $fp-24
	# _tmp4 = 122
	  li $t5, 122		# load constant value 122 into $t5
	  sw $t5, -28($fp)	# spill _tmp4 from $t5 to $fp-28
	# _tmp5 = *(betsy)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp6 = *(_tmp5)
	  lw $t6, 0($t5) 	# load with offset
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t7, -28($fp)	# fill _tmp4 to $t7 from $fp-28
	  sw $t7, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill betsy from $t4 to $fp-8
	  sw $t5, -32($fp)	# spill _tmp5 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp6 from $t6 to $fp-36
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -24($fp)	# fill _tmp3 to $t3 from $fp-24
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill betsy to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp6
	  lw $t3, -36($fp)	# fill _tmp6 to $t3 from $fp-36
	  jalr $t3            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp7 = *(betsy)
	  lw $t3, -8($fp)	# fill betsy to $t3 from $fp-8
	  lw $t4, 0($t3) 	# load with offset
	# _tmp8 = *(_tmp7 + 4)
	  lw $t5, 4($t4) 	# load with offset
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	  sw $t4, -40($fp)	# spill _tmp7 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp8 from $t5 to $fp-44
	# ACall _tmp8
	  lw $t3, -44($fp)	# fill _tmp8 to $t3 from $fp-44
	  jalr $t3            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = w
	  lw $t3, 8($fp)	# fill w to $t3 from $fp+8
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t3, 8($t4) 	# store with offset
	# *(this + 4) = h
	  lw $t5, 12($fp)	# fill h to $t5 from $fp+12
	  sw $t5, 4($t4) 	# store with offset
	# EndFunc
	  sw $t4, 4($fp)	# spill this from $t4 to $fp+4
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Moo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp9 = *(this + 4)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -8($fp)	# spill _tmp9 from $t4 to $fp-8
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
	  .text
	  la $t3, _string1	# load label
	  sw $t3, -12($fp)	# spill _tmp10 from $t3 to $fp-12
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill _tmp10 to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp11 = *(this + 8)
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	  sw $t4, -16($fp)	# spill _tmp11 from $t4 to $fp-16
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t3, _string2	# load label
	  sw $t3, -20($fp)	# spill _tmp12 from $t3 to $fp-20
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -20($fp)	# fill _tmp12 to $t3 from $fp-20
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Cow.Init
	  .word _Cow.Moo
	  .text
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
