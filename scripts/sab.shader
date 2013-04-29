vis/textures/projectiles/rocketweak/rocketweakflare
{
	cull disable
	{
		animmap 8 vis/textures/projectiles/rocketweak/rocketweakflare1.tga vis/textures/projectiles/rocketweak/rocketweakflare2.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 vis/textures/projectiles/rocketweak/rocketweakflare1.tga vis/textures/projectiles/rocketweak/rocketweakflare2.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}
vis/textures/projectiles/rocketstrong/rocketflare
{
	cull disable
	{
		animmap 8 vis/textures/projectiles/rocketstrong/rocketflare1.tga vis/textures/projectiles/rocketstrong/rocketflare2.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 vis/textures/projectiles/rocketstrong/rocketflare1.tga vis/textures/projectiles/rocketstrong/rocketflare2.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}
vis/textures/ships/griever/shipbody
{
        {
                map vis/textures/ships/griever/shipbody.tga
                rgbGen lightingdiffuse
        }
}

vis/textures/ships/griever/engine
{
        {
                map vis/textures/ships/griever/engine.tga
                rgbGen lightingdiffuse
        }
}
vis/textures/weaps/hook/hook
{
        {
                map vis/textures/weaps/hook/hook.tga
                rgbGen lightingdiffuse
        }
}
vis/textures/weaps/rockets/rockets
{
        {
                map vis/textures/weaps/rockets/rockets.tga
                rgbGen lightingdiffuse
        }
}


lightningBoltNew
{
	cull none
	{
		map gfx/misc/lightning3new.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave sin 1 0.5 0 7.1
		tcmod scale  2 1
		tcMod scroll -5 0
	}
	{
		map gfx/misc/lightning3new.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave sin 1 0.8 0 8.1
		tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}


lightningBoltNewNPM
{
	nopicmip
	cull none
	{
		map gfx/misc/lightning3newNPM.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave sin 1 0.5 0 7.1
		tcmod scale  2 1
		tcMod scroll -5 0
	}
	{
		map gfx/misc/lightning3newNPM.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave sin 1 0.8 0 8.1
		tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}


