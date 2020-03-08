--special ones

--i4 1.9 diesel as requested by RadekSK

ACF_DefineEngine( "1.9-I4", {
	name = "1.9L I4 Diesel",
	desc = "Small and light diesel, for low power applications requiring a wide powerband",
	model = "models/engines/inline4s.mdl",
	sound = "acf_engines/i4_diesel2.wav",
	category = "I4",
	fuel = "Diesel",
	enginetype = "GenericDiesel",
	weight = 110,
	torque = 180,
	flywheelmass = 0.21,
	idlerpm = 630,
	peakminrpm = 950,
	peakmaxrpm = 2900,
	limitrpm = 4700
} )