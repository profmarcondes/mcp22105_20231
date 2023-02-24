.macro print_str (%str)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
.end_macro

.macro print_strPtr (%ptr)
	li $v0, 4
	la $a0, %ptr
	syscall
.end_macro
	
.macro exit
  li $v0, 10
  syscall
.end_macro

.macro printIntReg (%reg)
  li $v0, 1
  move $a0, %reg
  syscall
.end_macro

.macro printIntImm (%reg)
  li $v0, 1
  li $a0, %reg
  syscall
.end_macro


.data
newline: .asciiz "\n"
nums: .word 15, 45, 60, 56
result: .word 0

.text
la $t0, nums
lw $s0, 0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)

add $s0, $s0, $s1
add $s0, $s0, $s2

sw $s0, result


print_str("O resultado é igual a ")

printIntReg($s0)

print_strPtr(newline)

printIntImm(10) 

print_strPtr(newline)

printIntImm(20) 


exit





