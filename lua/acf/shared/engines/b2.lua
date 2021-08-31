if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE B"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE Flat Engines",
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
-- boxer 2 engines

ACF_DefineEngineold( "B2-1.2", {
	name = "B2 1.2L Flat 2 Petrol",
	desc = "[ACFE] bike sized flat two engine, sporty and light",
	model = "models/engines/b2s.mdl",
	sound = "acf_engines/b2s.wav",
	category = "B",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 35,
	torque = 120,
	flywheelmass = 0.08,
	idlerpm = 750,
	peakminrpm = 5500,
	peakmaxrpm = 7500,
	limitrpm = 8500
} )

ACF_DefineEngineold( "B2-2.3", {
	name = "B2 2.3L Flat 2 Petrol",
	desc = "[ACFE]  car grade flat two, cuz it looks cool",
	model = "models/engines/b2m.mdl",
	sound = "acf_engines/b2m.wav",
	category = "B",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 75,
	torque = 290,
	flywheelmass = 0.1,
	idlerpm = 900,
	peakminrpm = 4300,
	peakmaxrpm = 6500,
	limitrpm = 7200
} )

ACF_DefineEngineold( "B2-4.6", {
	name = "B2 4.6L Flat 2 Petrol",
	desc = "[ACFE] Aircraft grade boxer",
	model = "models/engines/b2l.mdl",
	sound = "acf_engines/b2l.wav",
	category = "B",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 160,
	torque = 480,
	flywheelmass = 0.7,
	idlerpm = 620,
	peakminrpm = 2800,
	peakmaxrpm = 5200,
	limitrpm = 6000
} )


