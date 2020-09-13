
digtron_customizations = {
  -- true if a digtron is digging
  digging = false
}

local MP = minetest.get_modpath("digtron_customizations")

dofile(MP.."/memoize.lua")
dofile(MP.."/is_protected.lua")
dofile(MP.."/overrides.lua")
dofile(MP.."/item_ejector_drop_on_error.lua")
