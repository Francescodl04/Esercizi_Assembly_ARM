@Francesco Di Lena
@Secondo esercizio laboratorio 3 - prima parte (senza l'uso di frame pointer) - 30-04-2024
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
   @  R0: indirizzo del primo elemento del vettore (alla fine conterrà il valore massimo)
   @  R1: numero di elementi nel vettore
   @  R2: indice temporaneo array (come se fosse l'indice i di un for)
   @  R3: contiene l'indirizzo del valore da confrontare con il massimo
   @  R4: contiene temporaneamente il valore di R0 
   
   PUSH {R2-R4, LR}
   MOV R2, #1 @parte dal valore 1 perché non confronto l'elemento di indice 0 con se stesso
   MOV R3, R0
   ADD R3, R3, #4
   LDR R4, [R0]
   BL loop
   POP {R2-R4, LR}
   MOV PC, LR   @ ritorna alla funzione chiamante.

loop:
   LDR R5, [R3]
   CMP R5, R4 
   MOVGT R0, R3  
   LDRGT R4, [R3]
   ADD R2, R2, #1
   ADD R3, R3, #4
   CMP R2, R1
   BLO loop
   LDR R0, [R0]
   MOV PC, LR




   


