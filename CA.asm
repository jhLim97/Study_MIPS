.globl main
.data
tab: .asciiz "\t"
msg: .asciiz "Select Procedure : "
one: .asciiz "a is : "
two: .asciiz "b is : "
three: .asciiz " is multiple of three!"
four: .asciiz " is not multiple of three!"
five: .asciiz "-- program is finished running --"
six: .asciiz "n is : "
.text
main:
la $a0 msg
li $v0 4
syscall
li $v0 5
syscall
#Select Procedure값 입력 받음
add $t0 $v0 $zero
addi $sp, $sp, -4
#스택 포인터을 움직여 스택 공간을 확보
sw $ra, 0($sp)
#ra 레지스터 값을 스택에 저장
slti $t1 $t0 2
beq $t1 $zero L
#Select Procedure값이 2일경우 L로 브랜치
jal first 
#first함수호출
j out
#out으로 점프
L:
jal second
#seconf함수호출
out:
lw $ra, 0($sp)
#ra 레지스터 값 복원
addi $sp, $sp, 4
#스택 포인터 복원
li $v0 10
syscall
#프로그램 종료
first:
#a-b가 3의 배수인지 판별하는 함수
la $a0 one
li $v0 4
syscall
li $v0 5
syscall
add $t0 $v0 $zero
#a값 입력 받은 후 임시변수 t0레지스터에 a값 대입
la $a0 two
li $v0 4
syscall
li $v0 5
syscall
add $t1 $v0 $zero
#b값 입력 받은 후 임시변수 t1레지스터에 b값 대입
sub $t2 $t0 $t1
#임시변수 t2레지스터에 a-b값 대입
addi $t3 $zero 3
#임시변수 t3레지스터에 3대입
 div $t2 $t3
 mfhi $t3
 #a-b를 3으로 나눴을 때 나머지를 임시변수 t3에 대입
 add $a0 $t2 $zero 
 li $v0 1
 syscall
 beq $t3 $zero yes
 #3의 배수가 아닐 경우
 la $a0 four
 li $v0 4
 syscall
 j out1

yes:
#3의 배수일 경우
la $a0 three
li $v0 4
syscall

out1:
jr $ra

second:
#n까지의 점화식 계산 후 출력
la $a0 six
li $v0 4
syscall
li $v0 5
syscall
add $t0 $v0 $zero
#임시변수 t0에 n값 대입
la $a0 one
li $v0 4
syscall
li $v0 5
syscall
add $t1 $v0 $zero
#임시변수 t1에 a값 대입
addi $t2 $zero 1
addi $t3 $zero 1
addi $t5 $zero 1
add $a0 $t2 $zero
#임시변수 t2,t3,t5에 각각 1대입
li $v0 1
syscall
la $a0 tab
li $v0 4
syscall
add $a0 $t2 $zero
li $v0 1
syscall
loop:
add $t4 $t2 $zero
add $t2 $t2 $t3
add $t2 $t2 $t1
add $t3 $t4 $zero
addi $t5 $t5 1
la $a0 tab
li $v0 4
syscall
add $a0 $t2 $zero
li $v0 1
syscall
bne $t5 $t0 loop
#n까지 출력 후 종료

jr $ra
#호출당한 장소로 돌아감



