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

ACF_DefineEngineold( "VR8-5.7", {
	name = "VR8 5.7L Petrol",
	desc = "[ACFE] Car sized petrol engine, good power and mid range torque",
	model = "models/engines/vr8s.mdl",
	sound = "acf_engines/vrs.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 260,
	torque = 320,
	flywheelmass = 0.15,
	idlerpm = 800,
	peakminrpm = 3000,
	peakmaxrpm = 5000,
	limitrpm = 6500
} )

ACF_DefineEngineold( "VR8-9.0", {
	name = "VR8 9.0L Petrol",
	desc = "[ACFE] Thirsty, giant VR8, for medium applications",
	model = "models/engines/vr8m.mdl",
	sound = "acf_engines/vrm.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 400,
	torque = 460,
	flywheelmass = 0.25,
	idlerpm = 700,
	peakminrpm = 3100,
	peakmaxrpm = 5000,
	limitrpm = 5500
} )

ACF_DefineEngineold( "VR8-18.0", {
	name = "VR8 18.0L Petrol",
	desc = "[ACFE] American gasoline tank VR8, good overall power and torque and fairly lightweight",
	model = "models/engines/vr8b.mdl",
	sound = "acf_engines/vrl.wav",
	category = "VR",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 850,
	torque = 1458,
	flywheelmass = 2.8,
	idlerpm = 600,
	peakminrpm = 2000,
	peakmaxrpm = 3300,
	limitrpm = 3800
} )