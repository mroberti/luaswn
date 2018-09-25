Heresy = class("Heresy")

function Heresy:init(data)
    local heresyTable = loadjson("tables/heresy.json")
    self.founder = choice(heresyTable["founder"])
    self.major_heresy = choice(heresyTable["major_heresy"])
    self.attitude = choice(heresyTable["attitude"])
    self.quirk = choice(heresyTable["quirk"])
    if(debug)then
    	print("Heresy:")
	    print("Founder: "..self.founder)
	    print("Major Heresy: "..self.major_heresy)
	    print("Attitude: "..self.attitude)
	    print("Quirk: "..self.quirk)
	end
end

function Heresy:Serialize()
    return self.element
end
--= Return Factory
return Heresy