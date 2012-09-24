SHELL=/bin/sh
GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90
OGGENC?=oggenc
OGGFLAGS?=-Q -q6 --resample 44100
IM?=convert
IMFLAGS?=
CRUSH?=pngcrush
CRUSHFLAGS?=-q -rem text -rem alla
YMAP?=ymap
YMAPFLAGS?=-threads 4

DBASE?=base
DINSTALL?=/usr/local/games/quake3
DISTNAME?='$(DBASE)-$(shell date +"%Y-%m-%d")'

DBOTFILES=botfiles
DDEMOS=demos
DFONTS=fonts
DMAPS=maps
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
     $(DEDITORTEX)/trigger.png \
     $(DTEXTURES)/shells/m_shell.png \
     $(DTEXTURES)/weaps/rocketstrong/rocketflare.png \
     $(DTEXTURES)/weaps/rocketstrong/rocketflare1.png \
     $(DTEXTURES)/weaps/rocketstrong/rocketflare2.png
TARGETS+=$(ART)

MAPS=\
     $(DMAPS)/kctf1.bsp \
     $(DMAPS)/kdm1.bsp \
     $(DMAPS)/kt1.bsp \
     $(DMAPS)/kt2.bsp
TARGETS+=$(MAPS)

DMODELS=$(DVIS)/models

DMUSIC=$(DSOUND)/music
DFEEDBACK=$(DSOUND)/feedback
SND=\
     $(DSOUND)/null.ogg \
     $(DSOUND)/default.ogg \
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
%.png : %.tga
	$(IM) $(IMFLAGS) tga:$< png:$@
%.ogg : %.wav
	$(OGGENC) $(OGGFLAGS) -o $@ $<
%.bsp : %.map
	$(YMAP) $(YMAPFLAGS) $< >/dev/null
	$(YMAP) -vis $(YMAPFLAGS) $< >/dev/null
	$(YMAP) -light $(YMAPFLAGS) $< >/dev/null

.PHONY: all clean dist distclean copyall rmbase

all: $(TARGETS)

copyall: all $(DISTFILES)
	@if [ ! -d $(DBASE) ]; then \
		mkdir $(DBASE); \
	fi
	@tar -c $(DISTFILES) | tar -xv -C $(DBASE) >/dev/null

distclean: clean
	@rm -f *.7z *.xz
	@rm -rf $(DBASE)

dist: copyall
	@rm -f *.7z *.xz
	tar -c $(DBASE) | xz >$(DISTNAME).tar.xz
	@echo
	7z a -r -ssw -scsUTF-8 -m0=lzma2 -mx=9 $(DISTNAME).7z $(DBASE)

install: copyall
	@if [ ! -d $(DINSTALL)/$(DBASE) ]; then \
		mkdir -p $(DINSTALL)/$(DBASE); \
	fi
	@cp -f -R $(DBASE)/* $(DINSTALL)/$(DBASE)
	@echo
	@echo "$(DBASE) installed in $(DINSTALL)"

clean:
	@rm -f $(TARGETS)
	@rm -rf $(DBASE)

