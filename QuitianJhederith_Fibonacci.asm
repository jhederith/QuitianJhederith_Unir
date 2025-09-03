.data
    msg_n:         .asciiz "Ingrese la cantidad de números de la serie Fibonacci a generar: "
    msg_serie:     .asciiz "Serie Fibonacci: "
    msg_suma:      .asciiz "Suma total: "
    espacio:       .asciiz " "
    nueva_linea:   .asciiz "\n"

.text
main:
    # Preguntamos cuántos números de Fibonacci quiere generar
    li $v0, 4               # "Encendemos la pantalla" para mostrar mensaje
    la $a0, msg_n           # Cargamos el texto de la pregunta
    syscall                 # Mostramos: "Ingrese la cantidad..."
    li $v0, 5               # Preparamos para leer un número
    syscall                 # El usuario escribe cuántos números quiere
    move $t0, $v0           # Guardamos ese número en $t0 (n)

    # Inicializamos las variables
    li $t1, 0               # $t1 = 0 (primer número de Fibonacci)
    li $t2, 1               # $t2 = 1 (segundo número)
    li $t3, 0               # $t3 = contador (cuántos números hemos impreso)
    li $t4, 0               # $t4 = suma total (empezamos en 0)

    #  Mostramos el título de la serie
    li $v0, 4
    la $a0, msg_serie
    syscall

    #  Si el usuario puso 0, no hacemos nada (solo suma=0)
    beq $t0, $zero, end     # Si n=0, saltamos al final

    # Imprimimos el PRIMER número (siempre es 0)
    li $v0, 1               # Modo "imprimir número"
    move $a0, $t1           # Cargamos el 0
    syscall
    add $t4, $t4, $t1       # Sumamos 0 a la suma total (sigue siendo 0)
    addi $t3, $t3, 1        # Contador = 1 (ya imprimimos 1 número)

    # Si solo quería 1 número, terminamos aquí
    beq $t0, $t3, end       # Si n=1, saltamos al final

    # Imprimimos un espacio y el SEGUNDO número (siempre es 1)
    li $v0, 4
    la $a0, espacio
    syscall
    li $v0, 1
    move $a0, $t2           # Cargamos el 1
    syscall
    add $t4, $t4, $t2       # Sumamos 1 (ahora suma=1)
    addi $t3, $t3, 1        # Contador = 2 (ya imprimimos 2 números)

    # Si solo quería 2 números, terminamos aquí
    beq $t0, $t3, end       # Si n=2, saltamos al final

loop:
    # Si ya imprimimos todos los números, terminamos
    bge $t3, $t0, end       # Si contador >= n, salimos del bucle

    # Calculamos el SIGUIENTE número: c = a + b
    add $t5, $t1, $t2       # $t5 = $t1 + $t2 (ej: 0 + 1 = 1)

    #  Imprimimos un espacio antes del nuevo número
    li $v0, 4
    la $a0, espacio
    syscall

    # Imprimimos el nuevo número
    li $v0, 1
    move $a0, $t5
    syscall

    #  Lo sumamos a la cuenta total
    add $t4, $t4, $t5       

    # Actualizamos los números para la próxima vuelta
    move $t1, $t2           # $t1 ahora es el viejo $t2 (1)
    move $t2, $t5           # $t2 ahora es el nuevo número (1)

    # umentamos el contador
    addi $t3, $t3, 1        # 
    j loop                  # Volvemos al inicio del bucle

end:
    # Saltamos a una nueva línea
    li $v0, 4
    la $a0, nueva_linea
    syscall
    li $v0, 4
    la $a0, msg_suma
    syscall
    li $v0, 1
    move $a0, $t4          
    syscall
# Terminamos el programa
    li $v0, 10              
    syscall
