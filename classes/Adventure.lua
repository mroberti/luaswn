Adventure = class("Adventure")

function Adventure:init(data)
    local adventureTable = loadjson(".\\tables\\adventure.JSON")
    self.adventure=choice(adventureTable["seed"])
    logger(self.adventure)
end

function Adventure:Serialize()
    return self.adventure
end
--= Return Factory
return Adventure
