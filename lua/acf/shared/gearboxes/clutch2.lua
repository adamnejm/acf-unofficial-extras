if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineGearboxold(id,data)
		ACF_DefineGearbox(id,data)
	end

else
local class = "zACFE Clutch"
local typeoverwrite = nil

	ACF.RegisterGearboxClass(class, {
		Name		= "ACFE Clutches",
		CreateMenu	= ACF.ManualGearboxMenu,
		Gears = {
			Min	= 0,
			Max	= 1,
		}
	})

	do

		function ACF_DefineGearboxold(id,data)
			ACF.RegisterGearbox(id, class, {
				Name		= data.name,
				Description	= data.desc,
				Model		= data.model,
				Mass		= data.weight,
				Switch		= data.switch,
				MaxTorque	= data.maxtq,
			})
		end
		
	end

end
-- Clutch

-- Weight
local CTW = 2
local CSW = 5
local CMW = 10
local CLW = 20

-- Torque Rating
local CTT = 75
local CST = 650
local CMT = 1400 
local CLT = 8000

-- general description
local CDesc = "A standalone clutch for when a full size gearbox is unnecessary or too long."

-- Straight-through

ACF_DefineGearboxold( "Clutch-S-T", {
	name = "Clutch, Straight, Tiny",
	desc = CDesc,
	model = "models/engines/flywheelclutcht.mdl",
	category = "Clutch",
	weight = CTW,
	switch = 0.3,
	maxtq = CTT,
	gears = 0,
	geartable = {
		[ 0 ] = 1,
		[ -1 ] = 1
	}
} )

ACF_DefineGearboxold( "Clutch-S-S", {
	name = "Clutch, Straight, Small",
	desc = CDesc,
	model = "models/engines/flywheelclutchs.mdl",
	category = "Clutch",
	weight = CSW,
	switch = 0.3,
	maxtq = CST,
	gears = 0,
	geartable = {
		[ 0 ] = 1,
		[ -1 ] = 1
	}
} )

ACF_DefineGearboxold( "Clutch-S-M", {
	name = "Clutch, Straight, Medium",
	desc = CDesc,
	model = "models/engines/flywheelclutchm.mdl",
	category = "Clutch",
	weight = CMW,
	switch = 0.4,
	maxtq = CMT,
	gears = 0,
	geartable = {
		[ 0 ] = 1,
		[ -1 ] = 1
	}
} )

ACF_DefineGearboxold( "Clutch-S-L", {
	name = "Clutch, Straight, Large",
	desc = CDesc,
	model = "models/engines/flywheelclutchb.mdl",
	category = "Clutch",
	weight = CLW,
	switch = 0.6,
	maxtq = CLT,
	gears = 0,
	geartable = {
		[ 0 ] = 1,
		[ -1 ] = 1
	}
} )
