
--Pulsejets 

ACF_DefineEngine( "Pulsejet-Small", {
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

ACF_DefineEngine( "Pulsejet-Medium", {
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

ACF_DefineEngine( "Pulsejet-Large", {
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
