ORG 100h          ; Origin, to specify that the program starts at 100h (COM file format)

; Print "Enter the input: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_enter_input ; Load address of the string
INT 21h           ; Call DOS interrupt to print the string

; Read multiple characters from user
MOV AH, 0Ah       ; DOS function 0Ah: buffered input
MOV DX, OFFSET input_buffer  ; Load address of the input buffer
INT 21h           ; Call DOS interrupt to read the string

; Add a $ at the end of the entered string for printing
MOV AL, '$'            ; Store $ in AL
LEA DI, input_buffer+2 ; DI points to the actual input string
MOV CL, [input_buffer+1] ; Get the count of characters entered
ADD DI, CX             ; Move DI to the end of the entered string
MOV [DI], AL           ; Insert $ at the end of the string

; Print "The entered input is: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_entered_input ; Load address of the second string
INT 21h           ; Call DOS interrupt to print the string

; Print the entered string
LEA DX, input_buffer+2  ; Load address of the actual input (skip buffer size and count)
MOV AH, 09h             ; DOS function 09h: print string
INT 21h                 ; Call DOS interrupt to print the input string

; Terminate the program
MOV AH, 4Ch       ; DOS function 4Ch: terminate program
INT 21h           ; Call DOS interrupt to exit

; Data section
msg_enter_input DB 'Enter the input: $'          ; Prompt message
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' ; Newline and display message
input_buffer DB 10, 0   ; Buffer to store input: 10 max chars, initial count 0
                       ; The actual characters will be stored starting here
                       ; Followed by a terminator (CR)
END         ; End of program