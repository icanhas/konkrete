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

vis/models/players/griever/engine
{
        {
                map vis/models/players/griever/engine.tga
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