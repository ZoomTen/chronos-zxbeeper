;------------------------------------------------------------------------------
; Chronos 1-bit music code (C) 1987 Tim Follin / Mastertronic
;
; Disassembled by ZoomTen, June 2020
; Revised: January 2022
;------------------------------------------------------------------------------

; whether or not to enable AY noise drums
	ENABLE_AY EQU 1

INCLUDE "include/notes.asm"
INCLUDE "include/macros.asm"

; ------------------- music code start -----------------------------------------

	ORG $ebe4

Music_Data:
Music_Chords:
	drum_speed 1
	fx_03
	three_note_chord
	fx_01 1, 2, 3, 1
	fx_01 0, 0, 3, 1

; the drum pattern is repeated for the first few beats
	drumB
	chord3 Cs4, As3, Fs3, 6
	drumB
	chord3 Ds4, C_4, Gs3, 6
	drumB
	chord3 E_4, Cs4, A_3, 6
	drumB
	chord3 Fs4, Ds4, B_3, 6
	drum_speed 128
	drumA
	chord3 Cs4, Gs3, F_3, 64

; begin first part
	two_note_chord
	repeat 2
		fx_01 0, 0, 2, 1
		chord2 Ds4, Fs3, 32         ; 1st chord note, 2nd chord note, length
		chord2 Ds4, Fs3, 18
		fx_01 1, 1, 0, 1
		chord2 Gs3, F_3-1, 14
	return
	drum_speed 2
	drumB
	repeat 16
		fx_01 0, 0, 2, 1
		chord2 A_3, D_4, 32
		chord2 A_3, D_4, 18
		fx_01 1,1,0,1
		chord2 Gs3, E_4, 14
	return
	repeat 8
		fx_01 0,0,2,1
		chord2 Ds4, Fs3, 32
		chord2 A_3, D_4, 18
		fx_01 1,1,0,1
		chord2 Gs3, E_4, 14
	return
	drum_speed 2
	drumA
	three_note_chord
	fx_01 0,0,1,1
	repeat 24
		chord3 Ds4, B_3, Fs3, 8
		chord3 Cs4, As3, Fs3, 8
		chord3 Cs4, A_3, E_3, 6
		chord3 B_3, Gs3, E_3, 6
		chord3 Cs4, A_3, E_3, 4
	return
; last few bars
	fx_01 0, 0, 0, 1
	drum_speed 64
	drumB
	chord3 Ds4, B_3, Fs3, 12
	drumB
	chord3 Cs4, As3, Fs3, 16
	drumB
	chord3 Cs4, A_3, E_3, 24
	drumB
	chord3 B_3, Gs3, E_3, 64
	drum_speed 2
	drumA
	chord3 Ds4, B_3, Fs3, 32
	chord3 B_4-1, B_3, 254, 4
	end_song

; according to CommandProcessor seems to be only 3 commands chord part?
Music_Bass:
	enable_glide
	note 226,12
	note 240,12
	note 216,12
	note 226,12
	note 202,128
	enable_glide
	repeat 4
		note Gs3, 16
		note Gs3, 16
		note Gs3, 16
		note Gs3, 8
		note Gs3, 8
	return
	repeat 24
		note 254, 16
		note B_3, 16
		note E_3, 4
		note Fs3, 4
		note A_3, 4
		note Fs3, 4
		note A_3, 4
		note B_3, 4
		note 254, 16
		note B_3, 16
		note B_3, 4
		note A_3, 4
		note E_3, 4
		note Fs3, 4
		note E_3, 4
		note Fs3, 4
		note A_3, 4
		note B_3, 4
		note Fs3, 4
		note 226, 4
	return
	repeat 24
		note 254, 8
		note 254, 8
		note A_3, 4
		note B_3, 8
		note A_3, 4
		note Fs3, 8
		note E_3, 4
		note Fs3, 8
		note E_3, 4
		note Fs3, 4
		note 226, 4
	return
	note B_3, 24
	note As3, 32
	note A_3, 48
	note Gs3, 128
	note 254, 64
	note B_3, 8
	end_song

; melody part reader: pc $f2f9
Music_Melody:
	predef_03 1
	disable_glide
	predef_04 0,1,2 ; set priority? Attack, sustain, decay?
	disable_glide
; melody begin
	note Cs4, 4
	note As3, 4
	note Fs3, 4
	note Ds4, 4
	note C_4, 4
	note Gs3, 4
	note E_4, 4
	note Cs4, 4
	note A_3, 4
	note Fs4, 4
	note Ds4, 4
	note B_3, 4
	note F_4, 128

	echo_volume 3
	enable_echo
	note B_3, 24
	note As3, 4
	note B_3, 24
	note Cs4, 4
	note Ds4, 8
	note Cs4, 8
	note B_3, 8
	note As3, 8
	note Fs3, 8
	note Gs3, 32
	note B_3, 24
	note As3, 4
	note B_3, 20
	note Cs4, 4
	note D_4, 6
	note Ds4, 6
	note Fs4, 8
	repeat 4
		note D_4,2
		note B_3,2
	return
	enable_glide
	DEFB Fs4,40

	disable_glide
	disable_echo
	echo_volume 10 ; make echo more pronounced
	repeat 2
		note Fs4, 4
		note E_4, 4
		note Fs4, 32
		note Gs4, 4
		note A_4, 4
		note B_4, 4
		note Gs4, 4
		note E_4, 4
		note Gs4, 4
		note Fs4, 4
		note A_4, 4
		note Fs4, 56
	return

	note Fs4, 4
	note E_4, 4
	note D_4, 4
	note Cs4, 4
	note D_4, 4
	note Cs4, 4
	note B_3, 4
	note A_3, 4
	note B_3, 4
	note A_3, 4
	note Fs3, 4
	note E_3, 4
	note Fs3, 80
	note Fs3, 4
	note E_3, 4
	note Fs3, 4
	note A_3, 4
	note B_3, 4
	note A_3, 4
	note B_3, 4
	note Cs4, 4
	note D_4, 4
	note Cs4, 4
	note D_4, 4
	note E_4, 4
	note Fs4, 80
	repeat 2
		note 254, 2
		note E_3, 2
		note Fs3, 2
		note B_3, 2
		note E_4, 2
		note Fs4, 2
		note B_4, 2
		note Fs4, 2
		note E_4, 2
		note B_3, 2
		note Fs3, 2
		note E_3, 2
	return
	note 254, 2
	note E_3, 2
	note Fs3,38
	predef_04 1,1,0
	note E_3, 38
	predef_04 0,0,3
	enable_glide
	note A_4, 115
	disable_glide
	repeat 4
		note Gs4, 4
		note E_4, 4
		note Cs4, 4
		note E_4, 4
		note Fs4,48
	return
	note Gs4, 4
	note E_4, 4
	note Cs4, 4
	note Fs4,32
	repeat 4	; ?
	repeat 2
		note Fs3, 2
		note B_3, 2
		note Cs4, 2
		note B_4, 2
		note Cs4, 2
		note B_3, 2
		note Fs3, 2
		note 226, 2
	return
	note Fs3, 64
	predef_03 2
	note Fs4, 16
	enable_glide
	note E_4, 16
	note Fs4, 16
	note A_4, 16
	note Fs4, 16
	note E_4, 16
	note D_4, 16
	note Cs4, 16
	note B_3, 32
	note A_3, 16
	note As3, 16
	note B_3, 32
	note A_3, 16
	note F_3-1, 16
	disable_glide
	note Fs4, 16
	enable_glide
	note E_4, 16
	note Fs4, 16
	note A_4, 16
	note Fs4, 16
	note E_4, 16
	note D_4, 16
	note Cs4, 16
	echo_volume 0
	disable_glide
	repeat 4
		note D_4,4
		note B_3,4
		note Fs3,4
		note Cs4,4
		note A_3,4
		note Fs3,4
		note D_4,4
		note B_3,4
		note Fs3,4
		note Cs4,4
		note A_3,4
		note Fs3,4
		note D_4,4
		note B_3,4
		note Cs4,4
		note A_3,4
	return
	echo_volume 9
	repeat 4	; same as previous section
		note D_4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note A_3, 4
		note Fs3, 4
		note D_4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note A_3, 4
		note Fs3, 4
		note D_4, 4
		note B_3, 4
		note Cs4, 4
		note A_3, 4
	return
	repeat 4
		note Ds4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note As3, 4
		note Fs3, 4
		note Ds4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note As3, 4
		note Fs3, 4
		note Ds4, 4
		note B_3, 4
		note Cs4, 4
		note As3, 4
		note D_4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note A_3, 4
		note Fs3, 4
		note D_4, 4
		note B_3, 4
		note Fs3, 4
		note Cs4, 4
		note A_3, 4
		note Fs3, 4
		note D_4, 4
		note B_3, 4
		note Cs4, 4
		note A_3, 4
	return

; Deadmau5 - Edit Your Friends :p
	predef_04 0, 0, 1
	repeat 4
		note Ds4, 60
		note E_4, 4
		note D_4, 32
		note Fs4, 4
		note E_4, 24
		note Fs4, 4
	return

	disable_glide
	predef_04 1, 8, 0
	note B_4, 0	; length 256

	predef_04 0,0,2
	repeat 2
		note B_4, 8
		note 56, 8
		note B_4+3, 4
		note Gs4, 4
		note Fs4, 8
		note A_4, 8
		note B_4, 8
		note Gs4, 4
		note Fs4, 4
		note E_4, 8
		note Fs4, 64
	return
	repeat 4
		note B_4, 16
		note 67, 16
		note A_4, 12
		note Gs4, 12
		note A_4, 8
	return
	repeat 2
		note B_4, 8
		note 56, 8
		note B_4+3, 4
		note Gs4, 4
		note Fs4, 4
		note Gs4, 4
		note A_4, 4
		note Gs4, 4
		note Fs4, 4
		note E_4, 4
		note Gs4, 4
		note Fs4, 4
		note E_4, 4
		note Fs4, 4
		note Ds4, 64
		predef_03 9
		enable_glide
	return
	repeat 2
		note Ds4, 4
		note Cs4, 4
		note Ds4, 4
		note E_4, 4
		note Fs4, 4
		note Gs4, 4
		note A_4, 4
		note Gs4, 4
		note A_4, 4
		note Gs4, 4
		note Fs4, 4
		note E_4, 4
		note Gs4, 4
		note Fs4, 4
		note E_4, 4
		note Fs4, 4
		note Ds4, 64
	return
	disable_glide
	repeat 4
		note Ds4, 4
		note B_3, 4
		note Fs3, 4
		note B_3, 4
		note Cs4, 4
		note As3, 4
		note Fs3, 4
		note As3, 4
		note Cs4, 4
		note A_3, 4
		note E_3, 4
		note B_3, 4
		note Gs3, 4
		note E_3, 4
		note Cs4, 4
		note A_3, 4
	return

; final few bars
	note B_3, 24
	enable_glide
	note As3, 32
	note A_3, 48
	note Gs3, 128

	note 254, 64
	disable_glide
	defb B_3	; length doesn't matter at this point, song is cut off

; music init
Music_Init:
	DI                      ; Disable interrupts, since perfect timing is needed
	LD HL,L63263
Music_Init_0:
	LD BC,65533             ; + Select AY registers
	LD A,(HL)
	INC HL

IF ENABLE_AY
	OUT (C),A               ; + Execute AY part
ELSE
	NOP
	NOP
ENDIF

	LD BC,49149             ; + Write to AY registers
	LD A,(HL)
	INC HL

IF ENABLE_AY
	OUT (C),A               ; + Execute AY part
ELSE
	NOP
	NOP
ENDIF

	LD A,(HL)
	AND A
	JP NZ,Music_Init_0
	LD IX,Music_Chords       ; IX = chords
	LD (Chord_RepeatPoint),IX
	LD IY,Music_Bass        ; IY = bass
	XOR A
	LD (Music_Init_42+1),A
	INC A
	LD (Music_Init_30+1),A
	LD (Music_Init_36+1),A
	LD (Music_Init_2+1),A
	LD (Music_Init_28+1),A
	LD (Music_Init_40+1),A
	LD (Bass_RepeatPoint),IY
	LD A,(Variables_4)
	LD (Variables_3),A
	LD A,(Variables_5)
	LD (Music_Init_12+1),A
	LD A,(Variables_6)
	LD (Music_Init_14+1),A
	EXX
	LD DE,Music_Melody      ; DE = melody
	LD (Melody_RepeatPoint),DE
	LD A,1
	LD (Music_Init_34+1),A
	EXX
IX_CommandProcessor:
	LD A,(IX+0)             ; Read current byte for 3-tone portion
	CP 2
	JP NZ,Music_Init_1
; 02 xx = set repeat
	INC IX
	LD A,(IX+0)             ; Get repeat count
	INC A
	LD (Music_Init_2+1),A   ; Set the repeat counter
	INC IX
	LD (Chord_RepeatPoint),IX     ; Store repeat point address
	LD A,(IX+0)
	JP Music_Init_4         ; Read the next byte
Music_Init_1:
	CP 1
	JP NZ,Music_Init_4
; 01 = go back to repeat point
Music_Init_2:
	LD A,2                  ; This is modified by the subroutine above
	DEC A                   ; A is the repeat counter
	JP NZ,Music_Init_3      ; If the counter hasn't ran out, go back to loop
	                        ; point
	INC IX
	JP IX_CommandProcessor  ; Read the next byte
Music_Init_3:
	LD (Music_Init_2+1),A   ; Save repeat counter
	LD IX,(Chord_RepeatPoint)     ; Load saved repeat point
	LD A,(IX+0)
Music_Init_4:
	AND A
	JP Z,StopMusic          ; If current byte = 0, stop the music entirely
	CP 255
	JP NZ,Music_Init_5      ; If current byte != 255, process some notes
; FF xx aa bb .. = special command for setting effects and envelopes
	INC IX                  ; Begin processing effects
	INC IX                  ; IX now points to the first argument
	LD A,(IX-1)             ; Check command byte
	CP 1
	JP Z,IX_FFCommand01     ; 1 set envelope
	CP 2
	JP Z,IX_FFCommand02
	CP 3
	JP Z,IX_FFCommand03
	CP 4
	JP Z,IX_FFCommand04     ; 4 play drum pattern?
	CP 5
	JP Z,IX_FFCommand05     ; 5 play drum pattern?
	CP 8
	JP Z,IX_FFCommand08
	CP 9
	JP Z,IX_FFCommand09     ; 9 set 2 note chord mode?
	CP 10
	JP Z,IX_FFCommand0a     ; 10 set 3 note chord mode?
	JP IX_CommandProcessor
IX_FFCommand09:
	LD A,1
	LD (Music_Init_42+1),A  ; Use 2 channels
	JP IX_CommandProcessor
IX_FFCommand0a:
	XOR A
	LD (Music_Init_42+1),A  ; Use 3 channels
	JP IX_CommandProcessor
IX_FFCommand08:
	LD A,(IX+0)
	INC IX
	LD (Music_Init_24+1),A
	JP IX_CommandProcessor
IX_FFCommand04:
	LD HL,DrumPatternA
	LD (Music_Init_22+1),HL
	JP IX_FFCommand02
IX_FFCommand05:
	LD HL,DrumPatternB
	LD (Music_Init_22+1),HL
	JP IX_FFCommand02
IX_FFCommand02:
	XOR A
	LD (Music_Init_23+1),A
	LD A,1
	LD (Music_Init_21+1),A
	JP IX_CommandProcessor
IX_FFCommand03:
	XOR A
	LD (Music_Init_23+1),A
	XOR A
	LD (Music_Init_21+1),A
	JP IX_CommandProcessor
IX_FFCommand01:
	LD A,(IX+0)             ; Attack?
	LD (Variables_0),A
	LD (Variables),A
	LD A,(IX+1)             ; Decay target?
	LD (Variables_1),A
	LD A,(IX+2)             ; Decay rate?
	LD (Variables_2),A
	LD A,(IX+3)             ; ???
	LD (L62747_2+1),A
	INC IX                  ; Move IX to next music data
	INC IX
	INC IX
	INC IX
	JP IX_CommandProcessor  ; Read next byte
Music_Init_5:
	LD A,(Variables_0)
	LD (Variables),A
	LD A,(Variables_1)
	LD (Music_Init_47+1),A
	LD A,(Variables_2)
	LD (L62747+1),A
	LD D,(IX+2)             ; E,H contains the notes
	LD E,(IX+0)             ; D contains the length / note
	LD H,(IX+1)
	INC IX
	INC IX
	LD A,(Music_Init_42+1)
	DEC A                   ; A = 0 if using 2 channels
	JP Z,Music_Init_6
	INC IX
Music_Init_6:
	LD A,(Variables)
	AND A
	JP Z,L62682
	LD A,D
	LD (L63022_7+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_10+1),A
	LD (Music_Init_48+1),A
	LD A,E
	LD (L63022_13+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_16+1),A
	LD (Music_Init_50+1),A
	LD A,H
	LD (L63022_19+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_22+1),A
	LD (Music_Init_52+1),A
	LD A,1
	LD (L63022_8+1),A
	LD (L63022_14+1),A
	LD (L63022_20+1),A
; This entry point is used by the routine at L62682.
Music_Init_7:
	LD A,0
	LD (Music_Init_53+1),A
	LD A,(IX+0)
	INC IX
Music_Init_8:
	EX AF,AF'
	XOR A
	IN A,(254)
	CPL
	AND 31
	JP NZ,StopMusic
Music_Init_9:
	LD A, 0
	INC A
	LD (Music_Init_9+1),A
Music_Init_10:
	CP 1
	JP NZ,Music_Init_11
	XOR A
	LD (Music_Init_9+1),A
	LD A,(L63022_28+1)
	DEC A
	JP Z,Music_Init_11
	LD (L63022_28+1),A
	LD A,(L63022_30+1)
	INC A
	LD (L63022_30+1),A
Music_Init_11:
	LD A,(Variables_3)
	AND A
	JP Z,Music_Init_14
Music_Init_12:
	LD A, 1
	DEC A
	LD (Music_Init_12+1),A
	JP NZ,Music_Init_15
	LD A,(Variables_5)
	LD (Music_Init_12+1),A
	LD A,(L63022_2+1)
	INC A
Music_Init_13:
	CP 42
	JP Z,L62675
	LD (L63022_2+1),A
	LD A,(L63022_4+1)
	DEC A
	LD (L63022_4+1),A
	JP Music_Init_15
Music_Init_14:
	LD A,2
	DEC A
	LD (Music_Init_14+1),A
	JP NZ,Music_Init_15
	LD A,(Variables_6)
	LD (Music_Init_14+1),A
	LD A,(L63022_2+1)
	DEC A
	JP Z,Music_Init_15
	LD (L63022_2+1),A
	LD A,(L63022_4+1)
	INC A
	LD (L63022_4+1),A
; This entry point is used by the routine at L62675.
Music_Init_15:
	LD A,(Music_Init_17+1)
	LD B,A
	LD A,(Music_Init_18+1)
	CP B
	JP Z,Music_Init_21
Music_Init_16:
	LD B, 1
Music_Init_17:
	LD A, 113
Music_Init_18:
	CP 113                  ; Current note
	JP Z,Music_Init_20
	JP C,Music_Init_19
	DEC A
	DEC A
Music_Init_19:
	INC A
	LD (Music_Init_17+1),A
	DJNZ Music_Init_17
Music_Init_20:
	LD B,A
	CALL L62613
Music_Init_21:
	LD A, 0
	DEC A
	CP 255
	JP Z,Music_Init_28
	LD (Music_Init_21+1),A
	AND A
	JP NZ,Music_Init_28
	PUSH HL
	PUSH DE
	PUSH BC
Music_Init_22:
	LD HL, DrumPatternA
	LD D,0
Music_Init_23:
	LD E,2
	ADD HL,DE
	LD A,E
	ADD A,2
	LD (Music_Init_23+1),A
	LD A,(HL)
	LD C,A
Music_Init_24:
	LD B, 128
	DEC B
	JP Z,Music_Init_26
Music_Init_25:
	ADD A,C
	DJNZ Music_Init_25
Music_Init_26:
	LD (Music_Init_21+1),A
	INC HL
	PUSH HL
	LD A,(HL)               ; Drums processor?
	CP 0
	CALL Z,L62826
	CP 1
	CALL Z,L62926
	CP 2
	CALL Z,L62845
	CP 3
	CALL Z,L62876
	CP 4
	CALL Z,L62959
	CP 5
	CALL Z,L62994
	POP HL
	INC HL
	LD A,(HL)
	CP 255
	JP NZ,Music_Init_27
	XOR A
	LD (Music_Init_23+1),A
Music_Init_27:
	POP BC
	POP DE
	POP HL
Music_Init_28:
	LD A, 9
	DEC A
	LD (Music_Init_28+1),A
	JP NZ,Music_Init_34
IY_CommandProcessor:
	LD A,(IY+0)
	CP 2
	JP NZ,Music_Init_29
	INC IY                  ; 02 xx Set repeat
	LD A,(IY+0)
	INC A
	LD (Music_Init_30+1),A
	INC IY
	LD (Bass_RepeatPoint),IY
	JP IY_CommandProcessor
Music_Init_29:
	CP 1
	JP NZ,Music_Init_32
Music_Init_30:
	LD A,3                  ; 01 Go back to repeat point
	DEC A
	JP Z,Music_Init_31
	LD (Music_Init_30+1),A
	LD IY,(Bass_RepeatPoint)
	JP IY_CommandProcessor
Music_Init_31:
	INC IY
	JP IY_CommandProcessor
Music_Init_32:
	CP 3
	JP NZ,Music_Init_33
	INC IY                  ; 03 xx unknown
	LD A,(IY+0)
	LD (Music_Init_10+1),A
	DEC A
	LD (Music_Init_9+1),A
	INC IY
	JP IY_CommandProcessor
Music_Init_33:
	LD (L63022_27+1),A      ; Process note
	SRL A
	SRL A
	LD L,A
	SRL A
	SRL L
	ADD A,L
	LD (L63022_28+1),A
	LD L,A
	LD A,1
	LD (L63022_30+1),A
	LD A,(IY+1)
	LD (Music_Init_28+1),A
	INC IY
	INC IY
Music_Init_34:
	LD A,1                  ; Note length
	DEC A
	LD (Music_Init_34+1),A
	JP NZ,Music_Init_42
	LD A,1
	LD (Music_Init_12+1),A
	LD (Music_Init_14+1),A
	LD A,(Variables_4)
	LD (Variables_3),A
	EXX
DE_CommandProcessor:
	LD A,(DE)
	CP 2
	JP NZ,Music_Init_35
	INC DE
	LD A,(DE)
	INC A
	LD (Music_Init_36+1),A
	INC DE
	LD (Melody_RepeatPoint),DE
	JP DE_CommandProcessor
Music_Init_35:
	CP 1
	JP NZ,Music_Init_38
Music_Init_36:
	LD A,1
	DEC A
	JP Z,Music_Init_37
	LD (Music_Init_36+1),A
	LD DE,(Melody_RepeatPoint)
	JP DE_CommandProcessor
Music_Init_37:
	INC DE
	JP DE_CommandProcessor
Music_Init_38:
	LD A,(DE)
	CP 3
	JP NZ,Music_Init_39
	INC DE
	LD A,(DE)
	INC DE
	CP 1
	JP Z,DE_03Command01
	CP 2
	JP Z,DE_03Command02
	CP 3
	JP Z,DE_03Command03
	CP 4
	JP Z,DE_03Command04
	CP 5
	JP Z,DE_03Command05
	CP 6
	JP Z,DE_03Command06
	CP 7
	JP Z,DE_03Command07
	JP DE_CommandProcessor
DE_03Command06:
	LD A,60                 ; INC A, enables echo
	LD (Music_Init_45),A
	JP DE_CommandProcessor
DE_03Command07:
	XOR A                   ; NOP, disables echo
	LD (Music_Init_45),A
	JP DE_CommandProcessor
DE_03Command05:
	LD A,(DE)
	INC DE
	LD (Music_Init_44+1),A
	JP DE_CommandProcessor
DE_03Command03:
	LD A,(DE)
	LD (Music_Init_16+1),A
	INC DE
	JP DE_CommandProcessor
DE_03Command01:
	LD A,1                  ; enable glide
	LD (Music_Init_40+1),A
	JP DE_CommandProcessor
DE_03Command02:
	XOR A                   ; disable glide
	LD (Music_Init_40+1),A
	JP DE_CommandProcessor
DE_03Command04:
	LD A,(DE)
	LD (Variables_4),A
	LD (Variables_3),A
	INC DE
	LD A,(DE)
	LD (Variables_5),A
	INC DE
	LD A,(DE)
	LD (Variables_6),A
	INC DE
	LD A,1
	LD (Music_Init_12+1),A
	LD (Music_Init_14+1),A
	JP DE_CommandProcessor
Music_Init_39:
	INC DE
	LD (Music_Init_18+1),A
	LD B,A
Music_Init_40:
	LD A,0
	AND A
	JP NZ,Music_Init_41
	CALL L62613
	LD A,(L63022_1+1)
	LD (Music_Init_17+1),A
Music_Init_41:
	LD A,(DE)
	LD (Music_Init_34+1),A
	INC DE
	EXX
Music_Init_42:
	LD A,1
	DEC A
	JP NZ,Music_Init_46
	PUSH HL
	PUSH BC
Music_Init_43:
	LD A,8
	INC A
	AND 15
	LD (Music_Init_43+1),A
	LD HL,Variables_10
	LD C,A
	ADD A,A
	ADD A,C
	LD C,A
	LD B,0
	ADD HL,BC
	LD A,(L63022_1+1)
	LD (HL),A
	INC HL
	LD A,(L63022_2+1)
	LD (HL),A
	INC HL
	LD A,(L63022_4+1)
	LD (HL),A
	LD A,(Music_Init_43+1)
Music_Init_44:
	SUB 3
	AND 15
	LD HL,Variables_10
	LD C,A
	ADD A,A
	ADD A,C
	LD C,A
	ADD HL,BC
	LD A,(HL)
Music_Init_45:
	INC A
	LD (L63022_7+1),A
	INC HL
	LD A,(HL)
	SRL A
	LD B,A
	SRL A
	SRL A
	ADD A,B
	OR 1
	LD (L63022_8+1),A
	INC HL
	LD A,(HL)
	SRL A
	LD B,A
	SRL A
	SRL A
	ADD A,B
	OR 1
	LD (L63022_10+1),A
	POP BC
	POP HL
Music_Init_46:
	CALL L63022
	LD A,(Variables)
	CP 0
	JP Z,L62747
	CP 2
	JP Z,Music_Init_53
Music_Init_47:
	LD A,0
	DEC A
	LD (Music_Init_47+1),A
	JP NZ,Music_Init_53
	LD A,(Variables_1)
	LD (Music_Init_47+1),A
	LD A,(L63022_8+1)
	INC A
Music_Init_48:
	CP 0
	JP Z,Music_Init_49
	LD (L63022_8+1),A
	LD A,(L63022_10+1)
	DEC A
	LD (L63022_10+1),A
Music_Init_49:
	LD A,(L63022_14+1)
	INC A
Music_Init_50:
	CP 0
	JP Z,Music_Init_51
	LD (L63022_14+1),A
	LD A,(L63022_16+1)
	DEC A
	LD (L63022_16+1),A
Music_Init_51:
	LD A,(L63022_20+1)
	INC A
Music_Init_52:
	CP 0
	JP Z,L62668
	LD (L63022_20+1),A
	LD A,(L63022_22+1)
	DEC A
	LD (L63022_22+1),A
; This entry point is used by the routines at L62668 and L62747.
Music_Init_53:
	LD A,0
	XOR 1
	LD (Music_Init_53+1),A
	JP Z,Music_Init_54
	EX AF,AF'
	JP Music_Init_8
Music_Init_54:
	EX AF,AF'
	DEC A
	JP NZ,Music_Init_8
	LD A,127
	IN A,(254)
	AND 1
	JP NZ,IX_CommandProcessor
StopMusic:
	LD IY,23610
	LD A,(Music_Init_36+1)
	LD C,A
	LD B,0
	EI
	RET

; Routine at 62613
;
; Used by the routine at Music_Init.
L62613:
	LD A,(Variables_3)
	AND A
	JP Z,L62613_0
	LD A,B
	LD (L63022_1+1),A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_4+1),A
	LD (Music_Init_13+1),A
	LD A,1
	LD (L63022_2+1),A
	RET
L62613_0:
	LD A,B
	LD (L63022_1+1),A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_2+1),A
	LD (Music_Init_13+1),A
	LD A,1
	LD (L63022_4+1),A
	RET

; Routine at 62668
;
; Used by the routine at Music_Init.
L62668:
	XOR A
	LD (Variables),A
	JP Music_Init_53

; Routine at 62675
;
; Used by the routine at Music_Init.
L62675:
	XOR A
	LD (Variables_3),A
	JP Music_Init_15

; Routine at 62682
;
; Used by the routine at Music_Init.
L62682:
	LD A,D
	LD (L63022_7+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_8+1),A
	LD A,E
	LD (L63022_13+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_14+1),A
	LD A,H
	LD (L63022_19+1),A
	SRL A
	SRL A
	SRL A
	LD B,A
	SRL A
	ADD A,B
	LD (L63022_20+1),A
	LD A,1
	LD (L63022_10+1),A
	LD (L63022_16+1),A
	LD (L63022_22+1),A
	JP Music_Init_7

; Routine at 62747
;
; Used by the routine at Music_Init.
L62747:
	LD A,2
	DEC A
	LD (L62747+1),A
	JP NZ,Music_Init_53
	LD A,(Variables_2)
	LD (L62747+1),A
	LD A,(L63022_8+1)
	DEC A
	JP Z,L62747_0
	LD (L63022_8+1),A
	LD A,(L63022_10+1)
	INC A
	LD (L63022_10+1),A
L62747_0:
	LD A,(L63022_14+1)
	DEC A
	JP Z,L62747_1
	LD (L63022_14+1),A
	LD A,(L63022_16+1)
	INC A
	LD (L63022_16+1),A
L62747_1:
	LD A,(L63022_20+1)
	DEC A
L62747_2:
	CP 1
	JP Z,L62747_3
	LD (L63022_20+1),A
	LD A, (L63022_22+1)
	INC A
	LD (L63022_22+1),A
	JP Music_Init_53
L62747_3:
	LD A,2
	LD (Variables),A
	JP Music_Init_53

; Routine at 62826
;
; Used by the routine at Music_Init.
L62826:
	LD BC,700
L62826_0:
	DEC BC
	LD A,B
	OR C
	JP NZ,L62826_0
	XOR A                   ; Zero
	OUT (254),A             ; Set beeper low
	LD A,0
L62826_1:
	DEC A
	JP NZ,L62826_1
	RET

; Routine at 62845
;
; Used by the routine at Music_Init.
L62845:
	LD HL,0
	LD B,10
L62845_0:
	XOR A
	OUT (254),A
	LD A,(HL)
	INC HL
	AND 128
	ADD A,16
L62845_1:
	DEC A
	JP NZ,L62845_1
	LD A,16                 ; High
	OUT (254),A             ; Set beeper high
	LD A,20
L62845_2:
	DEC A
	JP NZ,L62845_2
	DJNZ L62845_0
	RET

; Routine at 62876
;
; Used by the routine at Music_Init.
L62876:
	LD BC,65533
	LD A,13
	OUT (C),A
	LD BC,49149
	LD A,1
	OUT (C),A
	LD C,5
	LD HL,10
L62876_0:
	XOR A
	OUT (254),A             ; Set beeper low
	LD B,(HL)
	INC HL
L62876_1:
	DJNZ L62876_1
	LD A,16
	OUT (254),A             ; Set beeper high
	LD B,(HL)
	INC HL
L62876_2:
	DJNZ L62876_2
	PUSH BC
	LD BC,C_4
L62876_3:
	DEC BC
	LD A,B
	OR C
	JP NZ,L62876_3
	POP BC
	DEC C
	JP NZ,L62876_0
	RET

; Routine at 62926
;
; Used by the routine at Music_Init.
L62926:
	LD C,30
	LD HL,1000
L62926_0:
	XOR A
	OUT (254),A             ; Set beeper low
	LD B,C
L62926_1:
	DJNZ L62926_1
	LD A,16
	OUT (254),A             ; Set beeper high
	LD A,31
	SUB C
	LD B,A
L62926_2:
	DJNZ L62926_2
	LD A,(HL)
	AND 16
	LD B,A
	INC HL
L62926_3:
	DJNZ L62926_3
	DEC C
	JP NZ,L62926_0
	RET

; Routine at 62959
;
; Used by the routine at Music_Init.
L62959:
	LD C,26
	LD HL,1000
L62959_0:
	XOR A
	OUT (254),A             ; Set beeper low
	LD A,C
	LD B,A
L62959_1:
	DJNZ L62959_1
	LD A,16
	OUT (254),A             ; Set beeper high
	LD A,27
	SUB C
	LD B,A
L62959_2:
	DJNZ L62959_2
	LD A,(HL)
	AND 16
	LD B,A
	INC HL
L62959_3:
	DJNZ L62959_3
	DEC C
	DEC C
	JP NZ,L62959_0
	RET

; Routine at 62994
;
; Used by the routine at Music_Init.
L62994:
	LD HL,2000
	LD C,25
L62994_0:
	XOR A
	OUT (254),A             ; Beeper low
	LD B,30
L62994_1:
	DJNZ L62994_1
	LD A,16
	OUT (254),A             ; Beeper high
	LD A,(HL)
	INC HL
	AND 128
	LD B,A
L62994_2:
	DJNZ L62994_2
	DEC C
	JP NZ,L62994_0
	RET

; Routine at 63022
;
; Used by the routine at Music_Init.
L63022:
	LD B,0
	CALL L63022_0           ; This routine is executed 4 times
	CALL L63022_0
	CALL L63022_0
L63022_0:
	DEC C                   ; counter for something?
	JP NZ,L63022_6          ; ?
	XOR A
	OUT (254),A             ; Beeper low
L63022_1:
	LD C,113
L63022_2:
	LD A,38
L63022_3:
	DEC A
	JP NZ,L63022_3
	LD A,16
	OUT (254),A             ; Beeper high
L63022_4:
	LD A,5
L63022_5:
	DEC A
	JP NZ,L63022_5
L63022_6:
	DEC D
	JP NZ,L63022_12         ; First note?
	XOR A
	OUT (254),A             ; Beeper low
L63022_7:
	LD D,114
L63022_8:
	LD A,24
L63022_9:
	DEC A
	JP NZ,L63022_9
	LD A,16
	OUT (254),A             ; Beeper high
L63022_10:
	LD A,2
L63022_11:
	DEC A
	JP NZ,L63022_11
L63022_12:
	DEC E
	JP NZ,L63022_18         ; Second note?
	XOR A
	OUT (254),A             ; Beeper low
L63022_13:
	LD E,101
L63022_14:
	LD A,14
L63022_15:
	DEC A
	JP NZ,L63022_15
	LD A,16
	OUT (254),A             ; Beeper high
L63022_16:
	LD A,5
L63022_17:
	DEC A
	JP NZ,L63022_17
L63022_18:
	DEC H
	JP NZ,L63022_24         ; Third note?
	XOR A
	OUT (254),A             ; Beeper low
L63022_19:
	LD H,170
L63022_20:
	LD A,27
L63022_21:
	DEC A
	JP NZ,L63022_21
	LD A,16
	OUT (254),A             ; Beeper high
L63022_22:
	LD A,5
L63022_23:
	DEC A
	JP NZ,L63022_23
L63022_24:
	LD A,B
	AND 1
	JP NZ,L63022_26
L63022_25:
	DJNZ L63022_0
	RET
L63022_26:
	DEC L
	JP NZ,L63022_25
	XOR A
	OUT (254),A             ; Beeper low
L63022_27:
	LD L,151
L63022_28:
	LD A,29
L63022_29:
	DEC A
	JP NZ,L63022_29
	LD A,16
	OUT (254),A             ; Beeper high
L63022_30:
	LD A,8
L63022_31:
	DEC A
	JP NZ,L63022_31
	JP L63022_25

; Data block at 63170 variables
Variables:
	defb 0
Variables_0:
	defb 0
Variables_1:
	defb 0
Variables_2:
	defb 2
Variables_3:
	defb 0
Variables_4:
	defb 0
Variables_5:
	defb 1
Variables_6:
	defb 2
	defb 0
Melody_RepeatPoint:
	defw 0 ; insert pointer here
	defb 0
Bass_RepeatPoint:
	defw 0 ; insert pointer here
	defb 0
Chord_RepeatPoint:
	defw 0 ; insert pointer here
	defb 0,255


; drum pattern 1, called by FF 04
DrumPatternA:
	defb 8,0,8,2
	defb 4,3,2,0,4,3,2,0,2
	defb 3,2,0,255,255

; drum pattern 2, called by FF 05
DrumPatternB:
	defb 8,0,8
	defb 3,6,0,2,0,2,3,4
	defb 0,2,4,8,0,4,3,4
	defb 0,8,0,4,3,2,0,2
	defb 0,8,0,8,3,6,0,2
	defb 0,2,3,6,0,8,0,4
	defb 3,4,0,8,0,2,1,2
	defb 3,4,3,255,255

L63263:
	defb 7,55,11
	defb 0,12,8,13,1,8,17,6
	defb 5,8,16,0,0
Variables_10:
	defb 101,33,5
	defb 113,42,1,113,41,2,113,41
	defb 2,113,40,3,113,40,3,113
	defb 39,4,113,39,4,113,38,5
	defb 101,37,1,101,36,2,101,36
	defb 2,101,35,3,101,35,3,101
	defb 34,4

; Message at 63324
L63324:
	DEFM "e\"",10,"ng to say but what a day, how's your boy been    Nothing to d"

