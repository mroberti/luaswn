Adventure = class("Adventure")

function Adventure:init(data)
    local adventureTable = loadjson("tables/adventure.json")
    self.adventure=choice(adventureTable["seed"])
    if(debug)then
	    print(self.adventure)
	end
end

function Adventure:Serialize()
    return self.adventure
end
--= Return Factory
return Adventure
