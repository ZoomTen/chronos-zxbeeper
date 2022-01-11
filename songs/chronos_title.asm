Music_Data:
	song_speed 4

Music_Chords:
; assuming a "16th note" means a note in the melody layer with length 1
; then a length 1 on this layer is a 8th note
	drum_speed 1
	fx_03
	three_note_chord
	chord_envelope 1, 2, 3, 1
	chord_envelope 0, 0, 3, 1

	song_speed 1
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
		chord_envelope 0, 0, 2, 1
		chord2 Ds4, Fs3, 32         ; 1st chord note, 2nd chord note, length
		chord2 Ds4, Fs3, 18
		chord_envelope 1, 1, 0, 1
		chord2 Gs3, F_3-1, 14
	return
	drum_speed 2
	drumB
	repeat 16
		chord_envelope 0, 0, 2, 1
		chord2 A_3, D_4, 32
		chord2 A_3, D_4, 18
		chord_envelope 1,1,0,1
		chord2 Gs3, E_4, 14
	return
	repeat 8
		chord_envelope 0,0,2,1
		chord2 Ds4, Fs3, 32
		chord2 A_3, D_4, 18
		chord_envelope 1,1,0,1
		chord2 Gs3, E_4, 14
	return
	drum_speed 2
	drumA
	three_note_chord
	chord_envelope 0,0,1,1
	repeat 24
		chord3 Ds4, B_3, Fs3, 8
		chord3 Cs4, As3, Fs3, 8
		chord3 Cs4, A_3, E_3, 6
		chord3 B_3, Gs3, E_3, 6
		chord3 Cs4, A_3, E_3, 4
	return
; last few bars
	chord_envelope 0, 0, 0, 1
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
	chord3 B_4-1, B_3, B_2, 4
	end_song

Music_Bass:
	song_speed 4
	enable_glide
	note Cs3, 3
	note C_3, 3
	note D_3, 3
	note Cs3, 3
	note Ds3, 32
	enable_glide
	repeat 4
		note Gs3, 4
		note Gs3, 4
		note Gs3, 4
		note Gs3, 2
		note Gs3, 2
	return
	repeat 24
		note B_2, 4
		note B_3, 4
		note E_3, 1
		note Fs3, 1
		note A_3, 1
		note Fs3, 1
		note A_3, 1
		note B_3, 1
		note B_2, 4
		note B_3, 4
		note B_3, 1
		note A_3, 1
		note E_3, 1
		note Fs3, 1
		note E_3, 1
		note Fs3, 1
		note A_3, 1
		note B_3, 1
		note Fs3, 1
		note Cs3, 1
	return
	repeat 24
		note B_2, 2
		note B_2, 2
		note A_3, 1
		note B_3, 2
		note A_3, 1
		note Fs3, 2
		note E_3, 1
		note Fs3, 2
		note E_3, 1
		note Fs3, 1
		note Cs3, 1
	return
	note B_3, 6
	note As3, 8
	note A_3, 12
	note Gs3, 32
	note B_2, 16
	note B_3, 2
	end_song

Music_Melody:
	glide_speed 1
	disable_glide
	melody_envelope 0,1,2 ; set priority? Attack, sustain, decay?
	disable_glide
; melody begin
	note Cs4, 1
	note As3, 1
	note Fs3, 1
	note Ds4, 1
	note C_4, 1
	note Gs3, 1
	note E_4, 1
	note Cs4, 1
	note A_3, 1
	note Fs4, 1
	note Ds4, 1
	note B_3, 1
	note F_4, 32

; key seems to shift up here to compensate for echo?
	echo_volume 3
	enable_echo
	note B_3, 6
	note As3, 1
	note B_3, 6
	note Cs4, 1
	note Ds4, 2
	note Cs4, 2
	note B_3, 2
	note As3, 2
	note Fs3, 2
	note Gs3, 8

	note B_3, 6
	note As3, 1
	note B_3, 5
	note Cs4, 1
	song_speed 6	; triplet
	note D_4, 1
	note Ds4, 1
	song_speed 4	; whole
	note Fs4, 2
	song_speed 2
	repeat 4
		note D_4,1
		note B_3,1
	return

	song_speed 4
	enable_glide
	note Fs4,10

; normal key?
	disable_glide
	disable_echo
	echo_volume 10
	repeat 2
		note Fs4, 1
		note E_4, 1
		note Fs4, 8
		note Gs4, 1
		note A_4, 1
		note B_4, 1
		note Gs4, 1
		note E_4, 1
		note Gs4, 1
		note Fs4, 1
		note A_4, 1
		note Fs4, 14
	return

	note Fs4, 1
	note E_4, 1
	note D_4, 1
	note Cs4, 1
	note D_4, 1
	note Cs4, 1
	note B_3, 1
	note A_3, 1
	note B_3, 1
	note A_3, 1
	note Fs3, 1
	note E_3, 1
	note Fs3, 20

	note Fs3, 1
	note E_3, 1
	note Fs3, 1
	note A_3, 1
	note B_3, 1
	note A_3, 1
	note B_3, 1
	note Cs4, 1
	note D_4, 1
	note Cs4, 1
	note D_4, 1
	note E_4, 1
	note Fs4, 20

	song_speed 2 ; really fast notes
	repeat 2
		note B_2, 1
		note E_3, 1
		note Fs3, 1
		note B_3, 1
		note E_4, 1
		note Fs4, 1
		note B_4, 1
		note Fs4, 1
		note E_4, 1
		note B_3, 1
		note Fs3, 1
		note E_3, 1
	return
	note B_2, 1
	note E_3, 1

	song_speed 1	; precise
	note Fs3, 38
	melody_envelope 1,1,0
	note E_3, 38
	melody_envelope 0,0,3
	enable_glide
	note A_4, 115
	disable_glide

	song_speed 4
	repeat 4
		note Gs4, 1
		note E_4, 1
		note Cs4, 1
		note E_4, 1
		note Fs4, 12
	return

	note Gs4, 1
	note E_4, 1
	note Cs4, 1
	note Fs4, 8

	repeat 4	; ?
	repeat 2
		song_speed 2 ; really fast notes
		note Fs3, 1
		note B_3, 1
		note Cs4, 1
		note B_4, 1
		note Cs4, 1
		note B_3, 1
		note Fs3, 1
		note Cs3, 1
	return

	song_speed 4
	note Fs3, 16
	glide_speed 2
	note Fs4, 4
	enable_glide
	note E_4, 4
	note Fs4, 4
	note A_4, 4
	note Fs4, 4
	note E_4, 4
	note D_4, 4
	note Cs4, 4
	note B_3, 8
	note A_3, 4
	note As3, 4
	note B_3, 8
	note A_3, 4
	note F_3-1, 4
	disable_glide
	note Fs4, 4
	enable_glide
	note E_4, 4
	note Fs4, 4
	note A_4, 4
	note Fs4, 4
	note E_4, 4
	note D_4, 4
	note Cs4, 4
	echo_volume 0
	disable_glide
	repeat 4
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Cs4, 1
		note A_3, 1
	return
	echo_volume 9
	repeat 4	; same as previous section
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Cs4, 1
		note A_3, 1
	return
	repeat 4
		note Ds4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note As3, 1
		note Fs3, 1
		note Ds4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note As3, 1
		note Fs3, 1
		note Ds4, 1
		note B_3, 1
		note Cs4, 1
		note As3, 1
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Fs3, 1
		note Cs4, 1
		note A_3, 1
		note Fs3, 1
		note D_4, 1
		note B_3, 1
		note Cs4, 1
		note A_3, 1
	return

; Deadmau5 - Edit Your Friends :p
	melody_envelope 0, 0, 1
	repeat 4
		note Ds4, 15
		note E_4, 1
		note D_4, 8
		note Fs4, 1
		note E_4, 6
		note Fs4, 1
	return

	disable_glide
	melody_envelope 1, 8, 0
	note B_4, 0	; length 256

	melody_envelope 0,0,2
	repeat 2
		note B_4, 2
		note 56, 2
		note B_4+3, 1
		note Gs4, 1
		note Fs4, 2
		note A_4, 2
		note B_4, 2
		note Gs4, 1
		note Fs4, 1
		note E_4, 2
		note Fs4, 16
	return
	repeat 4
		note B_4, 4
		note 67, 4
		note A_4, 3
		note Gs4, 3
		note A_4, 2
	return
	repeat 2
		note B_4, 2
		note 56, 2
		note B_4+3, 1
		note Gs4, 1
		note Fs4, 1
		note Gs4, 1
		note A_4, 1
		note Gs4, 1
		note Fs4, 1
		note E_4, 1
		note Gs4, 1
		note Fs4, 1
		note E_4, 1
		note Fs4, 1
		note Ds4, 16
		glide_speed 9
		enable_glide
	return
	repeat 2
		note Ds4, 1
		note Cs4, 1
		note Ds4, 1
		note E_4, 1
		note Fs4, 1
		note Gs4, 1
		note A_4, 1
		note Gs4, 1
		note A_4, 1
		note Gs4, 1
		note Fs4, 1
		note E_4, 1
		note Gs4, 1
		note Fs4, 1
		note E_4, 1
		note Fs4, 1
		note Ds4, 16
	return
	disable_glide
	repeat 4
		note Ds4, 1
		note B_3, 1
		note Fs3, 1
		note B_3, 1
		note Cs4, 1
		note As3, 1
		note Fs3, 1
		note As3, 1
		note Cs4, 1
		note A_3, 1
		note E_3, 1
		note B_3, 1
		note Gs3, 1
		note E_3, 1
		note Cs4, 1
		note A_3, 1
	return

; final few bars
	note B_3, 6
	enable_glide
	note As3, 8
	note A_3, 12
	note Gs3, 32

	note B_2, 16
	disable_glide
	defb B_3	; length doesn't matter at this point, song is cut off

