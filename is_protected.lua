local has_monitoring_mod = minetest.get_modpath("monitoring")

local hit_count, miss_count

if has_monitoring_mod then
  hit_count = monitoring.counter("digtron_customizations_memoize_hit", "Memoizer cache hits")
  miss_count = monitoring.counter("digtron_customizations_memoize_miss", "Memoizer cache misses")
end


local old_is_protected = minetest.is_protected

minetest.is_protected = function(pos, name)
  if not digtron_customizations.digging then
    -- skip memoization check entirely
    return old_is_protected(pos, name)
  end

  local result, is_cached = digtron_customizations.is_protected(pos, name)

  -- cached
  if is_cached then
    if has_monitoring_mod then
      hit_count.inc()
    end

    return result
  end

  -- uncached
  result = old_is_protected(pos, name)
  digtron_customizations.cache(pos, name, result)

  if has_monitoring_mod then
    miss_count.inc()
  end

  return result
end

-- total cache reset
local function reset_cache()
  digtron_customizations.invalidate_all()
  minetest.after(30, reset_cache)
end

-- periodically reset protection cache
minetest.after(30, reset_cache)
