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

    # ??c s? nguyên t? ng??i dùng
    li $v0, 5
    syscall

    move $s0, $v0    # L?u giá tr? s? vào $s0

    # Tính s? ngh?ch ??o
    li $t0, 0         # Kh?i t?o giá tr? ??o ban ??u là 0
    move $t1, $s0     # Sao chép giá tr? s? vào $t1

    compute_inverse:
        rem $t2, $t1, 10    # L?y ph?n d? c?a $t1 khi chia cho 10
        mul $t0, $t0, 10    # Nhân $t0 v?i 10
        add $t0, $t0, $t2   # C?ng ph?n d? vào $t0
        div $t1, $t1, 10    # Chia $t1 cho 10
        bnez $t1, compute_inverse   # L?p l?i cho ??n khi $t1 b?ng 0

    # Xu?t k?t qu?
    la $a0, result
    li $v0, 4
    syscall

    move $a0, $t0    # ??a giá tr? s? ngh?ch ??o t? $t0 vào $a0 ?? in ra
    li $v0, 1
    syscall

    # K?t thúc ch??ng trình
    li $v0, 10
    syscall
