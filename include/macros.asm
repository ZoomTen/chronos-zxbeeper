; predef commands
	predefCommand1 equ $FF
	predefCommand2 equ $03

; to mute use parameters: 1, 0, 1, 1
MACRO chord_envelope, ?attack, ?sustain, ?decay, ?release
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

MACRO glide_speed, ?speed
	defb predefCommand2
	defb $03, ?speed
ENDM

; to mute use parameters: 1, 0, 1
MACRO melody_envelope, ?is_attack, ?attack, ?decay ; set envelope?
	defb predefCommand2
	defb $04, ?is_attack, ?attack, ?decay
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
	defb ?length * _SPEED
ENDM

MACRO chord2, ?note1, ?note2, ?length ; two notes pressed
	defb ?note1, ?note2
	defb ?length * _SPEED
ENDM

MACRO chord3, ?note1, ?note2, ?note3, ?length ; two notes pressed
	defb ?note1, ?note2, ?note3
	defb ?length * _SPEED
ENDM

MACRO song_speed, ?speed ; compile-time parameter
; higher speed parameter = slower song
; this is usually the length of a 16th note
	_SPEED defl ?speed
ENDM
