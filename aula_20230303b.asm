.macro print_strPtr (%ptr)
	li $v0, 4
	la $a0, %ptr
	syscall
.end_macro

.macro exit
  li $v0, 10
  syscall
.end_macro

.macro getInt(%reg)
	li $v0, 5
	syscall
	move %reg, $v0
.end_macro

.data
question: .asciiz "Digite um número: "
n_zero: .asciiz "n é zero\n"
n_par: .asciiz "n é par\n"
n_quadrado: .asciiz "n é quadrado\n"
n_primo: .asciiz "n é primo\n"
n_default: .asciiz "fora da faixa [ 0 - 9 ]\n"

jump_table: .word case0, case1, case2, case3, case4
			.word case5, case6, case7, case8, case9

.text

L0:

print_strPtr(question)
getInt($s0)

bgtu $s0, 9, default
la  $t0, jump_table
sll $s0, $s0, 2
add $t0, $t0, $s0
lw  $t0, 0($t0)
jr  $t0

case0:
	print_strPtr(n_zero)
	j switch_end
case4:
	print_strPtr(n_par)
case1:
case9:
	print_strPtr(n_quadrado)
	j switch_end
case2:
	print_strPtr(n_par)
case3:
case5:
case7:
	print_strPtr(n_primo)
	j switch_end
case6:
case8:
	print_strPtr(n_par)
	j switch_end
default:
	print_strPtr(n_default)
	exit
switch_end:

j L0