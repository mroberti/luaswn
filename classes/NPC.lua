NPC = class("NPC")

function NPC:init(data)
    local NPCTable = loadjson("tables/NPC.json")
    self.name = ""
    self.gender         = choice(NPCTable["gender"])
    self.age            = choice(NPCTable["age"])
    self.height         = choice(NPCTable["height"])
    self.problems       = choice(NPCTable["problems"])
    self.job_motivation = choice(NPCTable["job_motivation"])
    self.quirk          = choice(NPCTable["quirk"])

    if(debug)then
        print("-")
        print("Gender: "..self.gender)
        print("Age: "..self.age)
        print("Height: "..self.height)
        print("Problems: "..self.problems)
        print("Job Motivation: "..self.job_motivation)
        print("Quirk: "..self.quirk)
    end
end

function NPC:Serialize()
    return self.element
end
--= Return Factory
return NPC