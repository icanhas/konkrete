GS?=gs	# often "gswin64c" or "gswin32c" on Windows
GSFLAGS?=-q -r90
OGG?=oggenc
OGGFLAGS?=-Q -q6 --resample 44100
IM?=convert
IMFLAGS?=
CRUSH?=pngcrush
CRUSHFLAGS?=-q -rem text -rem alla
YMAP?=ymap
YMAPFLAGS?=-texturedir vis/textures
IQM?=iqm

DBASE?=base
DINSTALL?=/usr/local/games/konkrete
RELEASE?=$(DBASE)-$(shell date +"%Y-%m-%d")
DIST?=$(DBASE)-src-$(shell date +"%Y-%m-%d")

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
     vis/test.png \
     vis/models/projectiles/nade.iqm \
     vis/models/projectiles/proxmine.iqm \
     vis/models/projectiles/rocket.iqm \
     vis/models/projectiles/rocketweak.iqm \
     vis/models/shells/m_shell.iqm \
     vis/models/ships/griever/hull.iqm \
     vis/models/ships/ship2/hull.iqm \
     vis/models/ships/ship3/hull.iqm \
     vis/models/weaphits/boom01.iqm \
     vis/models/weaphits/bullet.iqm \
     vis/models/weaphits/ring02.iqm \
     vis/models/weaps/heminigun/heminigun.iqm \
     vis/models/weaps/flak/flak.iqm \
     vis/models/weaps/lightning/lightning.iqm \
     vis/models/weaps/melee/melee.iqm \
     vis/models/weaps/minigun/minigun.iqm \
     vis/models/weaps/nadelauncher/nadelauncher.iqm \
     vis/models/weaps/plasma/plasma.iqm \
     vis/models/weaps/proxlauncher/prox.iqm \
     vis/models/weaps/rail/railgun.iqm \
     vis/models/weaps/rocketpod/strong.iqm\
     vis/models/weaps/rocketpod/weak.iqm\
     vis/models/weaps/shotgun/shotgun.iqm \
     vis/textures/2d/defer.png \
     vis/textures/2d/lag.png \
     vis/textures/2d/net.png \
     vis/textures/2d/select.png \
     vis/textures/2d/numbers/one_32b.png \
     vis/textures/2d/numbers/two_32b.png \
     vis/textures/2d/numbers/three_32b.png \
     vis/textures/2d/numbers/four_32b.png \
     vis/textures/2d/numbers/five_32b.png \
     vis/textures/2d/numbers/six_32b.png \
     vis/textures/2d/numbers/seven_32b.png \
     vis/textures/2d/numbers/eight_32b.png \
     vis/textures/2d/numbers/nine_32b.png \
     vis/textures/2d/numbers/zero_32b.png \
     vis/textures/2d/numbers/minus_32b.png \
     vis/textures/common/areaportal.png \
     vis/textures/common/caulk.png \
     vis/textures/common/clip.png \
     vis/textures/common/hint.png \
     vis/textures/common/nodraw.png \
     vis/textures/common/noimpact.png \
     vis/textures/common/trigger.png \
     vis/textures/dmg/bullet_mrk.png \
     vis/textures/dmg/burn_med_mrk.png \
     vis/textures/dmg/hole_lg_mrk.png \
     vis/textures/dmg/plasma_mrk.png \
     vis/textures/dmg/shadow.png \
     vis/textures/effects/black.png \
     vis/textures/effects/bullethit/1.png \
     vis/textures/effects/bullethit/3.png \
     vis/textures/effects/bullethit/2.png \
     vis/textures/effects/invismap.png \
     vis/textures/effects/plasma.png \
     vis/textures/effects/plasmahit.png \
     vis/textures/effects/quadmap2.png \
     vis/textures/effects/railcore.png \
     vis/textures/effects/regenmap2.png \
     vis/textures/effects/railhit/1.png \
     vis/textures/effects/railhit/2.png \
     vis/textures/effects/railhit/3.png \
     vis/textures/effects/smokepuff1.png \
     vis/textures/effects/sabsplode/1.png \
	 vis/textures/effects/sabsplode/2.png \
	 vis/textures/effects/sabsplode/3.png \
	 vis/textures/effects/sabsplode/4.png \
	 vis/textures/effects/sabsplode/5.png \
     vis/textures/icons/anon.png \
     vis/textures/icons/envirosuit.png \
     vis/textures/icons/flight.png \
     vis/textures/icons/haste.png \
     vis/textures/icons/grenades.png \
     vis/textures/icons/lightningcells.png \
     vis/textures/icons/rounds.png \
     vis/textures/icons/plasma.png \
     vis/textures/icons/slugs.png \
     vis/textures/icons/rockets.png \
     vis/textures/icons/shotgunshells.png \
     vis/textures/icons/homingrockets.png \
     vis/textures/icons/homingrockets.png \
     vis/textures/icons/herounds.png \
     vis/textures/icons/nanoids.png \
     vis/textures/icons/iconf_blu.png \
     vis/textures/icons/blueflag.png \
     vis/textures/icons/iconf_blu2.png \
     vis/textures/icons/iconf_blu3.png \
     vis/textures/icons/iconf_red.png \
     vis/textures/icons/redflag.png \
     vis/textures/icons/iconf_red2.png \
     vis/textures/icons/iconf_red3.png \
     vis/textures/icons/armourshard.png \
     vis/textures/icons/armourmega.png \
     vis/textures/icons/armourlarge.png \
     vis/textures/icons/armourmedium.png \
     vis/textures/icons/heavyshieldgen.png \
     vis/textures/icons/shieldcellssmall.png \
     vis/textures/icons/shieldcellslarge.png \
     vis/textures/icons/melee.png \
     vis/textures/icons/hook.png \
     vis/textures/icons/nadelauncher.png \
     vis/textures/icons/lightning.png \
     vis/textures/icons/machinegun.png \
     vis/textures/icons/plasmagun.png \
     vis/textures/icons/railgun.png \
     vis/textures/icons/rocket.png \
     vis/textures/icons/shotgun.png \
     vis/textures/icons/homing.png \
     vis/textures/icons/proxlauncher.png \
     vis/textures/icons/heminigun.png \
     vis/textures/icons/nanoidcannon.png \
     vis/textures/icons/invis.png \
     vis/textures/icons/medkit.png \
     vis/textures/icons/noammo.png \
     vis/textures/icons/quad.png \
     vis/textures/icons/regen.png \
     vis/textures/icons/teleporter.png \
     vis/textures/map1/wall1.png \
     vis/textures/medals/medal_accuracy.png \
     vis/textures/medals/medal_assist.png \
     vis/textures/medals/medal_capture.png \
     vis/textures/medals/medal_defend.png \
     vis/textures/medals/medal_excellent.png \
     vis/textures/medals/medal_frags.png \
     vis/textures/medals/medal_gauntlet.png \
     vis/textures/medals/medal_impressive.png \
     vis/textures/medals/medal_victory.png \
     vis/textures/menu/pointer.png \
     vis/textures/menu/font1_prop.png \
     vis/textures/menu/font1_prop_glo.png \
     vis/textures/menu/sliderbutton0.png \
     vis/textures/menu/switch_off.png \
     vis/textures/menu/switch_on.png \
     vis/textures/menu/sigil.png \
     vis/textures/null.png \
     vis/textures/projectiles/rocket/rocketflare1.png \
     vis/textures/projectiles/rocket/rocketflare2.png \
     vis/textures/projectiles/rocket/rocketnade.png \
     vis/textures/projectiles/rocketweak/rocketweakflare1.png \
     vis/textures/projectiles/rocketweak/rocketweakflare2.png \
     vis/textures/shells/m_shell.png \
     vis/textures/ships/griever/engine.png \
     vis/textures/ships/griever/shipbody.png \
     vis/textures/ships/ship2/engine.png \
     vis/textures/ships/ship2/shipbody.png \
     vis/textures/ships/ship3/shipbody.png \
     vis/textures/sprites/balloon4.png \
     vis/textures/sprites/bubble.png \
     vis/textures/sprites/foe2.png \
     vis/textures/sprites/plasmaa.png \
     vis/textures/sprites/splash.png \
     vis/textures/weaps/heminigun/heminigun.png \
     vis/textures/weaps/hook/hook.png \
     vis/textures/weaps/lightning/lgeffect.png \
     vis/textures/weaps/lightning/lightning.png \
     vis/textures/weaps/melee/melee.png \
     vis/textures/weaps/minigun/minigun.png \
     vis/textures/weaps/nadelauncher/nadelauncher.png \
     vis/textures/weaps/plasma/plasma.png \
     vis/textures/weaps/railgun/railgun.png \
     vis/textures/weaps/shotgun/shotgun.png \
     vis/textures/weaps/rockets/rockets.png \
     vis/textures/xhairs/dot.png \
     vis/textures/xhairs/ring.png
TARGETS+=$(VIS)

MAPS=\
     maps/kctf1.bsp \
     maps/kctf2.bsp \
     maps/kdm1.bsp \
     maps/kt1.bsp \
     maps/kt2.bsp
TARGETS+=$(MAPS)

SND=\
     sound/null.ogg \
     sound/default.ogg \
     sound/feedback/hit.ogg \
     sound/music/testm.ogg \
     sound/weaps/change.ogg \
     sound/weaps/weaphover.ogg \
     sound/weaps/machinegun/machgf1b.ogg \
     sound/weaps/nanoid/fire.ogg \
     sound/weaps/nanoid/nanoidflight.ogg \
     sound/weaps/plasma/hyprbf1a.ogg \
     sound/weaps/prox/tick.ogg \
     sound/weaps/prox/trigger.ogg \
     sound/weaps/rail/railgf1a.ogg \
     sound/weaps/rail/rg_hum.ogg
TARGETS+=$(SND)

RELEASEFILES=\
     $(TARGETS) \
     default.cfg \
     slab-cpma.cfg \
     ducky-ql.cfg \
     botfiles \
     demos \
     fonts \
     scripts \
     vis/models/ships/griever/hull_default.skin \
     vis/models/ships/ship2/hull_default.skin \
     vis/models/ships/ship3/hull_default.skin \
     vis/models/ships/griever/animation.cfg \
     vis/models/ships/ship2/animation.cfg \
     vis/models/ships/ship3/animation.cfg \
     vis/textures/2d/bigchars.tga \
     vis/textures/menu/font2_prop.tga

%.png : %.pdf
	$(GS) $(GSFLAGS) -sDEVICE=pngalpha -o $@ $<
	$(CRUSH) $(CRUSHFLAGS) $@ $*.tmp.png
	mv $*.tmp.png $@
%.png : %.svg
	$(IM) $(IMFLAGS) -deconstruct -coalesce -background none svg:$< tiff:$*.tmp.tiff
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
	$(OGG) $(OGGFLAGS) -o $@ $<
%.bsp : %.map
	$(YMAP) $(YMAPFLAGS) $< >/dev/null
	$(YMAP) $(YMAPFLAGS) -vis $< >/dev/null
	$(YMAP) $(YMAPFLAGS) -light $< >/dev/null
%.iqm : %.iqe
	$(IQM) $@ $< >/dev/null

all: $(TARGETS)

copyall: all $(RELEASEFILES)
	@if [ ! -d $(DBASE) ]; then \
		mkdir $(DBASE); \
	fi
	@tar cf - $(RELEASEFILES) | tar xvf - -C $(DBASE)

releaseclean: clean
	@rm -f *.7z *.tar.*
	@rm -rf $(DBASE)

release: all
	@rm -f *.7z *.xz
	@tar cf - $(RELEASEFILES) >$(RELEASE).tar
	gzip <$(RELEASE).tar >$(RELEASE).tar.gz
	bzip2 <$(RELEASE).tar >$(RELEASE).tar.bz2
	xz <$(RELEASE).tar >$(RELEASE).tar.xz
#	7z a -m0=lzma -mx=8 $(RELEASE).7z $(RELEASEFILES) >/dev/null
	@rm $(RELEASE).tar

dist: all
	git archive --format=tar HEAD >$(DIST).tar
	gzip <$(DIST).tar >$(DIST).tar.gz
	bzip2 <$(DIST).tar >$(DIST).tar.bz2
	xz <$(DIST).tar >$(DIST).tar.xz
	@rm $(DIST).tar

install: all
	@if [ ! -d $(DINSTALL)/$(DBASE) ]; then \
		mkdir -p $(DINSTALL)/$(DBASE); \
	fi
	@tar cf - $(RELEASEFILES) | tar xf - -C $(DINSTALL)/$(DBASE)
	@echo
	@echo "installed $(DINSTALL)/$(DBASE)"
	@echo

clean:
	@rm -f $(TARGETS)
	@rm -rf $(DBASE)
