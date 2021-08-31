if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineGearboxold(id,data)
		ACF_DefineGearbox(id,data)
	end

else
local class = "zACFE Transfercase"
local typeoverwrite = nil

	ACF.RegisterGearboxClass(class, {
		Name		= "ACFE Transfercases",
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

ACF_DefineGearboxold( "2Gear-L-T", {
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

ACF_DefineGearboxold( "2Gear-T-T", {
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

