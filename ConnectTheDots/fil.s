	.data
	.global game_sel
	.global game_0
	.global game_1
	.global game_2
	.global game_3
	.global game_4
	.global game_5
	.global game_6
	.global game_7
	.global game_8
	.global game_9
	.global game_10
	.global game_11
	.global game_12
	.global game_13
	.global game_14
	.global game_15
	.global game_16
	.global game_17
	.global	u_q
	.global drawing_color
	.global u_i
	.global	u_inst
	.global r
	.global move_cursor
	.global rcursor
	.global	scursor
	.global l_mov
	.global time_hlr
	.global	time_act
	.global seconds_val
	.global minutes_val
	.global bckgnd
	.global score
	.global scr_out
	.global scr_str
score:	.int	0
scr_out:	.string	")Connected Colors: ",0
scr_str:	.string	"",0
time_sec:	.string	"0",0
time_min:	.string	"0",0
bckgnd:	.string	27,"[40m",0
time_hlr:	.string	")Time Elapsed: ",0
seconds_val:	.int	0
minutes_val:	.int	0
rcursor:	.string	27,"[u",0
scursor:	.string 27,"[s",0
move_cursor:	.int	24
rc:				.int	0
game_selec:	.string	"",0
game_0:	.string	")X)X)X)X)X)X)X)X)X)X",0XD	;21 long
	.string ")X#O%O&O! ! ! ! ! )X",0XD
	.string ")X! ! ! 'O(O! )O! )X",0XD
	.string ")X! ! ! ! ! ! (O! )X",0XD
	.string ")X! ! ! ! ! ! ! ! )X",0XD
	.string ")X! #O! ! ! )O! 'O)X",0XD
	.string ")X$O%O! &O! ! ! $O)X",0XD
	.string ")X! ! ! ! ! ! ! ! )X",0XD
	.string	")X)X)X)X)X)X)X)X)X)X",0
game_1:	.string	"!X!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X#O%O&O! ! ! ! ! !X",0XD
	.string 	"!X! ! ! 'O(O! )O! !X",0XD
	.string 	"!X! ! ! ! ! ! (O! !X",0XD
	.string 	"!X! ! ! ! ! ! ! ! !X",0XD
	.string 	"!X! #O! ! ! )O! 'O!X",0XD
	.string 	"!X$O%O! &O! ! ! $O!X",0XD
	.string 	"!X! ! ! ! ! ! ! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X!X",0

game_2:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X$O! ! ! ! #O&O!X",0XD
	.string 	"!X! %O$O! %O! ! !X",0XD
	.string 	"!X! #O! ! ! ! &O!X",0XD
	.string 	"!X! ! ! ! ! ! (O!X",0XD
	.string 	"!X(O! ! ! ! ! 'O!X",0XD
	.string 	"!X! ! ! ! ! ! ! !X",0XD
	.string 	"!X)O! ! )O'O! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_3:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X(O)O! ! ! ! )O!X",0XD
	.string 	"!X! ! ! ! ! ! #O!X",0XD
	.string 	"!X(O! $O! ! ! &O!X",0XD
	.string 	"!X! ! ! ! #O! ! !X",0XD
	.string 	"!X! ! ! %O! %O! !X",0XD
	.string 	"!X! ! ! $O! ! ! !X",0XD
	.string 	"!X! ! ! #O'O! 'O!X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_4:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X(O! $O%O)O! ! !X",0XD
	.string 	"!X! ! ! ! ! #O)O!X",0XD
	.string 	"!X! (O! ! ! ! ! !X",0XD
	.string 	"!X! ! ! ! ! &O! !X",0XD
	.string 	"!X! %O! ! ! 'O! !X",0XD
	.string 	"!X! ! ! &O! ! ! !X",0XD
	.string 	"!X$O! ! 'O! ! #O!X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_5:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X! ! ! ! ! ! $O!X",0XD
	.string 	"!X! ! ! ! ! #O$O!X",0XD
	.string 	"!X! #O'O! %O&O! !X",0XD
	.string 	"!X! (O'O%O)O! ! !X",0XD
	.string 	"!X! ! )O! ! ! ! !X",0XD
	.string 	"!X! (O&O! ! ! ! !X",0XD
	.string 	"!X! ! ! ! ! ! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_6:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X! ! ! ! ! ! &O!X",0XD
	.string 	"!X! %O%O$O! ! (O!X",0XD
	.string 	"!X! ! ! ! ! )O! !X",0XD
	.string 	"!X&O! ! ! ! )O! !X",0XD
	.string 	"!X$O! ! ! ! ! ! !X",0XD
	.string 	"!X#O! ! ! ! ! (O!X",0XD
	.string 	"!X'O! 'O! ! ! #O!X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_7:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X$O%O)O(O! ! 'O!X",0XD
	.string 	"!X! ! ! ! ! ! ! !X",0XD
	.string 	"!X! ! ! ! ! ! ! !X",0XD
	.string 	"!X! %O! ! ! ! ! !X",0XD
	.string 	"!X! $O)O! ! ! ! !X",0XD
	.string 	"!X#O! ! ! ! ! ! !X",0XD
	.string 	"!X&O&O#O(O'O! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_8:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X! ! %O%O)O! ! !X",0XD
	.string 	"!X! ! ! ! ! &O! !X",0XD
	.string 	"!X! ! ! (O! )O! !X",0XD
	.string 	"!X! ! $O! ! ! ! !X",0XD
	.string 	"!X! $O#O! ! ! 'O!X",0XD
	.string 	"!X! #O! &O! ! ! !X",0XD
	.string 	"!X(O'O! ! ! ! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_9:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 	"!X$O! ! ! ! ! ! !X",0XD
	.string 	"!X! ! %O! #O%O! !X",0XD
	.string 	"!X! ! ! ! ! ! ! !X",0XD
	.string 	"!X! ! ! $O! #O! !X",0XD
	.string 	"!X! (O! ! ! &O! !X",0XD
	.string 	"!X! ! )O! ! 'O! !X",0XD
	.string 	"!X(O)O'O! &O! ! !X",0XD
	.string		"!X!X!X!X!X!X!X!X!X",0

game_10: .string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X'O! ! ! ! ! (O!X",0XD
	.string 		"!X$O! $O'O(O#O#O!X",0XD
	.string 		"!X&O! ! ! ! ! &O!X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! ! ! ! )O%O! !X",0XD
	.string 		"!X! ! %O! ! ! ! !X",0XD
	.string 		"!X)O! ! ! ! ! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_11:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X#O#O(O$O)O! %O!X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! $O(O! ! 'O! !X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! ! ! ! ! ! %O!X",0XD
	.string 		"!X! &O! ! ! ! ! !X",0XD
	.string 		"!X! ! ! )O&O'O! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_12:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X%O! ! ! ! ! ! !X",0XD
	.string 		"!X%O! ! ! ! ! ! !X",0XD
	.string 		"!X)O(O(O#O$O! ! !X",0XD
	.string 		"!X)O#O! ! ! ! ! !X",0XD
	.string 		"!X$O! ! ! ! ! ! !X",0XD
	.string 		"!X! ! &O'O'O! ! !X",0XD
	.string 		"!X! ! ! ! &O! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_13:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X! ! %O$O! ! &O!X",0XD
	.string 		"!X! (O! ! ! ! )O!X",0XD
	.string 		"!X! ! %O! ! &O! !X",0XD
	.string 		"!X(O! ! ! ! ! ! !X",0XD
	.string 		"!X$O! ! ! ! )O#O!X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X#O'O! ! ! ! 'O!X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_14:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X! ! %O$O(O! ! !X",0XD
	.string 		"!X! ! ! ! ! 'O(O!X",0XD
	.string 		"!X! ! ! ! ! 'O#O!X",0XD
	.string 		"!X! ! ! ! $O! ! !X",0XD
	.string 		"!X! &O! ! %O! )O!X",0XD
	.string 		"!X! #O! ! ! ! ! !X",0XD
	.string 		"!X! ! ! &O)O! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_15:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X! ! #O$O! ! $O!X",0XD
	.string 		"!X! ! ! ! ! ! #O!X",0XD
	.string 		"!X&O! ! ! ! ! &O!X",0XD
	.string 		"!X)O(O'O! ! %O%O!X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! ! ! (O! ! ! !X",0XD
	.string 		"!X! ! ! )O'O! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_16:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X! $O(O$O! ! ! !X",0XD
	.string 		"!X! 'O! #O! ! ! !X",0XD
	.string 		"!X! ! ! &O! #O! !X",0XD
	.string 		"!X! ! ! )O&O%O! !X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! 'O(O)O! %O! !X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0

game_17:	.string	"!X!X!X!X!X!X!X!X!X",0XD
	.string 		"!X! ! ! ! ! ! ! !X",0XD
	.string 		"!X! ! ! ! ! #O! !X",0XD
	.string 		"!X! ! %O%O(O#O! !X",0XD
	.string 		"!X! ! )O$O! &O! !X",0XD
	.string 		"!X! ! )O$O&O'O! !X",0XD
	.string 		"!X! ! ! ! ! 'O! !X",0XD
	.string 		"!X! ! ! (O! ! ! !X",0XD
	.string			"!X!X!X!X!X!X!X!X!X",0
l_mov:	.string	" ",0
p:	.string 27,"[5;2H",0
u:	.string 27,"[1A",0
u6:	.string 27,"[6A",0
d:	.string 27,"[1B",0
r:	.string 27,"[1C",0
l:	.string 27,"[1D",0
drawing_color:	.string	"!",0
u_i:	.string	" ",0
switchPos:	.string 27,"[14;0H",0
prompt:		.string ")Game is Paused.. Hit [r] to Restart. Hit [n] to try new puzzle. Hit [c]to continue. Hit [x] to exit",0
u_q:	.string	")Welcome to Color Connector. Want to play [y\n]",0
u_inst:	.string	")Press switch to change from vertical to horizontal, spacebar to switch direction.",0
rsrt:	.string	")Restart [y\n]",0
	.text
	.global timer_init
	.global Timer_Handler
	.global uart_init
	.global	read_char_intr
	.global UART0_Handler
	.global Switch_Handler
 	.global interrupt_init
	.global lab6
	.global read_character
	.global output_character
	.global int2str
	.global output_string
	.global	switch
	.global gpio_init
	.global illuminate_RGB_LED
	.global turn_LED_off
	.global user_input
	.global	exit_game
	.global	user_query
	.global non_interrupt_timer_init
	.global	user_instructions
	.global game_over
	.global restart
	.global delete_line
	.global	board_0
	.global board_1
	.global board_2
	.global board_3
	.global board_4
	.global board_5
	.global board_6
	.global board_7
	.global board_8
	.global board_9
	.global board_10
	.global board_11
	.global board_12
	.global board_13
	.global board_14
	.global board_15
	.global board_16
	.global board_17
	.global	game_state
	.global output_time
	.global cursor_offset
;User Comm Strings
user_instructions:	.word	u_inst
user_query:	.word	u_q
restart:	.word	rsrt
user_input:	.word	u_i

;Cursor Movement
SwitchPrompt:	.word	prompt
cursor2: 		.word   switchPos
restore_cursor:	.word	rcursor
save_cursor:	.word	scursor
cursor1: .word 	p
up:	.word u
up6:	.word u6
down:	.word d
right:	.word r
left:	.word l
cursor_offset:	.word	move_cursor
last_movement:	.word	l_mov

;Time
timer_words:	.word	time_hlr
time_seconds:	.word	time_sec
time_minutes:	.word	time_min
seconds_elapsed:	.word	seconds_val
minutes_elapsed:	.word	minutes_val

;Game
color_flag:	.word	drawing_color
board_0:	.word	game_0
board_1:	.word	game_1
board_2:	.word	game_2
board_3:	.word	game_3
board_4:	.word	game_4
board_5:	.word	game_5
board_6:	.word	game_6
board_7:	.word	game_7
board_8:	.word	game_8
board_9:	.word	game_9
board_10:	.word	game_10
board_11:	.word	game_11
board_12:	.word	game_12
board_13:	.word	game_13
board_14:	.word	game_14
board_15:	.word	game_15
board_16:	.word	game_16
board_17: 	.word	game_17
board_select:	.word	board_0
background:	.word	bckgnd
num_completed:	.word	score
score_out:	.word	scr_out
score_string:	.word	scr_str
;Control flags
restart_check:	.word	rc

lab6:
	STMFD SP!,{r0-r12,lr} ; Store register lr on stack
	; Initialize game
	BL gpio_init
	BL uart_init

res:
	;ask user if they want to play *
	mov r0,#0xC
	BL output_character
	ldr r1,user_query
	BL output_string

	;Read user input
	BL read_character
	BL output_character	;echo
	cmp r0,#121
	BNE exit_game

	;Set time to 0
	ldr r3,time_seconds
	ldr r4,time_minutes
	mov r2,#0
	str r2,[r3]
	str r2,[r4]
	;Output time
	BL output_time
	ldr r1,background
	BL output_string

	;Sample time
	mov r5, #0x0050
	movt r5, #0x4003
	ldr r0,[r5]
	and r6,r0,#0xF
	ldr r5,board_0
	;dont know how double pointers
	;get random board
	cmp r6,#0
	it eq
	ldreq r5,board_0
	cmp r6,#1
	it eq
	ldreq r5,board_1
	cmp r6,#2
	it eq
	ldreq r5,board_2
	cmp r6,#3
	it eq
	ldreq r5,board_3
	cmp r6,#4
	it eq
	ldreq r5,board_4
	cmp r6,#5
	it eq
	ldreq r5,board_5
	cmp r6,#6
	it eq
	ldreq r5,board_6
	cmp r6,#7
	it eq
	ldreq r5,board_7
	cmp r6,#8
	it eq
	ldreq r5,board_8
	cmp r6,#9
	it eq
	ldreq r5,board_9
	cmp r6,#10
	it eq
	ldreq r5,board_10
	cmp r6,#11
	it eq
	ldreq r5,board_11
	cmp r6,#12
	it eq
	ldreq r5,board_12
	cmp r6,#13
	it eq
	ldreq r5,board_13
	cmp r6,#14
	it eq
	ldreq r5,board_14
	cmp r6,#15
	it eq
	ldreq r5,board_15
	cmp r6,#16
	it eq
	ldreq r5,board_16
	;select game
	;ldr r2,board_select
	;ldr r1,[r2]
	;str r5,[r2] this shit should fucking work
	ldr r2,board_select
	ldr r1,[r2]
	BL output_string

	;load and save cursor position
	ldr r1,cursor1
	BL output_string
	ldr r1,save_cursor
	BL output_string

	;enable Interupts
	;BL gpio_init
	BL timer_init
	BL interrupt_init

infinity:
	;Check for restart flags
	ldr r3, restart_check
	ldrb r2,[r3]
	cmp r2, #1
	BEQ res
	mov r2, #0
	strb r2,[r3]
	B infinity
	LDMFD sp!, {r0-r12,lr}
	MOV pc, lr

output_time:
	STMFD SP!, {lr}

	;Clear screen
	mov r0,#0xC
	BL output_character

	ldr r1,timer_words
	BL output_string

	;load time
	ldr r1,time_minutes
	ldr r4,minutes_elapsed
	ldr r6,[r4]

	;output minutes
	mov r0,r6
	BL int2str
	ldr r1,time_minutes
	BL output_string

	;output :
	mov r0,#0x3A
	BL output_character

	;output seconds
	ldr r3,seconds_elapsed
	ldr r2,[r3]
	ldr r1,time_seconds
	mov r0, r2
	BL int2str
	BL output_string

	mov r0,#0xD
	BL output_character

	;output score
	ldr r1,score_out
	BL output_string
	ldr r2,num_completed
	ldr r1, score_string
	ldrb r0,[r2]
	BL int2str
	ldr r1, score_string
	BL output_string
	;print /7
	mov r0,#0x2F
	BL output_character
	mov r0,#0x37
	BL output_character

	;newline
	mov r0,#0xD
	BL output_character

	LDMFD sp!, {lr}
	MOV pc, lr

delete_line:
	STMFD SP!,{r6-r12,lr}
	;color @ r5
	;loop through string, changing every non "O" color r7
	;to a black space
	;decrement score
	mov r12,#0
	strb r7,[r8]
	ldr r11,board_select
	ldr r6,[r11]

	mov r10,#0x20
	mov r11,#0x21
delete_loop:
	ldrb r7,[r6]

	;check for end of string
	cmp r7,#0
	BEQ finish_delete

	;get color
	cmp r7, r5
	BNE traverse_board

	;get character
	add r6,r6,#1
	ldrb r7,[r6]
	;make sure char is not an O
	cmp r7,#0x4F
	BEQ traverse_board
	;make sure char is not a X
	cmp r7,#0x58
	BEQ traverse_board
	;replace with black space
	strb r10,[r6]
	sub r6,r6,#1
	strb r11,[r6]
	add r6,r6,#1
	mov r12,#1
traverse_board:
	;traverse string
	add r6,r6,#1
	B delete_loop

finish_delete:
	ldr r8,num_completed
	ldrb r7,[r8]
	cmp r7,#0
	it gt
	subgt r7,r7,#1
	strb r7,[r8]
	LDMFD sp!, {r6-r12,lr}
	MOV pc, lr

connected_a_color:
	STMFD SP!,{r0-r12,lr}
	;update score
	ldr r4,num_completed
	ldrb r0,[r4]
	add r0,r0,#1
	strb r0,[r4]
	LDMFD sp!, {r0-r12,lr}
	MOV pc, lr

UART0_Handler:
 	STMFD SP!,{r0-r12,lr} ; Store register lr on stack

	;Clear interrupt
	mov r5,#0xC044
	movt r5,#0x4000
	ldr r6,[r5]
	;RXIC @ bit 5 of UARTIM
	orr r6,r6,#0x20
	str r6,[r5]

	;Read Character
	BL read_char_intr
	ldr r2,cursor_offset
	ldrb r3,[r2]
	mov r11,r0
	mov r10, r3		;r10 holds previous cursor position
	cmp r0, #0x77 	; if "w" move forward
	BEQ move_up
	cmp r0, #0x73	; if "s" move down
	BEQ move_down
	cmp r0, #0x64	; if "d" move right
	BEQ move_right
	cmp r0, #0x61	; if "a" move right
	BEQ move_left
	cmp r0,#32		;if "space", change color
	BEQ space_action

move_up:
	ldr r1, up
	sub r3,r3,#21
	B wasd

move_down:
	ldr r1, down
	add r3,r3,#21
	B wasd

move_right:
	ldr r1, right
	add r3,r3,#2
	B wasd

move_left:
	ldr r1, left
	sub r3,r3,#2

wasd:
	;See what is drawing
 	ldr r6,color_flag
	ldrb r7,[r6]
	;cursor board position
	ldr r12,board_select
	ldr r4,[r12]
	add r4,r4,r3
	ldrb r5,[r4]
	;r4 = cursor position ptr
 	;r5 = what cursor is hovering over
 	;r10 = current cursor position
	;r7 = drawing color

	;if "X", exit
	cmp r5, #0x58
	BEQ exit_UART_handler

	;If we are drawing nothing, just move the player
	cmp r7,#0x21
	BEQ move_player

	;if "O", check for score and exit
	cmp r5, #0x4F
	BNE not_on_portal
	;check for O's color
	sub r9,r4,#1
	ldrb r8,[r9]
	;must be same color
	cmp r8,r7
	it eq
	;BNE exit_UART_handler
	BLEQ connected_a_color
	B exit_UART_handler
not_on_portal:
	;if Space draw and move
	cmp r5, #0x20
	BEQ draw

	;Must be crossing another color's line
	sub r4,r4,#1
	ldrb r5,[r4]

	;do not cross same color line
	cmp r5,r7
	BEQ exit_UART_handler

	;Delete that color, draw and move
	BL delete_line
	add r4,r4,#1
	ldrb r5,[r4]

draw:; get last movement and compare with current movement
	ldr r8, last_movement

	ldrb r9,[r8]
	cmp r11,#0x70
	BLT horizon_dash

	;w&s are | ; a&d are -
vertical_dash:	;draw |
	;update last movement
	mov r12,#0x7C
	strb r12,[r8]
	cmp r9,#0x70
	BLT corner_dash
	mov r5,#0x7C
	B finish_drawing

horizon_dash:	;draw -
	;update last movement
	mov r12,#0x2D
	strb r12,[r8]
	cmp r9,#0x70
	BGT corner_dash
	mov r5,#0x2D
	B finish_drawing

corner_dash:	;draw +
	mov r5,#0x2B

finish_drawing:
	;store char in board mem
	strb r5,[r4]
	;store color
	sub r4,r4,#1
	strb r7,[r4]

move_player:
	;output cursor ANSII movment
	BL output_string

	;save new cursor
	ldr r1,save_cursor
	BL output_string

	;update cursor game pointer
	mov r10,r3
	B exit_UART_handler

space_action:;r3 holds cursor offset, r2 holds ptr

	;get board position
	ldr r4,board_select
	ldr r4,[r4]
	add r4,r4,r3
	ldrb r5,[r4]

	;See what current_Color is
	ldr r6,color_flag
	ldrb r7,[r6]

	;is position an "O"?
	cmp r5, #0x4F
	BNE stop_drawing

	;delete old line
	sub r4,r4,#1
	ldrb r5,[r4]
	BL delete_line
	add r4,r4,#1
	ldrb r5,[r4]

	;Is color black?
	cmp r7,#0x21
	BNE stop_drawing

	;update drawing_color
	add r4, r4, #-1
	ldrb r1,[r4];
	strb r1,[r6]

	;send to RGB
	BL illuminate_RGB_LED
	B exit_UART_handler

stop_drawing:
	;update drawing_color
	mov r1,#0x21
	strb r1,[r6]

	;send to RGB
	BL illuminate_RGB_LED

exit_UART_handler:
	;update cursor position
	strb r10,[r2]

	;Output time
	BL output_time

	;Update Board
	ldr r1,background
	BL output_string

	ldr r1,board_select
	ldr r1,[r1]
	BL output_string

	;Update Cursor
	ldr r1,restore_cursor
	BL output_string

	LDMFD sp!, {r0-r12,lr}
	BX lr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Switch_Handler:
	STMFD SP!,{r0-r12,lr} ; Preserve registers on the stack
	; Clears the Interrupt for the Pin on the Port
	; via the GPIO Interrupt Clear Register(GPIOICR)


	; clear interrupt
	mov r5,#0x541C
	movt r5,#0x4002
	ldr r6,[r5]
	ORR r6, r6, #0x10
	str r6,[r5]

	;Clear screen
	mov r0,#0xC
	BL output_character

turn_TIMER_off:

	; disable timer
	mov r5,#0x000C
	movt r5,#0x4003
	ldr r6,[r5]
	BIC r6,r6,#0x1
	str r6,[r5]


	ldr r1, cursor2
	BL output_string

	ldr r1, SwitchPrompt
	BL output_string

turn_UART_off:

	; disable Uart
	mov r5,#0xC038
	movt r5,#0x4000
	ldr r6,[r5]
	BIC r6,r6,#0x10
	str r6,[r5]


	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	BIC r6,r6,#0x20
	str r6,[r5]


Check_user_input:

	mov r5,#0x541C
	movt r5,#0x4002
	ldr r6,[r5]
	ORR r6, r6, #0x10
	str r6,[r5]

	BL read_char_intr

	cmp r0, #0x63    ;c
	beq Continue
	cmp r0, #0x78    ;x
	beq exit_game
	cmp r0, #0x72    ;r
	beq re_start
	cmp r0, #0x6E    ;n
	beq new_puzzle

	B Check_user_input

re_start:

	ldr r3, restart_check
	mov r2,#1
	strb r2,[r3]

	; clear interrupt
	mov r5,#0xC044
	movt r5,#0x4000
	ldr r6,[r5]
	orr r6,r6,#0x20
	str r6,[r5]

	; enable timer
	mov r5,#0x000C
	movt r5,#0x4003
	ldr r6,[r5]
	orr r6,r6,#0x1
	str r6,[r5]


	; enable uart
	mov r5,#0xC038
	movt r5,#0x4000
	ldr r6,[r5]
	orr r6,r6,#0x10
	str r6,[r5]


	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	orr r6,r6,#0x20
	str r6,[r5]


	B exit_handler


new_puzzle:

Continue:

	;enable timer
	mov r5,#0x000C
	movt r5,#0x4003
	ldr r6,[r5]
	orr r6,r6,#0x1
	str r6,[r5]

	;enable Uart
	mov r5,#0xC038
	movt r5,#0x4000
	ldr r6,[r5]
	orr r6,r6,#0x10
	str r6,[r5]

	mov r5,#0xE100
	movt r5,#0xE000
	ldr r6,[r5]
	orr r6,r6,#0x20
	str r6,[r5]


exit_handler:


	LDMFD sp!, {r0-r12,lr}
	BX lr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Timer_Handler:
	 ; Preserve registers on the stack
	STMFD SP!,{r0-r12,lr}

	;Clear Interrupt
	mov r5,#0x0024
	movt r5,#0x4003
	ldr r6,[r5]
	ORR r6,r6,#0x1
	str r6,[r5]

	;load current time
	ldr r3,seconds_elapsed
	ldr r7,minutes_elapsed
	ldrb r2,[r3]
	ldrb r4,[r7]
	;increment time
	add r2,r2,#1

	;increment minute
	cmp r2,#60
	BNE store_time
	mov r2,#0
	add r4,r4,#1

store_time:
	strb r2,[r3]
	strb r4,[r7]

	;Output time
	BL output_time

	;Update Board
	ldr r1,background
	BL output_string
	ldr r1,board_select
	ldr r1,[r1]
	BL output_string

	;Update Cursor
	ldr r1,restore_cursor
	BL output_string

exit_timer_handler:

	LDMFD sp!, {r0-r12,lr}
	BX lr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
non_interrupt_timer_init:

RCGC_Timer:	.equ	0x604
GPTMCTL:	.equ 	0x00C
GPTMCFG: 	.equ 	0x000
GPTMTAMR: 	.equ 	0x004
GPTMTAILR: 	.equ 	0x028

	; Enable Timer Clock
	mov r1, #0xe000
	movt r1, #0x400f
	add r1,r1,#RCGC_Timer
	ldrb r3,[r1]
	orr  r3, #1
	strb r3, [r1]

	; Timer 0 Base Address
	mov r1, #0x0000
	movt r1, #0x4003

	; Disable Timer
	mov r0, #0
	str r0, [r1, #GPTMCTL]

	; Configure as 32-bit
	mov r0, #0
	str r0, [r1, #GPTMCFG]

	; Set to Periodic Mode
	mov r0, #0x12
	str r0, [r1, #GPTMTAMR]

	; Configure Interval
	mov r0, #0xFFFF
	movt r0, #0xFFFF
	str r0, [r1, #GPTMTAILR]

	; Enable Timer
	mov r0, #1
	str r0, [r1, #GPTMCTL]

	; Return
	mov pc,lr


exit_game:
	mov r0,#0xC
	BL output_character
.end
