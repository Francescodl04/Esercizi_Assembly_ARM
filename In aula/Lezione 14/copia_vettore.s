@Francesco Di Lena

@Sviluppare un codice ARM che, dato un vettore 
@ne esegua la copia in un altro spazio di memoria

.arm

.text

    .global main

    end:
        B end

    arrayCopy:
        @Carico la word del primo vettore nel registro R3
        LDR R3, [R1], #4
        @Inserisco la parola dal registro R3 a R2 (che contiene il secondo array)
        STR R3, [R2], #4
        @Ora verifico se sono alla fine del processo: se ho ancora parole da copiare, 
        @allora ripeto il ciclo del branch arrayCopy
        CMP R1, R0
        BLT arrayCopy
        B end

    main:
        @Inserisco nei registri di memoria R1 e R2 gli indirizzi dei due array
        LDR R1, =array1
        LDR R2, =array2
        @Ora faccio in modo che il registro R0 contenga l'indirizzo al quale si deve fermare 
        @per eseguire la copia del primo array nel secondo (indirizzo array1 + 480 byte)
        MOV R0, #nByte
        ADD R0, R0, R1
        @Eseguo ora la copia da array1 a array2
        B arrayCopy
    
    .bss
        @Dichiaro lo spazio di memoria che mi consentirà di copiare il vettore
        array2: .skip nByte
    
    .data 
        .equ nByte, 480
        array1: @Dichiaro l'array da copiare
            .ascii "Registers R0 to R7 are unbanked registers. This me"
            .ascii "ans that each of them refers to the same 32-bit ph"
            .ascii "ysical register in all processor modes. They are c"
            .ascii "ompletely general-purpose registers, with no speci"
            .ascii "al uses implied by the architecture, and can be us"
            .ascii "ed wherever an instruction allows a general-purpos"
            .ascii "e register to be specified. Registers R8 to R14 ar"
            .ascii "e banked registers. The physical register referred"
            .ascii "to by each of them depends on the current processo"
            .ascii "r mode. Where a particular phy"