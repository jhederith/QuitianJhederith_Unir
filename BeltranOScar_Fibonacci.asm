# Integrantes: 
# Esteban Quitian Diaz
# Oscar Ivan Beltran

.data
    mensaje_pedir_n:      .asciiz "¿Cuántos números de la serie Fibonacci desea generar?: "
    mensaje_serie:        .asciiz "Serie Fibonacci: "
    mensaje_suma:         .asciiz "\nSuma de la serie: "
    newline:              .asciiz "\n"
    espacio:              .asciiz " "
    
.text
.globl main

main:
    # Pedir la cantidad de números de la serie
    li $v0, 4                # syscall para imprimir string
    la $a0, mensaje_pedir_n
    syscall
    
    li $v0, 5                # syscall para leer entero
    syscall
    move $t0, $v0           # Guardar la cantidad en $t0 (n)
    
    # Inicializar los primeros dos números de la serie
    li $t1, 0                # t1 = a
    li $t2, 1                # t2 = b
    li $t3, 0                # t3 = suma
    li $t4, 0                # Contador
    
    # Imprimir "Serie Fibonacci: "
    li $v0, 4
    la $a0, mensaje_serie
    syscall
    
bucle_fibonacci:
    beq $t4, $t0, fin_bucle_fibonacci  # Si contador == n, terminar
    
    # Imprimir el número actual
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, espacio
    syscall
    
    # Calcular el siguiente número
    add $t5, $t1, $t2     # t5 = a + b
    move $t1, $t2        # a = b
    move $t2, $t5        # b = t5
    
    # Sumar al total
    add $t3, $t3, $t1
    
    # Incrementar el contador
    addi $t4, $t4, 1
    
    j bucle_fibonacci
    
fin_bucle_fibonacci:
    # Imprimir la suma
    li $v0, 4
    la $a0, mensaje_suma
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10               # syscall para salir
    syscall