local Adventure = require(".\\classes\\Adventure")
local Trade = require(".\\classes\\Trade")
local Architecture = require(".\\classes\\Architecture")
local Political_Party = require(".\\classes\\PoliticalParty")
local World = require(".\\classes\\World")
local Animal = require(".\\classes\\Animal")
local Corporation = require(".\\classes\\Corporation")
local Religion = require(".\\classes\\Religion")
local Heresy = require(".\\classes\\Heresy")
local Faction = require(".\\classes\\Faction")
local Alien = require(".\\classes\\Alien")
local NPC = require(".\\classes\\NPC")

local Planet = {}
local Planet_mt = { __index = Planet }	-- metatable


function Planet.new()	-- constructor
	local newPlanet = {}
    local worldTable = loadjson(".\\tables\\world.json")
    newPlanet.atmosphere=choice(worldTable["atmosphere"])
    newPlanet.temperature=choice(worldTable["temperature"])
    newPlanet.biosphere=choice(worldTable["biosphere"])
    newPlanet.population=choice(worldTable["population"])
    newPlanet.tech_level=choice(worldTable["tech_level"])
	if(debug)then   
	    print("Atmosphere: "..newPlanet.atmosphere)
	    print("Temperature: "..newPlanet.temperature)
	    print("Biosphere: "..newPlanet.biosphere)
	    print("Population: "..newPlanet.population)
	    print("Tech Level: "..newPlanet.tech_level)
	end

    newPlanet.architecture = Architecture:new()
    newPlanet.tags = {}
    for i=1,RAND(1,3) do
        table.insert(newPlanet.tags,choice(worldTable["tags"]))
    end

	newPlanet.race = Alien:new()


	newPlanet.politicalParties={}
	newPlanet.animals = {}
	newPlanet.corporations = {}
	newPlanet.religions = {}
	newPlanet.heresies = {}
	newPlanet.NPCs = {}
	newPlanet.adventures = {}

	local numberOfPoliticalParties = RAND(2,3)
	local numberOfAnimals = RAND(2,3)
	local numberOfCorporations = RAND(2,3)
	local numberOfReligions = RAND(1,2)
	local numberOfNPCs = RAND(3,5)
	local numberOfAdventures = RAND(2,3)

	print("---")
	for i=1,numberOfAnimals do
		local theAnimal = Animal:new()
		table.insert(newPlanet.animals,theAnimal)
		print("")
	end
	print("---")
	for i=1,numberOfPoliticalParties do
		local theParty = Political_Party:new()
		table.insert(newPlanet.politicalParties,theParty)
		print("")
	end
	print("---")
	for i=1,numberOfCorporations do
		local theCorporation = Corporation:new()
		table.insert(newPlanet.corporations,theCorporation)
		print("")
	end
	print("---")

	for i=1,numberOfReligions do
		local theHeresy = Heresy:new()
		table.insert(newPlanet.heresies,theHeresy)
		print("")	
		local theReligion = Religion:new()
		table.insert(newPlanet.religions,theReligion)
		print("")	
	end
	print("---")
	print("Prominent NPCs:")
	for i=1,numberOfNPCs do
		local theNPC = NPC:new()
		table.insert(newPlanet.NPCs,theNPC)
	end
	print("---")
	print("Adventure seeds:")
	for i=1,numberOfAdventures do
		local theAdventure = Adventure:new()
		table.insert(newPlanet.adventures,theAdventure)
	end
	print("")
	print("World Market:")
	print("===========================")
		local theTrade = Trade:new()
	return setmetatable( newPlanet, Planet_mt )
end

return Planet

