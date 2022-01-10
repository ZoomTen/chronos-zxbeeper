; predef commands
	predefCommand1 equ $FF
	predefCommand2 equ $03

MACRO fx_01, ?attack, ?sustain, ?decay, ?release
	defb predefCommand1
	defb $01, ?attack, ?sustain, ?decay, ?release
ENDM

MACRO fx_02
	defb predefCommand1
	defb $02
ENDM

MACRO fx_03
	defb predefCommand1
	defb $03
ENDM

MACRO drumA ; play drum pattern A
	defb predefCommand1
	defb $04
ENDM

MACRO drumB ; play drum pattern B
	defb predefCommand1
	defb $05
ENDM

MACRO drum_speed, ?speed ; speeding up drums may slow down entire song
	defb predefCommand1
	defb $08, ?speed
ENDM

MACRO two_note_chord ; beware: this will also ENABLE echo
	defb predefCommand1
	defb $09
ENDM

MACRO three_note_chord ; beware: this will also DISABLE echo
	defb predefCommand1
	defb $0A
ENDM

MACRO enable_glide
	defb predefCommand2
	defb $01
ENDM

MACRO disable_glide
	defb predefCommand2
	defb $02
ENDM

MACRO predef_03, ?arg_1
	defb predefCommand2
	defb $03, ?arg_1
ENDM

MACRO predef_04, ?arg_1, ?arg_2, ?arg_3 ; set envelope?
	defb predefCommand2
	defb $04, ?arg_1, ?arg_2, ?arg_3
ENDM

MACRO echo_volume, ?volume
	defb predefCommand2
	defb $05, ?volume
ENDM

MACRO enable_echo ; only works in 2-note chord mode. This also detunes the melody.
	defb predefCommand2
	defb $06
ENDM

MACRO disable_echo
	defb predefCommand2
	defb $07
ENDM

MACRO return
	defb $01
ENDM

MACRO repeat, ?times ; minimum of 2x
	defb $02, ?times-1
ENDM

MACRO end_song
	defb $00
ENDM

MACRO note, ?note, ?length
	defb ?note
	defb ?length
ENDM

MACRO note2, ?note1, ?note2, ?length ; two notes pressed
	defb ?note1, ?note2
	defb ?length
ENDM

MACRO note3, ?note1, ?note2, ?note3, ?length ; two notes pressed
	defb ?note1, ?note2, ?note3
	defb ?length
ENDM
