@Francesco Di Lena

@Sviluppare un codice ARM che data una stringa
@ascii, la riscrive tutta in maiuscolo

.arm

.text

    .global main

        main: 
            LDR r1, =string
            LDR r2, =upperString
            LDR r3, =charNumber

        singleByteAnalysis:
            LDRB r0, [r1] @Carico un carattere della stringa (che si trova nel registro r1)
            CMP r0, #97
            BLT write
            CMP r0, #122
            BGT write
            SUBLT r0, r0, #32 @Faccio la sottrazione e poi scrivo il carattere maiuscolo

        write:
            STRB r0, [r2] @Inserisco il valore di un byte di r0 in r2
            ADD r2, r2, #1 @Incremento il puntatore del carattere di r2
            ADD r1, r1, #1 @Incremento il puntatore del carattere della stringa
            SUB r3, r3, #1 @Decremento il numero di caratteri ancora da analizzare
            CMP r3, #0
            BNE singleByteAnalysis
            BKPT

    .bss
        upperString: .skip 13

    .data
        string: .ascii "Ciao mondo!"
        .equ charNumber, 11