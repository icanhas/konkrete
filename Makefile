SHELL=/bin/sh
GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90
OGGENC?=oggenc
OGGFLAGS?=-Q -q6 --resample 44100
IM?=convert
IMFLAGS?=

DBASE=base
DISTNAME='$(DBASE)-$(shell date +"%Y-%m-%d")'

DBOTFILES=botfiles
DDEMOS=demos
DFONTS=fonts
DSCRIPTS=scripts
DVIS=vis
DSOUND=sound

DGRAPHICS=$(DVIS)/graphics
DTEXTURES=$(DVIS)/textures
D2DART=$(DGRAPHICS)/2d
DMENUART=$(DGRAPHICS)/menu
ART=\
     $(DVIS)/test.png \
     $(D2DART)/crosshaira.png \
     $(D2DART)/crosshairb.png \
     $(D2DART)/crosshairc.png \
     $(DMENUART)/cursor.png \
     $(DMENUART)/sliderbutton0.png \
     $(DMENUART)/switch_off.png \
     $(DMENUART)/switch_on.png
TARGETS+=$(ART)

DMUSIC=$(DSOUND)/music
DFEEDBACK=$(DSOUND)/feedback
SND=\
     $(DSOUND)/null.ogg \
     $(DFEEDBACK)/hit.ogg \
     $(DMUSIC)/testm.ogg
TARGETS+=$(SND)

DISTFILES=\
     default.cfg \
     slab-cpma.cfg \
     $(DBOTFILES) \
     $(DDEMOS) \
     $(DFONTS) \
     $(DSCRIPTS) \
     $(TARGETS)

.SUFFIXES: .png .pdf .ps .psd .ogg .wav 
%.png : %.pdf
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
%.png : %.ps
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
%.png : %.psd
	$(IM) $(IMFLAGS) -deconstruct -coalesce psd:$< tiff:$*.tmp.tiff
	$(IM) $(IMFLAGS) tiff:$*.tmp.tiff[0] png:$@
	@rm -f $*.tmp.tiff
%.ogg : %.wav
	$(OGGENC) $(OGGFLAGS) -o $@ $<

.PHONY: all clean dist distclean copyall rmbase

all: $(TARGETS)

copyall: all
	@if [ ! -d $(DBASE) ]; then mkdir $(DBASE); fi
	@tar -c $(DISTFILES) | tar -xv -C $(DBASE)

rmbase:
	@rm -rf $(DBASE)

distclean: rmbase clean
	@rm -f $(DISTNAME).*

dist: copyall $(DISTFILES)
#tar -c $(DBASE) | xz >$(DISTNAME).tar.xz
	7z a -r -ssw -scsUTF-8 -m0=lzma2 -mx=9 $(DISTNAME).7z $(DBASE)

clean:
	@rm -f $(TARGETS)

