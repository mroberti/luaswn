Architecture = class("Architecture")

function Architecture:init(data)
    local architectureTable = loadjson("tables/architecture.json")
    self.element = choice(architectureTable["element"])
    if(debug)then
	    print("Predominant architectural feature: "..self.element)
	end
end

function Architecture:Serialize()
    return self.element
end
--= Return Factory
return Architecture