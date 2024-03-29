if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineGearboxold(id,data)
		ACF_DefineGearbox(id,data)
	end

else
local class = "zACFE Differential"
local typeoverwrite = nil

	ACF.RegisterGearboxClass(class, {
		Name		= "ACFE Differentials",
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

-- Inline

ACF_DefineGearboxold( "1Gear-L-T", {
	name = "Differential, Inline, Tiny",
	desc = "Tiny differential, used to connect power from gearbox to wheels",
	model = "models/engines/linear_t.mdl",
	category = "Differential",
	weight = 6,
	switch = 0.2,
	maxtq = 12500,
	gears = 1,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ -1 ] = 0.5
	}
} )

-- Inline Dual Clutch

ACF_DefineGearboxold( "1Gear-LD-T", {
	name = "Differential, Inline, Tiny, Dual Clutch",
	desc = "Tiny differential, used to connect power from gearbox to wheels",
	model = "models/engines/linear_t.mdl",
	category = "Differential",
	weight = 6,
	switch = 0.2,
	maxtq = 12500,
	gears = 1,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ -1 ] = 0.5
	}
} )

-- Transaxial

ACF_DefineGearboxold( "1Gear-T-T", {
	name = "Differential, Tiny",
	desc = "Tiny differential, used to connect power from gearbox to wheels",
	model = "models/engines/transaxial_t.mdl",
	category = "Differential",
	weight = 6,
	switch = 0.2,
	maxtq = 25000,
	gears = 1,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ -1 ] = 0.5
	}
} )

-- Transaxial Dual Clutch

ACF_DefineGearboxold( "1Gear-TD-T", {
	name = "Differential, Tiny, Dual Clutch",
	desc = "Tiny differential, used to connect power from gearbox to wheels",
	model = "models/engines/transaxial_t.mdl",
	category = "Differential",
	weight = 6,
	switch = 0.2,
	maxtq = 12500,
	gears = 1,
	doubleclutch = true,
	geartable = {
		[ 0 ] = 0,
		[ 1 ] = 0.5,
		[ -1 ] = 0.5
	}
} )

