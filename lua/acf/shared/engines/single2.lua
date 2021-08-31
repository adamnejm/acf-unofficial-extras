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


-- Single-cylinder engines
ACF_DefineEngineold( "0.125-I1.2", {
	name = "125cc Single",
	desc = "[ACFE] Very Tiny RC engine",
	model = "models/engines/1cyltiny.mdl",
	sound = "acf_engines/i1_small.wav",
	category = "Single",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 7,
	torque = 11,
	flywheelmass = 0.003,
	idlerpm = 2200,
	peakminrpm = 5000,
	peakmaxrpm = 7500,
	limitrpm = 8500
} )

ACF_DefineEngineold( "0.25-I1.2", {
	name = "250cc Single 2",
	desc = "[ACFE] Tiny bike engine",
	model = "models/engines/1cyls.mdl",
	sound = "acf_engines/i1_small.wav",
	category = "Single",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 15,
	torque = 20,
	flywheelmass = 0.005,
	idlerpm = 1200,
	peakminrpm = 4000,
	peakmaxrpm = 6500,
	limitrpm = 7500
} )

ACF_DefineEngineold( "0.5-I1.2", {
	name = "500cc Single 2",
	desc = "[ACFE] Large single cylinder bike engine",
	model = "models/engines/1cylm.mdl",
	sound = "acf_engines/i1_medium.wav",
	category = "Single",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 20,
	torque = 40,
	flywheelmass = 0.005,
	idlerpm = 900,
	peakminrpm = 4300,
	peakmaxrpm = 7000,
	limitrpm = 8000
} )

ACF_DefineEngineold( "1.3-I1.2", {
	name = "1300cc Single 2",
	desc = "[ACFE] Ridiculously large single cylinder engine, seriously what the fuck",
	model = "models/engines/1cylb.mdl",
	sound = "acf_engines/i1_large.wav",
	category = "Single",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 50,
	torque = 90,
	flywheelmass = 0.1,
	idlerpm = 600,
	peakminrpm = 3600,
	peakmaxrpm = 6000,
	limitrpm = 6700
} )


--diesel


ACF_DefineEngineold( "0.3-I1D", {
	name = "300cc Diesel Single",
	desc = "[ACFE] Single Cylinder Diesel Engine",
	model = "models/engines/1cylsml.mdl",
	sound = "acf_engines/singlediesels.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 25,
	torque = 40,
	flywheelmass = 0.015,
	idlerpm = 550,
	peakminrpm = 3000,
	peakmaxrpm = 4500,
	limitrpm = 5000
} )

ACF_DefineEngineold( "0.5-I1D", {
	name = "500cc Diesel Single",
	desc = "[ACFE] Large single cylinder diesel engine",
	model = "models/engines/1cylmed.mdl",
	sound = "acf_engines/singledieselm.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 20,
	torque = 40,
	flywheelmass = 0.055,
	idlerpm = 450,
	peakminrpm = 2000,
	peakmaxrpm = 3800,
	limitrpm = 4300
} )

ACF_DefineEngineold( "1.3-I1D", {
	name = "1300cc Diesel Single",
	desc = "[ACFE] Larger single cylinder diesel engine, wubwubwubwubwub",
	model = "models/engines/1cylbig.mdl",
	sound = "acf_engines/singlediesell.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 50,
	torque = 90,
	flywheelmass = 0.2,
	idlerpm = 350,
	peakminrpm = 1200,
	peakmaxrpm = 2600,
	limitrpm = 3500
} )


ACF_DefineEngineold( "0.3-I1D2", {
	name = "300cc Diesel Single 2",
	desc = "[ACFE] Single Cylinder Diesel Engine",
	model = "models/engines/1cyls.mdl",
	sound = "acf_engines/singlediesels.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 25,
	torque = 40,
	flywheelmass = 0.015,
	idlerpm = 550,
	peakminrpm = 3000,
	peakmaxrpm = 4500,
	limitrpm = 5000
} )

ACF_DefineEngineold( "0.5-I1D2", {
	name = "500cc Diesel Single 2",
	desc = "[ACFE] Large single cylinder diesel engine",
	model = "models/engines/1cylm.mdl",
	sound = "acf_engines/singledieselm.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 20,
	torque = 40,
	flywheelmass = 0.055,
	idlerpm = 450,
	peakminrpm = 2000,
	peakmaxrpm = 3800,
	limitrpm = 4300
} )

ACF_DefineEngineold( "1.3-I1D2", {
	name = "1300cc Diesel Single 2",
	desc = "[ACFE] Larger single cylinder diesel engine, wubwubwubwubwub",
	model = "models/engines/1cylb.mdl",
	sound = "acf_engines/singlediesell.wav",
	category = "Single",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 50,
	torque = 90,
	flywheelmass = 0.2,
	idlerpm = 350,
	peakminrpm = 1200,
	peakmaxrpm = 2600,
	limitrpm = 3500
} )
