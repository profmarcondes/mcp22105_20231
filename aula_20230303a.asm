#IF0
	blt $s0, $s1, IF0_true
#IF0_false
	addi $t0, $zero, 0  # i = 0
	L1:
		bge $t0, $s1, L1_end
		L2:
			ble $s1, $zero, L2_end
			addi $s1, $s1, -1       # b--;
			j L2		
		L2_end:
		#IF1
		beq $t0, $s1, L1_end # break
		addi $t0, $t0, 1 # i++
		j L1
	L1_end:

	j IF0_end
IF0_true:
	L0:
		bge $s0, 10, L0_end
		addi $s0, $s0, 1
		j L0
	L0_end:
	addi $s1, $s0, -5
IF0_end: