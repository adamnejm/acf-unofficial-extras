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

ACF_DefineEngineold( "14.0-V6-D", {
	name = "14.0L V6 Diesel",
	desc = "[ACFE]  This is what you get if you teach a redneck a little engineeeing, give him diesel fuel ,injectors ,a saw and a tank v12.",
	model = "models/engines/v6large.mdl",
	sound = "acf_engines/v6_diesellarge.wav",
	category = "V6",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 950,
	torque = 1800,
	flywheelmass = 5,
	idlerpm = 550,
	peakminrpm = 800,
	peakmaxrpm = 2400,
	limitrpm = 2850
} )

ACF_DefineEngineold( "7.8-V6-D", {
	name = "7.8L V6 Diesel",
	desc = "[ACFE]  This is what you get if you teach a redneck a little engineeeing, give him diesel fuel ,injectors ,a saw and a tank v12.",
	model = "models/engines/v6med.mdl",
	sound = "acf_engines/v8_dieselmedium2.wav",
	category = "V6",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 650,
	torque = 900,
	flywheelmass = 4,
	idlerpm = 650,
	peakminrpm = 1000,
	peakmaxrpm = 3000,
	limitrpm = 3250
} )

ACF_DefineEngineold( "3.0-V6-D", {
	name = "3L V6 Diesel",
	desc = "[ACFE]  This is what you get if you teach a redneck a little engineeeing, give him diesel fuel ,injectors ,a saw and a tank v12.",
	model = "models/engines/v6small.mdl",
	sound = "acf_engines/v8_dieselsmall.wav",
	category = "V6",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 300,
	torque = 500,
	flywheelmass = 3,
	idlerpm = 800,
	peakminrpm = 1100,
	peakmaxrpm = 3300,
	limitrpm = 3500
} )
