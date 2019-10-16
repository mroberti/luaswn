Architecture = class("Architecture")

function Architecture:init(data)
	-- logger("1 Current directory "..lfs.currentdir())
	-- logger("----------")
	local myFile = lfs.currentdir().."\\tables\\architecture.json"
    local architectureTable = loadjson(myFile)
    -- print_r(architectureTable)
    self.element = choice(architectureTable["element"])
	logger(self.element)
end

function Architecture:Serialize()
    return self.element
end
--= Return Factory
return Architecture