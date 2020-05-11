
globals = {
	"digtron_customizations",
	"digtron",
	"minetest"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump",

	-- deps
	"protector",
	"areas",
	"monitoring"
}
