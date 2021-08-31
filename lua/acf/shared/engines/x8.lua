if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE X"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE X Engines",
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

ACF_DefineEngineold( "X8-3.2", {
	name = "X8 3.2L Petrol",
	desc = "[ACFE] A tiny, old worn-out X8 engine.",
	model = "models/engines/x8s.mdl",
	sound = "acf_engines/r7_petrolsmall.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 179,
	torque = 310,
	flywheelmass = 0.10,
	idlerpm = 710,
	peakminrpm = 2600,
	peakmaxrpm = 4500,
	limitrpm = 4900
} )

ACF_DefineEngineold( "X8-12.4", {
	name = "X8 12.4L Petrol",
	desc = "[ACFE] Mid range X8 engine, thirsty and smooth",
	model = "models/engines/x8m.mdl",
	sound = "acf_engines/r7_petrolmedium.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 520,
	torque = 720,
	flywheelmass = 0.45,
	idlerpm = 680,
	peakminrpm = 2200,
	peakmaxrpm = 3600,
	limitrpm = 3900
} )

ACF_DefineEngineold( "X8-25.6", {
	name = "X8 25.6L Petrol",
	desc = "[ACFE] Massive X8 monster, perfect for a vibrator.",
	model = "models/engines/x8b.mdl",
	sound = "acf_engines/r7_petrollarge.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 1500,
	torque = 2025,
	flywheelmass = 2,
	idlerpm = 650,
	peakminrpm = 2100,
	peakmaxrpm = 3200,
	limitrpm = 3800
} )