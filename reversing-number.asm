.data
    prompt: .asciiz "Nhap mot so: "
    result: .asciiz "So nghich dao: "

.text
.globl main
main:
    # In prompt
    la $a0, prompt
    li $v0, 4
    syscall

    # ??c s? nguy�n t? ng??i d�ng
    li $v0, 5
    syscall

    move $s0, $v0    # L?u gi� tr? s? v�o $s0

    # T�nh s? ngh?ch ??o
    li $t0, 0         # Kh?i t?o gi� tr? ??o ban ??u l� 0
    move $t1, $s0     # Sao ch�p gi� tr? s? v�o $t1

    compute_inverse:
        rem $t2, $t1, 10    # L?y ph?n d? c?a $t1 khi chia cho 10
        mul $t0, $t0, 10    # Nh�n $t0 v?i 10
        add $t0, $t0, $t2   # C?ng ph?n d? v�o $t0
        div $t1, $t1, 10    # Chia $t1 cho 10
        bnez $t1, compute_inverse   # L?p l?i cho ??n khi $t1 b?ng 0

    # Xu?t k?t qu?
    la $a0, result
    li $v0, 4
    syscall

    move $a0, $t0    # ??a gi� tr? s? ngh?ch ??o t? $t0 v�o $a0 ?? in ra
    li $v0, 1
    syscall

    # K?t th�c ch??ng tr�nh
    li $v0, 10
    syscall
