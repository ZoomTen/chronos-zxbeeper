# Chronos ZX Beeper Music Disassembly

Tim Follin's beeper sound engine for the ZX Spectrum, ripped from Chronos (1987)

This disassembly uses the [Skoolkit](https://skoolkit.ca/) format. The scripts folder contains shell scripts (`build`, `generate_asm`) that can be used as a guide to compile it.

Work in progress.

For educational purposes.

## Build dependencies

* Python 3 + Skoolkit

* [Pasmo Assembler](http://pasmo.speccy.org/)

* [AYMakeR](https://www.worldofspectrum.org/projectay/tech.htm)

## Details on the music data

The music data here is made up of four components:

* **Note polyphony**, used to play chords. Two or three notes play at the same time depending on the mode. This component also controls the drum track, as well as the entire song. Tim Follin's code as published in [Your Sinclair(20):55](https://live.worldofspectrum.org/archive/magazines/your-sinclair/20#56) only contains this component (thus the one that's bundled with Shiru's [1tracker](https://shiru.untergrund.net/software.shtml) is limited to this as well). Has no concept of rest notes (in Agent X, envelope trickery is used instead; parameters: 1,0,1,1).

* **Bass component**. Plays one note at a time, is pitched 1 octave lower than the other components. Its envelope cannot be set.

* **Melody component**. Supports envelopes, portamento on/off, echo (only when 2-note polyphony mode is set, and will also detune the component)

* **Drum component**, separated from the other components. There are only a few patterns that can be sequenced and are controlled from the note polyphony component. If the AY-3-8912 chip is present, the data can be passed on to the noise channel as well.

All in all, 6 virtual channels can be played with this engine: 2 for chords, 1 for extra chord note / melody echo, 1 for melody, 1 for bass, and 1 for the drums.
