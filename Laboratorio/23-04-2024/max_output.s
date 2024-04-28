@Francesco Di Lena
@Secondo esercizio laboratorio 2 (con stampa su output) - 23-04-2024
@Architettura degli elaboratori - A.A. 2023-2024

.data

n: .word 200 @ dimensione array

@ Alloca e inizializza un vettore di 200 word 

V: .word 9358, 2004, -4825, 1350, 4430, -8168, 5440, 5889, -8785, 1553, -6649, -4573, 5614, 1554, -5869, -1917, -6712, -3810, -4482, -1818, -1468, 4551, 5502, -2013, -7377, -3975, 579, 8881, -4537, 9575, 2758, 4301, -4233, 3608, 4407, -3995, -2806, -1554, 4156, -4797, -5685, -5405, -5070, -4702, 6903, -2431, -545, 6623, -7757, -1472, 8585, 6527, 5596, -4869, -5453, 9987, 3885, -6509, -7289, 4761, -687, 4402, -9686, -6855, -3430, -4706, 1938, 3581, -1134, -770, -2411, 4784, 3399, 2006, 2544, 6287, -9439, -4646, 7949, -5312, -2208, 8538, -5928, -351, -6919, -4260, -5623, 3523, -3881, 6036, -8544, 300, -3800, -7033, 8003, 9185, 8788, 2787, 1557, 8490, 8476, -1035, -7864, 1288, 6058, 6139, -3197, -5075, 8050, -5813, 1151, 9964, 7935, -5460, -4756, 4739, 2114, -7874, -4010, 7757, -8588, -726, 9005, -3026, -8511, -8550, 6983, 1790, 3644, 7301, -3878, 3299, 5349, -7739, 3944, 5620, 4789, -4680, -1720, -9537, -2976, 4, -7429, 7726, 7799, 8766, -9125, -7220, 5753, 4187, 9883, 1323, -5171, 5892, 7558, -8226, 9204, -5963, -9794, 7303, -2512, 9836, 4087, 2872, 500, -347, -4816, -8494, -3817, 4194, 2968, -5695, 6994, 668, 2934, -8195, -7753, 3830, -2120, 488, -3257, -3269, 186, 7033, 9580, -1029, 7656, -6843, 2832, 9633, 2689, -5830, -6588, -182, 5228, 6533, 3690, -2096, 4198, 1669

.bss

max: .skip 4		@ il valore max del vettore list
indice_max: .skip 4 	@ l'indice all'interno di list del valore massimo

.text

.global main

main:	
    @Contenuto dei vari registri:
    @ r0: contiene il massimo valore
    @ r1: contiene l'indice del massimo valore
    @ r2: contiene il contatore (indice array attuale)
    @ r3: contiene l'elemento da confrontare con il massimo
    @ r4: contiene l'indirizzo in memoria di n
    @ r5: contiene l'indirizzo in memoria del primo valore di V.
    @ r6: contiene l'indirizzo di memoria di max.
    @ r7: contiene l'indirizzo di memoria di indice_max.
    @ r8: contiene l'offset
    @ r9: contiene il valore di n

    MOV R1, #0
    MOV R2, #1 @parto dall'indice 1 perché fin dall'inizio considero l'elemento all'indice 0 come il massimo elemento e non ho bisogno di confrontarlo con se stesso
    LDR R4, =n
    LDR R5, =V
    MOV R8, #4 @dichiaro l'offset a 4 per potermi spostare al secondo elemento dell'array (indice 1)
    LDR R3, [R5, R8] 
    LDR R0, [R5]
    LDR R6, =max
    LDR R7, =indice_max
    LDR R9, [R4]
    B loop

loop:
    @Verifico se ho un nuovo massimo
    CMP R0, R3
    MOVLT R0, R3
    MOVLT R1, R2

    CMP R2, R9
    @Eseguo le operazioni per passare all'elemento successivo dell'array
    ADDLO R2, R2, #1 @incremento il contatore
    ADDLO R8, R8, #4 @incremento l'offset dal valore iniziale dell'array
    LDRLO R3, [R5, R8]
    BLO loop

    @Se non devo più ripetere il ciclo, salvo in memoria i risultati ottenuti e esco dal programma
    STR R0, [R6]
    BL print_int
    STR R1, [R7]
    BL print_int
    BL exit_program

