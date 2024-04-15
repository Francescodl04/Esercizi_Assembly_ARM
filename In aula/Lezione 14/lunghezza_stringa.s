@Francesco Di Lena

@Sviluppare un codice ARM che, data una stringa,
@ne calcoli la lunghezza

.arm

.text
    .global main

    end:
        B end

    stringLength:
        @Uso il registro R2 per mantenere l'indirizzo nel quale mi trovo
        @e per poter confrontare il valore con il carattere terminatore
        LDRB R2, [R0, R1] @R1 costituisce l'offset per indicare lo spostamento dal carattere iniziale della stringa
        CMP R2, #0
        ADDNE R1, R1, #1
        BNE stringLength
        B end

    main:
        @Dichiaro in R0 il primo carattere della stringa, mentre in R1 la lunghezza della stringa
        LDR R0, =string
        MOV R1, #0
        B stringLength

    .bss
    @Non ho bisogno in questo esercizio di spazi di memoria non allocati

    .data
        string: 
            .ascii "Questa stringa e' lunga 36 caratteri"
            .byte 0
            .align @Allineo a gruppi di 4 i byte della stringa 
