local World = {}
local World_mt = { __index = World }	-- metatable

function World.new()	-- constructor

    local newWorld = { }
    local worldTable = loadjson(".\\tables\\world.JSON")
    newWorld.atmosphere=choice(worldTable["atmosphere"])
    newWorld.temperature=choice(worldTable["temperature"])
    newWorld.biosphere=choice(worldTable["biosphere"])
    newWorld.population=choice(worldTable["population"])
    newWorld.tech_level=choice(worldTable["tech_level"])
    logger("Atmosphere: "..newWorld.atmosphere)
    logger("Temperature: "..newWorld.temperature)
    logger("Biosphere: "..newWorld.biosphere)
    logger("Population: "..newWorld.population)
    logger("Tech Level: "..newWorld.tech_level)

    newWorld.tags = {}
    for i=1,math.random(1,3) do
        table.insert(newWorld.tags,choice(worldTable["tags"]))
    end
    return setmetatable( newWorld, World_mt )
end

return World