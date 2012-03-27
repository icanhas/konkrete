SHELL=/bin/sh
GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90

DBASE=base

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

.PHONY: all clean dist distclean copyall rmbase

all: $(TARGETS)

copyall: all
	@if [ ! -d $(DBASE) ]; then\
		mkdir $(DBASE); \
	fi
	
	@tar -c \
		$(DBOTFILES) \
		$(DDEMOS) \
		$(DFONTS) \
		$(DSCRIPTS) \
		$(TARGETS) \
		| tar -xv -C $(DBASE)

DISTNAME='$(DBASE)-$(shell date +"%Y-%m-%d")'

rmbase:
	@rm -rf $(DBASE)

distclean: rmbase
	@rm -f $(DISTNAME).*

dist: copyall
#tar -c $(DBASE) | xz >$(DISTNAME).tar.xz
	7z a -r -ssw -scsUTF-8 -m0=lzma2 -mx=9 $(DISTNAME).7z $(DBASE)

clean:
	@rm -f $(TARGETS)

