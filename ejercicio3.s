
.data
	String: .asciz "El resultado de la operacion es: %d \n"
.text
  .globl main

sumar:
    // x0 = x0 + x1
    // aqui solo hay que utilizar la funcion add
    add x0, x0, x1
    b exit
resta:
    sub x0, x0, x1
    // Su codigo aqui
    b exit
mult:
    mul x0, x0, x1
    // Su codigo aqui
    b exit
div:
    sdiv x0, x0, x1
    // Su codigo aqui
    b exit
and:
    and x0, x0, x1
    // Su codigo aqui
    b exit
or:
    orr x0, x0, x1
    // Su codigo aqui
    b exit
xor:
    eor x0,x0,x1
    // Su codigo aqui
    b exit
sll:
    lslv x0, x0, x1
    // Su codigo aqui
    b exit
srl:
    lsrv x0, x0, x1
    // Su codigo aqui
    b exit
sra:
    asr x0, x0, x1
    // Su codigo aqui	
    b exit

main:
    add SP, SP, #-16
    str x30, [SP]         // guardamos x30 para poder llamar a funciones

    ldr x21, [x1, 8]
    ldr x9, [x1, 16]
    ldrb w19, [x9, 0]
    ldr x23, [x1, 24]

    mov x0, x21
    bl atoi
    mov x21, x0
  
    mov x0, x23
    bl atoi
    mov x23, x0

    mov x0, x21
    mov x1, x23

    cmp w19, '+'
    b.eq sumar

    cmp w19, '-'
    b.eq resta

    cmp w19, 'x'
    b.eq mult

    cmp w19, '/'
    b.eq div

exit:
    // restauramos los registros
    mov x1, x0
    ldr x0, =String
    bl printf

    mov x1	, x30
    ldr x30, [SP]
    add SP, SP, #16 // retornamos el espacio prestado del stack
    ret // retornamos al SO
