Faction = class("Faction")

function Faction:init(data)
    local factionTable = loadjson(".\\tables\\faction.JSON")
    local tempNumber = math.random(1,3)
    local tempInfo = ""
    self.tags = {}
    self.assets = {}
    if(tempNumber==1)then
        self.type = "Minor faction"
        tempInfo = factionTable["minor"]
    elseif(tempNumber==2)then
        self.type = "Major faction"
        tempInfo = factionTable["major"]
    else
        self.type = "Hegemon"
        tempInfo = factionTable["hegemon"]
    end
    self.hit_points = tempInfo["hit_points"]
    local tempStats = tempInfo["stats"]

    shuffledStats=ShuffleTable(tempStats)
    self.force   =  shuffledStats[1]
    self.cunning =  shuffledStats[2]
    self.wealth  =  shuffledStats[3]

    while( #self.assets < tempInfo["assets"][1] )
    do
        local tempNum = math.random(1,3)
        -- Force
        if(tempNum==1)then
            local tempNumber = math.random(1,self.force)
            logger("tempNumber "..tempNumber)
            table.insert(self.assets,choice(factionTable["force"][tostring(tempNumber)]).."/Force "..tempNumber)
        end
        -- Wealth
        if(tempNum==2)then
            local tempNumber = math.random(1,self.wealth)
            table.insert(self.assets,choice(factionTable["wealth"][tostring(tempNumber)]).."/Wealth "..tempNumber)
        end
        -- Cunning
        if(tempNum==3)then
            local tempNumber = math.random(1,self.cunning)
            table.insert(self.assets,choice(factionTable["cunning"][tostring(tempNumber)]).."/Cunning "..tempNumber)
        end

        -- Strip any duplicates...
        self.assets=StripDuplicates(self.assets)
    end

    local numberOfTags=math.random(1,4)
    while( #self.tags < numberOfTags )
    do
        table.insert(self.tags,choice(factionTable["tags"]))
        -- Strip any duplicates...
        self.tags=StripDuplicates(self.tags)
    end

    if(debug)then
        logger("Type: "..self.type)
        logger("Hit Points: "..self.hit_points)
        logger("Force: "..self.force)
        logger("Cunning: "..self.cunning)
        logger("Wealth: "..self.wealth)
        logger("Tags:"..implode(', ',self.tags))
        logger("Assets: "..implode(', ',self.assets))
    end

    -- M.sort(stats)
    logger("Largest is "..tempStats[1])

end

function Faction:Serialize()
    local result = {}
    table.insert(result,self.name)
    table.insert(result,self.business)
    table.insert(result,self.reputation)
    return result
end
--= Return Factory
return Faction

