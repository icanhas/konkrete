SHELL=/bin/sh
GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90

DBOTFILES=botfiles
DDEMOS=demos
DFONTS=fonts
DSCRIPTS=scripts
DVIS=vis
DSOUND=sound

DMUSIC=$(DSOUND)/music
DFEEDBACK=$(DSOUND)/feedback

DGRAPHICS=$(DVIS)/graphics
DTEXTURES=$(DVIS)/textures

DMENUART=$(DGRAPHICS)/menu
ART=\
     $(DMENUART)/cursor.png \
     $(DMENUART)/sliderbutton0.png \
     $(DMENUART)/switch_off.png \
     $(DMENUART)/switch_on.png
TARGETS+=$(ART)

.SUFFIXES: .png .pdf .ps
%.png : %.pdf
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
%.png : %.ps
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	@rm -f $(TARGETS)

