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
vis/textures/projectiles/rocket/rocketflare
{
	cull disable
	{
		animmap 8 vis/textures/projectiles/rocket/rocketflare1.tga vis/textures/projectiles/rocket/rocketflare2.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 vis/textures/projectiles/rocket/rocketflare1.tga vis/textures/projectiles/rocket/rocketflare2.tga
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
		map vis/textures/weaps/lightning/lgeffect.tga
		blendFunc GL_ONE GL_ONE
		tcmod scale  2 1
	}
}

textures/metal/shinymetal
{

	{
		//map $lightmap
		map vis/textures/metal/metalenv.tga
                tcGen environment
		tcmod scale 1 1
		rgbGen identity   
	}

		
	{
		map vis/textures/metal/metaldiffuse.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
		
}

textures/common/flag
{
	cull disable
    {
		map vis/textures/basic/flag.tga
        rgbGen lightingdiffuse
    }
}
