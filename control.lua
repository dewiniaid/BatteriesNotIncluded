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

    return remote.call("QuickItemSwap", "apply_patch", {
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
        }
    })
end

local function on_init()
    qis_register_events()
    qis_apply_patch()
end

local function on_load()
    qis_register_events()
end



script.on_init(on_init)
script.on_configuration_changed(on_init)
script.on_load(on_load)