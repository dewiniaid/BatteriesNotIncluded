config = {}

-- The wattage of a nominal speed=1 battery charging station.  Used to calculate time
-- requirements for recharging recipes.
config.BASE_CHARGING_KW = 500

-- Charge time multiplier based on the above.
config.CHARGE_TIME_MULTIPLIER = (1000 / config.BASE_CHARGING_KW) -- Because we're going from mega-(joules) to kilo-(watts)

-- Mod prefix and base dir
config.BASEDIR = '__BatteriesNotIncluded__'
config.PREFIX = 'bni_'

return config
