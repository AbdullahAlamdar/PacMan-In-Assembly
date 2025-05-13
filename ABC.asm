
;            NAME   : MUHAMMAD Abdullah 
;            NU ID  : 23I-2597
;            SEC    : DS-C
;            FAST NUCES, Islamabad Campus
;            Department of AI & DS

;          

;===========================================   P A C M A N - IRVINE 32 (x86 ASSEMBLY CODE) ==========================================================

;===========================================    C O A L - SEMESETER PROJECT ( SPRING'25)   ==========================================================




; = = = = = IMPLEMENTATION STARTS HERE = = = = = = = = =


INCLUDE Irvine32.inc      ; IRVINE LIBRARY


.data     ; .DATA START HERE ( VARIABLE DECLARATIONS)

mazeLayout  BYTE "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0                       ;  COMPLETE MAZE LAYOUT
            BYTE "@@ .  .  .  .  .  .  .  .  .  @@@ .  .  .  .  .  .  .  .  .   @@",0                       ;  ROLL NO IS WRITTEN (23I-2534)
            BYTE "@@  @@@@@@@  @@@@@@@@@        @@@         @@@@@@@@@  @@@@@@@  @@",0                       ;  70 DOTS (REMAINING Design with @)
            BYTE "@@ . .  .  .  .  .  .  .  .  .   .  .   .   .   .   .  .  .   @@",0                       ;  ALL ARE BYTE
            BYTE "@@  @@@@@@@  @@@  @@@@  @@@@@@@@@@@@@@@@  @@@@  @@@  @@@@@@@  @@",0
            BYTE "@@  @@ .          @@@@  @@@@@@@@@@@@@@@@  @@@@          . @@  @@",0
            BYTE "@@  @@  @@@@@@@@  @@@@        @@@         @@@@  @@@@@@@@  @@  @@",0
            BYTE "@@  @@  @@@@@@@@  @@@@@@@@@@  @@@  @@@@@@@@@@@  @@@@@@@@  @@  @@",0
            BYTE "@@  @@  @@@@@@@@  @@@@@@@@@@  @@@  @@@@@@@@@@@  @@@@@@@@  @@  @@",0
            BYTE "@@  @@ .    .     .      .    @@@  .    .     .     .     @@  @@",0
            BYTE "@@  @@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@  @@",0
            BYTE "@@  @@          Abdullah         23i2597                  @@  @@",0
            BYTE "@@  @@    @@@@@@@          @@          @@@@@@@@@@@@    .  @@  @@",0
            BYTE "@@  @@          @          @@          @                  @@  @@",0
            BYTE "@@  @@    @@@@@@@          @@          @@@@@@@@@@@@       @@  @@",0
            BYTE "@@  @@    @     Abdullah   @@    23i2597          @       @@  @@",0
            BYTE "@@  @@    @@@@@@@          @@          @@@@@@@@@@@@    .  @@  @@",0
            BYTE "@@  @@          Abdullah   @@    23i2597                  @@  @@",0
            BYTE "@@  @@    @@@@@@@@         @@          @@@@@@@@@@@@    .  @@  @@",0
            BYTE "@@  @@    @      @         @@                     @       @@  @@",0
            BYTE "@@  @@    @@@@@@@@         @@                     @       @@  @@",0
            BYTE "@@  @@           @         @@                     @       @@  @@",0
            BYTE "@@  @@    @@@@@@@@         @@                     @   .   @@  @@",0
            BYTE "@@  @@         Abdullah          23i2597                  @@  @@",0
            BYTE "@@  @@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@  @@",0
            BYTE "@@  @@            @@@@  @@@@@@@@@@@@@@@@  @@@@            @@  @@",0
            BYTE "@@ .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  . @@",0
            BYTE "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0
    

    MazeEffect BYTE "****************************************************************",0                        ;SCREEN TRANSITION EFFECT ( FOR LITTLE BIT GOOD LOOKS)

    scoreText BYTE "POINTS : ",0   ; SCORE VALUE
    playerScore BYTE 0             ; INITAL IS ZERO

    playerX BYTE 30             ; PLAYER POSITION (X - AXIS)
    playerY BYTE 15             ; PLAYER POSITION (Y - AXIS)

    userInput BYTE ?            ; WHAT USER PRESSED
    tempVar BYTE 0              ; TEMP FOR CALCULATIONS IN CODE FURTHER

    livesText BYTE "HEALTH : ",0  ; HEALTH/LIFES
    healthCount BYTE 3            ; PACMAN HAS 3 LIVES   (DEC TO 0)

    levelText BYTE "STAGE : ",0   ; LEVELS/STAGES
    currentLevel BYTE 1           ; START ME LEVEL 1 HOGA


gameInstructions BYTE "           PAC-MAN INSTRUCTIONS               ",0ah                   ; PACMAN INSTRUCTION STATS HERE
            BYTE "          ---------------------------------------- ",0ah
            BYTE "          1. Use (W,A,S,D) to move Pac-Man through  ",0ah
            BYTE "             the maze and collect all the DOTS.    ",0ah
            BYTE "                                                   ",0ah
            BYTE "          2. Avoid ghosts to prevent losing a life.",0ah
            BYTE "                                                   ",0ah
            BYTE "          3. Earn points for each DOT consumed.    ",0ah
            BYTE "                                                   ",0ah
            BYTE "          4. Progress through levels by clearing   ",0ah
            BYTE "             all DOTS on the current maze.         ",0ah
            BYTE "                                                   ",0ah
            BYTE "          5. 'P' to pause and resume the game.     ",0ah
            BYTE "          ---------------------------------------- ",0ah
            BYTE "              ENJOY -> Abdullah - 23I-2597  (DS-C)     ",0ah
            BYTE "          ---------------------------------------- ",0ah
            BYTE "                                                   ",0ah
            BYTE "              press any key to continue...         ",0ah,0
 

gameLogo    BYTE "          ______  ___  _____ ___  ___  ___   _   _ ",0ah                  ; PACMAN KA LOGO GAME START PE DISPLAY HOGA
            BYTE "          | ___ \/ _ \/  __ \|  \/  | / _ \ | \ | |",0ah
            BYTE "          | |_/ / /_\ \ /  \/| .  . |/ /_\ \|  \| |",0ah
            BYTE "          |  __/|  _  | |    | |\/| ||  _  || . ` |",0ah
            BYTE "          | |   | | | | \__/\| |  | || | | || |\  |",0ah
            BYTE "          \_|   \_| |_/\____/\_|  |_/\_| |_/\_| \_/",0ah,0               
        
playerInfoBuffer byte 30 dup(?)                                                                 ; 30 char can be stored in name
nameLength dword ?                                                                              ; when user enters name , the length will be stored in this        


inputMsg BYTE "Enter Player Name: ",0                                                           ; display msg     



mainMenu BYTE "                            MENU",0ah                                            ; MAIN MENU DISPLAY
         BYTE " ",0ah
         BYTE "                        1.START GAME",0ah
         BYTE " ",0ah
         BYTE "                        2.HIGHCORES",0ah
         BYTE " ",0ah
         BYTE "                        3.LEVEL SELECT",0ah
         BYTE " ",0ah
         BYTE "                        4.QUIT",0ah
         BYTE " ",0ah
         BYTE " ",0ah
         BYTE "                    Enter your choice 1-4...",0ah,0                               ; IF YOU GO IN LEVEL -> THEN LEVEL 1 , 2 , 3 WILL DISPLAY


levelMenu  BYTE "           Select Number",0ah
           BYTE " ",0ah
           BYTE "                   Level 1",0ah
           BYTE " ",0ah
           BYTE "                   Level 2",0ah
           BYTE " ",0ah
           BYTE "                   Level 3",0ah,0

scoreFile byte "Players.txt",0                                      ; FILE TO STORE THE SCORES OF THE PLAYERS

ghost1 BYTE 25,4                       ; GHOST 1 POS
ghost1MoveDir BYTE 1                   ; MOVING DIRECTION 

ghost2 BYTE 30,4                       ; GHOST 2 POS     
ghost2MoveDir BYTE 2                   ; MOVING DIRECTION

bonusX BYTE 13                          ; BONUS FOOD
bonusY BYTE 6                           ; BONUS FOOD COORD    

endGameMsg BYTE  "Game Over !!!",0ah
        

entryPortalX BYTE 3           ; TRIED TO IMPLEMETENT WHEN USER TOUCES 3,16 IT MOVES TO 61,16
entryPortalY BYTE 16          ; JUST LIKE IN SNAKE GAME SNAKE TOUCHES BOUNDARY AND DOSRI SIDE SY NIKAL ATA HY  

exitPortalX BYTE 61           ; THIS IS THE EXIT POSITION JAHAN SY BAHIR AYEGA
exitPortalY BYTE 16





.code             ; .CODE SECTION STATS.. 


;======================================================================   MAIN STARTS HERE... =====================================================================
;==================================================================================================================================================================

main PROC


;   ==== GAME TITLE DISPLAY ======

    mov dl,0                  ; CURSOR POS     
    mov dh,8                  ; CURSOR (0,8)
    call Gotoxy               ; MOVE CURSOR TO THAT POS        
    mov edx,OFFSET gameLogo
    mov eax,6                 ; BROWN = 6
    call SetTextColor         ; APPLY TEXT COLOR
    call WriteString          ; DISPLAY THE LOGO
    mov eax,2000              ; SET DEALY VALUE TO 2 SEC



;===================== INPUT PLAYER NAME ========

    mov dl,15                               ; CUROSR POS
    mov dh,15           
    call Gotoxy                             ; SET THE POS
    mov edx,OFFSET inputMsg                 ; INPUT MSG ADDRESS
    call WriteString                        ; WRITE THAT MSG
    mov edx,offset playerInfoBuffer         ; SET BUFFER STORE THE NAME OF PLAYER
    mov ecx,lengthof playerInfoBuffer       ; SET THE MAX CHHAR TO READ
    call readstring                         ; READ THE KEYBOARD INPUT
    call clrscr                             ; CLEAR SCREEN
    mov edx,offset scoreFile                ; SCORE FILE NAME ADD
    call createOutputFile                   ; CREATE THE FILE ( STORE SCORING)
    call OpenInputFile                      ; OPEN THAT FILE
    mov edx,offset playerInfoBuffer         ; LOAD PLAYER NAME AND BUFFER ADDRESS
    call WriteToFile                        ; PLAYER NAME WRITE KRY GA FILE ME



;================= DISPLAY INSTRCTION ===========================
  
    mov dl,10                             ; CURSOR POS
    mov dh,5
    call Gotoxy                           ; MOVE THAT CUROSR
    mov eax,2 + (0*16)                    ; YELLOW TEXT = 2 + BGM IS BLACK = 0
    call SetTextColor
    mov edx,OFFSET gameInstructions       ; ADDRESS
    call WriteString
    mov eax,2 + (0*16)  
    call SetTextColor
    call readchar



; MENU SCREEN LABLE...
menuScreen:
    mov eax,0               ;CLEAR EAX REGISTER
    call clrscr 
    mov dl,0                ; CURSOR POS
    mov dh,7
    call Gotoxy             ; SET POS
    mov edx,OFFSET mainMenu ; MAIN MENU ADRESS IN EDX
    call WriteString        ; JO DECLARED HY WO LIIKH DYGA
    call readint            ; USER ENTERED CHOICE
       

; MENU ACTIONS LABLE...
menuActions:
    cmp al,1        ; CMP USER INPUT WITH 1
    je beginGame    ; IF 1 -> START THE GAME
    cmp al,2        
    je menuActions  ; IF 2 -> JUMP TO MENU
    cmp al,3
    jne checkExit            ; 3 - > EXIT
    call clrscr              ; CLEAR THE SCREEN
    mov dl,0
    mov dh,7
    call Gotoxy                ; SET CURSOR POS
    mov edx,OFFSET levelMenu   ; LEVEL MENU ADDRESS LOADING
    call WriteString
    call readint               ; USER INPUT READING
    mov currentLevel,al        ; STORE THE SELECTED LEVEL BY USER
    jmp beginGame              ;  THEN GAME ME CHALA JAYEGA
    
    checkExit:
    cmp al,4               ; IF USER OPT 4 --> EXIT & END GAME
    je stopGame
    

 ;NEXT STAGE LEVEL...
nextStage:
    call resetCoins     ; COLLECTED COINS SET TO ZERO BY THIS PROC
    inc currentLevel    ; CURRENT STAGE/LEVEL + 1 
    beginGame:
    mov healthCount,3   ; REVIVE HEATLTH TO 3
    mov playerX,30      ; INITIAL POS
    mov playerY,15      ; INITIAL POS STAGE 2
    mov playerScore,0   ; SET SCORE AGAIN TO ZERO

    call showAnimation  ; ANIMATION -> DECLARED STARICS IN DATA SECTION
    call displayMaze    ; MAZE DISPLAY
    call drawPacman     ; PACMAN PLACEMENT ------ PHURRRR
    call drawGhost1     ; DRAW THE GHOST 

    cmp currentLevel,2  ; CMP CURRENT LVL WITH 2
    jl singleGhost      ; IF LVL < 2 , SKIP TO SINGLE GHOST
    call drawGhost2     ; IF LVL >=2 , 2 GHOST

    call drawBonus      ; IF LVL >=2 DRAW BONUS
    singleGhost:        ; LABLE WHEN ONLY USE ONE GHOST


;========  GAME MAIN LOOP ================
gameMainLoop:
        cmp currentLevel,4   ; STAGE 4 IS NOT THERE SO EXIT
        je stopGame

        cmp playerScore,70    ; WHEN SCORE = 70 , STAGE NEXT
        je nextStage

        cmp healthCount,0     ;IF PLAYER HAS HEALTH REMAINING
        je stopGame                 ; STOP OTHERWSIE

        mov esi,offset ghost1    ; ADDRESS OF GHOST1
        mov al,[esi]             ; GHOST1 pos IN AL
        cmp al,playerX           ; COMPARE GHOST AND PACMAN POS
        jne noCollision1         ; IF BOTH POS NOT EQ, SO NO COLLISION
        mov al,[esi+1]           ; LOAD GHOST 1 POS IN AL
        cmp al,playerY           ; SAME STEP AGAIN
        jne noCollision1
            dec healthCount           
            mov playerX,30
            mov playerY,15

        noCollision1:    ; LABLE WHEN NO COLLISON IN THEM

        cmp currentLevel,2        ;CMP LEVEL WITH 2
        jl skipGhost2Check        ; AGAR LESS HY SKIP GHOST 2 
        mov esi,offset ghost2     ; COPY ASS GHOST 2 IN ESI
        mov al,[esi]              ; GHOST2 X POS IN AL
        cmp al,playerX           ; COMPARE GHOST POS WITH PLYAER
        jne noCollision2
        mov al,[esi+1]        ; LOAD GHOST 2 Y POS IN AL
        cmp al,playerY        ; compare pos
        jne noCollision2      ; if not equal -> no collision wiht ghost 2 
            dec healthCount      ; dec health/lives
            mov playerX,30       ; reset the positions
            mov playerY,15
        noCollision2:          

        skipGhost2Check:    ; lable to skip ghost 2 collision chk

    call moveGhost1    ; move 1st ghost
    mov eax,60         ; set delay time
    call delay         ; wait for that time
    
    cmp currentLevel,2   ; cmp with 2 lvl
    jl skipGhost2Move    ; same steps
    call drawGhost2
    call moveGhost2
    skipGhost2Move:

    cmp currentLevel,1  ;cmp curr lvl 1 
    je collectDots      ; if lvl=1 skip to collect dost -> bonus miss krado
        mov bl,playerX ; pos load
        cmp bl,bonusX
        jne noBonus    ; cmp kro agr hy tou bnous wrna ni
        mov bl,playerY
        cmp bl,bonusY
        jne noBonus
            add playerScore,10   ; agar bonus hy 10 score add krdo
            call createNewBonus
            call drawBonus
        noBonus:     ; lable when no bnonus collected

    collectDots:
        mov eax,0     ; clear reg
        mov ecx,0 
        mov ebx,0
        mov eax,65     ; maze width
        movzx ecx,playerY   ; player Y pos to ecx withxero extenson
        sub ecx,1   ; maze indexing
        imul eax,ecx                ; xing eax,ecx Y pos * width
        mov bl,playerX              ; player x pos in bl
        add eax,ebx
        mov esi,eax
        cmp mazeLayout[esi],'.'     ; check agr curr pos pe dot . hy



    jne noDot    ; IF NO DOT SKIP SCOREING
    inc playerScore ; INC SCORE DOT HOGA TOU
    mov mazeLayout[esi],'&' ; REPLACE DOT WITH EMPTY SPACE 
    noDot:
    mov eax,15 + (0 * 16) 
    call SetTextColor




;========== DISPLAY LEVELS ==========
    ; Display level
    mov dl,27      ; CURSOR POS
    mov dh,0
    call Gotoxy
    mov edx,OFFSET levelText     ; LEVEL TEXT ADDRESS
    call WriteString 
    mov al,currentLevel      ; LOAD CURR LVL IN AL
    call WriteDec               ; WRITE DECIMAL THAT NO

; SCORE DISPALY

    mov dl,0
    mov dh,0
    call Gotoxy
    mov edx,OFFSET scoreText
    call WriteString
    mov al,playerScore
    call WriteDec

; DISPLAY LIVES

    mov dl,55
    mov dh,0
    call Gotoxy
    mov edx,OFFSET livesText 
    call WriteString
    mov al,healthCount
    call WriteDec


; GHOST COLLISON DETECTION

    mov esi,offset ghost1   ; ADD OF GHOST 1 COORD
    mov al,[esi]               ; LOAD POS IN AL
    cmp al,playerX            ; CMP WITH PLAYAR X 
    jne noCollision3          ; IF NOT EQ, NO COLL WITH G1
    mov al,[esi+1]              ; LOAD GHOST 1 Y POS IN AL
    cmp al,playerY
    jne noCollision3
        dec healthCount           
        mov playerX,30
        mov playerY,15
    noCollision3:

    cmp currentLevel,2
    jl skipGhost2Collision      ; SAME ABOVE STEPS DOBARA WOI CONDITIONS KE SATH
    mov esi,offset ghost2
    mov al,[esi]
    cmp al,playerX
    jne noCollision4
    mov al,[esi+1]
    cmp al,playerY
    jne noCollision4
        dec healthCount           
        mov playerX,30
        mov playerY,15
    noCollision4:

    skipGhost2Collision:

    cmp currentLevel,3
    jl noTeleport     ; IF LEVEL < 3 , SKIP TELEPORT
    mov al,entryPortalX   ; LOAD ENTRT PORTAL X POS IN AL
    cmp al,playerX        ; CMP WITH PLAYER X
    jne noTeleportCheck   ; NO TELEPORT IF NOT EQUAL
    mov al,entryPortalY   ; POS THAT DECLARED IN DATA COPTYING IN REGISTERS
    cmp al,playerY
    jne noTeleportCheck   ; NOT EQ NO TELEPORT
        call clearPlayer   ; CURR POS SY PLAYER HATA DO
        mov al,exitPortalX
        mov playerX,al
        mov al,exitPortalY  
        mov playerY,al      ; NEW POS SETTING 
    noTeleportCheck:
    noTeleport:     ; NO TELEPORT LABLES



    call Readkey  ; READ KEYBOARD INPUT
    cmp al,1      ; IF AL=1 NO KEY PRESSED 
    je keepInput  ; IF NO KEEP PREVIOUS
    mov userInput,al ; STORE NEW

    keepInput:
    cmp userInput,"x"    ;IF X EXIT 
    je stopGame    ; EXIT

    cmp userInput,"w"  ; GO UP
    je goUp 

    cmp userInput,"s" 
    je goDown

    cmp userInput,"a"
    je goLeft

    cmp userInput,"d"
    je goRight

    cmp userInput,"p"   ; PAUSE HOJAE GA, FREEZ
    je pauseGame

jmp gameMainLoop   ; JMP BACK TO START OF GAMELOOP


    pauseGame:
        call Readchar   ;  WAIT FOR KEY PRESS
        cmp al,"r"      ; RESUME
    jne pauseGame        ;IF NOT R KEEP WAITING
    jmp gameMainLoop

goUp:
    call clearPlayer      ; CURR POS SY PLAYE HATA DEGA
    dec playerY            ; Y AXIS KO DEC KRNY SY UPR JAYEGA
    movzx eax,playerX       ; MOV PLAYER X TO EAX WITH ZERO
    movzx ebx,playerY
    call getMazeChar        ; GET CHAR AT NEW POS
    cmp al,'@'              ; IF WALL
    jne upOK           ;IF NOT WALL KEEP MOVE
    inc playerY         ; IF WALL REVERT Y
    upOK:              ; ONLY IF VALID UPGOING
    call drawPacman
    jmp gameMainLoop

goDown:
    call clearPlayer      ; clear the player uski curr pos sy
    inc playerY           ; y inc so down
    movzx eax,playerX     ; mov plaer x to eax with zero ext
    movzx ebx,playerY
    call getMazeChar      ; get char at new pos
    cmp al,'@'            ; wall check
    jne downOK            ; if not , movmenet is valid
    dec playerY
    downOK:
    call drawPacman
    jmp gameMainLoop
    
goLeft:
    call clearPlayer
    dec playerX
    movzx eax,playerX
    movzx ebx,playerY
    call getMazeChar
    cmp al,'@'
    jne leftOK
    inc playerX
    leftOK:
    call drawPacman
    jmp gameMainLoop

goRight:
    call clearPlayer
    inc playerX
    movzx eax,playerX
    movzx ebx,playerY
    call getMazeChar
    cmp al,'@'
    jne rightOK 
    dec playerX
    rightOK: 
    call drawPacman

jmp gameMainLoop

stopGame:
    mov eax,15 + (0 * 16) 
    call SetTextColor
    call clrscr
    mov dl,25       ;set cursor
    mov dh,15
    call Gotoxy
    mov edx,OFFSET endGameMsg
    mov eax,6                   ;color=6
    call SetTextColor
    call WriteString    

    exit
main ENDP

;====================================   MAIN ENDS HEREEE ====================


;=================================   PROC STATRS =================================


;=================== MAZE DISPLAY =====================
displayMaze PROC
    mov dl,0    ; cursor
    mov dh,1
    mov bl,dh
    mov ecx,29    ; total rows to draw

    mov esi,offset mazeLayout    
    drawRow: 
        mov eax,1 + (0 * 16)
        call SetTextColor
        mov dh,bl   ; cursor y to row counter
        mov dl,0    ; cur x start of row
        call Gotoxy
        mov edx,esi
        call WriteString
        call Delay
        call Delay
        add esi, 65  ;65 char per row
        inc bl ; inc row counter
    loop drawRow   ; row drawing loop until ecx=0
    ret
displayMaze ENDP


;=========== PACMAN DRAWING ================

drawPacman PROC
    mov eax,6 + (6 * 16) ; BLUE
    call SetTextColor
    mov dl,playerX
    mov dh,playerY
    call Gotoxy
    mov al,"C"
    call WriteChar
    ret
drawPacman ENDP


;================== CLEAR PLAYER =======================
clearPlayer PROC
    mov dl,playerX
    mov dh,playerY
    call Gotoxy
    mov al," "   ;SPACE TO CLEAR
    call WriteChar   ;dSPLAY SPACE EMPTY
    ret
clearPlayer ENDP


;=================SHOW ANIMATION =======================

showAnimation PROC
    mov dl,0
    mov dh,1
    mov bl,dh ; ROW COUNTER AND DH ISy POS
    mov ecx,29 ; T ROWS
    animate:
        mov eax,4 + (0 * 16) ; RED
        call SetTextColor
        mov dh,bl
        mov dl,0
        call Gotoxy
        mov edx,offset MazeEffect   
        call WriteString 
        inc bl
    loop animate
    ret
showAnimation ENDP


;====== GHOST 1 MOVING PROC ===============
moveGhost1 PROC
    mov esi,offset ghost1   ; LOAD ADDRESS OF GHOST 1 IN ESI
    
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]     ; GHOST 1 X AND Y POS IN AL AND BL RESPECTIVELY
    call getMazeChar   
    cmp al,'.'   ; CHECK IF POS HAS A DOT
    jne noDot1   ; IF NOT DOT JUMP 
        mov eax,1 + (0 * 16) 
        call SetTextColor
        mov al,"."
        jmp draw1
    noDot1:
        mov eax,0 + (0 * 16) 
        call SetTextColor
        mov al," "
    draw1:
    mov dl,[esi]           ; SET CURSOR X TO GHOST 1 X POS
    mov dh,[esi+1]          ; SET CURSOR Y TO GHOST 1 Y POS
    call Gotoxy             ; SET THE POS CURSOR
    call WriteChar      ; DISPLAY DOT AOR SPACE
    jmp continue1      
    changeDir1:     ; GHOST 1 DIRECTION CHANGEING
     mov eax,4       ; SET RANGE FOR 0-3
     call RandomRange  ; IRVINE FUNC
     mov ghost1MoveDir,al ; STORE NEW DIR IN GHOST1MOVEDIR
     continue1:        ; DIRECTION CHK
        cmp ghost1MoveDir,1   ; IF 1 UP
        je ghost1Up
        cmp ghost1MoveDir,2    ; SO ON
        je ghost1Down
        cmp ghost1MoveDir,3
        je ghost1Left
        cmp ghost1MoveDir,4
        je ghost1Right

ghost1Right:
    mov al,1    ; SET MOVEMENT TO 1
    add [esi],al   ; ADD 1 TO GHOST X POS (MOVE RIGHT)
    mov eax,0    
    mov ebx,0
    mov al,[esi]    ; LOAD NEW GHOST 1 X POS
    mov bl,[esi+1]   ; LOAD GHOST 1 Y POS
    call getMazeChar ; GET CHAR AT NEW POS
    cmp al,'@'   ; WALLL CHK
    jne right1OK   ; IF NO WALL MOVE OK
    mov al,1       
    sub [esi],al   ; UNDO MOVEMENT
    jmp changeDir1  ;CHANGE DIRECTION WALL ENCOUNTERE
    right1OK:   ; VALID RIGHT MOV
    call drawGhost1 
    jmp done1

ghost1Left:
    mov al,1
    sub [esi],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne left1OK 
    mov al,1
    add [esi],al
    jmp changeDir1
    left1OK:
    call drawGhost1
    jmp done1
ghost1Up:
    mov al,1
    sub [esi+1],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne up1OK 
    mov al,1
    add [esi+1],al
    jmp changeDir1
    up1OK:
    call drawGhost1
    jmp done1
ghost1Down:
    mov al,1
    add [esi+1],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne down1OK 
    mov al,1
    sub [esi+1],al
    jmp changeDir1
    down1OK:
    call drawGhost1
    jmp done1 
done1:
ret
moveGhost1 ENDP

;============== DRAW GHOST ====================

drawGhost1 PROC
    mov esi, offset ghost1   
    mov edx,0
    mov eax,0
    mov dl,[esi] ; G1 X POS 
    inc esi      ; POINT TO Y POS
    mov dh,[esi] ; G1 Y POS 
    inc esi     
    mov eax,4 + (4 * 16) ;RED
    call SetTextColor
    call Gotoxy
    mov al,"M"     ; M FOR GHOST
    call WriteChar
ret
drawGhost1 ENDP


;===================== DRAW G2 =====================
drawGhost2 PROC
    mov esi, offset ghost2
    mov edx,0
    mov eax,0
    mov dl,[esi]
    inc esi
    mov dh,[esi]
    inc esi
    mov eax,4 + (4 * 16) ; RED
    call SetTextColor
    call Gotoxy
    mov al,"M"    ; M FOR GHOST 
    call WriteChar
ret
drawGhost2 ENDP



;========================  MOVE GHOST 2 PROC ===============

moveGhost2 PROC
    mov esi,offset ghost2      
    
    mov eax,0
    mov ebx,0
    mov al,[esi]   ; G2 X POS IN AL
    mov bl,[esi+1]
    call getMazeChar;GET CHAR AT G POS IN AL
    cmp al,'.'   ; POS HAS DOT
    jne noDot2    ; IF NOT DOT
        mov eax,1 + (0 * 16) 
        call SetTextColor
        mov al,"."
        jmp draw2
    noDot2:
        mov eax,0 + (0 * 16)
        call SetTextColor
        mov al," "
    draw2:
    mov dl,[esi]    ;HOST 2 X AND Y POS
    mov dh,[esi+1]
    call Gotoxy
    call WriteChar  
    jmp continue2
    changeDir2:     ; GHOST DIR CHANGING LABLE
     mov eax,4
     call RandomRange
     mov ghost2MoveDir,al
     continue2:
        cmp ghost2MoveDir,1
        je ghost2Up
        cmp ghost2MoveDir,2
        je ghost2Down
        cmp ghost2MoveDir,3
        je ghost2Left
        cmp ghost2MoveDir,4
        je ghost2Right

ghost2Right:
    mov al,1    
    add [esi],al    ;ADD 1 TO GHOST 2 X POS MOVE RIGHT
    mov eax,0
    mov ebx,0
    mov al,[esi]   ; LOAD NEW POS
    mov bl,[esi+1]
    call getMazeChar  ; GET CHAR AT NEW POS
    cmp al,'@'   ; WALL CHKL
    jne right2OK ; IF NTO WALL OK
    mov al,1 
    sub [esi],al ; UNDO MOVMENET
    jmp changeDir2  ; WALL CHANGE DIR
    right2OK: ; VALID RIGHT MOB
    call drawGhost2
    jmp done2

ghost2Left:
    mov al,1
    sub [esi],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne left2OK 
    mov al,1
    add [esi],al
    jmp changeDir2
    left2OK:
    call drawGhost2
    jmp done2

ghost2Up:
    mov al,1
    sub [esi+1],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne up2OK 
    mov al,1
    add [esi+1],al
    jmp changeDir2
    up2OK:
    call drawGhost2
    jmp done2


ghost2Down:
    mov al,1
    add [esi+1],al
    mov eax,0
    mov ebx,0
    mov al,[esi]
    mov bl,[esi+1]
    call getMazeChar
    cmp al,'@'
    jne down2OK 
    mov al,1
    sub [esi+1],al
    jmp changeDir2
    down2OK:
    call drawGhost2
    jmp done2 


done2:     ; LABLE FOR COMPLETE GHOST 2 MOVEMNET
ret
moveGhost2 ENDP

getMazeChar PROC       
    mov edi,offset mazeLayout    ; MAZE ADD IN EDI
    dec ebx                     ;Y POS DEC
    imul ebx,65                 ; EBX X 65 CHARS PER ROW
    add ebx,eax
    add edi,ebx              
    mov al,[edi]        ; LOAD CALCULATED POS IN AL
ret
getMazeChar ENDP




;========================== BONUS CREATION ==============================

createNewBonus PROC
newPos:
    mov eax,27          ; 0-27 RANGE   
    call RandomRange 
    inc eax
    mov bonusX,al       ; STORE X POS
    mov eax,55          ; SET RANGE 0-54
    call RandomRange 
    inc eax
    mov bonusY,al    ;STORE Y POS IN BONUS Y
    mov eax,65 
    movzx ebx,bonusY   ; MOV Y IN EBX WITH ZERO
    sub ebx,1          
    imul eax,ebx     ; EAX X EBX
    mov ebx,0          ; CLEAR EBX
    mov bl,bonusX        
    add eax,ebx      ;ADD BL TO EAX
    mov esi,eax          ; MOVE CALCULATE VALUE TO ESI
    cmp mazeLayout[esi],'@'
    je newPos              ; IF WALL TRY NEW POS
        
    ret
createNewBonus ENDP
      

;======================== DRAW BONUS PROC ====================

drawBonus PROC
    mov eax,4 + (0 * 16) ; RED 
    call SetTextColor
    mov dl,bonusX
    mov dh,bonusY
    call Gotoxy    ; CURSOR SETTING
    mov al,"*"       ; SYMBOL CHOSE
    call WriteChar
    ret
drawBonus ENDP

resetCoins Proc   ; COINS / DOTS
    mov ebx,65    ; 65 CHAR WIDTH OF MAZE
    mov eax,28    ; 28 ROS
    imul eax,ebx   ; TOTAL CELLS HEIGHT X WIDTH 
    mov ecx,eax  ; LOOP TOTAL CELLS
    dec ecx
    mov edi,0      ; CURR POS ZERO
    checkCoins:
        cmp mazeLayout[edi],"&"    ; SPACES 
        jne nextCoin             ; IF NOT EMPTY SKIP TO NEXT CELL
        mov mazeLayout[edi],"."    ; REPLACE EMPTY SPACE WITH DOT
        nextCoin:                 ; MOVE TO NEXT
        inc edi
        loop checkCoins         ; REPEAT UNTIL ALL CELLS CHECKED 
    ret
resetCoins endp
END main



;====================================================== MUHAMMAD Abdullah  ======================================================