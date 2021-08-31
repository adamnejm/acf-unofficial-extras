if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE R"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE Radial Engines",
	})

	do

		function ACF_DefineEngineold(id,data)
			local Fueltype = {}
			if data.fuel == "Petrol"	then Fueltype = { Petrol = true } end
			if data.fuel == "Diesel"	then Fueltype = { Diesel = true } end
			if data.fuel == "Multifuel" then Fueltype = { Petrol = true, Diesel = true } end
			if data.fuel == "Electric"	then Fueltype = { Electric = true } end
			ACF.RegisterEngine(id, class, {
				Name		 = data.name,
				Description	 = data.desc,
				Model		 = data.model,
				Sound		 = data.sound,
				Fuel		 = Fueltype,
				Type		 = typeoverwrite or data.enginetype,
				Mass		 = data.weight,
				Torque		 = data.torque,
				FlywheelMass = data.flywheelmass,
				RPM = {
					Idle	= data.idlerpm,
					PeakMin	= data.peakminrpm,
					PeakMax	= data.peakmaxrpm,
					Limit	= data.limitrpm,
				},
			})
		end
		
	end

	
end
-- Radial engines

ACF_DefineEngineold( "R5-2.1", {
	name = "R5 2.1L Petrol",
	desc = "[ACFE] A tiny, old worn-out radial.",
	model = "models/engines/radial5s.mdl",
	sound = "acf_engines/r5.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 133,
	torque = 99,
	flywheelmass = 0.10,
	idlerpm = 1100,
	peakminrpm = 3500,
	peakmaxrpm = 6600,
	limitrpm = 7000
} )

ACF_DefineEngineold( "R5-9.3", {
	name = "R5 9.3 Petrol",
	desc = "[ACFE] Mid range radial, thirsty and smooth",
	model = "models/engines/radial5m.mdl",
	sound = "acf_engines/r5.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 250,
	torque = 238,
	flywheelmass = 0.35,
	idlerpm = 650,
	peakminrpm = 2900,
	peakmaxrpm = 5500,
	limitrpm = 5750
} )

ACF_DefineEngineold( "R5-19.5", {
	name = "R5 19.5L Petrol",
	desc = "[ACFE] Massive American radial monster, destined for fighter aircraft and heavy tanks.",
	model = "models/engines/radial5b.mdl",
	sound = "acf_engines/r5.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 400,
	torque = 590,
	flywheelmass = 3,
	idlerpm = 550,
	peakminrpm = 2500,
	peakmaxrpm = 4200,
	limitrpm = 4350
} )
