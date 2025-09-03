.data
    msg_n:      .asciiz "Ingresar la cantidad de números que va a comparar, debe ser entre 3 y 5: "
    msg_num:    .asciiz "Ingrese un número: "
    msg_menor:  .asciiz "El número menor es: "
    error_msg:  .asciiz "Error: debe ingresar entre 3 y 5 números.\n"

.text
main:
    # Al igual que en el anterior, pedimos los números
    li $v0, 4               # "Encendemos la pantalla" para mostrar mensaje
    la $a0, msg_n           # Cargamos el texto de la pregunta
    syscall                 # Mostramos: "Ingrese la cantidad..."
    li $v0, 5               # Preparamos para leer un número
    syscall                 # El usuario escribe cuántos números dará
    move $t0, $v0           # Guardamos ese número
    # Verificamos que sea 3, 4 o 5 (si no, error)
    li $t1, 3               # Guardamos el 3 (mínimo)
    li $t2, 5               # Guardamos el 5 (máximo)
    blt $t0, $t1, error     # Si es menos de 3 → error
    bgt $t0, $t2, error     # Si es más de 5 → error
    # Leemos el primer número
    li $v0, 4
    la $a0, msg_num
    syscall
    li $v0, 5
    syscall
    move $t3, $v0           # Guardamos el primer número como "menor inicial"
    # Contamos desde el segundo número (ya leímos 1)
    li $t4, 1               # $t4 = contador (empezamos en 1)

loop:
    bge $t4, $t0, end_loop  # Si ya leímos todos, terminamos
    # Pedimos otro número
    li $v0, 4
    la $a0, msg_num
    syscall
    li $v0, 5
    syscall
    move $t5, $v0           # Guardamos el nuevo número aquí
    # Verificamos si es más pequeño que el actual
    bge $t5, $t3, no_update # Si es MAYOR o IGUAL → ignoramos (¡CORRECCIÓN!)
    move $t3, $t5           # Si es MENOR → actualizamos el menor

no_update:
    addi $t4, $t4, 1        # Aumentamos el contador (pasamos al siguiente)
    j loop                  # Volvemos a pedir números

end_loop:
    # Mostramos el resultado
    li $v0, 4
    la $a0, msg_menor       # "El número menor es: "
    syscall
    li $v0, 1               # Modo "imprimir número"
    move $a0, $t3           # Cargamos el menor encontrado
    syscall
    # Cerramos el programa
    li $v0, 10              # "Apagamos la computadora"
    syscall

error:
    # Si el usuario se equivocó con la cantidad (ej: puso 2)
    li $v0, 4
    la $a0, error_msg       # Mostramos el mensaje de error
    syscall
    j main                  # Volvemos al inicio (sin borrar nada)
