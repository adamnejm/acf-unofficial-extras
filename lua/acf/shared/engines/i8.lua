if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE I"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE Inline Engines",
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
-- Inline 8 engines

-- Petrol

ACF_DefineEngineold( "3.4-I8", {
	name = "3.4L I8 Petrol",
	desc = "[ACFE] Inline 8 small yo",
	model = "models/engines/i8sml.mdl",
	sound = "acf_engines/i12s.wav",
	category = "I8",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 160,
	torque = 170,
	flywheelmass = 0.2,
	idlerpm = 1000,
	peakminrpm = 3750,
	peakmaxrpm = 5250,
	limitrpm = 6000
} )

ACF_DefineEngineold( "5.6-I8", {
	name = "5.6L I8 Petrol",
	desc = "[ACFE] Inline 8 Medium yo",
	model = "models/engines/i8med.mdl",
	sound = "acf_engines/i12m.wav",
	category = "I8",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 300,
	torque = 250,
	flywheelmass = 0.35,
	idlerpm = 800,
	peakminrpm = 3250,
	peakmaxrpm = 4950,
	limitrpm = 5800
} )

ACF_DefineEngineold( "9.0-I8", {
	name = "9.0L I8 Petrol",
	desc = "[ACFE] Inline 8 large yo",
	model = "models/engines/i8lrg.mdl",
	sound = "acf_engines/i12l.wav",
	category = "I8",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 650,
	torque = 480,
	flywheelmass = 0.7,
	idlerpm = 700,
	peakminrpm = 3000,
	peakmaxrpm = 4550,
	limitrpm = 5250
} )



-- Diesel

ACF_DefineEngineold( "4.0-I8", {
	name = "4.0L I8 Diesel",
	desc = "[ACFE] Inline 8 small in diesel",
	model = "models/engines/i8sml.mdl",
	sound = "acf_engines/l6_dieselsmall.wav",
	category = "I8",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 200,
	torque = 220,
	flywheelmass = 0.4,
	idlerpm = 650,
	peakminrpm = 1800,
	peakmaxrpm = 3800,
	limitrpm = 4000
} )

ACF_DefineEngineold( "6.0-I8", {
	name = "6.0L I8 Diesel",
	desc = "[ACFE] Inline 8 medium in diesel",
	model = "models/engines/i8med.mdl",
	sound = "acf_engines/l6_dieselmedium4.wav",
	category = "I8",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 400,
	torque = 300,
	flywheelmass = 0.5,
	idlerpm = 500,
	peakminrpm = 1450,
	peakmaxrpm = 3100,
	limitrpm = 3400
} )

ACF_DefineEngineold( "11.0-I8", {
	name = "11.0L I8 Diesel",
	desc = "[ACFE] Inline 8 Large in diesel",
	model = "models/engines/i8lrg.mdl",
	sound = "acf_engines/l6_diesellarge2.wav",
	category = "I8",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 1800,
	torque = 3600,
	flywheelmass = 8,
	idlerpm = 350,
	peakminrpm = 1200,
	peakmaxrpm = 1900,
	limitrpm = 2100
} )

