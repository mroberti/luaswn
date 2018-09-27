Corporation = class("Corporation")

function Corporation:init(data)
    local corporationTable = loadjson(".\\tables\\corporation.JSON")
    self.name = choice(corporationTable["name"]).." "..choice(corporationTable["organization"])
    self.business = choice(corporationTable["business"])
    self.reputation = choice(corporationTable["reputation"])
    if(debug)then
	    print("Corporation: "..self.name)
	    print("Business: "..self.business)
	    print("Reputation: "..self.reputation)
	end
end

function Corporation:Serialize()
	local result = {}
	table.insert(result,self.name)
	table.insert(result,self.business)
	table.insert(result,self.reputation)
    return result
end
--= Return Factory
return Corporation

