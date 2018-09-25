Animal = class("Animal")

function Animal:init(data)
    -- Classes' variables
    local animalTable = loadjson("tables/animal.json")

    self.traits = ""
    self.groupSize = RAND(1,7)

    local template = choice(animalTable["template"])
    if(template== "Hybrid")then
        local num_templates = RAND(2,#animalTable["template"])
        local templates = {}

        while #templates< num_templates do
            local new_template = choice(animalTable["template"])
            if(new_template ~= "Hybrid")then
                table.insert(templates,new_template)
            end
        end

        for i=1,#templates do
            local tempString = string.lower(templates[i])
            local string2 = choice(animalTable["trait"][tempString])
            if(i<#templates)then
                self.traits = self.traits..string2.." / "
            else
                self.traits = self.traits..string2
            end
        end

    else
        local tempString = string.lower(template)
        local string2 = choice(animalTable["trait"][tempString])
        self.traits = self.traits..string2
    end
    self.traits = template.." "..self.traits
    if(debug)then
        print("Animal:")
        print("Template: "..template)
        print("Traits: "..self.traits)
        print("Group size:"..self.groupSize)
    end
end

function Animal:Serialize()
    return self.traits
end
--= Return Factory
return Animal

