@Francesco Di Lena
@Secondo esercizio laboratorio 3 - 30-04-2024
@File completo con tutte le procedure per essere compilato su emulatore
@Architettura degli elaboratori - A.A. 2023-2024

.data

n: .word 200 @ dimensione array

@ Alloca e inizializza un vettore di 200 word

V: .word -697, 1625, -873, 1375, -158, 1162, -1590, -1971, -345, 260, -956, 1329, 784, -1003, 968, 1346, 802, 855, -1649, -1579, -1634, -75, -1027, -842, -1669, -526, 181, 904, 881, 96, 668, -1467, 1421, -1420, 166, 1119, -561, -564, 1779, 1700, -585, -1603, -1819, -514, -1740, 498, 1981, -1389, 947, 1099, 1197, -1850, -584, -325, 387, -1480, 1335, 1818, 975, 1667, 1402, 1047, -273, -1091, -46, -562, -635, -1700, -1194, 1053, 713, -1857, -1577, 1657, -1930, 1064, -278, 563, 1473, -1871, 1767, 662, 91, -1045, 110, 225, -1095, 959, -720, 690, -693, 250, -1252, -628, 1468, 502, -820, 931, 1051, 511, 522, -130, 833, 204, 1238, -1736, 1721, 978, -1475, 1472, 1788, -1870, -788, -595, 419, -824, -146, -1333, -292, 311, -1873, -994, -1518, 1631, -905, -805, 544, 1960, -128, 333, -125, 1046, -1093, -1720, 356, 524, -316, -1395, -1761, -1515, -339, -1542, -40, -245, 1058, 103, 85, 1885, 29, -762, 1146, 1449, -520, -1746, -807, -1627, 135, -1586, 415, 1746, -1738, -1370, 193, -1782, 302, -1881, 1584, 1240, -1349, 363, 566, -138, -1891, 521, -1457, -1621, 1077, -479, -1713, -846, 1908, 679, 1060, 1132, 1126, 534, -230, -670, 1461, -1698, 1129, 1272, 1299, 813, 1453, -1772, 239, 355, 850, 1388

.text

.global _start

_start:    
    @PUSH {R0, R1, LR}   @ salva contenuto registri
    LDR R1, =n          @ carica indirizzo con la dimensione
    LDR R1, [R1]        @ carica la lunghezza dell'array in r1
    LDR R0, =V          @ indirizzo del vettore in r0
    B find_max         @ chiama la funzione per trovare il massimo
    BKPT
    @POP {R0, R1, LR}    @ recupera valori iniziali dei registri
    MOV PC, LR          @ esci

find_max:
   @@@ istruzioni della funzione max
   @Uso dei registri nella procedura:
   @  R0: indirizzo del primo elemento del vettore
   @  R1: numero di elementi nel vettore
   @  R2: indice temporaneo array (che parte dal valore 1 perché non confronto l'elemento di indice 0 con se stesso)
   @  R3: contiene il valore da confrontare con il massimo
   @  R4: contiene l'offset da R0
   @  R5: contiene il valore temporaneo del massimo
   
   PUSH {R2-R5}
   MOV R2, #1
   LDR R3, [R0]
   ADD R3, R3, #1
   MOV R4, R2
   B loop
   LDR R0, [R0]
   POP {R2-R5}
   MOV PC, LR   @ ritorna alla funzione chiamante.

loop:
   LDR R5, [R0]
   CMP R3, R5
   LDRGT R0, [R0], R4
   MOVGT R4, #0
   ADD R2, R2, #1
   ADD R3, R3, #1
   ADD R4, R4, #1
   CMP R2, R1
   BLO loop
