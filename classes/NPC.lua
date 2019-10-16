NPC = class("NPC")

function NPC:init(data)
    local NPCTable = loadjson(".\\tables\\NPC.JSON")
    self.name = ""
    self.gender         = choice(NPCTable["gender"])
    self.age            = choice(NPCTable["age"])
    self.height         = choice(NPCTable["height"])
    self.problems       = choice(NPCTable["problems"])
    self.job_motivation = choice(NPCTable["job_motivation"])
    self.quirk          = choice(NPCTable["quirk"])

    if(debug)then
        logger("-")
        logger("Gender: "..self.gender)
        logger("Age: "..self.age)
        logger("Height: "..self.height)
        logger("Problems: "..self.problems)
        logger("Job Motivation: "..self.job_motivation)
        logger("Quirk: "..self.quirk)
    end
end

function NPC:Serialize()
    return self.element
end
--= Return Factory
return NPC