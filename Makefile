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
DINSTALL?=/usr/local/games/konkrete
DISTNAME?='$(DBASE)-$(shell date +"%Y-%m-%d")'

DBOTFILES=botfiles
DDEMOS=demos
DFONTS=fonts
DMAPS=maps
DSCRIPTS=scripts
DVIS=vis
DSOUND=sound

DGRAPHICS=$(DVIS)/graphics
DMODELS=$(DVIS)/models
DTEXTURES=$(DVIS)/textures

ART=\
     $(DVIS)/test.png \
     $(DGRAPHICS)/2d/crosshaira.png \
     $(DGRAPHICS)/2d/crosshairb.png \
     $(DGRAPHICS)/2d/crosshairc.png \
     $(DGRAPHICS)/menu/cursor.png \
     $(DGRAPHICS)/menu/sliderbutton0.png \
     $(DGRAPHICS)/menu/switch_off.png \
     $(DGRAPHICS)/menu/switch_on.png \
     $(DTEXTURES)/common/areaportal.png \
     $(DTEXTURES)/common/caulk.png \
     $(DTEXTURES)/common/clip.png \
     $(DTEXTURES)/common/hint.png \
     $(DTEXTURES)/common/nodraw.png \
     $(DTEXTURES)/common/noimpact.png \
     $(DTEXTURES)/common/trigger.png \
     $(DTEXTURES)/shells/m_shell.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare1.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare2.png
TARGETS+=$(ART)

MAPS=\
     $(DMAPS)/kctf1.bsp \
     $(DMAPS)/kdm1.bsp \
     $(DMAPS)/kt1.bsp \
     $(DMAPS)/kt2.bsp
TARGETS+=$(MAPS)

SND=\
     $(DSOUND)/null.ogg \
     $(DSOUND)/default.ogg \
     $(DSOUND)/feedback/hit.ogg \
     $(DSOUND)/music/testm.ogg \
     $(DSOUND)/weaps/weaphover.ogg
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

