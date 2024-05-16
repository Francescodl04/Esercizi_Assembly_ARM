@Francesco Di Lena
@Secondo esercizio laboratorio 3 - 30-04-2024
@Procedura per determinare il massimo elemento di un array (da compilare insieme al file main_max.s)
@Architettura degli elaboratori - A.A. 2023-2024

.text
.global find_max

@ Input:
@   * R0: indirizzo in memoria del vettore di interi con segno;
@   * R1: numero di elementi del vettore;

@ Output:
@   * R0: il valor massimo del vettore

find_max:
   @@@ istruzioni della funzione max
   @Uso dei registri nella procedura:
   @  R0: indirizzo del primo elemento del vettore
   @  R1: numero di elementi nel vettore
   @  R2: indice temporaneo array (che parte dal valore 1 perché non confronto l'elemento di indice 0 con se stesso)
   @  R3: contiene il valore da confrontare con il massimo
   @  R4: contiene l'offset da R0
   @  R5: contiene il valore temporaneo del massimo
   
   PUSH {R2-R5, LR}
   MOV R2, #1
   LDR R3, [R0]
   ADD R3, R3, #1
   MOV R4, R2
   B loop
   LDR R0, [R0]
   POP {R2-R5, LR}
   MOV PC, LR   @ ritorna alla funzione chiamante.

loop:
   LDR R5, [R0]
   CMP R3, R5
   LDRGT R0, [R0, R4]
   MOVGT R4, #0
   ADD R2, R2, #1
   ADD R3, R3, #1
   ADD R4, R4, #1
   CMP R2, R1
   BLO loop




   


