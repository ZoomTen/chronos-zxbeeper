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
	note Fs4,40

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

