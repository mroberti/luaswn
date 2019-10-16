Religion = class("Religion")

function Religion:init(data)
    local religionTable = loadjson(".\\tables\\religion.JSON")
    self.evolution = choice(religionTable["evolution"])
    self.leadership = choice(religionTable["leadership"])
    self.origin_tradition = choice(religionTable["origin_tradition"])

    if(debug)then
    	logger("Religion:")
	    logger("Evolution: "..self.evolution)
	    logger("Leadership: "..self.leadership)
	    logger("Origin Tradition: "..self.origin_tradition)
	end
end

function Religion:Serialize()
    return self.element
end
--= Return Factory
return Religion