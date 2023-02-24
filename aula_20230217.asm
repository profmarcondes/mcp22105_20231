##### Aula 17_02_2023
li $t0, 10
li $t1, 5
li $t2, 3

# d = a - 3 * ( b + c + 8 )
#  a -> $t0, b -> $t1, c -> $t2, d -> $t3
addi $t3, $t2, 8   # d = c + 8
add  $t3, $t1, $t3 # d = b + d = (b + c + 8)
addi $t4, $zero, 3 # $t4 <- 3
mul  $t3, $t4, $t3 # d = 3 * d = 3 * (b + c + 8)
sub  $t3, $t0, $t3 # d = a - d = a - 3 * (b + c + 8)

li $t0, 5
li $t1, 10
li $t2, 3
# c = ( a < b ) || ( (a + b) == 10 )
#  a -> $t0, b -> $t1, c -> $t2

add $t3, $t0, $t1  ### tmp1 = a + b
seq $t3, $t3, 10   ## tmp1 = ((a+b) == 10) ? 1 : 0
slt $t2, $t0, $t1  ## c = (a < b) ? 1 : 0 
or  $t2, $t2, $t3  ## c = ( a < b ) || ( (a + b) == 10 )






