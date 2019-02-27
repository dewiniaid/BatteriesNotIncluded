require "util"

--local config = require "../config"

local locomotive = table.deepcopy(data.raw.locomotive.locomotive)
locomotive.name = config.PREFIX .. "electric-locomotive"
locomotive.reversing_power_modifier = 1.0 -- Electric engines don't care
locomotive.burner.fuel_category = "stored-electricity"
locomotive.burner.fuel_inventory_size = 2
locomotive.burner.burnt_inventory_size = 2
locomotive.burner.smoke = nil
locomotive.color = { r = 0.333, g = 0.733, b = 1.00, a = 0.5 }
locomotive.minable.result = locomotive.name
locomotive.working_sound = {
    sound = {
        filename = config.BASEDIR .. "/sounds/electric-locomotive.ogg",
        volume = 0.4,
    },
    match_speed_to_activity = true,
}
data:extend({
    locomotive,

    {
        type = "item-with-entity-data",
        name = locomotive.name,
        icon = config.BASEDIR .. "/graphics/icons/electric-locomotive.png",
        icon_size = 32,
        subgroup = "transport",
        order = "a[train-system]-f[electric-locomotive]",
        place_result = config.PREFIX .. "electric-locomotive",
        stack_size = 5,
    },

    {
        type = "recipe",
        icon = config.BASEDIR .. "/graphics/icons/electric-locomotive.png",
        icon_size = 32,
        name = locomotive.name,
        energy = 10,
        ingredients = {
            { "electric-engine-unit", 20 },
            { "electronic-circuit", 10 },
            { "steel-plate", 30 },
            { "accumulator", 1 },
        },
        result = locomotive.name,
        enabled = false,
    },
})
