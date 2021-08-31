if ACF.Version then --fallback to old acf, its not set in acf3

	function ACF_DefineFuelTankSizeold(id,data)
		ACF_DefineFuelTankSize(id,data)
	end

else
local class = "zACFE BATT"
local typeoverwrite = nil
-- Flat 2 engines
	ACF.RegisterFuelTankClass(class, {
		Name		= "ACFE Batteries",
		Description	= "Random battery models",
	})

	do

		function ACF_DefineFuelTankSizeold(id,data)
			ACF.RegisterFuelTank(id,class, {
				Name		= data.name,
				Description	= data.desc,
				Model		= data.model,
				SurfaceArea	= data.dims.S,
				Volume		= data.dims.V,
			})
		end
		
	end
end



ACF_DefineFuelTankSizeold( "Battery_1x1x2", {
	name = "1x1x2 Battery",
	desc = "Will keep a kart running all day.",
	model = "models/fueltank/battery16t.mdl",
	dims = { S = 1574, V = 2383.1 }
} )

ACF_DefineFuelTankSizeold( "Battery_1x1x4", {
	name = "1x1x4 Battery",
	desc = "Dinghy",
	model = "models/fueltank/battery32t.mdl",
	dims = { S = 3240, V = 6960 }
} )


ACF_DefineFuelTankSizeold( "Battery_1x2x4", {
	name = "1x2x4 Battery",
	desc = "Outboard motor.",
	model = "models/fueltank/battery16s.mdl",
	dims = { S = 6980, V = 12920 }
} )

ACF_DefineFuelTankSizeold( "Battery_1x4x4", {
	name = "1x4x4 Battery",
	desc = "",
	model = "models/fueltank/battery32s.mdl",
	dims = { S = 12960, V = 22840 }
} )

ACF_DefineFuelTankSizeold( "Battery_1x8x2", {
	name = "1x8x2 Battery",
	desc = "",
	model = "models/fueltank/battery16mb.mdl",
	dims = { S = 12960, V = 22840 }
} )

ACF_DefineFuelTankSizeold( "Battery_1x8x4", {
	name = "1x8x4 Battery",
	desc = "",
	model = "models/fueltank/battery32mb.mdl",
	dims = { S = 19920, V = 40680 }
} )

ACF_DefineFuelTankSizeold( "Battery_2x4x1", {
	name = "2x4x1 Battery",
	desc = "",
	model = "models/fueltank/battery16m.mdl",
	dims = { S = 6980, V = 14920 }
} )

ACF_DefineFuelTankSizeold( "Battery_2x4x2", {
	name = "2x4x2 Battery",
	desc = "Mini Cooper.",
	model = "models/fueltank/battery32m.mdl",
	dims = { S = 12840, V = 25840 }
} )

ACF_DefineFuelTankSizeold( "Battery_2x8x2", {
	name = "1x8x2 Battery",
	desc = "",
	model = "models/fueltank/battery16b.mdl",
	dims = { S = 22680, V = 40680 }
} )

ACF_DefineFuelTankSizeold( "Battery_2x8x4", {
	name = "2x8x4 Battery",
	desc = "",
	model = "models/fueltank/battery32b.mdl",
	dims = { S = 25600, V = 64000 }
} )

ACF_DefineFuelTankSizeold( "Battery_1x8x4", {
	name = "1x8x4 Battery",
	desc = "",
	model = "models/fueltank/battery16h.mdl",
	dims = { S = 25680, V = 44680 }
} )

ACF_DefineFuelTankSizeold( "Battery_2x8x8", {
	name = "2x8x8 Battery",
	desc = "",
	model = "models/fueltank/battery32h.mdl",
	dims = { S = 84000, V = 140200 }
} )
