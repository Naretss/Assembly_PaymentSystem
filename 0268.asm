
.MODEL SMALL
.DATA  

LF  EQU 0AH
CF  EQU 0DH
N DB ?
SUM1 DW 0
SUM2 DW 0
 
NUM DW 1000
RES  DW 10 DUP ('$') 

DIV01 DW 0
SCRAP DW 0
SUMDIV DW 0 

MSG1 DB "********* Payment System *********"
     DB CF,LF,"All prices paid -> $"
MSG3 DB CF,LF,LF,"Money 1000 baht change : $" 
MSG4 DB CF,LF,"Money 500 baht change : $"  
MSG5 DB CF,LF,"Money 100 baht change : $" 
MSG6 DB CF,LF,"Money 50 baht change : $"
MSG7 DB CF,LF,"Money 20 baht change : $" 
MSG8 DB CF,LF,"Money 10 baht change : $" 
MSG9 DB CF,LF,"Money 5 baht change : $"
MSG10 DB CF,LF,"Money 2 baht change : $"  
MSG11 DB CF,LF,"Money 1 baht change : $"
MSG12 DB CF,LF,"Money received ( Money>Price) : $"
MSG13 DB CF,LF,LF,"Payment : $" 
MSG14 DB CF,LF,LF,"Replay y/n : $"
.CODE

MAIN PROC NEAR
     CALL FUNTION01
     CALL FUNTION02 
     CALL PRINT
     CALL Division1000
     CALL Division500
     CALL Division100
     CALL Division50    
     CALL Division20
     CALL Division10
     CALL Division5
     CALL Division2
     CALL Division1
     CALL REPLAY
     MOV AH,4CH   
     INT 21H

MAIN    ENDP
;--------------------------
FUNTION01 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG1
    INT 21H
    MOV DL,0H
FOR:
    MOV     AH,01H
    INT     21H
    CMP     AL,0DH
    JE      END_FOR
    SUB     AL,30H
    MOV     N,AL
    MOV     AL,10
    MUL     DL
    ADD     AL,N
    MOV     DL,AL
    MOV     BL,DL
    MOV     DH,AH
    MOV     BH,DH
    JMP     FOR
END_FOR:

    MOV     SUM1,BX
   
    RET
FUNTION01  ENDP
;--------------------------
FUNTION02 PROC NEAR
FRIST:    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG12
    INT 21H
    MOV DL,0H
FOR02:
    MOV     AH,01H
    INT     21H
    CMP     AL,0DH
    JE      END_FOR02
    SUB     AL,30H
    MOV     N,AL
    MOV     AL,10
    MUL     DL
    ADD     AL,N
    MOV     DL,AL
    MOV     BL,DL
    MOV     DH,AH
    MOV     BH,DH
    JMP     FOR02
END_FOR02:
    
    MOV     SUM2,BX 
    CMP BX,SUM1
    JB FRIST
    
    
    MOV AX,SUM2
    MOV BX,SUM1
    SUB AX,BX 
    MOV NUM,AX
    MOV DIV01,AX
    
    
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG13
    INT 21H 
    
    RET
FUNTION02  ENDP
    
;--------------------------
Division1000 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG3
    INT 21H
    MOV BX,1000
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division1000 ENDP  
;--------------------------
Division500 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG4
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,500
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division500 ENDP  
;--------------------------
Division100 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG5
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,100
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division100 ENDP
;--------------------------
Division50 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG6
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,50
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division50 ENDP
;--------------------------   
Division20 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG7
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,20
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division20 ENDP
;--------------------------
Division10 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG8
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,10
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division10 ENDP
;-------------------------- 
Division5 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG9
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,5
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division5 ENDP
;-------------------------- 
Division2 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG10
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,2
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division2 ENDP
;-------------------------- 
Division1 PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG11
    INT 21H
    MOV AX,SCRAP
    
    MOV DIV01,AX
    MOV BX,1
    MOV DX,0 
    MOV AX,DIV01
    DIV BX      
    
    MOV SCRAP,DX
    ADD AX,48 
    MOV SUMDIV,AX
 
    MOV AH,02
    MOV DX,SUMDIV
    INT 21H
    RET
Division1 ENDP
;--------------------------
PRINT PROC NEAR
    MOV AX,@DATA
    MOV DS,AX
   
    MOV AH,0
    MOV AX,NUM
      
    LEA SI,RES
    CALL HEX2DEC
   
    LEA DX,RES
    MOV AH,9
    INT 21H 
            
    RET 
PRINT ENDP
 ;---------------------------

HEX2DEC PROC NEAR
    MOV CX,0
    MOV BX,10
   
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
     
       ADD AL,30H
       MOV [SI],AL
     
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2
       RET
       
HEX2DEC ENDP                  
;--------------------------- 
REPLAY PROC NEAR
    
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,09H
    LEA DX,MSG14
    INT 21H 
    MOV AH,01H
    INT 21H
    MOV AH,0

    CMP AL,'y'
    JE REPLAY01
    JNE ENDRE
REPLAY01 : 
         CALL CLRSCR
         CALL MAIN
               
    
ENDRE:  RET
      
REPLAY ENDP 
;--------------------------- 
clrscr proc NEAR
    mov ax,0003h
    int 10h 
    ret
clrscr endp
;---------------------------
END MAIN