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

ACF_DefineEngineold( "R3-1.2", {
	name = "R3 1.2L Petrol",
	desc = "[ACFE] A tiny, old worn-out radial.",
	model = "models/engines/radial3s.mdl",
	sound = "acf_engines/r7_petrolsmall.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 70,
	torque = 120,
	flywheelmass = 0.10,
	idlerpm = 710,
	peakminrpm = 2800,
	peakmaxrpm = 4600,
	limitrpm = 5000
} )

ACF_DefineEngineold( "R3-5.0", {
	name = "R3 5.0 Petrol",
	desc = "[ACFE] Mid range radial, thirsty and smooth",
	model = "models/engines/radial3m.mdl",
	sound = "acf_engines/r7_petrolmedium.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 240,
	torque = 340,
	flywheelmass = 0.35,
	idlerpm = 700,
	peakminrpm = 2300,
	peakmaxrpm = 3800,
	limitrpm = 4000
} )

ACF_DefineEngineold( "R3-11.0", {
	name = "R3 11.0L Petrol",
	desc = "[ACFE] Massive American radial monster, destined for aircraft and heavy things.",
	model = "models/engines/radial3b.mdl",
	sound = "acf_engines/r7_petrollarge.wav",
	category = "Radial",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 600,
	torque = 1025,
	flywheelmass = 3,
	idlerpm = 760,
	peakminrpm = 2200,
	peakmaxrpm = 3400,
	limitrpm = 3800
} )
