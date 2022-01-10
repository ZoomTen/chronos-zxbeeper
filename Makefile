WINE := wine
PYTHON := python
AYMAKER := AYMakeR/AYMakeR.exe
PASMO := Pasmo/pasmo.exe

all: music

music: chronos_zxbeeper.ay

clean:
	rm *.ay *.ini *.bin

%.ay: %.ini
	$(WINE) $(AYMAKER) $<

%.ini: %.ini.txt %.bin
	$(PYTHON) scripts/make_ini.py
	
%.bin: %.asm
	$(WINE) $(PASMO) -v $< $@ $*.sym
