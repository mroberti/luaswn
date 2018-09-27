Religion = class("Religion")

function Religion:init(data)
    local religionTable = loadjson(".\\tables\\religion.JSON")
    self.evolution = choice(religionTable["evolution"])
    self.leadership = choice(religionTable["leadership"])
    self.origin_tradition = choice(religionTable["origin_tradition"])

    if(debug)then
    	print("Religion:")
	    print("Evolution: "..self.evolution)
	    print("Leadership: "..self.leadership)
	    print("Origin Tradition: "..self.origin_tradition)
	end
end

function Religion:Serialize()
    return self.element
end
--= Return Factory
return Religion