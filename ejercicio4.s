.data
	String: .asciz " %d \n"
.text
  .globl main


main:
    sub sp, sp, 16
    str x30, [sp]
    ldr x21, [x1, 8]
    mov x0, x21
    bl atoi
fact:
    add SP, SP, #-16
    str x19, [sp, 0]
    str x30, [SP, 8]         // guardamos x30 para poder llamar a funciones

    mov x19, x0
    cmp x19, 1
    b.lt cambio
    sub x0, x19, 1
    bl fact
    mul  x0, x19, x0
    b fin_fact
cambio:
    mov x0, 1

fin_fact:
    ldr x19, [sp, 0]
    ldr x30, [sp, 8]
    add sp, sp, 16
    ret
    b exit
exit:
    mov x1, x0
    ldr x0, =String
    bl printf

    // restauramos los registros
    mov x1, x30
    ldr x19, [sp, 0]
    ldr x30, [SP, 8]
    add SP, SP, #16 // retornamos el espacio prestado del stack
    ret // retornamos al SO
