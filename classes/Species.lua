Species = class("Species")

function Species:init(data)
    local myFile = lfs.currentdir().."\\tables\\alien.JSON"
    local alienTable = loadjson(myFile)

    function GetLenses()
        local result = ""
        local selection1 = {1,2,2,3,4}
        local selection2 = selection1[math.random(1,#selection1)]
        for i=1,selection2 do
            if(i==selection2)then
                result=result..choice(alienTable["lens"])
            else
                result=result..choice(alienTable["lens"])..","
            end
        end
        return result
    end
    self.lenses = GetLenses()
    self.social_structure = choice(alienTable["social_structure"])
    self.body_type = choice(alienTable["body_type"])
    if(debug)then
        logger("Body type: "..self.body_type)
        logger("Social Structure: "..self.social_structure)
        logger("Lenses: "..self.lenses)
    end
end

function Species:Serialize()
    local results = {}
    table.insert(results,self.body_type)
    table.insert(results,self.social_structure)
    table.insert(results,self.lenses)
    return results
end
--= Return Factory
return Species
