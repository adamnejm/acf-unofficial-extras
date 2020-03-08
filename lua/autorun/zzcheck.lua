hook.Add("Initialize","check for acf",function()
	if not ACF then
		error("no acf found, install it first!!!")
	end
end)
// got this snipped from evolve, cuz im lazy
timer.Create( "TagCheckACFE", 1, 0, function()
	if not GetConVar( "sv_tags" ) then CreateConVar("sv_tags","") end
	if ( !string.find( GetConVar( "sv_tags" ):GetString(), "acfe" ) ) then
	RunConsoleCommand( "sv_tags", GetConVar( "sv_tags" ):GetString() .. ",acfe" )
	end
end )

//for testing, may not work. friction could be capped at 1
physenv.AddSurfaceData([[
"friction1"
{
    "base"	"rubber"
    "friction"	"10"
    "elasticity"	"3"
    "density"	"500"
}
"friction2"
{
    "base"	"rubber"
    "friction"	"20"
    "elasticity"	"3"
    "density"	"500"
}
"friction3"
{
    "base"	"rubber"
    "friction"	"30"
    "elasticity"	"3"
    "density"	"500"
}
]])
