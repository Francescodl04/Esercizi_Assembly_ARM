@Francesco Di Lena

@Sviluppare un codice ARM che, dato un carattere in
@input, controlla se il carattere è una lettera
@minuscola oppure no

.arm

.text

.global main

main: 
    @Dichiaro il valore dei due registri coinvolti nel programma: R0 e R1
    MOV r0, #0x10
    MOV r1, #0x0

    @Prima valutazione: r0 è minore di 97?
    CMP r0, #0x61
    MOVLT r1, #0x2
    BLT end

    @Seconda valutazione: r0 è maggiore di 122?

    CMP r0, #0x7A
    MOVGT r1, #0x2
    BGT end

    @Ora ci troviamo al caso dell'"else": arrivati qui siamo sicuri che il carattere sia minuscolo

    MOV r1, #0x1
    BKPT

end:
    BKPT

