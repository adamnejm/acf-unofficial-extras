if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE VR"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE VR Engines",
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

ACF_DefineEngineold( "VR6-2.2", {
	name = "VR6 2.2L Petrol",
	desc = "[ACFE] A tiny, old worn-out VR6 engine.",
	model = "models/engines/vr6s.mdl",
	sound = "acf_engines/vrs.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericDiesel",
	weight = 120,
	torque = 140,
	flywheelmass = 0.10,
	idlerpm = 710,
	peakminrpm = 3900,
	peakmaxrpm = 6400,
	limitrpm = 7000
} )

ACF_DefineEngineold( "VR6-4.8", {
	name = "VR6 4.8 Petrol",
	desc = "[ACFE] Mid range VR6 engine, thirsty and smooth",
	model = "models/engines/vr6m.mdl",
	sound = "acf_engines/vrm.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericDiesel",
	weight = 300,
	torque = 360,
	flywheelmass = 0.2,
	idlerpm = 900,
	peakminrpm = 3100,
	peakmaxrpm = 5000,
	limitrpm = 5500
} )

ACF_DefineEngineold( "VR6-17.2", {
	name = "VR6  17.2L Petrol",
	desc = "[ACFE] Massive VR6 monster, perfect for nothing.",
	model = "models/engines/vr6b.mdl",
	sound = "acf_engines/vrl.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericDiesel",
	weight = 850,
	torque = 1025,
	flywheelmass = 2.5,
	idlerpm = 750,
	peakminrpm = 2100,
	peakmaxrpm = 3900,
	limitrpm = 4100
} )

