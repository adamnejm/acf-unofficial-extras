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

ACF_DefineEngineold( "X12-4.8", {
	name = "X12 3.2L Petrol",
	desc = "[ACFE] A tiny, old worn-out X12 engine.",
	model = "models/engines/x12s.mdl",
	sound = "acf_engines/r7_petrolsmall.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 270,
	torque = 460,
	flywheelmass = 0.10,
	idlerpm = 710,
	peakminrpm = 2600,
	peakmaxrpm = 4500,
	limitrpm = 4900
} )

ACF_DefineEngineold( "X12-18.6", {
	name = "X12 18.6L Petrol",
	desc = "[ACFE] Mid range X12 engine, thirsty and smooth",
	model = "models/engines/x12m.mdl",
	sound = "acf_engines/r7_petrolmedium.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 770,
	torque = 1180,
	flywheelmass = 0.45,
	idlerpm = 680,
	peakminrpm = 2200,
	peakmaxrpm = 3600,
	limitrpm = 3900
} )

ACF_DefineEngineold( "X12-42.9", {
	name = "X12 42.9L Petrol",
	desc = "[ACFE] Massive X12 monster, perfect for a vibrator.",
	model = "models/engines/x12b.mdl",
	sound = "acf_engines/r7_petrollarge.wav",
	category = "X",
	fuel = "Petrol",
	enginetype = "Radial",
	weight = 2250,
	torque = 3000,
	flywheelmass = 2,
	idlerpm = 650,
	peakminrpm = 2100,
	peakmaxrpm = 3200,
	limitrpm = 3800
} )