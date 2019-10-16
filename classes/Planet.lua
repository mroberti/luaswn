Planet = class("Planet")

function Planet:init(data)
	local newPlanet = {}
	local myFile = lfs.currentdir().."\\tables\\world.json"
    local worldTable = loadjson(myFile)
    newPlanet.atmosphere=choice(worldTable["atmosphere"])
    newPlanet.temperature=choice(worldTable["temperature"])
    newPlanet.biosphere=choice(worldTable["biosphere"])
    newPlanet.population=choice(worldTable["population"])
    newPlanet.tech_level=choice(worldTable["tech_level"])
	if(debug)then   
	    logger("Atmosphere: "..newPlanet.atmosphere)
	    logger("Temperature: "..newPlanet.temperature)
	    logger("Biosphere: "..newPlanet.biosphere)
	    logger("Population: "..newPlanet.population)
	    logger("Tech Level: "..newPlanet.tech_level)
	end

    newPlanet.architecture = Architecture:new()
    newPlanet.tags = {}
    for i=1,math.random(1,3) do
        table.insert(newPlanet.tags,choice(worldTable["tags"]))
    end

	newPlanet.species = Species:new()


	newPlanet.politicalParties={}
	newPlanet.animals = {}
	newPlanet.corporations = {}
	newPlanet.religions = {}
	newPlanet.heresies = {}
	newPlanet.NPCs = {}
	newPlanet.adventures = {}

	local numberOfPoliticalParties = math.random(2,3)
	local numberOfAnimals = math.random(2,3)
	local numberOfCorporations = math.random(2,3)
	local numberOfReligions = math.random(1,2)
	local numberOfNPCs = math.random(3,5)
	local numberOfAdventures = math.random(2,3)

	logger("---")
	for i=1,numberOfAnimals do
		local theAnimal = Animal:new()
		table.insert(newPlanet.animals,theAnimal)
		logger("")
	end
	logger("---")
	for i=1,numberOfPoliticalParties do
		local theParty = PoliticalParty:new()
		table.insert(newPlanet.politicalParties,theParty)
		logger("")
	end
	logger("---")
	for i=1,numberOfCorporations do
		local theCorporation = Corporation:new()
		table.insert(newPlanet.corporations,theCorporation)
		logger("")
	end
	logger("---")

	for i=1,numberOfReligions do
		local theHeresy = Heresy:new()
		table.insert(newPlanet.heresies,theHeresy)
		logger("")	
		local theReligion = Religion:new()
		table.insert(newPlanet.religions,theReligion)
		logger("")	
	end
	logger("---")
	logger("Prominent NPCs:")
	for i=1,numberOfNPCs do
		local theNPC = NPC:new()
		table.insert(newPlanet.NPCs,theNPC)
	end
	logger("---")
	logger("Adventure seeds:")
	for i=1,numberOfAdventures do
		local theAdventure = Adventure:new()
		table.insert(newPlanet.adventures,theAdventure)
	end
	logger("")
	logger("World Market:")
	logger("===========================")
		local theTrade = Trade:new()
	return setmetatable( newPlanet, Planet_mt )
end

function Planet:Serialize()
    return self.element
end
--= Return Factory

return Planet

