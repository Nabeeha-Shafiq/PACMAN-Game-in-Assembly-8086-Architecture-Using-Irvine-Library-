
;maybe i could say like in level2 one of the ghost is gonna kill you 
;level3 k liye ab maze mn na fixed ranges define kar do k yahan nahi jaa saktey
;teleporatation k liye bhi issi tarha if pacman enters the teleport area to usey goto any other plae kar do
;to keep count of levels of a person simple counter variable rakh lo
;sounds add
INCLUDE Irvine32.inc
includelib winmm.lib

PlaySound PROTO,
          pszSound:PTR BYTE,
          hmod:DWORD,
          fdwSound:DWORD

.data
welcomeMsgprompt db '         WELCOME TO', 0
pacmanLine1 db '         ######  #######  ######  #      #  #######  #       #', 0
pacmanLine2 db '         #    #  #     #  #       ##    ##  #     #  ##      #', 0
pacmanLine3 db '         #    #  #     #  #       # #  # #  #     #  # #     #', 0
pacmanLine4 db '         #####   #######  #       #  ##  #  #######  #  #    #', 0
pacmanLine5 db '         #       #     #  #       #      #  #     #  #   #   #', 0
pacmanLine6 db '         #       #     #  #       #      #  #     #  #    #  #', 0
pacmanLine7 db '         #       #     #  #       #      #  #     #  #     # #', 0
pacmanLine8 db '         #       #     #  ######  #      #  #     #  #       #', 0
pressKeyMsg db '         Press any key to continue', 0
codeNameprompt db '     Enter your code name for the game:', 0
startGameprompt db '        Press s to start the game', 0
instructionsPrompt db '        Press i to see instructions for PACMAN', 0
highscoreprompt db  '	Press h to see highscores of players', 0
MAX=80
codeNameUser byte MAX+1 DUP(?)


laddoPeelaColour WORD 0Eh 
;pechey black hey text ka colour yellow hey
bluecolorWithBlackForeGround word 01h OR 0h ;;;Background or foreground 
SecondPageUserIn byte ?

mazeLevel1 byte  ' ________________________________________________________________________________',0
mazeLevel2 byte  '|................................................................................|',0
mazeLevel3 byte  '|.        ___       .      ______   .    |        .   ______     .     ___      .|',0
mazeLevel4 byte  '|o...... |   |............|      |.......|...........|      |.........|   |.....o|',0
mazeLevel5 byte  '|.       |___|      .     |______|   .   |        .  |______|     .   |___|     .|',0
mazeLevel6 byte  '|........................................o.......................................|',0
mazeLevel7 byte  '|.      ____           .  . .        __________      . . .              ____    .|',0
mazeLevel8 byte  '|.     |____|          . |  .            |           . | .             |____|   .|',0
mazeLevel9 byte  '|............... . . . . |  .  .  .  .   | . . . . . . | ........................|',0
mazeLevel10 byte '|.             . | .     |_________      |    _________| .                      .|',0  
mazeLevel11 byte '|............... |.......|                             | ................ . . . .|',0
mazeLevel12 byte '|............... |  .    |      ______      ______     | .              .  |  . .|',0
mazeLevel13 byte '|.   ______    . |  .          |                  |    .         ____   .  |  . .|',0
mazeLevel14 byte '|........o |   . |  .   . . .  |                  |  . . .      | o......  |  . .|',0
mazeLevel15 byte '|.       . |   . |  .   .   .  |                  |  .   .      | .        |    .|',0
mazeLevel16 byte '|.       . |   . .  .   . | .  |__________________|  . | .      | .        |    .|',0
mazeLevel17 byte '|.       . |            . | ...........................| .      | .        |    .|',0
mazeLevel18 byte '|. ...................... |         ___________      . | ........................|',0
mazeLevel19 byte '|.        __________    .....            |           .   .   ___________        .|',0
mazeLevel20 byte '|........................ | .............| ........... | ........................|',0
mazeLevel21 byte '|.            ____________|___         . | .        ___|_____________           .|',0
mazeLevel22 byte '|................................................................................|',0
mazeLevel23 byte '|________________________________________________________________________________|',0

mazeLevel1a byte  ' ________________________________________________________________________________',0
mazeLevel2a byte  '|................................................................................|',0
mazeLevel3a byte  '|.        ___       .      ______   .    |        .   ______     .     ___      .|',0
mazeLevel4a byte  '|o...... |   |............|      |.......|...........|      |.........|   |.....o|',0
mazeLevel5a byte  '|.       |___|      .     |______|   .   |        .  |______|     .   |___|     .|',0
mazeLevel6a byte  '|........................................o.......................................|',0
mazeLevel7a byte  '|.      ____           .  . .                        . . .              ____    .|',0
mazeLevel8a byte  '|.     |____|          . |  .                        . | .             |____|   .|',0
mazeLevel9a byte  '|............... . . . . |  .  .  .  .     . . . . . . | ........................|',0
mazeLevel10a byte '|.             . | .     |                             | .                      .|',0  
mazeLevel11a byte '|............... |.......|                             | ................ . . . .|',0
mazeLevel12a byte '|............... |  .    |                             | .              .  |  . .|',0
mazeLevel13a byte '|.   ______    . |  .                                  .         ____   .  |  . .|',0
mazeLevel14a byte '|........o |   . |  .   . . .                        . . .      | o......  |  . .|',0
mazeLevel15a byte '|.       . |   . |  .   .   .                        .   .      | .        |    .|',0
mazeLevel16a byte '|.       . |   . .  .   . | .                        . | .      | .        |    .|',0
mazeLevel17a byte '|.       . |            . | ...........................| .      | .        |    .|',0
mazeLevel18a byte '|. ...................... |                          . | ........................|',0
mazeLevel19a byte '|.                      .....                        .   .                      .|',0
mazeLevel20a byte '|........................   .............  ...........   ........................|',0
mazeLevel21a byte '|.            ____________ ___         .   .        ___ _____________           .|',0
mazeLevel22a byte '|................................................................................|',0
mazeLevel23a byte '|________________________________________________________________________________|',0

mazeLevel1b byte  ' ________________________________________________________________________________',0
mazeLevel2b byte  '|................................................................................|',0
mazeLevel3b byte  '|.        ___       .      ______   .    |        .   ______     .     ___      .|',0
mazeLevel4b byte  '|o...... |   |............|      |.......|...........|      |.........|   |.....o|',0
mazeLevel5b byte  '|.       |___|      .     |______|   .   |        .  |______|     .   |___|     .|',0
mazeLevel6b byte  '|........................................o.......................................|',0
mazeLevel7b byte  '|.      ____           .  . .        __________      . . .              ____    .|',0
mazeLevel8b byte  '|.     |____|          . |  .            |           . | .             |____|   .|',0
mazeLevel9b byte  '|............... . . . . |  .  .  .  .   | . . . . . . | ........................|',0
mazeLevel10b byte '|.             . | .     |_________      |    _________| .                      .|',0  
mazeLevel11b byte '|............... |.......|                             | ................ . . . .|',0
mazeLevel12b byte '|............... |  .    |                             | .              .  |  . .|',0
mazeLevel13b byte '|.   ______    . |  .          |                  |    .         ____   .  |  . .|',0
mazeLevel14b byte '|........o |   . |  .   . . .  |                  |  . . .      | o......  |  . .|',0
mazeLevel15b byte '|.       . |   . |  .   .   .  |                  |  .   .      | .        |    .|',0
mazeLevel16b byte '|.       . |   . .  .   . | .  |                  |  . | .      | .        |    .|',0
mazeLevel17b byte '|.       . |            . | ...........................| .      | .        |    .|',0
mazeLevel18b byte '|. ...................... |         ___________      . | ........................|',0
mazeLevel19b byte '|.        __________    .....            |           .   .   ___________        .|',0
mazeLevel20b byte '|........................ | .............| ........... | ........................|',0
mazeLevel21b byte '|.            ____________|___         . | .        ___|_____________           .|',0
mazeLevel22b byte '|................................................................................|',0
mazeLevel23b byte '|________________________________________________________________________________|',0


myMAN byte 2
xCoordinate byte 41 ; x key liye normal right ->x increases 
yCoordinate byte 16 ;yaad rajey here y coordinate down position mn increases up mn decreases
score BYTE 0
strScore BYTE "Score: ",0
pinkGhost byte 4 ;ascii for DIAMOND character
redGhost byte 4
cyanGhost byte 4
purpleGhost byte 4
lifeCount byte 3 ; har level par 3 lifes milen gi
strLifecount byte "     LifeCount: ",0
gameOverStr1 byte "      You lost all you lives !",0
gameOverStr2 byte "             WASTED ! ",0
gameOverstr3 byte "Press 1 to go back to main menu page",0
flagGameOver byte 0
instructionPage1 byte "  -> Use keys 'w','a','s','d' to move pacman in the maze",0
instructionPage2 byte "  ->Your objective is simple: ",0
instructionPage3 byte "  *Eat as many dots as you can !",0
instructionPage4 byte "  *Avoid running into ghosts !",0
nameStr byte "Code-name: ",0
mazeLevel24 byte "Press n to move to next level",0
xCoordinatePinkGhost BYTE 2
yCoordinatePinkGhost BYTE 2
pinkGhostDirection   SBYTE 1 ;sbyte iss liye cz -1 means left bhi to move kar saktey hen 
xCoordinateRedGhost BYTE 18
yCoordinateRedGhost BYTE 6
redGhostDirection   sBYTE 1 ; 1 for moving right, -1 for movi
xCoordinateCyanGhost BYTE 41
yCoordinateCyanGhost BYTE 14
cyanGhostDirection   sBYTE 1 ; 1 for moving down, -1 for moving up
xCoordinatePurpleGhost BYTE 80
yCoordinatePurpleGhost BYTE 20
purpleGhostDirection   sBYTE 1 ; 1 for moving down, -1 for moving up
spawnFruit1 byte '+'
spawnfruit1XCoordinate byte 55
spawnfruit1YCoordinate byte 7
spawnFruit2 byte '+'
spawnfruit2XCoordinate byte 60
spawnfruit2YCoordinate byte 7
spawnFruit3 byte '+'
spawnfruit3XCoordinate byte 8
spawnfruit3YCoordinate byte 19
spawnFruit4 byte '+'
spawnfruit4XCoordinate byte 75
spawnfruit4YCoordinate byte 19
spawnFruit5 byte '+'
spawnfruit5XCoordinate byte 40
spawnfruit5YCoordinate byte 14
RandomCounterVariable byte 0

level1ghostInstruction byte 'Beware! all the static ghosts are gonna kill you',0
level2ghostInstruction byte 'Beware! one of these moving ghost is gonna cost you a life',0
level3teleportInstruction byte 'To teleport move your pacman to co-ordinates(40,18)!'
boolIsWall byte 0
strXCoordinate db "XCord: ", 0
strYCoordinate db "YCord: ", 0
is_obstacle byte 0
boolIsTeleported byte 0
greenGhost byte 4 ; ASCII for Green Ghost character
xCoordinateGreenGhost BYTE 10
yCoordinateGreenGhost BYTE 22
greenGhostDirection   sBYTE 1 ; 1 for moving right, -1 for moving left

whiteGhost byte 4 ; ASCII for White Ghost character
xCoordinateWhiteGhost BYTE 40
yCoordinateWhiteGhost BYTE 20
whiteGhostDirection   sBYTE 1 ; 1 for moving down, -1 for moving up
levelOfUser     DWORD 0
buffer BYTE 65536 DUP(0)  ; Buffer to store file contents, adjust size as needed
fileName BYTE "UserName",0
hFile HANDLE ?
;bytesRead DWORD ?     ; Add this line to define bytesRead
;bytesWritten DWORD ?  ; Add this line to define
.code

instructionsPage Proc

call Crlf
call Crlf
call Crlf
call Crlf
mov edx,offset instructionPage1
call WriteString
call Crlf
mov edx,offset instructionPage2
call WriteString
call Crlf
mov edx,offset instructionPage3
call WriteString
call Crlf
mov edx,offset instructionPage4
call WriteString
call Crlf
mov eax,04h
call SetTextColor
mov edx,offset level1ghostInstruction
call WriteString
call Crlf

mov edx,offset level2ghostInstruction
call WriteString
call Crlf

mov edx,offset level3TeleportInstruction
call WriteString
call Crlf


mov edx,offset gameOverstr3
call WriteString
call Crlf
call ReadChar


ret
instructionsPage endp 

First_Page_Display Proc

movzx eax, laddoPeelaColour
    call SetTextColor
                                     ; write "WELCOME TO" on the console
    mov edx, OFFSET welcomeMsgprompt
    call WriteString
    call Crlf                        ; New line
    call Crlf
        call Crlf
            call Crlf

                call Crlf
    mov edx, OFFSET pacmanLine1
    call WriteString
    call Crlf 
    mov edx, OFFSET pacmanLine2
    call WriteString
    call Crlf 
    mov edx, OFFSET pacmanLine3
    call WriteString
    call Crlf 
    mov edx, OFFSET pacmanLine4
    call WriteString
    call Crlf 
    mov edx, OFFSET pacmanLine5
    call WriteString
    call Crlf 
    mov edx,offset pacmanLine6
    call WriteString
    call Crlf
    mov edx,offset pacmanLine7
    call WriteString
    call Crlf
    mov edx,offset pacmanLine8
    call WriteString
    call Crlf


        call Crlf
    call Crlf
    call Crlf
    call Crlf

      mov edx, OFFSET codeNameprompt
    call WriteString
    mov edx,offset codeNameUser
    mov ecx,MAX
    call ReadString


    ; Write "Press any key to continue"
    mov edx, OFFSET pressKeyMsg
    call WriteString
    call Crlf ; New line

    ; Wait for any key press to continue
    call ReadChar
    ret 
    First_Page_Display endp
    ;-----------------------------------------senondpage
    SecondPageDisplay Proc
    movzx eax,bluecolorWithBlackForeGround 
    call SetTextColor
   
    call Crlf                        ; New line
    call Crlf
        call Crlf
            call Crlf
            call Crlf
    call Crlf
    call Crlf
    call Crlf
    call Crlf
    
                call Crlf
    mov edx, OFFSET startGameprompt
    call WriteString
    call Crlf 
    call Crlf
    call Crlf
    
    mov edx, OFFSET instructionsprompt
    call WriteString
    call Crlf 
    call Crlf
    call Crlf
    
    mov edx, OFFSET highscoreprompt
    call WriteString
    call Crlf 
   call Crlf
    call Crlf
    call Crlf
    call Crlf
    call Crlf
    call Crlf
    call ReadChar
    ret
    SecondPageDisplay endp


    ;==================================LEVEL1 MAZE LAYOUT=======================
    Level1PagePartc proc
    movzx eax,bluecolorWithBlackForeGround 
    call SetTextColor
    call Crlf
    mov edx, OFFSET mazeLevel1
    call WriteString
     call Crlf
    mov edx,offset mazeLevel2
    call Writestring
     call Crlf
       mov edx,offset mazeLevel3
    call Writestring
     call Crlf
       mov edx,offset mazeLevel4
       call Writestring
        call Crlf
          mov edx,offset mazeLevel5
    call Writestring
     call Crlf
       mov edx,offset mazeLevel6
    call Writestring
     call Crlf
     mov edx,offset mazeLevel7
    call Writestring
     call Crlf
     mov edx,offset mazeLevel8
    call Writestring
     call Crlf
     mov edx,offset mazeLevel9
    call Writestring
     call Crlf
     mov edx,offset mazeLevel10
    call Writestring
     call Crlf
       mov edx,offset mazeLevel11
    call Writestring
     call Crlf
       mov edx,offset mazeLevel12
    call Writestring
     call Crlf
       mov edx,offset mazeLevel13
    call Writestring
     call Crlf
       mov edx,offset mazeLevel14
    call Writestring
     call Crlf
       mov edx,offset mazeLevel15
    call Writestring
     call Crlf
       mov edx,offset mazeLevel16
    call Writestring
     call Crlf
       mov edx,offset mazeLevel17
    call Writestring
     call Crlf
       mov edx,offset mazeLevel18
    call Writestring
     call Crlf
       mov edx,offset mazeLevel19
    call Writestring
     call Crlf
       mov edx,offset mazeLevel20
    call Writestring
     call Crlf
       mov edx,offset mazeLevel21
    call Writestring
     call Crlf
       mov edx,offset mazeLevel22
    call Writestring
     call Crlf
       mov edx,offset mazeLevel23
    call Writestring
  call Crlf
  mov edx,offset mazeLevel24
  call WriteString
  call Crlf

    ret
    Level1PagePartc endp 



    Level1PageParta proc
    movzx eax,bluecolorWithBlackForeGround 
    call SetTextColor
    call Crlf
    mov edx, OFFSET mazeLevel1a
    call WriteString
     call Crlf
    mov edx,offset mazeLevel2a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel3a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel4a
       call Writestring
        call Crlf
          mov edx,offset mazeLevel5a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel6a
    call Writestring
     call Crlf
     mov edx,offset mazeLevel7a
    call Writestring
     call Crlf
     mov edx,offset mazeLevel8a
    call Writestring
     call Crlf
     mov edx,offset mazeLevel9a
    call Writestring
     call Crlf
     mov edx,offset mazeLevel10a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel11a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel12a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel13a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel14a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel15a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel16a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel17a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel18a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel19a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel20a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel21a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel22a
    call Writestring
     call Crlf
       mov edx,offset mazeLevel23a
    call Writestring
  call Crlf
  mov edx,offset mazeLevel24
  call WriteString
  call Crlf
    ret
    Level1PageParta endp 

    Level1PagePartb proc
    movzx eax,bluecolorWithBlackForeGround 
    call SetTextColor
    call Crlf
    mov edx, OFFSET mazeLevel1b
    call WriteString
     call Crlf
    mov edx,offset mazeLevel2b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel3b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel4b
       call Writestring
        call Crlf
          mov edx,offset mazeLevel5b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel6b
    call Writestring
     call Crlf
     mov edx,offset mazeLevel7b
    call Writestring
     call Crlf
     mov edx,offset mazeLevel8b
    call Writestring
     call Crlf
     mov edx,offset mazeLevel9b
    call Writestring
     call Crlf
     mov edx,offset mazeLevel10b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel11b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel12b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel13b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel14b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel15b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel16b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel17b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel18b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel19b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel20b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel21b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel22b
    call Writestring
     call Crlf
       mov edx,offset mazeLevel23b
    call Writestring
  call Crlf
  mov edx,offset mazeLevel24
  call WriteString
  call Crlf
    ret
    Level1PagePartb endp 



    ;;;draw player
    SetThePACOntoScreen Proc
    mov dl,xCoordinate
    mov dh,yCoordinate
    call Gotoxy
    mov al,myMAN
    call Writechar
    ret
    SetThePACOntoScreen endp 




    ;;;update player
    MovePAC proc ;saath saath clear/saaf the screen as pac moves ;ye basically dots eat 

    ; Save the current cursor position to check what's at Pac-Man's position
    mov dl,xCoordinate
    mov dh,yCoordinate
    call Gotoxy

    call ReadCharFromConsole
    cmp al, '.'
    je eatDot
    cmp al, 'o'
    je eatPellet
    jmp updateScreen

    eatDot:
    inc score
    jmp updateScreen

    eatPellet:
    add score, 5

    updateScreen:
   
    mov dl, xCoordinate
    mov dh, yCoordinate
    call Gotoxy
    mov al, " "
    call WriteChar

    ret
MovePAC endp 

DisplayScore PROC
;color hum ney function mn aaney sey pehley hi yellow select kar liya hehe
    mov dl, 0
    mov dh, 0
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    ; Convert score to string and display
    movzx eax, score   
    call WriteDec      

    mov dl,20
    call Gotoxy
    mov edx,offset strLifeCount ;cout <<Lifecount:
    call WriteString
    movzx eax ,lifeCount
    call WriteDec   ;cout<<""<<lifecount

     mov dl, 40
    mov dh, 0
    call Gotoxy
    mov edx, offset strXCoordinate ; "X Coordinate: "
    call WriteString
    movzx eax, xCoordinate
    call WriteDec   ; Display X coordinate

    ; Display Pac-Man's Y Coordinate
    mov dl, 50
    mov dh, 0
    call Gotoxy
    mov edx, offset strYCoordinate ; "Y Coordinate: "
    call WriteString
    movzx eax, yCoordinate
    call WriteDec   ; Display Y coordinate

    ret
DisplayScore ENDP

ReadCharFromConsole PROC ;to ye basically batata hey k x and y coordinate par kya para hey 
    movzx ebx, yCoordinate
    imul ebx, 84        
    movzx eax, xCoordinate
    add ebx, eax               
    
    add ebx, OFFSET mazeLevel1  
    
    mov al, [ebx]
    ret
ReadCharFromConsole ENDP

MobilizeGhostsPink PROC
    ; Clear Pink Ghost's Previous Position with a blue dot
    mov dl, xCoordinatePinkGhost
    mov dh, yCoordinatePinkGhost
    call Gotoxy
    mov eax, blue ; Set text color to blue
    call SetTextColor
    mov al, '.' ; Dot character
    call WriteChar

    ; Update Pink Ghost's Position
    cmp pinkGhostDirection, 1
    je MovePinkGhostRight
    jmp MovePinkGhostLeft

MovePinkGhostRight:
    inc xCoordinatePinkGhost
    cmp xCoordinatePinkGhost, 75
    jl PinkGhostUpdated
    mov pinkGhostDirection, -1 ; Change direction
    jmp PinkGhostUpdated

MovePinkGhostLeft:
    dec xCoordinatePinkGhost
    cmp xCoordinatePinkGhost, 2
    jge PinkGhostUpdated
    mov pinkGhostDirection, 1 ; Change direction

PinkGhostUpdated:
    ; Draw Pink Ghost at New Position
    mov dl, xCoordinatePinkGhost
    mov dh, yCoordinatePinkGhost
    call Gotoxy 
    mov eax, 0dh ; Set text color to pink
    call SetTextColor
    mov al, pinkGhost ; Pink ghost character
    call WriteChar

    ret 
MobilizeGhostsPink endp


MobilizeGhostsCyan PROC
mov dl,xCoordinateCyanGhost
mov dh,yCoordinateCyanGhost
call Gotoxy
;mov eax,blue
mov al,' '
call WriteChar

cmp cyanGhostDirection, 1
    je MoveCyanGhostDown
    jmp MoveCyanGhostUp

MoveCyanGhostDown:
    inc yCoordinateCyanGhost
    cmp yCoordinateCyanGhost, 17
    jl CyanGhostUpdated
    mov CyanGhostDirection, -1 ; Change direction
    jmp CyanGhostUpdated

MoveCyanGhostUp:
    dec yCoordinateCyanGhost
    cmp yCoordinateCyanGhost, 14
    jge CyanGhostUpdated
    mov CyanGhostDirection, 1 ; Change direction

CyanGhostUpdated:
    mov dl, xCoordinateCyanGhost
    mov dh, yCoordinateCyanGhost
    call Gotoxy 
    mov eax, 0bh
    call SetTextColor
    mov al, CyanGhost ; Pink ghost character
    call WriteChar
    ret
    MobilizeGhostsCyan endp

    MobilizeGhostsRed PROC
    ; Clear Red Ghost's Previous Position with a blue dot
    ; ... similar to PinkGhost ...
    mov dl, xCoordinateRedGhost
    mov dh, yCoordinateRedGhost
    call Gotoxy
    mov eax, blue ; Set text color to blue
    call SetTextColor
    mov al, '.' ; Dot character
    call WriteChar

    ; Update Red Ghost's Position
    cmp redGhostDirection, 1
    je MoveRedGhostRight
    jmp MoveRedGhostLeft

MoveRedGhostRight:
    inc xCoordinateRedGhost
    cmp xCoordinateRedGhost, 80
    jl RedGhostUpdated
    mov redGhostDirection, -1 ; Change direction
    jmp RedGhostUpdated

MoveRedGhostLeft:
    dec xCoordinateRedGhost
    cmp xCoordinateRedGhost, 18
    jge RedGhostUpdated
    mov redGhostDirection, 1 ; Change direction

RedGhostUpdated:
    ; Draw Red Ghost at New Position
    ; ... similar to PinkGhost ...
    mov dl, xCoordinateRedGhost
    mov dh, yCoordinateRedGhost
    call Gotoxy 
    mov eax, 04h
    call SetTextColor
    mov al, RedGhost ; Pink ghost character
    call WriteChar
    ret
MobilizeGhostsRed endp
MobilizeGhostsPurple PROC
    
    mov dl, xCoordinatePurpleGhost
    mov dh, yCoordinatePurpleGhost
    call Gotoxy
    mov eax, blue ; Set text color to blue
    call SetTextColor
    mov al, '.' ; Dot character
    call WriteChar

    ; Update Purple Ghost's Position
    cmp purpleGhostDirection, 1
    je MovePurpleGhostDown
    jmp MovePurpleGhostUp

MovePurpleGhostDown:
    inc yCoordinatePurpleGhost
    cmp yCoordinatePurpleGhost, 20
    jl PurpleGhostUpdated
    mov purpleGhostDirection, -1 ; Change direction
    jmp PurpleGhostUpdated

MovePurpleGhostUp:
    dec yCoordinatePurpleGhost
    cmp yCoordinatePurpleGhost, 3
    jge PurpleGhostUpdated
    mov purpleGhostDirection, 1 ; Change direction

PurpleGhostUpdated:
    
    mov dl, xCoordinatePurpleGhost
    mov dh, yCoordinatePurpleGhost
    call Gotoxy 
    mov eax, 05h ; Set text color to pink
    call SetTextColor
    mov al, purpleGhost 
    call WriteChar
    ret
MobilizeGhostsPurple endp

DrawGhosts PROC
;pink ghost draw
mov dl,2
mov dh,2
call gotoxy
mov ax,0Dh
call settextcolor
mov al,pinkghost
call writechar

mov dl,18
mov dh,6
call Gotoxy
mov ax,04h
call SetTextColor
mov al,redghost
call WriteChar

mov dl,41
mov dh,14
call Gotoxy
mov ax,0bh
call SetTextcolor
mov al,cyanghost
call writechar

mov dl, 80
    mov dh, 20
    call Gotoxy
    mov ax, 05h
    call SetTextColor 
    mov al, purpleghost
    call WriteChar
ret
DrawGhosts endp

CheckCollisions PROC
    mov al, xCoordinate
    mov ah, yCoordinate

    ; Check with Pink Ghost
    cmp al, 2 ; Check x-coordinate
    jne checkRed ; If not equal, check next ghost
    cmp ah, 2 ; Check y-coordinate
    jne checkRed ; If not equal, check next ghost
    jmp collision ; Both coordinates match, collision detected

checkRed:
    ; Check with Red Ghost
    cmp al, 18 ; Check x-coordinate
    jne checkCyan ; If not equal, check next ghost
    cmp ah, 6 ; Check y-coordinate
    jne checkCyan ; If not equal, check next ghost
    jmp collision ; Both coordinates match, collision detected

checkCyan:
    ; Check with Cyan Ghost
    cmp al, 41 ; Check x-coordinate
    jne checkpurple ; If not equal, check next ghost
    cmp ah, 14 ; Check y-coordinate
    jne checkpurple ; If not equal, check next ghost
    jmp collision ; Both coordinates match, collision detected

checkpurple:
    ; Check with purple Ghost
    cmp al, 80 ; Check x-coordinate
    jne noCollision ; If not equal, no collision
    cmp ah, 20 ; Check y-coordinate
    jne noCollision ; If not equal, no collision
    ; Both coordinates match, collision detected
    jmp collision

noCollision:
    ; No collision detected, return
    ret

collision:
    ; Collision detected, decrement life count
    call DecrementLifeCount
    ret
CheckCollisions ENDP

CheckCollisionsForMovingGhosts PROC
    mov al, xCoordinate     ; Pac-Man's x-coordinate
    mov ah, yCoordinate     ; Pac-Man's y-coordinate

    ; Check collision with Pink Ghost
    cmp al, xCoordinatePinkGhost
    jne checkCollisionWithRedGhost
    cmp ah, yCoordinatePinkGhost
    jne checkCollisionWithRedGhost
   jmp handleCollision1
    

checkCollisionWithRedGhost:
    ; Check collision with Red Ghost
    cmp al, xCoordinateRedGhost
    jne checkCollisionWithCyanGhost
    cmp ah, yCoordinateRedGhost
    jne checkCollisionWithCyanGhost
    jmp handleCollision1
    

checkCollisionWithCyanGhost:
    ; Check collision with Cyan Ghost
    cmp al, xCoordinateCyanGhost
    jne checkCollisionWithPurpleGhost
    cmp ah, yCoordinateCyanGhost
    jne checkCollisionWithPurpleGhost
    jmp handleCollision1
    

checkCollisionWithPurpleGhost:
    ; Check collision with Purple Ghost
    cmp al, xCoordinatePurpleGhost
    jne noCollision
    cmp ah, yCoordinatePurpleGhost
    jne noCollision
    jmp handleCollision1
    

noCollision:
    ; No collision detected
    ret

handleCollision1:
    ; Collision detected, decrement life count
    call DecrementLifeCount
    ret

CheckCollisionsForMovingGhosts ENDP
CheckCollisionsForMovingGhostsLevel3 PROC
    mov al, xCoordinate     ; Pac-Man's x-coordinate
    mov ah, yCoordinate     ; Pac-Man's y-coordinate

    ; Check collision with Pink Ghost
    cmp al, xCoordinatePinkGhost
    jne checkCollisionWithRedGhost
    cmp ah, yCoordinatePinkGhost
    jne checkCollisionWithRedGhost
    jmp handleCollision
    

checkCollisionWithRedGhost:
    ; Check collision with Red Ghost
    cmp al, xCoordinateRedGhost
    jne checkCollisionWithCyanGhost
    cmp ah, yCoordinateRedGhost
    jne checkCollisionWithCyanGhost
    jmp handleCollision
    

checkCollisionWithCyanGhost:
    ; Check collision with Cyan Ghost
    cmp al, xCoordinateCyanGhost
    jne checkCollisionWithPurpleGhost
    cmp ah, yCoordinateCyanGhost
    jne checkCollisionWithPurpleGhost
    jmp handleCollision
    

checkCollisionWithPurpleGhost:
    ; Check collision with Purple Ghost
    cmp al, xCoordinatePurpleGhost
    jne checkCollisionWithGreenGhost
    cmp ah, yCoordinatePurpleGhost
    jne checkCollisionWithGreenGhost
    jmp handleCollision
    

checkCollisionWithGreenGhost:
    ; Check collision with Green Ghost
    cmp al, xCoordinateGreenGhost
    jne checkCollisionWithWhiteGhost
    cmp ah, yCoordinateGreenGhost
    jne checkCollisionWithWhiteGhost
    jmp handleCollision
    

checkCollisionWithWhiteGhost:
    ; Check collision with White Ghost
    cmp al, xCoordinateWhiteGhost
    jne noCollision
    cmp ah, yCoordinateWhiteGhost
    jne noCollision
    jmp handleCollision
    

noCollision:
    ; No collision detected
    ret

handleCollision:
    
    call DecrementLifeCount
   
    ret

CheckCollisionsForMovingGhostsLevel3 ENDP


DrawGhostsPink PROC
    ; Pink ghost draw
    mov dl, xCoordinatePinkGhost 
    mov dh, yCoordinatePinkGhost 
    call gotoxy
    mov ax, 0Dh
    call settextcolor
    mov al, pinkghost
    call writechar

    ; Other ghost drawing code remains the same...

ret
DrawGhostsPink ENDP

MobilizeGhostsGreen PROC
    ; Clear Green Ghost's Previous Position with a blue dot
    mov dl, xCoordinateGreenGhost
    mov dh, yCoordinateGreenGhost
    call Gotoxy
    mov eax, blue 
    call SetTextColor
    mov al, '.' ; Dot character
    call WriteChar

    ; Update Green Ghost's Position
    cmp greenGhostDirection, 1
    je MoveGreenGhostRight
    jmp MoveGreenGhostLeft

MoveGreenGhostRight:
    inc xCoordinateGreenGhost
    cmp xCoordinateGreenGhost, 80
    jl GreenGhostUpdated
    mov greenGhostDirection, -1 ; Change direction

MoveGreenGhostLeft:
    dec xCoordinateGreenGhost
    cmp xCoordinateGreenGhost, 10
    jge GreenGhostUpdated
    mov greenGhostDirection, 1 ; Change direction

GreenGhostUpdated:
    ; Draw Green Ghost at New Position
    mov dl, xCoordinateGreenGhost
    mov dh, yCoordinateGreenGhost
    call Gotoxy 
    mov eax, 0Ah 
    call SetTextColor
    mov al, greenGhost 
    call WriteChar
    ret
MobilizeGhostsGreen ENDP

MobilizeGhostsWhite PROC
    ; Clear White Ghost's Previous Position with a blue dot
    mov dl, xCoordinateWhiteGhost
    mov dh, yCoordinateWhiteGhost
    call Gotoxy
    mov eax, blue ; Set text color to blue
    call SetTextColor
    mov al, '.' ; Dot character
    call WriteChar

    ; Update White Ghost's Position
    cmp whiteGhostDirection, 1
    je MoveWhiteGhostDown
    jmp MoveWhiteGhostUp

MoveWhiteGhostDown:
    inc yCoordinateWhiteGhost
    cmp yCoordinateWhiteGhost, 23
    jl WhiteGhostUpdated
    mov whiteGhostDirection, -1 ; Change direction

MoveWhiteGhostUp:
    dec yCoordinateWhiteGhost
    cmp yCoordinateWhiteGhost, 20
    jge WhiteGhostUpdated
    mov whiteGhostDirection, 1 ; Change direction

WhiteGhostUpdated:
    ; Draw White Ghost at New Position
    mov dl, xCoordinateWhiteGhost
    mov dh, yCoordinateWhiteGhost
    call Gotoxy 
    mov eax, 0Fh ; Set text color to white
    call SetTextColor
    mov al, whiteGhost ; White ghost character
    call WriteChar
    ret
MobilizeGhostsWhite ENDP

DecrementLifeCount PROC
;there should be a string of life count as there is of score and a variable lifeCount which is initially 3 but then it decrements with every collision with ghosts...
dec lifeCount
cmp lifeCount,0
jle GameOver
call DisplayScore
jmp notGameOver

GameOver:
mov flagGameOver,1

notGameOver:
    ret
DecrementLifeCount ENDP

GameOverPage proc
mov ax,04h
call SetTextColor
call Clrscr
call Crlf
call Crlf
call Crlf
call Crlf
call Crlf
call Crlf
call Crlf
call Crlf

mov edx,offset gameOverstr1
call WriteString
call Crlf

mov edx,offset gameOverstr2
call WriteString
call Crlf

mov edx,offset gameOverstr3
call WriteString 
call Crlf

call DisplayUserNameAndScore

    WaitForKeyPress:
        call ReadChar
        cmp al, '1' 
        jne WaitForKeyPress 
        jmp returnCond



returnCond:
ret
GameOverPage endp 
DisplayUserNameAndScore PROC
   
   mov edx,offset nameStr
   call WriteString
    mov edx, OFFSET codeNameUser 
    call WriteString             

    call Crlf                    

    ; Display the score
    mov edx, OFFSET strScore     
    call WriteString             
    movzx eax, score             
    call WriteDec                

    ret
DisplayUserNameAndScore ENDP

SpawnFruits PROC
mov bl,RandomCounterVariable
 cmp bl, 3
    je SpawnFruit1Label
    cmp bl, 6
    je SpawnFruit2Label
    cmp bl, 9
    je SpawnFruit3Label
    cmp bl, 12
    je SpawnFruit4Label
    cmp bl, 15
    je SpawnFruit5Label
    ret ;else return kar jaao
    SpawnFruit1Label:
    mov dl, spawnfruit1XCoordinate
    mov dh, spawnfruit1YCoordinate
    call Gotoxy
    mov eax, 0Eh  ;laddopeela calar
    call SetTextColor
    mov al, spawnFruit1
    call WriteChar
    ret
     SpawnFruit2Label:
    mov dl, spawnfruit2XCoordinate
    mov dh, spawnfruit2YCoordinate
    call Gotoxy
    mov eax, 0Eh 
    call SetTextColor
    mov al, spawnFruit1
    call WriteChar
    ret
     SpawnFruit3Label:
    mov dl, spawnfruit3XCoordinate
    mov dh, spawnfruit3YCoordinate
    call Gotoxy
    mov eax, 0Eh 
    call SetTextColor
    mov al, spawnFruit1
    call WriteChar
    ret
     SpawnFruit4Label:
    mov dl, spawnfruit4XCoordinate
    mov dh, spawnfruit4YCoordinate
    call Gotoxy
    mov eax, 0Eh 
    call SetTextColor
    mov al, spawnFruit1
    call WriteChar
    ret
     SpawnFruit5Label:
    mov dl, spawnfruit5XCoordinate
    mov dh, spawnfruit5YCoordinate
    call Gotoxy
    mov eax, 0Eh 
    call SetTextColor
    mov al, spawnFruit1
    call WriteChar
    ret
    SpawnFruits endp


    CheckFruitCollisions PROC
    mov al, xCoordinate ; Pacman's X-coordinate
    mov ah, yCoordinate ; Pacman's Y-coordinate

    ; Check collision with Fruit 1
    cmp al, spawnfruit1XCoordinate
    jne checkFruit2
    cmp ah, spawnfruit1YCoordinate
    jne checkFruit2
    call EatFruit
    jmp endCheck

checkFruit2:
    
    cmp al, spawnfruit2XCoordinate
    jne checkFruit3
    cmp ah, spawnfruit2YCoordinate
    jne checkFruit3
    call EatFruit
    jmp endCheck

checkFruit3:
    
    cmp al, spawnfruit3XCoordinate
    jne checkFruit4
    cmp ah, spawnfruit3YCoordinate
    jne checkFruit4
    call EatFruit
    jmp endCheck

checkFruit4:
   
    cmp al, spawnfruit4XCoordinate
    jne checkFruit5
    cmp ah, spawnfruit4YCoordinate
    jne checkFruit5
    call EatFruit
    jmp endCheck

    checkFruit5:
    
    cmp al, spawnfruit5XCoordinate
    jne endCheck
    cmp ah, spawnfruit5YCoordinate
    jne endCheck
    call EatFruit
    jmp endCheck



endCheck:
    ret

EatFruit:
    add score, 5 
   
    ret

CheckFruitCollisions ENDP

CheckWallCollisions PROC
   
    mov bl, xCoordinate
    mov bh, yCoordinate

    ; Check left wall
    cmp xCoordinate, 0
    je CollisionDetected
    ; Check right wall
    cmp xCoordinate, 81
    je CollisionDetected
    ; Check top wall
    cmp yCoordinate, 1
    je CollisionDetected
    ; Check bottom wall
    cmp yCoordinate, 23
    je CollisionDetected

   
    mov boolIswall, 0
    ret

CollisionDetected:
    ; Restore original coordinates
    mov xCoordinate, bl
    mov yCoordinate, bh

    mov boolIswall, 1
    ret
CheckWallCollisions ENDP

CollisionWithFixedObstacles PROC
    
    mov is_obstacle, 0

   
    cmp bl, 32
    jb CheckSecondHorizontal
    cmp bl, 38
    ja CheckSecondHorizontal
   
    je SetObstacleFlag
  
    cmp bh, 16
    je SetObstacleFlag
    jmp NoCollision

CheckSecondHorizontal:
    cmp bl, 43
    jb NoCollision
    cmp bl, 49
    ja NoCollision
  
    cmp bh, 12
    je SetObstacleFlag
    cmp bh, 16
    je SetObstacleFlag

NoCollision:
    
    cmp bl, 31
    je CheckVertical
    cmp bl, 50
    je CheckVertical
    jmp NoCollisionVertical ; If not at 31 or 50, no collision

CheckVertical:
    
    cmp bh, 13
    jb NoCollisionVertical ; If less than 13, no collision
    cmp bh, 16
    ja NoCollisionVertical ; If greater than 16, no collision
    
    jmp SetObstacleFlag

NoCollisionVertical:
    ret

SetObstacleFlag:
 
    mov is_obstacle, 1
    ret

CollisionWithFixedObstacles ENDP

TeleportMrPac PROC
   
    cmp xCoordinate, 79
    jne NoTeleport
    cmp yCoordinate, 20
    jne NoTeleport

    mov xCoordinate, 10
    mov yCoordinate, 23

    
    mov boolIsTeleported, 1
    jmp TeleportDone

NoTeleport:
   
    mov boolIsTeleported, 0

TeleportDone:
    ret
TeleportMrPac ENDP



main PROC ;=================MAIN PROC======================
call First_Page_Display

 StartMenu:
   call Clrscr     ;to clear the screen
    call SecondPageDisplay
    
WaitForInput:
;call ReadChar
mov SecondPageUserIn,al
cmp SecondPageUserIn,'s'
je StartGame

cmp SecondPageUserIn,'i'
je instructionPage

cmp SecondPageUserIn,'h'
je highscorePage

instructionPage:
call Clrscr
mov ax,03h
call SetTextColor
call instructionsPage
mov SecondPageUserIn,al
cmp SecondPageUserIn,'1'
je StartMenu

highscorePage:


;instructions and high score page

jmp WaitForInput
    
    StartGame:
    mov score, 0       ; Initialize score to 0
    mov lifeCount,3
    mov flagGameOver,0
    call Level1PageParta
    call DrawGhosts

    gameLoop:
    
     cmp flagGameOver,1
   je GameOverPageLabel
  
   movzx eax, laddoPeelaColour
    call SetTextColor
     call DisplayScore
   
    call ReadChar
    mov SecondPageuserIn,al 

    cmp SecondPageuserIn,'e'
    je exitGame

    cmp SecondPageuserIn,'n'
    je JumpToLevel2

    cmp SecondPageuserIn,'w'
    je moveUp

    cmp SecondPageuserIn,'s'
    je moveDown

    cmp SecondPageuserIn,'d'
    je moveRight

    cmp SecondPageuserIn,'a'
    je moveLeft

    moveUp:
    
    call MovePAC
    sub yCoordinate,1
    call SetThePACOntoScreen
    call CheckCollisions ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
   
   jmp gameLoop

    moveDown:
    call MovePAC
    add yCoordinate,1
    call SetThePACOntoScreen
     call CheckCollisions ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    jmp gameLoop

    moveRight:
    call MovePAC
    add xCoordinate,1
    
    call SetThePACOntoScreen
     call CheckCollisions ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
     
    jmp gameLoop

    moveLeft:
    call MovePAC
     sub xCoordinate,1
    
    call SetThePACOntoScreen
       call CheckCollisions ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    jmp gameLoop
    ;;;else k case mn game loop mn jjaye ga 
    ;jmp gameLoop 
   ;jmp StartMenu
    ;call Level1Page

    JumpToLevel2:   ;;;============LEVEL2 PROC ================

    StartGame2:
    mov score, 0       ; Initialize score to 0
    mov lifeCount,3
    mov flagGameOver,0
    mov xCoordinate,40
    mov yCoordinate,17
    call Level1PagePartb
    ;call DrawGhosts;--------------->change this to draw moving ghosts

    gameLoop2:
    mov boolIsWall,0
     cmp flagGameOver,1
   je GameOverPageLabel
  
   movzx eax, laddoPeelaColour
    call SetTextColor
     call DisplayScore
   
     ; Update ghost positions
    call MobilizeGhostsPink
    call MobilizeGhostsRed
    call MobilizeGhostsCyan
    call MobilizeGhostsPurple
    inc RandomCounterVariable
        call SpawnFruits
    ; Draw ghosts in their updated positions
   ; call DrawGhostsPink

   call ReadChar
    mov SecondPageuserIn,al 

    cmp SecondPageuserIn,'e'
    je exitGame

    cmp SecondPageuserIn,'n'
    je JumpToLevel3

    cmp SecondPageuserIn,'w'
    je moveUp2

    cmp SecondPageuserIn,'s'
    je moveDown2

    cmp SecondPageuserIn,'d'
    je moveRight2

    cmp SecondPageuserIn,'a'
    je moveLeft2

    moveUp2:
    
    call MovePAC
    sub yCoordinate,1
    call SetThePACOntoScreen
    call CheckCollisionsForMovingGhosts ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
   call CheckFruitCollisions
   jmp gameLoop2

    moveDown2:
    call MovePAC
    add yCoordinate,1
    call SetThePACOntoScreen
     call CheckCollisionsForMovingGhosts ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
   call CheckFruitCollisions
   jmp gameLoop2

    moveRight2:
    call MovePAC
    add xCoordinate,1
    
    call SetThePACOntoScreen
     call CheckCollisionsForMovingGhosts ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    call CheckFruitCollisions 
    jmp gameLoop2

    moveLeft2:
    call MovePAC
     sub xCoordinate,1
    
    call SetThePACOntoScreen
       call CheckCollisionsForMovingGhosts ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    call CheckFruitCollisions
    jmp gameLoop2
    ;;;else k case mn game loop mn jjaye ga 
    ;jmp gameLoop 
   ;jmp StartMenu
    ;call Level1Page


    JumpToLevel3:;==========LEVEL3=================
    call Clrscr

    StartGame3:
    mov score, 0       ; Initialize score to 0
    mov lifeCount,3
    mov flagGameOver,0
    mov xCoordinate,40
    mov yCoordinate,17
    call Level1PagePartc
    ;call DrawGhosts;--------------->change this to draw moving ghosts

    gameLoop3:
    mov is_obstacle,0
    mov boolIsWall,0
    mov boolIsTeleported,0
     cmp flagGameOver,1
   je GameOverPageLabel
    cmp xCoordinate, 40
    jne NoTeleport
    cmp yCoordinate, 18
    jne NoTeleport

    
    mov xCoordinate, 20
    mov yCoordinate, 22
    
    
NoTeleport:
    


   movzx eax, laddoPeelaColour
    call SetTextColor
     call DisplayScore
   
     ; Update ghost positions
    call MobilizeGhostsPink
    call MobilizeGhostsRed
    call MobilizeGhostsCyan
    call MobilizeGhostsPurple
    call MobilizeGhostsWhite
    call MobilizeghostsGreen
    inc RandomCounterVariable
        call SpawnFruits
    ; Draw ghosts in their updated positions
   ; call DrawGhostsPink

   call ReadChar
    mov SecondPageuserIn,al 

    cmp SecondPageuserIn,'e'
    je exitGame

    cmp SecondPageuserIn,'w'
    je moveUp3

    cmp SecondPageuserIn,'s'
    je moveDown3

    cmp SecondPageuserIn,'d'
    je moveRight3

    cmp SecondPageuserIn,'a'
    je moveLeft3
   ; call TeleportMrPac
    ;cmp boolIsTeleported,1
    ;je gameLoop3

    moveUp3:
    mov bl, xCoordinate
    mov bh, yCoordinate
    dec bh 
    call CollisionWithFixedObstacles
    cmp is_obstacle, 1
    je  gameLoop3
    call MovePAC
    sub yCoordinate,1
    call CheckWallCollisions
    cmp boolIswall,1
    je SkipMovementWallDetected1
    ;jmp noWall1
    call SetThePACOntoScreen
    
    call CheckCollisionsForMovingGhostsLevel3 ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
   call CheckFruitCollisions
   jmp gameLoop3
   SkipMovementWallDetected1:
    add yCoordinate,1
   jmp gameLoop3

    moveDown3:
     mov bl, xCoordinate
    mov bh, yCoordinate
    inc bh 
    call CollisionWithFixedObstacles
    cmp is_obstacle, 1
    je  gameLoop3
    call MovePAC
    add yCoordinate,1
     call CheckWallCollisions
    mov boolIsWall,0
    je SkipMovementWallDetected2
    call SetThePACOntoScreen
   
     call CheckCollisionsForMovingGhostsLevel3 ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
   call CheckFruitCollisions
   jmp gameloop3
    SkipMovementWallDetected2:
   sub yCoordinate,1
   
   jmp gameLoop3

    moveRight3:
     mov bl, xCoordinate
    mov bh, yCoordinate
    inc bl
    call CollisionWithFixedObstacles
    cmp is_obstacle, 1
    je  gameLoop3
    call MovePAC
    add xCoordinate,1
     call CheckWallCollisions
    mov boolIsWall,0
    je SkipMovementWallDetected3
    call SetThePACOntoScreen
  
     call CheckCollisionsForMovingGhostsLevel3 ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    call CheckFruitCollisions 
    jmp gameloop3
      SkipMovementWallDetected3:
   sub xCoordinate,1
    jmp gameLoop3

    moveLeft3:
     mov bl, xCoordinate
    mov bh, yCoordinate
    dec bl 
    call CollisionWithFixedObstacles
    cmp is_obstacle, 1
    je  gameLoop3
    call MovePAC
     sub xCoordinate,1
     call CheckWallCollisions
    mov boolIsWall,0
    je SkipMovementWallDetected4
    call SetThePACOntoScreen
    
      call CheckCollisionsForMovingGhostsLevel3 ;this function sees if our pacman,s new position coincides with the ghost position if so pause game
    call CheckFruitCollisions
    jmp gameloop3
    SkipMovementWallDetected4:
        add xCoordinate,1   
    jmp gameLoop3


    GameOverPageLabel:
    call gameOverpage
    jmp StartMenu ;;;;;;UNCOMMENT THIS BAAD MN IN COMPILINg


  

    exitGame:
    call Clrscr
   
    exit
main ENDP

END main
