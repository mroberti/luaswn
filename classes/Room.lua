Room = class("Room")

function Room:init(data)
	-- logger("1 Current directory "..lfs.currentdir())
	-- logger("----------")
	local myFile = lfs.currentdir().."\\tables\\room.json"
    local roomTable = loadjson(myFile)
    -- print_r(roomTable)
    self.description = choice(roomTable["description"])
	logger("room: "..self.description)
end

function Room:Serialize()
    return self.description
end
--= Return Factory
return Room