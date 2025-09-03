.data
    msg_n:      .asciiz "Ingresar la cantidad de números que va a comparar, debe ser entre 3 y 5: "
    msg_num:    .asciiz "Ingrese un número: "
    msg_mayor:  .asciiz "El número mayor es: "
    error_msg:  .asciiz "Error: debe ingresar entre 3 y 5 números.\n"

.text
main:
    # Mostramos mensaje para pedir cuántos números se van a comparar
    li $v0, 4
    la $a0, msg_n
    syscall
    # Leemos la cantidad de números (n)
    li $v0, 5
    syscall
    move $t0, $v0  # Guardamos la cantidad en $t0

    # Verificamos que n sea 3, 4 o 5
    li $t1, 3      # Cargamos el mínimo permitido (3)
    li $t2, 5      # Cargamos el máximo permitido (5)
    blt $t0, $t1, error  # Si n es menor que 3, saltamos a error
    bgt $t0, $t2, error  # Si n es mayor que 5, saltamos a error

    # Leemos el primer número (será el mayor inicial)
    li $v0, 4      # Mostramos mensaje para pedir número
    la $a0, msg_num
    syscall
    li $v0, 5      # Leemos el número
    syscall
    move $t3, $v0  # Guardamos el primer número en $t3 (mayor actual)
    li $t4, 1      # Iniciamos contador en 1 (ya leímos 1 número)

loop:
    # Si ya leímos todos los números, terminamos el bucle
    bge $t4, $t0, end_loop

    # Pedimos el siguiente número
    li $v0, 4
    la $a0, msg_num
    syscall
    li $v0, 5
    syscall
    move $t5, $v0  # Guardamos el número leído en $t5

    # Comparamos si el nuevo número es mayor que el actual mayor
    bgt $t5, $t3, update_mayor  # Si es mayor, actualizamos
    j no_update                # Si no, seguimos sin cambiar el mayor

update_mayor:
    move $t3, $t5  # Actualizamos el mayor

no_update:
    addi $t4, $t4, 1  # Aumentamos el contador
    j loop            # Volvemos al inicio del bucle

end_loop:
    # Mostramos el mensaje del número mayor
    li $v0, 4
    la $a0, msg_mayor
    syscall
    # Mostramos el número mayor
    li $v0, 1
    move $a0, $t3
    syscall
    # Terminamos el programa
    li $v0, 10
    syscall

error:
    # Mostramos mensaje de error
    li $v0, 4
    la $a0, error_msg
    syscall
    # Terminamos el programa con error
    li $v0, 10
    syscall

