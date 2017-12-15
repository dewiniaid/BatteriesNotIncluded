--local config = require "config"

local green_science = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, }
local blue_science = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, }

data:extend({
    {
        type = "technology",
        name = config.PREFIX .. "battery-pack",
        icon = config.BASEDIR .. "/graphics/icons/battery-pack.png",
        icon_size = 32,
        effects = {
            { type = "unlock-recipe", recipe = config.PREFIX .. "battery-pack-empty", },
            { type = "unlock-recipe", recipe = config.PREFIX .. "battery-pack-recharge", },
            { type = "unlock-recipe", recipe = config.PREFIX .. "charging-station", },
        },
        prerequisites = { "electric-energy-accumulators-1", "advanced-electronics", "electric-energy-distribution-1" },
        unit = {
            count = 200,
            ingredients = green_science,
            time = 20,
        },
        order = "e",
    },
    {
        type = "technology",
        name = config.PREFIX .. "electric-locomotive",
        icon = config.BASEDIR .. "/graphics/icons/electric-locomotive.png",
        icon_size = 32,
        effects = {
            { type = "unlock-recipe", recipe = config.PREFIX .. "electric-locomotive", },
        },
        prerequisites = { config.PREFIX .. "battery-pack", "railway" },
        unit = {
            count = 200,
            ingredients = green_science,
            time = 20,
        },
        order = "e-a",
    },
    {
        type = "technology",
        name = config.PREFIX .. "high-performance-battery-pack",
        icon = config.BASEDIR .. "/graphics/icons/battery-pack-2.png",
        icon_size = 32,
        effects = {
            { type = "unlock-recipe", recipe = config.PREFIX .. "battery-pack-2", },
            { type = "unlock-recipe", recipe = config.PREFIX .. "battery-pack-2-recharge", },
        },
        prerequisites = { config.PREFIX .. "battery-pack", "advanced-electronics-2", "electric-energy-distribution-2" },
        unit = {
            count = 300,
            ingredients = blue_science,
            time = 30,
        },
        order = "e-b",
    },
    {
        type = "technology",
        name = config.PREFIX .. "rapid-charging",
        icon = config.BASEDIR .. "/graphics/icons/rapid-charging-station.png",
        icon_size = 32,
        effects = {
            { type = "unlock-recipe", recipe = config.PREFIX .. "rapid-charging-station", },
        },
        prerequisites = { config.PREFIX .. "battery-pack", "advanced-electronics-2" },
        unit = {
            count = 300,
            ingredients = blue_science,
            time = 40,
        },
        order = "e-c",
    },

})
