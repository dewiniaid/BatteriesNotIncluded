--local config = require "config"

local function make_charging_station(args)
    local name = args.name
    local prefixed = config.PREFIX .. name
    local crafting_speed = args.crafting_speed or 1
    local efficiency = args.efficiency or 1.0
    local energy_usage = args.energy_usage or (((config.BASE_CHARGING_KW * crafting_speed) / efficiency) .. "kW")
    local ingredients = args.ingredients
    args.speed = nil
    args.efficiency = nil
    args.energy_usage = nil
    args.ingredients = nil

    local entity = {
        type = "furnace",
        name = prefixed,
        icon = config.BASEDIR .. "/graphics/icons/" .. name .. ".png",
        icon_size = 32,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 1, result = prefixed },
        max_health = 150,
        corpse = "medium-remnants",
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        selection_box = { { -1, -1 }, { 1, 1 } },
        dying_explosion = "medium-explosion",
        -- light = { intensity = 0.3, size = 7 },
        --        module_specification =
        --    {
        --      module_slots = 2,
        --      module_info_icon_shift = {0, 0.8}
        --    },
        --    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        crafting_categories = { "electric-charging" },
        result_inventory_size = 1,
        crafting_speed = crafting_speed,
        energy_usage = energy_usage,
        source_inventory_size = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            -- emissions = 0.005   -- FIXME: What should this be?
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound = {
            sound = {
                filename = "__base__/sound/accumulator-working.ogg",
                volume = 1
            },
            idle_sound = {
                filename = "__base__/sound/accumulator-idle.ogg",
                volume = 0.4
            },
            max_sounds_per_type = 5
        },
        working_visualisations =
        {
            {
                animation = {
                    -- May need layers = {...}
                    filename = config.BASEDIR .. "/graphics/entities/" .. name .. "-charge-animation.png",
                    width = 138,
                    height = 135,
                    line_length = 8,
                    frame_count = 24,
                    shift = { 0.46875, -0.640625 },
                    animation_speed = 0.5
                },
                light = { intensity = 0.3, size = 7, color = { r = 1.0, g = 1.0, b = 1.0 } },
            },
        },
        fast_replaceable_group = config.PREFIX .. "battery-charge-station",
        animation =
        {
            layers = {
                {
                    filename = config.BASEDIR .. "/graphics/entities/" .. name .. ".png",
                    priority = "high",
                    width = 124,
                    height = 103,
                    frame_count = 1,
                    shift = { 0.6875, -0.203125 }
                },
            }
        }
    }

    local item = {
        type = "item",
        name = entity.name,
        icon = entity.icon,
        flags = { "goes-to-quickbar" },
        subgroup = "production-machine",
        order = "x[" .. name .. "]",
        place_result = entity.name,
        stack_size = 50,
        icon_size = 32,
    }

    local recipe = {
        type = "recipe",
        name = item.name,
        enabled = false,
        --        energy = 10,
        ingredients = ingredients,
        energy = energy,
        result = entity.name,
        category = "crafting",
        icon_size = 32,
        --        category = "advanced-crafting",
    }

    return { entity, item, recipe }
end


data:extend(make_charging_station {
    name = "charging-station",
    ingredients = {
        { "accumulator", 1 },
        { "copper-cable", 30 },
        { "electronic-circuit", 10 },
        { "advanced-circuit", 5 }
    }
})


data:extend(make_charging_station {
    name = "rapid-charging-station",
    crafting_speed = 2,
    ingredients = {
        { config.PREFIX .. "charging-station", 1 },
        { "advanced-circuit", 20, },
        { "processing-unit", 20 },
    }
})
