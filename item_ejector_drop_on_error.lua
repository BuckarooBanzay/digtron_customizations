
local node_def = minetest.registered_nodes["digtron:inventory_ejector"]
local old_on_punch = node_def.on_punch

assert(node_def)
assert(old_on_punch)

minetest.override_item("digtron:inventory_ejector", {
  on_punch = function(pos, node, player)
    local ok = pcall(function()
      old_on_punch(pos, node, player)
    end)

    if not ok then
      minetest.log("warning", "[digtron_customizations] inventory_ejector failed at " .. minetest.pos_to_string(pos))
    end
  end
})
