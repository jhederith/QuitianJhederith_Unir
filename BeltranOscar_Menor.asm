# Integrantes: 
# Esteban Quitian Diaz
# Oscar Ivan Beltran

.data
    mensaje_pedir_cantidad:   .asciiz "¿Cuántos números desea comparar? (3-5): "
    mensaje_pedir_numero:     .asciiz "Ingrese el número: "
    mensaje_numero_menor:     .asciiz "El número menor es: "
    mensaje_error_cantidad:  .asciiz "Cantidad inválida. Debe ser entre 3 y 5.\n"
    newline:                  .asciiz "\n"
    
.text
.globl main

main:
    # Pedir la cantidad de números
    li $v0, 4                # syscall para imprimir string
    la $a0, mensaje_pedir_cantidad
    syscall
    
    li $v0, 5                # syscall para leer entero
    syscall
    move $t0, $v0           # Guardar la cantidad en $t0
    
    # Validar la cantidad
    blt $t0, 3, error_cantidad  # Si $t0 < 3, ir a error_cantidad
    bgt $t0, 5, error_cantidad  # Si $t0 > 5, ir a error_cantidad
    
    # Inicializar el número menor con el primer número
    li $v0, 4
    la $a0, mensaje_pedir_numero
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0           # Guardar el primer número en $t1 (menor actual)
    
    # Bucle para leer y comparar los números restantes
    li $t2, 1                # Inicializar el contador en 1
bucle_menor:
    bge $t2, $t0, fin_bucle_menor  # Si $t2 >= $t0, terminar el bucle
    
    li $v0, 4
    la $a0, mensaje_pedir_numero
    syscall
    
    li $v0, 5
    syscall
    move $t3, $v0           # Guardar el número ingresado en $t3
    
    blt $t3, $t1, actualizar_menor  # Si $t3 < $t1, actualizar el menor
    
    incrementar_contador_menor:
    addi $t2, $t2, 1         # Incrementar el contador
    j bucle_menor
    
actualizar_menor:
    move $t1, $t3           # Actualizar el menor ($t1 = $t3)
    j incrementar_contador_menor
    
fin_bucle_menor:
    # Mostrar el número menor
    li $v0, 4
    la $a0, mensaje_numero_menor
    syscall
    
    li $v0, 1                # syscall para imprimir entero
    move $a0, $t1           # Cargar el número menor en $a0
    syscall
    
    li $v0, 10               # syscall para salir del programa
    syscall
    
error_cantidad:
    li $v0, 4
    la $a0, mensaje_error_cantidad
    syscall
    
    j fin_programa
    
fin_programa:
    li $v0, 10
    syscall