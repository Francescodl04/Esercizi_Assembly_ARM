@Francesco Di Lena

@Sviluppare un codice ARM che, dato un numero,
@ne calcoli il fattoriale
.arm

.text
    .global main

    end:
        B end

    overflow:
        MOV R0, #0
        B end

    factorialCycle:
        MUL R0, R0, R1
        SUB R1, R1, #1
        CMP R1, #0
        BEQ end
        BNE factorialCycle

    factorial:
        @Prima di tutto devo verificare che il numero di R0 non superi 12:
        @13! non è rappresentabile con 32 bit
        CMP R0, #12
        BGT overflow

        @Se in R0 ho 0, allora inserisco il valore 1, perché 0! = 1
        CMP R0, #0
        MOVEQ R0, #1
        BEQ end

        @In tutti gli altri casi uso R1 come apppoggio per mantere il valore di n
        MOV R1, R0
        MOV R0, #1
        B factorialCycle

    main:
        @Dichiaro inizialmente in R0 il valore di cui bisogna calcolare il fattoriale
        @R0 conterrà poi, dopo le operazioni, n!, oppure 0 in caso di overflow
        MOV R0, #6
        B factorial
    