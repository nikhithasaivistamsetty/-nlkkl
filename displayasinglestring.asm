ORG 100h          ; Origin, to specify that the program starts at 100h (COM file format)
; Print "Enter the input: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_enter_input ; Load address of the string
INT 21h           ; Call DOS interrupt to print the string
; Read a single character from user
MOV AH, 01h       ; DOS function 01h: read single character
INT 21h           ; Call DOS interrupt to get the character
MOV BL, AL        ; Store the input character in BL register
; Print "The entered input is: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_entered_input ; Load address of the second string
INT 21h           ; Call DOS interrupt to print the string
; Print the character stored in BL register
MOV DL, BL        ; Move character from BL to DL for printing
MOV AH, 02h       ; DOS function 02h: print single character
INT 21h           ; Call DOS interrupt to print the character
; Terminate the program
MOV AH, 4Ch       ; DOS function 4Ch: terminate program
INT 21h           ; Call DOS interrupt to exit
; Data section
msg_enter_input DB 'Enter the input: $'          ; Prompt message
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' ; Newline and display message
END         ; End of program