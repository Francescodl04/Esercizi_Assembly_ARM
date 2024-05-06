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
   @  R0: indirizzo del primo elemento (considerato massimo)
   @  R1: indirizzo 
   MOV PC, LR   @ ritorna alla funzione chiamante.



