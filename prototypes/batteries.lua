--local config = require "config"
local make_battery_pack = function(args)
    -- Time for charging is assuming a base charging station (speed=1) of 500 kw
    -- So, 30 MJ / 500 kW = 60 seconds.

    local name = args.name
    local prefixed = config.PREFIX .. name
    local mj = args.mj
    local ingredients = args.ingredients

    args.name = nil
    args.mj = nil
    args.ingredients = nil

    local empty = {
        type = "item",
        name = prefixed .. "-empty",
        icon = config.BASEDIR .. "/graphics/icons/" .. name .. "-empty.png",
        icon_size = 32,
        flags = { "goes-to-main-inventory" },
        subgroup = "intermediate-product",
        order = "j[battery]-a[" .. name .. "-empty]",
        stack_size = args.stack_size or 10,
    }

    local full = {
        type = "item",
        name = prefixed,
        icon = config.BASEDIR .. "/graphics/icons/" .. name .. ".png",
        icon_size = 32,
        flags = { "goes-to-main-inventory" },
        fuel_category = "stored-electricity",
        subgroup = "intermediate-product",
        order = "j[battery]-a[" .. name .. "]",
        stack_size = empty.stack_size,
        burnt_result = empty.name,
        fuel_value = mj .. "MJ",
        fuel_acceleration_multiplier = 1.0,
        fuel_top_speed_multiplier = 1.0,
    }

    for k, v in pairs(args) do
        full[k] = v
    end

    local recharge = {
        type = "recipe",
        name = full.name .. "-recharge",
        enabled = false,
        energy_required = mj * config.CHARGE_TIME_MULTIPLIER,
        ingredients = { { empty.name, 1 } },
        result = full.name,
        category = "electric-charging",
        icon_size = 32,
    }

    return empty, full, recharge
end

local empty, full, recharge
empty, full, recharge = make_battery_pack {
    name = "battery-pack",
    mj = 20,
    fuel_acceleration_multiplier = 1.6,
    fuel_top_speed_multiplier = 1.1,
}

data:extend{
    empty, full, recharge,
    {
        type = "recipe",
        name = empty.name,
        enabled = false,
        result = empty.name,
        category = "crafting",
        energy_required = 10,
        ingredients = {
            { "battery", 5 },
            { "plastic-bar", 2 },
            { "advanced-circuit", 2 },
        },
        icon_size = 32,
    }
}

empty, full, recharge = make_battery_pack{
    name = "battery-pack-2",
    mj = 75,
    fuel_acceleration_multiplier = 2.0,
    fuel_top_speed_multiplier = 1.25,
}

data:extend{
    empty, full, recharge,
    {
        type = "recipe",
        name = full.name,
        enabled = false,
        result = full.name,
        category = "crafting",
        energy_required = 10,
        ingredients = {
            { config.PREFIX .. "battery-pack", 5 },
            { "processing-unit", 5 },
            { "advanced-circuit", 5 },
        },
        icon_size = 32,
    }
}
