	.data
	.global b_p
	.global r_p
	.global g_p
	.global y_p
	.global u_p
	.global m_p
	.global c_p
	.global w_p
b_p:	.string	27,"[30m",0
r_p:	.string	27,"[31m",0
g_p:	.string	27,"[32m",0
y_p:	.string	27,"[33m",0
u_p:	.string	27,"[34m",0
m_p:	.string	27,"[35m",0
c_p:	.string	27,"[36m",0
w_p:	.string	27,"[37m",0
	.text
	.global read_character		;
	.global	read_char_intr
	.global output_character	;
	.global output_string		;
	.global read_string			;
	.global uart_init			;
	.global gpio_init			;
	.global read_from_push_btn	;
	.global illuminate_RGB_LED
	.global num_digits			;
	.global int2str				;
	.global str2int				;
	.global timer_init
	.global interrupt_init
	.global colorize_char
	.global black_paint
	.global red_paint
	.global green_paint
	.global yellow_paint
	.global blue_paint
	.global magenta_paint
	.global cyan_paint
	.global white_paint
black_paint:	.word	b_p
red_paint:	.word	r_p
green_paint:	.word	g_p
yellow_paint:	.word	y_p
blue_paint:	.word	u_p
magenta_paint:	.word	m_p
cyan_paint:	.word	c_p
white_paint:	.word	w_p
;;;;;Integer Calculations;;;;
int2str:;				;r1 holds writing adress
 	STMFD r13!, {r14} 	; r0 contains integer
 	BL num_digits 		; (r2 holds num_digits)
	MOV r5,#0			; r5 will hold current char
	add r1, r1,r2		; store NULL
	strb r5,[r1]		; the end
	MOV r6, #10
int_2_s_writer:
	sub r1,r1,#1		; Subtract 1 from pointer
	;read along with comments to see logic flow
	;example value of 152 in r0
	UDIV r8,r0, r6		;1523/10 =  152
	MUL r5,r8,r6		;quotient = 152*10 = 1520
	sub r9,r0,r5		;1523-1520=3
	add r7,r9,#0x30 		;3 + #30 = "3"
	strb r7,[r1]		;Store char at ptr
	mov r0,r8			;152
	CMP r0,#0			;
	BNE int_2_s_writer	;restart
 	LDMFD r13!, {r14};	r1 contains adress of string
 	MOV pc, lr


str2int:
 	STMFD r13!, {r14}	;r1 contains  Pointer to string
 	ldr r5, [r1];
 	MOV r0, #0			; integer r0 = 0
 	MOV r6, #10			; r3 = 10
TEST:
	LDRB r7, [r5]	; Get char from r5
	CMP r7, #0		; Is char NULL?
    BEQ return_s_2_I	; Branch to finish if r4 is NULL
    SUB r8, r7, #0x30; Else, get remainder
    MUL r0, r0, r6	; Multiply current int by 10
    ADD r0, r0, r8	; Add remainder
    ADD r5, r5, #1	; Increment ptr by 1
	B TEST			; Repeat
return_s_2_I: ;Return integer in r0
 	LDMFD r13!, {r14}
 	MOV pc, lr

num_digits:
 	STMFD r13!, {r14}	;r0: contains integer
 	MOV r10,r0
	MOV r5, #0	   		;r5: Init #of digits = 0
	MOV r6, #10   	;r6 = 10
div_L:
	UDIV r10, r10, r6		;count # of times 10 divides r0
	ADD r5, r5, #1  	;Increment the number of digits
	CMP r10, #0 	  		;See if the result of the division is greater than 1
	BNE div_L		  	;Branch back to loop
	mov  r2, r5			;Return #digits in r2, number in r0
	LDMFD r13!, {r14}
 	MOV pc, lr

;;;;;;Port Initializations;;;;;;;

interrupt_init:
	STMFD SP!,{r0-r12,lr} ; Preserve registers on the stack

	;Set the Receive Interrupt Mask (RXIM)
	mov r5,#0xC038
	movt r5,#0x4000
	ldr r6,[r5]
	;RXIM @ bit 4 of UARTIM
	orr r6,r6,#0x10
	str r6,[r5]

	;Set bits in Enable register
	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	orr r6,r6,#0x20
	str r6,[r5]


	;Configuring the GPIOIS for interrupts
	mov r5,#0x5404
	movt r5,#0x4002
	ldr r6,[r5]
	; @ bit 4 of GPIOIS
	and r6,r6,#0x10
	str r6,[r5]

	;Setup the Interrupt for Edge or Level Sensitive via the GPIO Interrupt Both Edges(GPIOIBE)
	mov r5,#0x5408
	movt r5,#0x4002
	ldr r6,[r5]
	;@ bit 5 of GPIOIBE
	and r6,r6,#0x10
	str r6,[r5]


	;Setup the Interrupt for Falling Edge or Rising Edge Triggering via the GPIO Interrupt(GPIOIV)
	mov r5,#0x540C
	movt r5,#0x4002
	ldr r6,[r5]
	and r6, r6, #0x10   ;Falling edge
	str r6,[r5]

	;Enable the Interrupt via the GPIO Interrupt Mask Register (GPIOIM)
	mov r5,#0x5410
	movt r5,#0x4002
	ldr r6,[r5]
	ORR r6, r6, #0x10 ;Enabling
	str r6,[r5]


	;Set the bit 30 bit in the Interrupt 0-31 Set Enable Register (EN0)
	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	ORR r6, r6, #0x40000000
	str r6,[r5]

	LDMFD sp!, {r0-r12,lr}
	MOV pc, lr

timer_init:
	STMFD SP!,{r0-r12,lr} ; Preserve registers on the stack

	; Connect Clock to Timer

	mov r5,#0xE604
	movt r5,#0x400F
	ldr r6,[r5]
	ORR r6,r6,#0x1
	str r6,[r5]

	; Disable timer

	mov r5,#0x000C
	movt r5,#0x4003
	ldr r6,[r5]
	and r6,r6,#0x1
	str r6,[r5]

	; Put timer in 32-bit Mode

	mov r5,#0x0000
	movt r5,#0x4003
	ldr r6,[r5]
	mov r7, #0xFFF8
	movt r7, #0xFFFF
	and r6,r6, r7
	str r6,[r5]


	; Put timer in Periodic Mode

	mov r5,#0x0004
	movt r5,#0x4003
	ldr r6,[r5]
	ORR r6,r6,#0x2
	str r6,[r5]

	; Setup interval period

	mov r3,#0x0028
    movt r3,#0x4003
    ldr r2,[r3]
    ;Clock runs at 16MHZ, so set interval to 16M
    mov r2,#0x2400
    movt r2,#0x00F4            ;0xF42400
    str r2,[r3]

	; Enable timer to interrupt processor

	mov r5,#0x0018
	movt r5,#0x4003
	ldr r6,[r5]
	ORR r6,r6,#0x1
	str r6,[r5]


	; Configure Processor to Allow Timer to Interrupt Processor

	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	ORR r6,r6,#0x80000
	str r6,[r5]


	; Enable timer

 	mov r5,#0x000C
	movt r5,#0x4003
	ldr r6,[r5]
	ORR r6,r6,#0x1
	str r6,[r5]

	LDMFD sp!, {r0-r12,lr}
	MOV pc, lr

gpio_init:
	STMFD sp!,{lr}	;
	;Enable GPIO Port Clock
	mov r4,#0xE608;
	movt r4,#0x400F;	r4 points to GPIO clock
	ldr r3, [r4]
	ORR r2, r3, #0x20
	strb r2,[r4];		Enable Port 5
	;Pin direction set to input by default
	mov r4,#0x5400;
	movt r4,#0x4002;	r4 points to GPIO clock
	ldr r3, [r4]
	and r2, r3, #0x00
	strb r2,[r4];		Enable Port 5
	;Set SW1 pin as Digital I/O
	mov r4,#0x551C;
	movt r4,#0x4002;	r4 points to Port F GPIODEN
	ldr r3, [r4];
	ORR r2, r3, #0x10;	Enable Pin 4 as digital
	strb r2,[r4];
	;Configuring Pull up Resistor
	mov r4,#0x5510;
	movt r4,#0x4002;	r4 points to Port F GPIOPUR
	ldr r3, [r4];
	ORR r2, r3, #0x10;	Pull pin 4 up
	strb r2,[r4];
	LDMFD sp!, {lr}
	MOV pc, lr

uart_init:
	STMFD sp!,{lr}	; Store register lr on stack
	;0x400FE618 |= 1;
	MOV r4, #0xE618
	MOVT r4, #0x400F
	ldr r5, [r4]
	ORR r3, r5, #1
	str r3, [r4]
	;0x400FE608 |= 1
	MOV r4, #0xE608
	MOVT r4, #0x400F
	ldr r5, [r4]
	ORR r3, r5, #1
	str r3, [r4]
	;0x4000C030 |= 0
	MOV r4, #0xC030
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #1
	str r3, [r4]
	;0x4000C024 |= 8
	MOV r4, #0xC024
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #8
	str r3, [r4]
	;0x4000C028 |= 44
	MOV r4, #0xC028
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #44
	str r3, [r4]
	; #0x4000CFC8|=0
	MOV r4, #0xCFC8
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #44
	str r3, [r4]
	;0x4000C02C |= 0x60
	MOV r4, #0xC02C
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #0x60
	str r3, [r4]
	;0x4000C030 |= 0x301
	MOV r4, #0xC030
	MOVT r4, #0x4000
	ldr r5, [r4]
	MOV r6, #0x301
	ORR r3, r5, r6
	str r3, [r4]
	;0x4000451C |= 0x03
	MOV r4, #0x451C
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #0x03
	str r3, [r4]
	;0x40004420 |= 0x03
	MOV r4, #0x4420
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #0x03
	str r3, [r4]
	;0x4000452C |= 0x11
	MOV r4, #0x452C
	MOVT r4, #0x4000
	ldr r5, [r4]
	ORR r3, r5, #0x11
	str r3, [r4]

 	LDMFD sp!, {lr}
	mov pc, lr

;;;;;;;UART Action;;;;;;

read_string:
	STMFD sp!,{lr}	;r1 contains write address
	MOV r2, #0		;length of string
continue_reading:
	BL read_character		; returns character in r0
	BL output_character		;echo,If user "Enters", exit
	CMP r0, #0xA			;output char returns line feed
	BEQ stop_reading
	STRB r0, [r1]			;store char in mem
	ADD r2, r2, #1
	ADD r1, r1, #1			;increment through memory
	B continue_reading
stop_reading:
	MOV r9, #0
	STRB r9, [r1]	; storing null at the end of the string
	LDMFD sp!, {lr}	;
	mov pc, lr

read_character:
	STMFD sp!,{lr}	; Store register lr on stack
try_read:
  	MOV r5, #0xC018		; point to UART0's flag register
  	MOVT r5, #0x4000	;
  	ldr r6,[r5]			;
  	and r6,r6,#16		; masking to see if anything has been inputted
  	cmp r6, #16 		; if 4th bit is 1, read
  	BEQ try_read		; loop until full
  	MOV r5, #0xC000		;Point to UART0's data register
  	MOVT r5, #0x4000	;
  	ldr r0,[r5] 		; r0 contains character that was read
 	LDMFD sp!, {lr}
	mov pc, lr

read_char_intr:
	STMFD sp!,{lr}	; Store register lr on stack
  	MOV r5, #0xC000		;Point to UART0's data register
  	MOVT r5, #0x4000
  	ldr r0,[r5] 		; r0 contains character that was read
  	LDMFD sp!, {lr}
	mov pc, lr

colorize_char:
	STMFD sp!,{lr}			;r2 = rgb_flag
	; if char is ! (black)
	cmp r2,#0x21
	ldr r4,black_paint
	beq	colorizer
	; if char is # (Red)
	cmp r2,#0x23
	ldr r4,red_paint
	beq	colorizer
	; if char is $ (Green)
	cmp r2,#0x24
	ldr r4,green_paint
	beq	colorizer
	; if char is % (Yellow)
	cmp r2,#0x25
	ldr r4,yellow_paint
	beq	colorizer
	;if char is  & (Blue)
	cmp r2,#0x26
	ldr r4,blue_paint
	beq	colorizer
	; if char is ' (Magenta)
	cmp r2,#0x27
	ldr r4,magenta_paint
	beq	colorizer
	; if char is ( (Cyan)
	cmp r2,#0x28
	ldr r4,cyan_paint
	beq	colorizer
	; if char is ) (White)
	cmp r2,#0x29
	ldr r4,white_paint
	beq	colorizer
	b finish_o_c_s
colorizer:
	LDRB r0, [r4]
	CMP r0, #0
	BEQ finish_o_c_s
	BL output_character		;same thing as output character
	ADD r4, r4, #1			;output color code
	B colorizer
	;exit
finish_o_c_s:					;exit
 	LDMFD sp!, {lr}
	mov pc, lr

output_string:
	STMFD sp!,{lr}			;r1 contains read address
out_s_loop:
	LDRB r0, [r1]
	;if character is a number,
	;output it's corresponing color code
	cmp r0,#0x29
	BGT no_color
	cmp r0,#0x21
	BLT no_color
	;output color code
	mov r2,r0
	BL colorize_char
	ADD r1, r1, #1
	B out_s_loop
no_color:
	BL output_character		;output char
	ADD r1, r1, #1			;traverse string
	CMP r0, #0			;Send char to output in r0
	BNE out_s_loop
finish_o_s:					;exit
 	LDMFD sp!, {lr}
	mov pc, lr

output_character: ;r0 holds character to output
	STMFD sp!,{lr}	; Store register lr on stack
Loop:
  	MOV r5, #0xC018		; Point to UART0'S flag register
  	MOVT r5, #0x4000	;
  	ldr r6,[r5]			;
  	and r6,r6,#32		; mask to see if anything is being outputted
  	cmp r6, #32 		; if 5th bit is 1, its full
  	BEQ Loop            ; Loop until empty
  	MOV r5, #0xC000     ;
    MOVT r5, #0x4000    ; Point to UART0's data register
  	STRB r0, [r5]       ;
  	CMP r0, #0xD		; if r0 is equal the hex value of carriage return
  	BNE exit_o_c		; If not equal, branch to finish
  	SUB r0, r0, #0x3	;
  	B output_character	; output line feed
exit_o_c:
 	LDMFD sp!, {lr}		;r0 still contains outputted character
	mov pc, lr


read_from_push_btn:		;Enable SW1
	STMFD sp!,{lr}	; Store register lr on stack
	mov r5, #0x5000;		Using Base Addresses to Access a
	movt r5, #0x4002;		GPIO Control Register for Port F
	add r5, r5, #0x400; 	and setting GPIO Pin Direction via
	ldr r3, [r5];		GPIO direction register (configuring pin
	and r2, r3, #0xEF;		as output)
	strb r2, [r5]
wait_for_press:
; Read from Data Register
	mov r4,#0x53FC;
	movt r4,#0x4002;	r4 GPIODATA
	ldr r3, [r4];
	and r0,r3,#0x10
	cmp r0, #0x0;	If button is pressed, should be at = 0
	bne wait_for_press
	;wait for unpress
wait_for_release:
	mov r4,#0x53FC;
	movt r4,#0x4002;	r4 GPIODATA
	ldr r3, [r4];
	and r5,r3,#0x10
	cmp r5, #0x0;	If button is pressed, should be at = 0
	beq wait_for_press
	;r0 return
	LDMFD sp!, {lr}
	MOV pc, lr

illuminate_RGB_LED:
	STMFD sp!,{lr}; 		Store register lr on stack

	cmp r1, #0x24 	; Green
	BEQ setColorGreen

	cmp r1, #0x23	; Red
	BEQ setColorRed

	cmp r1, #0x26	; Blue
	BEQ setColorBlue

	cmp r1, #0x25	; Yellow
	BEQ setColorYellow

	cmp r1, #0x28	; Cayan
	BEQ setColorCayan

	cmp r1, #0x27	; Magenta
	BEQ setColorMagenta

	cmp r1, #0x29	; White
	BEQ setColorWhite

	cmp r1, #0x21	; Black
	BEQ setColorBlack

	B begin

setColorGreen:
	mov r0, #0x8
	B begin

setColorRed:
	mov r0, #0x2
	B begin

setColorBlue:
	mov r0, #0x4
	B begin

setColorYellow:
	mov r0, #0xA
	B begin

setColorCayan:
	mov r0, #0xC
	B begin

setColorMagenta:
	mov r0, #0x6
	B begin

setColorWhite:
	mov r0, #0xE
	B begin

setColorBlack:
	mov r0, #0x0


begin:
	mov r5, #0x5000;		Using Base Addresses to Access a
	movt r5, #0x4002;		GPIO Control Register for Port F
	add r5, r5, #0x400; 	and setting GPIO Pin Direction via
	ldr r3, [r5];		GPIO direction register (configuring pin
	ORR r2, r3, r0;		as output)
	strb r2, [r5]

	mov r5, #0x5000;
	movt r5, #0x4002; 	Configuring GPIO pin as digital
	add r5, r5, #0x51C;	enabling pins
	ldr r3, [r5];
	ORR r2, r3, r0
	strb r2, [r5]

	mov r5, #0x5000;
	movt r5, #0x4002;
	add r5, r5, #0x3FC;
	ldr r3, [r5];  		Setting pins to HIGH using data register
	ORR r2, r3, r0;		after configured bas output
	strb r2, [r5]
	cmp r0,#0
 	BNE	 ext_ls
 	mov r2,#0;		after configured bas output
	strb r2, [r5]
ext_ls:
	LDMFD sp!, {lr}
	MOV pc, lr


	.end
