
local old_execute_dig_cycle = digtron.execute_dig_cycle

digtron.execute_dig_cycle = function(...)
  -- enable protection cache just for the digging movement
  digtron_customizations.digging = true
  old_execute_dig_cycle(...)
  digtron_customizations.digging = false
end
