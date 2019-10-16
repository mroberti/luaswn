Heresy = class("Heresy")

function Heresy:init(data)
    local heresyTable = loadjson(".\\tables\\heresy.JSON")
    self.founder = choice(heresyTable["founder"])
    self.major_heresy = choice(heresyTable["major_heresy"])
    self.attitude = choice(heresyTable["attitude"])
    self.quirk = choice(heresyTable["quirk"])
    if(debug)then
    	logger("Heresy:")
	    logger("Founder: "..self.founder)
	    logger("Major Heresy: "..self.major_heresy)
	    logger("Attitude: "..self.attitude)
	    logger("Quirk: "..self.quirk)
	end
end

function Heresy:Serialize()
    return self.element
end
--= Return Factory
return Heresy