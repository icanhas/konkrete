SHELL=/bin/sh
GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90
OGGENC?=oggenc
OGGFLAGS?=-Q -q6 --resample 44100
IM?=convert
IMFLAGS?=
CRUSH?=pngcrush
CRUSHFLAGS?=-q -rem text -rem alla

DBASE?=base
DINSTALL?=/usr/local/games/quake3
DISTNAME?='$(DBASE)-$(shell date +"%Y-%m-%d")'

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
DEDITORTEX=$(DTEXTURES)/common
ART=\
     $(DVIS)/test.png \
     $(D2DART)/crosshaira.png \
     $(D2DART)/crosshairb.png \
     $(D2DART)/crosshairc.png \
     $(DMENUART)/cursor.png \
     $(DMENUART)/sliderbutton0.png \
     $(DMENUART)/switch_off.png \
     $(DMENUART)/switch_on.png \
     $(DEDITORTEX)/areaportal.png \
     $(DEDITORTEX)/caulk.png \
     $(DEDITORTEX)/clip.png \
     $(DEDITORTEX)/hint.png \
     $(DEDITORTEX)/nodraw.png \
     $(DEDITORTEX)/noimpact.png \
     $(DEDITORTEX)/trigger.png
TARGETS+=$(ART)

DMODELS=$(DVIS)/models

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
     $(DMODELS) \
     $(DFONTS) \
     $(DSCRIPTS) \
     $(TARGETS)

.SUFFIXES: .png .pdf .ps .psd .svg .ogg .wav 
%.png : %.pdf
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
	$(CRUSH) $(CRUSHFLAGS) $@ $*.tmp.png
	mv $*.tmp.png $@
%.png : %.svg
	$(IM) $(IMFLAGS) -deconstruct -coalesce svg:$< tiff:$*.tmp.tiff
	$(IM) $(IMFLAGS) tiff:$*.tmp.tiff[0] png:$@
	@rm -f $*.tmp.tiff
	$(CRUSH) $(CRUSHFLAGS) $@ $*.tmp.png
	mv $*.tmp.png $@
%.png : %.ps
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
	$(CRUSH) $(CRUSHFLAGS) $@ $*.tmp.png
	mv $*.tmp.png $@
%.png : %.psd
	$(IM) $(IMFLAGS) -deconstruct -coalesce psd:$< tiff:$*.tmp.tiff
	$(IM) $(IMFLAGS) tiff:$*.tmp.tiff[0] png:$@
	@rm -f $*.tmp.tiff
	$(CRUSH) $(CRUSHFLAGS) $@ $*.tmp.png
	mv $*.tmp.png $@
%.ogg : %.wav
	$(OGGENC) $(OGGFLAGS) -o $@ $<

.PHONY: all clean dist distclean copyall rmbase

all: $(TARGETS)

copyall: all $(DISTFILES)
	@if [ ! -d $(DBASE) ]; then \
		mkdir $(DBASE); \
	fi
	@tar -c $(DISTFILES) | tar -xv -C $(DBASE) >/dev/null

rmbase:
	@rm -rf $(DBASE)

distclean: rmbase clean
	@rm -f $(DISTNAME).*

dist: copyall
	7z a -r -ssw -scsUTF-8 -m0=lzma2 -mx=9 $(DISTNAME).7z $(DBASE)
	tar -c $(DBASE) | xz >$(DISTNAME).tar.xz

install: copyall
	@if [ ! -d $(DINSTALL)/$(DBASE) ]; then \
		mkdir -p $(DINSTALL)/$(DBASE); \
	fi
	@cp -f -R $(DBASE)/* $(DINSTALL)/$(DBASE)
	@echo
	@echo "$(DBASE) installed in $(DINSTALL)"

clean:
	@rm -f $(TARGETS)

