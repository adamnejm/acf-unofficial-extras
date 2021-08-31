if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineEngineold(id,data)
		ACF_DefineEngine(id,data)
	end

else
local class = "zACFE PJ"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterEngineClass(class, {
		Name = "ACFE Pulsejets",
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
--Pulsejets 

ACF_DefineEngineold( "Pulsejet-Small", {
	name = "Pulsejet, Small, Transaxial",
	desc = "[ACFE] A small Pulsejet\n\nPulsejets deliver thrust and noise. lil' screamer.",
	model = "models/engines/pulsejets.mdl",
	sound = "acf_engines/pulsejetsmall.wav",
	category = "Pulsejet",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 100,
	torque = 100,
	flywheelmass = 0.001,
	idlerpm = 100,
	peakminrpm = 1,
	peakmaxrpm = 1,
	limitrpm = 50000,
	iselec = false,
	istrans = false,
	elecpower = 110,
	flywheeloverride = 1
} )

ACF_DefineEngineold( "Pulsejet-Medium", {
	name = "Pulsejet, Medium, Transaxial",
	desc = "[ACFE] A small Pulsejet\n\nPulsejets deliver thrust and noise. german V-1 approved.",
	model = "models/engines/pulsejetm.mdl",
	sound = "acf_engines/pulsejetmedium.wav",
	category = "Pulsejet",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 200,
	torque = 200,
	flywheelmass = 0.001,
	idlerpm = 100,
	peakminrpm = 1,
	peakmaxrpm = 1,
	limitrpm = 50000,
	iselec = false,
	istrans = false,
	elecpower = 1,
	flywheeloverride = 1
} )

ACF_DefineEngineold( "Pulsejet-Large", {
	name = "Pulsejet, Large, Transaxial",
	desc = "[ACFE] A small Pulsejet\n\nPulsejets deliver thrust and a lot of noise. best way to wake up your neighbourhood.",
	model = "models/engines/pulsejetl.mdl",
	sound = "acf_engines/pulsejetlarge.wav",
	category = "Pulsejet",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 400,
	torque = 400,
	flywheelmass = 0.001,
	idlerpm = 100,
	peakminrpm = 1,
	peakmaxrpm = 1,
	limitrpm = 50000,
	iselec = false,
	istrans = false,
	elecpower = 1,
	flywheeloverride = 1
} )
