@Francesco Di Lena
@Secondo esercizio laboratorio 3 - seconda parte (con uso di frame pointer) - 30-04-2024
@File completo con tutte le procedure per essere compilato su emulatore
@Architettura degli elaboratori - A.A. 2023-2024

.data

   n: .word 200 @ dimensione array

   @ Alloca e inizializza un vettore di 200 word

   V: .word -697, 1625, -873, 1375, -158, 1162, -1590, -1971, -345, 1981, 260, -956, 1329, 784, -1003, 968, 1346, 802, 855, -1649, -1579, -1634, -75, -1027, -842, -1669, -526, 181, 904, 881, 96, 668, -1467, 1421, -1420, 166, 1119, -561, -564, 1779, 1700, -585, -1603, -1819, -514, -1740, 498, -1389, 947, 1099, 1197, -1850, -584, -325, 387, -1480, 1335, 1818, 975, 1667, 1402, 1047, -273, -1091, -46, -562, -635, -1700, -1194, 1053, 713, -1857, -1577, 1657, -1930, 1064, -278, 563, 1473, -1871, 1767, 662, 91, -1045, 110, 225, -1095, 959, -720, 690, -693, 250, -1252, -628, 1468, 502, -820, 931, 1051, 511, 522, -130, 833, 204, 1238, -1736, 1721, 978, -1475, 1472, 1788, -1870, -788, -595, 419, -824, -146, -1333, -292, 311, -1873, -994, -1518, 1631, -905, -805, 544, 1960, -128, 333, -125, 1046, -1093, -1720, 356, 524, -316, -1395, -1761, -1515, -339, -1542, -40, -245, 1058, 103, 85, 1885, 29, -762, 1146, 1449, -520, -1746, -807, -1627, 135, -1586, 415, 1746, -1738, -1370, 193, -1782, 302, -1881, 1584, 1240, -1349, 363, 566, -138, -1891, 521, -1457, -1621, 1077, -479, -1713, -846, 1908, 679, 1060, 1132, 1126, 534, -230, -670, 1461, -1698, 1129, 1272, 1299, 813, 1453, -1772, 239, 355, 850, 1388

.bss
   .skip 16384
   stack_base: .skip 4

.text

.global _start

_start:
   LDR SP, =stack_base
   LDR R1, =n              @ carica indirizzo con la dimensione
   LDR R1, [R1]            @ carica la lunghezza dell'array in r1
   LDR R0, =V              @ indirizzo del vettore in r0
   PUSH {R0, R1}           @ inserisco nello stack i parametri da passare alla procedura find_max
   BL find_max             @ chiama la funzione per trovare il massimo
   POP {R0, R1, PC, FP}    @ recupera valori iniziali dei registri

@ Input:
@   * FP + 8: indirizzo in memoria del vettore di interi con segno;
@   * FP + 12: numero di elementi del vettore;

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
   
   PUSH {LR, FP}
   MOV FP, SP
   PUSH {R1-R4}
   LDR R0, [FP, #8]
   LDR R1, [FP, #12]  
   MOV R2, #1 @parte dal valore 1 perché non confronto l'elemento di indice 0 con se stesso
   MOV R3, R0
   ADD R3, R3, #4
   LDR R4, [R0]
   BL loop
   POP {R1-R4}
   POP {FP, PC}

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




   


