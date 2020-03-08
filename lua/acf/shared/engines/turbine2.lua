
-- Gas turbines

ACF_DefineEngine( "Turbine-Small-Trans-Fuelless", {
	name = "Gas Turbine, Small, Transaxial, No Fuel",
	desc = "[ACFE] A small gas turbine, high power and a very wide powerband\n\nTurbines are powerful but suffer from poor throttle response.  Outputs to the side instead of rear. Doesnt requite fuel.",
	model = "models/engines/turbine_s.mdl",
	sound = "acf_engines/turbine_small.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 160,
	torque = 440,
	flywheelmass = 2.3,
	idlerpm = 1400,
	peakminrpm = 1000,
	peakmaxrpm = 1500,
	limitrpm = 10000,
	iselec = true,
	istrans = true,
	flywheeloverride = 4167
} )

ACF_DefineEngine( "Turbine-Medium-Trans-Fuelless", {
	name = "Gas Turbine, Medium, Transaxial, No Fuel",
	desc = "[ACFE] A medium gas turbine, moderate power but a very wide powerband\n\nTurbines are powerful but suffer from poor throttle response.  Outputs to the side instead of rear. Doesnt requite fuel.",
	model = "models/engines/turbine_m.mdl",
	sound = "acf_engines/turbine_medium.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 320,
	torque = 650,
	flywheelmass = 3.4,
	idlerpm = 1800,
	peakminrpm = 1200,
	peakmaxrpm = 1800,
	limitrpm = 12000,
	iselec = true,
	istrans = true,
	flywheeloverride = 5000
} )

ACF_DefineEngine( "Turbine-Large-Trans-Fuelless", {
	name = "Gas Turbine, Large, Transaxial, No Fuel",
	desc = "[ACFE] A large gas turbine, powerful with a wide powerband\n\nTurbines are powerful but suffer from poor throttle response.  Outputs to the side instead of rear. Doesnt requite fuel.",
	model = "models/engines/turbine_l.mdl",
	sound = "acf_engines/turbine_large.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 880,
	torque = 1592,
	flywheelmass = 8.4,
	idlerpm = 2000,
	peakminrpm = 1350,
	peakmaxrpm = 2025,
	limitrpm = 13500,
	iselec = true,
	istrans = true,
	flywheeloverride = 5625
} )

ACF_DefineEngine( "Turbine-Small-Fuelless", {
	name = "Gas Turbine, Small, No Fuel",
	desc = "[ACFE] A small gas turbine, high power and a very wide powerband\n\nTurbines are powerful but suffer from poor throttle response. Doesnt requite fuel.",
	model = "models/engines/gasturbine_s.mdl",
	sound = "acf_engines/turbine_small.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 200,
	torque = 550,
	flywheelmass = 2.9,
	idlerpm = 1400,
	peakminrpm = 1000,
	peakmaxrpm = 1500,
	limitrpm = 10000,
	iselec = true,
	flywheeloverride = 4167
} )

ACF_DefineEngine( "Turbine-Medium-Fuelless", {
	name = "Gas Turbine, Medium, No Fuel",
	desc = "[ACFE] A medium gas turbine, moderate power but a very wide powerband\n\nTurbines are powerful but suffer from poor throttle response. Doesnt requite fuel.",
	model = "models/engines/gasturbine_m.mdl",
	sound = "acf_engines/turbine_medium.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 400,
	torque = 813,
	flywheelmass = 4.3,
	idlerpm = 1800,
	peakminrpm = 1200,
	peakmaxrpm = 1800,
	limitrpm = 12000,
	iselec = true,
	flywheeloverride = 5000
} )

ACF_DefineEngine( "Turbine-Large-Fuelless", {
	name = "Gas Turbine, Large, No Fuel",
	desc = "[ACFE] A large gas turbine, powerful with a wide powerband\n\nTurbines are powerful but suffer from poor throttle response. Doesnt requite fuel.",
	model = "models/engines/gasturbine_l.mdl",
	sound = "acf_engines/turbine_large.wav",
	category = "Turbine",
	fuel = "Multifuel",
	enginetype = "Turbine",
	weight = 1100,
	torque = 1990,
	flywheelmass = 10.5,
	idlerpm = 2000,
	peakminrpm = 1350,
	peakmaxrpm = 2025,
	limitrpm = 13500,
	iselec = true,
	flywheeloverride = 5625
} )
