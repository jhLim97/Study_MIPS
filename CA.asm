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
#Select Procedure�� �Է� ����
add $t0 $v0 $zero
addi $sp, $sp, -4
#���� �������� ������ ���� ������ Ȯ��
sw $ra, 0($sp)
#ra �������� ���� ���ÿ� ����
slti $t1 $t0 2
beq $t1 $zero L
#Select Procedure���� 2�ϰ�� L�� �귣ġ
jal first 
#first�Լ�ȣ��
j out
#out���� ����
L:
jal second
#seconf�Լ�ȣ��
out:
lw $ra, 0($sp)
#ra �������� �� ����
addi $sp, $sp, 4
#���� ������ ����
li $v0 10
syscall
#���α׷� ����
first:
#a-b�� 3�� ������� �Ǻ��ϴ� �Լ�
la $a0 one
li $v0 4
syscall
li $v0 5
syscall
add $t0 $v0 $zero
#a�� �Է� ���� �� �ӽú��� t0�������Ϳ� a�� ����
la $a0 two
li $v0 4
syscall
li $v0 5
syscall
add $t1 $v0 $zero
#b�� �Է� ���� �� �ӽú��� t1�������Ϳ� b�� ����
sub $t2 $t0 $t1
#�ӽú��� t2�������Ϳ� a-b�� ����
addi $t3 $zero 3
#�ӽú��� t3�������Ϳ� 3����
 div $t2 $t3
 mfhi $t3
 #a-b�� 3���� ������ �� �������� �ӽú��� t3�� ����
 add $a0 $t2 $zero 
 li $v0 1
 syscall
 beq $t3 $zero yes
 #3�� ����� �ƴ� ���
 la $a0 four
 li $v0 4
 syscall
 j out1

yes:
#3�� ����� ���
la $a0 three
li $v0 4
syscall

out1:
jr $ra

second:
#n������ ��ȭ�� ��� �� ���
la $a0 six
li $v0 4
syscall
li $v0 5
syscall
add $t0 $v0 $zero
#�ӽú��� t0�� n�� ����
la $a0 one
li $v0 4
syscall
li $v0 5
syscall
add $t1 $v0 $zero
#�ӽú��� t1�� a�� ����
addi $t2 $zero 1
addi $t3 $zero 1
addi $t5 $zero 1
add $a0 $t2 $zero
#�ӽú��� t2,t3,t5�� ���� 1����
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
#n���� ��� �� ����

jr $ra
#ȣ����� ��ҷ� ���ư�



