

-- Inline

ACF_DefineGearbox( "2Gear-L-T", {
	name = "Transfer case, Inline, Tiny",
	desc = "2 speed gearbox, useful for low range and rc vehicles",
	model = "models/engines/linear_t.mdl",
	category = "Transfer",
	weight = 10,
	switch = 0.2,
	maxtq = 12500,
	gears = 2,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ 2 ] = -0.5,
		[ -1 ] = 0.5
	}
} )


-- Transaxial

ACF_DefineGearbox( "2Gear-T-T", {
	name = "Transfer case, Tiny",
	desc = "2 speed gearbox, useful for low range and rc vehicles",
	model = "models/engines/transaxial_t.mdl",
	category = "Transfer",
	weight = 20,
	switch = 0.2,
	maxtq = 12500,
	gears = 2,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ 2 ] = -0.5,
		[ -1 ] = 0.5
	}
} )

