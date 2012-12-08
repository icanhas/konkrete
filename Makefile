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
IQM?=iqm

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

VIS=\
     $(DVIS)/test.png \
     $(DGRAPHICS)/2d/crosshaira.png \
     $(DGRAPHICS)/2d/crosshairb.png \
     $(DGRAPHICS)/2d/crosshairc.png \
     $(DGRAPHICS)/menu/cursor.png \
     $(DGRAPHICS)/menu/sliderbutton0.png \
     $(DGRAPHICS)/menu/switch_off.png \
     $(DGRAPHICS)/menu/switch_on.png \
     $(DMODELS)/projectiles/nade.iqm \
     $(DMODELS)/projectiles/proxmine.iqm \
     $(DMODELS)/projectiles/rocketstrong.iqm \
     $(DMODELS)/shells/m_shell.iqm \
     $(DMODELS)/ships/griever/hull.iqm \
     $(DMODELS)/ships/griever/hull_default.skin \
     $(DMODELS)/ships/ship2/hull.iqm \
     $(DMODELS)/ships/ship2/hull_default.skin \
     $(DMODELS)/ships/ship3/hull.iqm \
     $(DMODELS)/weaps/grenade/grenade.iqm \
     $(DMODELS)/weaps/lightning/lightning.iqm \
     vis/models/weaps/melee/melee.iqm \
     $(DMODELS)/weaps/minigun/minigun.iqm \
     $(DMODELS)/weaps/plasma/plasma.iqm \
     vis/models/weaps/proxlauncher/prox.iqm \
     $(DMODELS)/weaps/rail/railgun.iqm \
     vis/models/weaps/flak/flak.iqm \
     vis/textures/dmg/bullet_mrk.png \
     vis/textures/dmg/burn_med_mrk.png \
     vis/textures/dmg/hole_lg_mrk.png \
     vis/textures/dmg/plasma_mrk.png \
     vis/textures/dmg/shadow.png \
     $(DTEXTURES)/common/areaportal.png \
     $(DTEXTURES)/common/caulk.png \
     $(DTEXTURES)/common/clip.png \
     $(DTEXTURES)/common/hint.png \
     $(DTEXTURES)/common/nodraw.png \
     $(DTEXTURES)/common/noimpact.png \
     $(DTEXTURES)/common/trigger.png \
     vis/textures/effects/invismap.png \
     vis/textures/effects/quadmap2.png \
     vis/textures/effects/regenmap2.png \
     vis/textures/icons/envirosuit.png \
     vis/textures/icons/flight.png \
     vis/textures/icons/haste.png \
     vis/textures/icons/icona_bfg.png \
     vis/textures/icons/icona_grenade.png \
     vis/textures/icons/icona_lightning.png \
     vis/textures/icons/icona_machinegun.png \
     vis/textures/icons/icona_plasma.png \
     vis/textures/icons/icona_railgun.png \
     vis/textures/icons/icona_rocket.png \
     vis/textures/icons/icona_shotgun.png \
     vis/textures/icons/iconf_blu.png \
     vis/textures/icons/iconf_blu1.png \
     vis/textures/icons/iconf_blu2.png \
     vis/textures/icons/iconf_blu3.png \
     vis/textures/icons/iconf_red.png \
     vis/textures/icons/iconf_red1.png \
     vis/textures/icons/iconf_red2.png \
     vis/textures/icons/iconf_red3.png \
     vis/textures/icons/iconh_green.png \
     vis/textures/icons/iconh_mega.png \
     vis/textures/icons/iconh_red.png \
     vis/textures/icons/iconh_yellow.png \
     vis/textures/icons/iconr_red.png \
     vis/textures/icons/iconr_shard.png \
     vis/textures/icons/iconr_yellow.png \
     vis/textures/icons/iconw_bfg.png \
     vis/textures/icons/iconw_gauntlet.png \
     vis/textures/icons/iconw_grapple.png \
     vis/textures/icons/iconw_grenade.png \
     vis/textures/icons/iconw_lightning.png \
     vis/textures/icons/iconw_machinegun.png \
     vis/textures/icons/iconw_plasma.png \
     vis/textures/icons/iconw_railgun.png \
     vis/textures/icons/iconw_rocket.png \
     vis/textures/icons/iconw_shotgun.png \
     vis/textures/icons/invis.png \
     vis/textures/icons/medkit.png \
     vis/textures/icons/noammo.png \
     vis/textures/icons/quad.png \
     vis/textures/icons/regen.png \
     vis/textures/icons/teleporter.png \
     vis/textures/kdm1/wall1.png \
     vis/textures/medals/medal_accuracy.png \
     vis/textures/medals/medal_assist.png \
     vis/textures/medals/medal_capture.png \
     vis/textures/medals/medal_defend.png \
     vis/textures/medals/medal_excellent.png \
     vis/textures/medals/medal_frags.png \
     vis/textures/medals/medal_gauntlet.png \
     vis/textures/medals/medal_impressive.png \
     vis/textures/medals/medal_victory.png \
     $(DTEXTURES)/shells/m_shell.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare1.png \
     $(DTEXTURES)/projectiles/rocketstrong/rocketflare2.png \
     $(DTEXTURES)/ships/griever/engine.png \
     $(DTEXTURES)/ships/griever/shipbody.png \
     $(DTEXTURES)/ships/ship2/engine.png \
     $(DTEXTURES)/ships/ship2/shipbody.png \
     $(DTEXTURES)/ships/ship3/shipbody.png \
     vis/textures/2d/crosshaira.png \
     vis/textures/2d/defer.png \
     vis/textures/2d/lag.png \
     vis/textures/2d/net.png \
     vis/textures/2d/select.png \
     vis/textures/sprites/balloon4.png \
     vis/textures/sprites/bubble.png \
     vis/textures/sprites/foe2.png \
     vis/textures/sprites/plasmaa.png \
     vis/textures/sprites/splash.png \
     $(DTEXTURES)/weaps/grenade/grenade.png \
     $(DTEXTURES)/weaps/hook/hook.png \
     $(DTEXTURES)/weaps/lightning/lightning.png \
     $(DTEXTURES)/weaps/minigun/minigun.png \
     $(DTEXTURES)/weaps/plasma/plasma.png \
     $(DTEXTURES)/weaps/railgun/railgun.png \
     $(DTEXTURES)/weaps/rockets/rockets.png
TARGETS+=$(VIS)

MAPS=\
     $(DMAPS)/kctf1.bsp \
     $(DMAPS)/kctf2.bsp \
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
%.iqm : %.iqe
	$(IQM) $@ $< >/dev/null

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
#	7z a -r -ssw -scsUTF-8 -m0=lzma2 -mx=9 $(DISTNAME).7z $(DBASE)

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

