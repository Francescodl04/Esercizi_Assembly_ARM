@Francesco Di Lena
@Primo esercizio laboratorio 3 - 30-04-2024
@Architettura degli elaboratori - A.A. 2023-2024

.text
@ Semplice funzione che calcola (r0+r1)^2 e salva il risultato in r0
sum_square: 
	PUSH {R2}
	ADD R2, R0, R1
	MUL R0, R2, R2
	POP {R2}
	MOV PC, LR

.global main
main:
	PUSH {LR, R0, R1}
	MOV R0, #5
	MOV R1, #3
	BL sum_square
	NOP
	POP {R0, R1, LR}
	MOV PC, LR

