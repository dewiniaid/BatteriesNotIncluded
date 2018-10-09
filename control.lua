config = require "config"

local function qis_register_events()
    if not remote.interfaces['QuickItemSwap'] then
        return
    end
    local events = remote.call('QuickItemSwap', 'get_events')

    script.on_event(events.on_qis_mappings_reset, qis_apply_patch)
end

local function qis_apply_patch()
    if not remote.interfaces['QuickItemSwap'] then
        return
    end

    return remote.call("QuickItemSwap", "apply_patch", "BatteriesNotIncluded", {
        categories = {
            trains = {
                groups = {
                    trains = {
                        default_order = 100,
                        items = {
                            [config.PREFIX .. "electric-locomotive"] = { order = 150 }
                        }
                    }
                }
            }
        },
    })
end

local function on_init()
--    qis_register_events()
--    qis_apply_patch()
end

local function on_load()
--    qis_register_events()
end

script.on_init(on_init)
script.on_configuration_changed(on_init)
script.on_load(on_load)

-- Register events.
local function has_recoverable_battery(entity)
    local burner  = entity.burner
    return (
        burner and -- Has a burner
        burner.currently_burning and -- Is currently burning fuel
        burner.currently_burning.fuel_category == 'stored-electricity' and -- Is our fuel type
        burner.currently_burning.burnt_result  -- Has a burnt result?
    )
end

local function recover_battery(event)
    if has_recoverable_battery(event.entity) then
        event.buffer.insert({name=event.entity.burner.currently_burning.burnt_result.name, count=1})
    end
end

local function pre_recover_battery(event)
    if has_recoverable_battery(event.entity) then
        event.entity.burner.burnt_result_inventory.insert({name=event.entity.burner.currently_burning.burnt_result.name, count=1})
        event.entity.burner.currently_burning = nil
    end
end




script.on_event(defines.events.on_player_mined_entity, recover_battery)
script.on_event(defines.events.on_robot_mined_entity, recover_battery)
--script.on_event(defines.events.on_pre_player_mined_item, pre_recover_battery)
--script.on_event(defines.events.on_robot_pre_mined, pre_recover_battery)
-- game.print("Done with control.lua")
