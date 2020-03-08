
-- Inline 2 engines

-- Petrol


ACF_DefineEngine( "2.6-I2", {
	name = "2.6L I2 Petrol",
	desc = "[ACFE] Short block engine for light utility use",
	model = "models/engines/inline2m.mdl",
	sound = "acf_engines/i4_petrolmedium2.wav",
	category = "I2",
	fuel = "Petrol",
	enginetype = "GenericPetrol",
	weight = 110,
	torque = 165,
	flywheelmass = 0.2,
	idlerpm = 1000,
	peakminrpm = 600,
	peakmaxrpm = 2200,
	limitrpm = 2650
} )


-- Diesel

ACF_DefineEngine( "0.7-I2", {
	name = "0.7L I2 Diesel",
	desc = "[ACFE] ATV grade 2-banger, enormous rev band but a choppy idle, great for light utility work",
	model = "models/engines/inline2s.mdl",
	sound = "acf_engines/i4_diesel2.wav",
	category = "I2",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 45,
	torque = 130,
	flywheelmass = 0.2,
	idlerpm = 650,
	peakminrpm = 900,
	peakmaxrpm = 2600,
	limitrpm = 3100
} )

ACF_DefineEngine( "1.8-I2", {
	name = "1.8L I2 Diesel",
	desc = "[ACFE] Medium utility grade I2 diesel, for tractors",
	model = "models/engines/inline2m.mdl",
	sound = "acf_engines/i4_dieselmedium.wav",
	category = "I2",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 150,
	torque = 230,
	flywheelmass = 1,
	idlerpm = 700,
	peakminrpm = 1300,
	peakmaxrpm = 3700,
	limitrpm = 3900
} )

ACF_DefineEngine( "7.3-I2", {
	name = "7.3L I2 Diesel",
	desc = "[ACFE] Light tank duty engine, compact yet grunts hard",
	model = "models/engines/inline2b.mdl",
	sound = "acf_engines/i4_diesellarge.wav",
	category = "I2",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 450,
	torque = 900,
	flywheelmass = 5,
	idlerpm = 650,
	peakminrpm = 750,
	peakmaxrpm = 1900,
	limitrpm = 2100
} )