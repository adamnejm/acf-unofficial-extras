
-- 4-Speed gearboxes

-- Weight
local Gear4SW = 30

local StWB = 0.75 --straight weight bonus mulitplier

-- Torque Rating
local Gear4ST = 280

local StTB = 1.25 --straight torque bonus multiplier

-- Inline

ACF_DefineGearbox( "4Gear-L-T", {
	name = "4-Speed, Inline, Tiny",
	desc = "A tiny, and light 4 speed inline gearbox, with a somewhat limited max torque rating\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/linear_t.mdl",
	category = "4-Speed",
	weight = Gear4SW,
	switch = 0.07,
	maxtq = Gear4ST,
	gears = 4,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = -0.1,
		[ -1 ] = 0.5
	}
} )

-- Inline Dual Clutch

ACF_DefineGearbox( "4Gear-LD-T", {
	name = "4-Speed, Inline, Tiny, Dual Clutch",
	desc = "A tiny, and light 4 speed inline gearbox, with a somewhat limited max torque rating. The dual clutch allows you to apply power and brake each side independently\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/linear_t.mdl",
	category = "4-Speed",
	weight = Gear4SW,
	switch = 0.07,
	maxtq = Gear4ST,
	gears = 4,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = -0.1,
		[ -1 ] = 0.5
	}
} )


-- Transaxial

ACF_DefineGearbox( "4Gear-T-T", {
	name = "4-Speed, Transaxial, Tiny",
	desc = "A tiny, and light 4 speed gearbox, with a somewhat limited max torque rating\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/transaxial_t.mdl",
	category = "4-Speed",
	weight = Gear4SW,
	switch = 0.07,
	maxtq = Gear4ST,
	gears = 4,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = -0.1,
		[ -1 ] = 0.5
	}
} )


-- Transaxial Dual Clutch

ACF_DefineGearbox( "4Gear-TD-T", {
	name = "4-Speed, Transaxial, Tiny, Dual Clutch",
	desc = "A tiny, and light 4 speed gearbox, with a somewhat limited max torque rating. The dual clutch allows you to apply power and brake each side independently\n\nThe Final Drive slider is a multiplier applied to all the other gear ratios",
	model = "models/engines/transaxial_t.mdl",
	category = "4-Speed",
	weight = Gear4SW,
	switch = 0.07,
	maxtq = Gear4ST,
	gears = 4,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = -0.1,
		[ -1 ] = 0.5
	}
} )

-- Straight-through gearboxes

ACF_DefineGearbox( "4Gear-ST-T", {
	name = "4-Speed, Straight, Tiny",
	desc = "A tiny straight-through gearbox",
	model = "models/engines/t5tiny.mdl",
	category = "4-Speed",
	weight = math.floor(Gear4SW * StWB),
	switch = 0.07,
	maxtq = math.floor(Gear4ST * StTB),
	gears = 4,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.1,
		[ 2 ] = 0.2,
		[ 3 ] = 0.3,
		[ 4 ] = -0.1,
		[ -1 ] = 1
	}
} )

