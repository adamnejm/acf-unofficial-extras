
-- 6-Speed gearboxes

-- Weight
local Gear6SW = 80
local Gear6MW = 160
local Gear6LW = 320
local StWB = 0.75 --straight weight bonus mulitplier

-- Torque Rating
local Gear6ST = 440
local Gear6MT = 1360
local Gear6LT = 10000
local StTB = 1.25 --straight torque bonus multiplier

-- Inline

ACF_DefineGearbox( "6Gear-L-T", {
	name = "6-Speed, Inline, Tiny",
	desc = "A Tiny and light 6 speed inline gearbox, with a limited max torque rating.",
	model = "models/engines/linear_t.mdl",
	category = "6-Speed",
	weight = 40,
	switch = 0.07,
	maxtq = 240,
	gears = 6,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = 0.4,
		[ 5 ] = 0.5,
		[ 6 ] = -0.1,
		[ -1 ] = 0.5
	}
} )

-- Inline Dual Clutch

ACF_DefineGearbox( "6Gear-LD-T", {
	name = "6-Speed, Inline, Tiny, Dual Clutch",
	desc = "A Tiny and light 6 speed inline gearbox, with a limited max torque rating. The dual clutch allows you to apply power and brake each side independently\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/linear_t.mdl",
	category = "6-Speed",
	weight = 40,
	switch = 0.07,
	maxtq = 240,
	gears = 6,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = 0.4,
		[ 5 ] = 0.5,
		[ 6 ] = -0.1,
		[ -1 ] = 0.5
	}
} )

-- Transaxial

ACF_DefineGearbox( "6Gear-T-T", {
	name = "6-Speed, Transaxial, Tiny",
	desc = "A Tiny and light 6 speed gearbox, with a limited max torque rating.",
	model = "models/engines/transaxial_t.mdl",
	category = "6-Speed",
	weight = 40,
	switch = 0.07,
	maxtq = 240,
	gears = 6,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = 0.4,
		[ 5 ] = 0.5,
		[ 6 ] = -0.1,
		[ -1 ] = 0.5
	}
} )


-- Transaxial Dual Clutch

ACF_DefineGearbox( "6Gear-TD-T", {
	name = "6-Speed, Transaxial, Tiny, Dual Clutch",
	desc = "A Tiny and light 6 speed gearbox, with a limited max torque rating. The dual clutch allows you to apply power and brake each side independently\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/transaxial_t.mdl",
	category = "6-Speed",
	weight = 40,
	switch = 0.07,
	maxtq = 240,
	gears = 6,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = 0.4,
		[ 5 ] = 0.5,
		[ 6 ] = -0.1,
		[ -1 ] = 0.5
	}
} )


-- Straight-through gearboxes

ACF_DefineGearbox( "6Gear-ST-T", {
	name = "6-Speed, Straight, Tiny",
	desc = "A Tiny and light 6 speed straight-through gearbox.",
	model = "models/engines/t5tiny.mdl",
	category = "6-Speed",
	weight = math.floor(40 * StWB),
	switch = 0.07,
	maxtq = math.floor(240 * StTB),
	gears = 6,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = 0.4,
		[ 5 ] = 0.5,
		[ 6 ] = -0.1,
		[ -1 ] = 0.5
	}
} )

