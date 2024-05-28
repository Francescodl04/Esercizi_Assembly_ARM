@Francesco Di Lena
@Primo esercizio laboratorio 2 (modificato con somma di quadrati di valori negativi)  - 23-04-2024
@Architettura degli elaboratori - A.A. 2023-2024

.data
   addr_n: .word 15		@ Word in memoria con il valore di n 
.bss
   addr_sum: .skip 4		@ Word in memoria dove salvare il valore finale
.text
   .global main
main:
   @Contenuto dei vari registri:
   @ r0: contiene la somma parziale
   @ r1: contiene il contatore
   @ r2: contiene il quadrato calcolato in ogni iterazione (r2 = r1*r1)
   @ r3: contiene il valore n
   @ r4: contiene l'indirizzo in memoria di n
   @ r5: contiene l'indirizzo in memoria di sum.
   
   @@@ Inizializzazione variabili e ciclo for
   
   MOV R0, #0
   MOV R1, #-5
   MOV R2, #0
   LDR R4, =addr_n
   LDR R3, [R4]
   LDR R5, =addr_sum
   B loop
   
loop:
     @@@ Parte principale del loop 
     MUL R2, R1, R1
     ADD R0, R0, R2
     ADD R1, R1, #1
     @@@ Verifica fine ciclo for: 
     CMP R1, R3
     @@@  1. salto a loop per ripetere
     BLE loop
     @@@  2. oppure continua dritto se il ciclo for è terminato
     
  
   @@@ Parte finale del programma
   
   STR R0, [R5]
   MOV PC, LR 