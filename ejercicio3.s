
.data
	String: .asciz "El resultado de la operacion es: %d \n"
.text
  .globl main

sumar:
    // x0 = x0 + x1
    // aqui solo hay que utilizar la funcion add
    add x0, x0, x1
    ret
resta:
    sub x0, x0, x1
    // Su codigo aqui
    ret
mult:
    mul x0, x0, x1
    // Su codigo aqui
    ret
div:
    sdiv x0, x0, x1
    // Su codigo aqui
    ret
and:
    and x0, x0, x1
    // Su codigo aqui
    ret
or:
    orr x0, x0, x1
    // Su codigo aqui
    ret
xor:
    eor x0,x0,x1
    // Su codigo aqui
    ret
sll:
    lslv x0, x0, x1
    // Su codigo aqui
    ret
srl:
    lsrv x0, x0, x1
    // Su codigo aqui
    ret
sra:
    asr x0, x0, x1
    // Su codigo aqui	
    ret

main:
    add SP, SP, #-16
    str x30, [SP]         // guardamos x30 para poder llamar a funciones

    ldr x21, [x1, 8]
    ldr x22, [x1, 16]
    ldr x23, [x1, 24]

    mov x0, x21
    bl atoi
    mov x21, x0
  
    mov x0, x23
    bl atoi
    mov x23, x0

    mov x0, x21
    mov x1, x23
    cmp x1, 2
    b.ne sumar	 // mandamos a llamar a add
    mov x1, x0
    ldr x0, =String
    bl printf
    b exit

exit:
    // restauramos los registros
    mov x1	, x30
    ldr x30, [SP]
    add SP, SP, #16 // retornamos el espacio prestado del stack
    ret // retornamos al SO
