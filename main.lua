require("lfs")
math.random = math.random
math.randomseed( os.time() )

require("misclua/miscLibrary")
JSON = require( "JSON" )

-- -- JSON = require('json')
debug = true
function logger(info,override)
	-- Override will logger regardless of global debug value
	if(debug or override~=nil)then
		print(info)
	end
end

class = require("misclua/30log-global")
Room = require("classes/Room")
Trade = require("classes/Trade")
Religion = require("classes/Religion")
NPC = require("classes/NPC")
Species = require("classes/Species")
Adventure = require("classes/Adventure")
Animal = require("classes/Animal")
Architecture = require("classes/Architecture")
Corporation = require("classes/Corporation")
Heresy = require("classes/Heresy")
Faction = require("classes/Faction")
PoliticalParty = require("classes/PoliticalParty")
Planet = require("classes/Planet")

for i=1,5 do
	local theAdventure = Adventure:new()
	print("\n")
end

-- local theAdventure = Adventure:new()

-- local theAnimal = Animal:new()

-- local theRoom = Room:new()

-- local thePlanet = Planet:new()

-- local theTrade = Trade:new()

-- -- local theNPC = NPC:new()

-- -- etc....
