local World = {}
local World_mt = { __index = World }	-- metatable

function World.new()	-- constructor

    local newWorld = { }
    local worldTable = loadjson("tables/world.json")
    newWorld.atmosphere=choice(worldTable["atmosphere"])
    newWorld.temperature=choice(worldTable["temperature"])
    newWorld.biosphere=choice(worldTable["biosphere"])
    newWorld.population=choice(worldTable["population"])
    newWorld.tech_level=choice(worldTable["tech_level"])
    print("Atmosphere: "..newWorld.atmosphere)
    print("Temperature: "..newWorld.temperature)
    print("Biosphere: "..newWorld.biosphere)
    print("Population: "..newWorld.population)
    print("Tech Level: "..newWorld.tech_level)

    newWorld.tags = {}
    for i=1,RAND(1,3) do
        table.insert(newWorld.tags,choice(worldTable["tags"]))
    end
    return setmetatable( newWorld, World_mt )
end

return World