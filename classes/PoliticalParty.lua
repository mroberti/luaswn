PoliticalParty = class("PoliticalParty")

function PoliticalParty:init(data)
    local politicalTable = loadjson(".\\tables\\political_party.JSON")
    self.leadership = choice(politicalTable["leadership"])
    self.economic_policy = choice(politicalTable["economic_policy"])
    self.important_issues = choice(politicalTable["important_issues"])
    self.name = choice(politicalTable["descriptor"]).." "..choice(politicalTable["name"])
    if(debug)then
        logger("Political Party:")
        logger("Name: "..self.name)
        logger("Leadership: "..self.leadership)
        logger("Economic Policy: "..self.economic_policy)
        logger("Important Issues: "..self.important_issues)
    end
end

function PoliticalParty:Serialize()
    local results = {}
    table.insert(results,self.name)
    table.insert(results,self.leadership)
    table.insert(results,self.economic_policy)
    table.insert(results,self.important_issues)
    return results
end
--= Return Factory
return PoliticalParty

