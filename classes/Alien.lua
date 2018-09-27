Alien = class("Alien")

function Alien:init(data)
    local alienTable = loadjson(".\\tables\\alien.JSON")
    function GetLenses()
        local result = ""
        local selection1 = {1,2,2,3,4}
        local selection2 = selection1[RAND(1,#selection1)]
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
        print("Body type: "..self.body_type)
        print("Social Structure: "..self.social_structure)
        print("Lenses: "..self.lenses)
    end
end

function Alien:Serialize()
    local results = {}
    table.insert(results,self.body_type)
    table.insert(results,self.social_structure)
    table.insert(results,self.lenses)
    return results
end
--= Return Factory
return Alien
