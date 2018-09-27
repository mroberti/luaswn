JSON = require( "JSON" )

class = require("misclua.30log-global")
Alien = require("classes.Alien")
Adventure = require("classes.Adventure")
Animal = require("classes.Animal")
Architecture = require("classes.Architecture")
Corporation = require("classes.Corporation")
Faction = require("classes.Faction")
Planet = require("classes.Planet")
PoliticalParty = require("classes.PoliticalParty")

require("misclua.miscLibrary")
RAND = math.random
debug = true
math.randomseed( os.time() )

local thePlanet = Planet:new()

-- local theAdventure = Adventure:new()

-- local theTrade = Trade:new()

-- local theNPC = NPC:new()

-- etc....
