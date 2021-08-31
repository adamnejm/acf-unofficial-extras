if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE V"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE V Engines",
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
-- V-Twin Diesel engines

ACF_DefineEngineold( "0.8-V2", {
	name = "836cc V-Twin Diesel",
	desc = "[ACFE] Twin cylinder Diesel bike engine, torquey for its size",
	model = "models/engines/v-twins2.mdl",
	sound = "acf_engines/vtwindiesels.wav",
	category = "V-Twin",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 50,
	torque = 70,
	flywheelmass = 0.02,
	idlerpm = 600,
	peakminrpm = 3900,
	peakmaxrpm = 5500,
	limitrpm = 6000
} )

ACF_DefineEngineold( "1.6-V2", {
	name = "1600cc V-Twin Diesel",
	desc = "[ACFE] Large displacement vtwin diesel engine",
	model = "models/engines/v-twinm2.mdl",
	sound = "acf_engines/vtwindieselm.wav",
	category = "V-Twin",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 80,
	torque = 105,
	flywheelmass = 0.03,
	idlerpm = 625,
	peakminrpm = 2900,
	peakmaxrpm = 4500,
	limitrpm = 5250
} )

ACF_DefineEngineold( "3.2-V2", {
	name = "3100cc V-Twin Diesel",
	desc = "[ACFE] Huge fucking Vtwin DIESEL 'MURRICA FUCK YEAH FUCK GREENPEACE",
	model = "models/engines/v-twinl2.mdl",
	sound = "acf_engines/vtwindiesell.wav",
	category = "V-Twin",
	fuel = "Diesel",
	enginetype = "GenericPetrol",
	weight = 150,
	torque = 260,
	flywheelmass = 0.115,
	idlerpm = 350,
	peakminrpm = 2000,
	peakmaxrpm = 3500,
	limitrpm = 4000
} )
