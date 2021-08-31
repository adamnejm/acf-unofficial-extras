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

ACF_DefineEngineold( "R9-4.1", {
	name = "R9 4.1L Petrol",
	desc = "[ACFE] A tiny, old worn-out radial.",
	model = "models/engines/radial9s.mdl",
	sound = "acf_engines/r9b.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 150,
	torque = 450,
	flywheelmass = 0.15,
	idlerpm = 700,
	peakminrpm = 2700,
	peakmaxrpm = 4400,
	limitrpm = 4800
} )

ACF_DefineEngineold( "R9-18.5", {
	name = "R9 18.5 Petrol",
	desc = "[ACFE] Mid range radial, thirsty and smooth",
	model = "models/engines/radial9m.mdl",
	sound = "acf_engines/r9m.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 560,
	torque = 1500,
	flywheelmass = 0.45,
	idlerpm = 700,
	peakminrpm = 1500,
	peakmaxrpm = 2150,
	limitrpm = 2200
} )

ACF_DefineEngineold( "R9-36.5", {
	name = "R9 36.5L Petrol",
	desc = "[ACFE] Massive American radial monster, destined for fighter aircraft and heavy tanks.",
	model = "models/engines/radial9b.mdl",
	sound = "acf_engines/r9s.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 1200,
	torque = 3205,
	flywheelmass = 1,
	idlerpm = 730,
	peakminrpm = 500,
	peakmaxrpm = 2200,
	limitrpm = 2300
} )
