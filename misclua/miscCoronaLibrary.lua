-- widget = require("widget")


-- Function to create the widget
-- function CreateButton(filename,passedID,buttonHandler)
--     local tempButton = widget.newButton
--     {
--         left = 0,
--         top = 0,
--         id = passedID,
--         defaultFile = filename,
--         onRelease =buttonHandler
--     }
--     return tempButton
-- end

-- function widget.newPanel( options )
--     logger("options.location: "..options.location)
    
--     local customOptions = options or {}
--     local opt = {}
--     opt.location = customOptions.location or "top"
    
--     if ( opt.location == "top" or opt.location == "bottom" ) then
--         default_width = display.contentWidth
--         default_height = display.contentHeight * 0.33
--     else
--         default_width = display.contentWidth * 0.33
--         default_height = display.contentHeight
--     end
--     opt.width = customOptions.width or default_width
--     opt.height = customOptions.height or default_height
--     opt.speed = customOptions.speed or 500
--     opt.inEasing = customOptions.inEasing or easing.linear
--     opt.outEasing = customOptions.outEasing or easing.linear
--     if ( customOptions.onComplete and type(customOptions.onComplete) == "function" ) then
--         opt.listener = customOptions.onComplete
--     else 
--         opt.listener = nil
--     end   
--     local container = display.newGroup()    
    
--     if ( opt.location == "left" ) then
--         container.x = display.screenOriginX
--         container.y = display.contentCenterY
--         container.anchorX = 1
--         container.anchorY = 0.5
--     elseif ( opt.location == "right" ) then
--         container.anchorX = 1
--         container.anchorY = 0.5       
--         container.x = display.actualContentWidth
--         container.y = display.contentCenterY
--     elseif ( opt.location == "top" ) then
--         container.anchorX = .5
--         container.anchorY = 0
--         container.x = display.contentCenterX
--         container.y = display.screenOriginY
--     else
--         container.x = display.contentCenterX
--         container.y = display.actualContentHeight
--     end
--     function container:show()
--         local options = {
--             time = 0,
--             transition = opt.linear
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "shown"
--         end
--         if ( opt.location == "top" ) then
--             options.y = display.screenOriginY
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX
--             options.y = 0
--         else
--             options.x = display.actualContentWidth
--         end 
--         transition.to( self, options )
--     end
--     function container:jump()
--         local options = {
--             time = 0,
--             transition = opt.linear
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "shown"
--         end
--         if ( opt.location == "top" ) then
--             options.y = display.screenOriginY
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX
--         else
--             options.x = display.actualContentWidth
--         end 
--         transition.to( self, options )
--     end
    
--     function container:hide()
--         local options = {
--             time = opt.speed,
--             transition = opt.outEasing
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "hidden"
--         end
--         if ( opt.location == "top" ) then
--             options.y = -opt.height
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight+opt.height
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX-opt.width
--         else
--             options.x = display.actualContentWidth+opt.width
--         end 
--         transition.to( self, options )
--     end
--     return container
-- end

-- function widget.newPanelContainer( options )
--     local customOptions = options or {}
--     local opt = {}
--     opt.location = customOptions.location or "top"
--     local default_width, default_height
--     if ( opt.location == "top" or opt.location == "bottom" ) then
--         default_width = display.contentWidth
--         default_height = display.contentHeight * 0.33
--     else
--         default_width = display.contentWidth * 0.33
--         default_height = display.contentHeight
--     end
--     opt.width = customOptions.width or default_width
--     opt.height = customOptions.height or default_height
--     opt.speed = customOptions.speed or 500
--     opt.inEasing = customOptions.inEasing or easing.linear
--     opt.outEasing = customOptions.outEasing or easing.linear
--     if ( customOptions.onComplete and type(customOptions.onComplete) == "function" ) then
--         opt.listener = customOptions.onComplete
--     else 
--         opt.listener = nil
--     end
--     local container = display.newContainer( opt.width, opt.height )
--     --    local container = display.newGroup()
--     container.width = opt.width
--     container.height = opt.height
--     if ( opt.location == "left" ) then
--         container.anchorX = 1.0
--         container.x = display.screenOriginX
--         container.anchorY = 0.5
--         container.y = display.contentCenterY
--     elseif ( opt.location == "right" ) then
--         container.anchorX = 0.0
--         container.x = display.actualContentWidth
--         container.anchorY = 0.5
--         container.y = display.contentCenterY
--     elseif ( opt.location == "top" ) then
--         container.anchorX = 0.5
--         container.x = display.contentCenterX
--         container.anchorY = 1.0
--         container.y = display.screenOriginY
--     else
--         container.anchorX = 0.5
--         container.x = display.contentCenterX
--         container.anchorY = 0.0
--         container.y = display.actualContentHeight
--     end
--     function container:show()
--         local options = {
--             time = opt.speed,
--             transition = opt.inEasing
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "shown"
--         end
--         if ( opt.location == "top" ) then
--             options.y = display.screenOriginY + opt.height
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight - opt.height
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX + opt.width
--         else
--             options.x = 200 --display.actualContentWidth - opt.width
--         end 
--         transition.to( self, options )
--     end
--     function container:jump()
--         local options = {
--             time = 0,
--             transition = opt.linear
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "shown"
--         end
--         if ( opt.location == "top" ) then
--             options.y = display.screenOriginY + opt.height
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight   - opt.height
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX + opt.width
--         else
--             options.x = display.actualContentWidth - opt.width
--         end 
--         transition.to( self, options )
--     end
    
--     function container:hide()
--         local options = {
--             time = opt.speed,
--             transition = opt.outEasing
--         }
--         if ( opt.listener ) then
--             options.onComplete = opt.listener
--             self.completeState = "hidden"
--         end
--         if ( opt.location == "top" ) then
--             options.y = display.screenOriginY
--         elseif ( opt.location == "bottom" ) then
--             options.y = display.actualContentHeight
--         elseif ( opt.location == "left" ) then
--             options.x = display.screenOriginX
--         else
--             options.x = display.actualContentWidth
--         end 
--         transition.to( self, options )
--     end
--     return container
-- end

require("lfs")

function isFile(name)
    if type(name)~="string" then return false end
    if not isDir(name) then
        return os.rename(name,name) and true or false
        -- note that the short evaluation is to
        -- return false instead of a possible nil
    end
    return false
end

function isFileOrDir(name)
    if type(name)~="string" then return false end
    return os.rename(name, name) and true or false
end

function isDir(name)
    if type(name)~="string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(name) and true or false
    lfs.chdir(cd)
    return is
end

function choice(passedTable)
    local tempNumber = math.random(1,#passedTable)
    return passedTable[tempNumber]
end

function rollDice( dicePattern )
    -- Dice pattern 3d6+3k3
    -- First number : number of dice
    -- d : required string
    -- Second number : sides to the dice
    -- +/- : optional modifier
    -- ^/k : optional string; '^' keeps the high values, 'k' keeps the low values
    -- Third number : number of dice to keep, i.e. 4d6^3 keeps the best three numbers
    local dice = {}
    local random = math.random
    local total = 0
    -- Parse the string
    local count, sides, sign, modifier, keepHiLo, keep = string.match( dicePattern, "(%d+)[dD](%d+)([%+%-]*)(%d*)([%^k]*)(%d*)" )
    modifier = tonumber(modifier)
    keep = tonumber(keep)
    if ( modifier == nil ) then
        modifier = 0
    end
    if ( sign == "-" and modifier > 0 ) then
        modifier = modifier * -1
    end
    for i = 1, count do
        dice[i] = random( sides )
    end
    if ( keep ) then
        local function keepCompare( a, b )
            return a > b
        end
        if ( keepHiLo == "k" ) then
            table.sort( dice )
        else
            table.sort( dice, keepCompare )
        end
        for i = 1, keep do
            total = total + dice[i]
        end
    else
        for i = 1, count do
            total = total + dice[i]
        end
    end
    total = total + modifier
    return total, dice
end

-- Remove duplicates from a table array (doesn't currently work
-- on key-value tables)
function table_unique(tt)
  local newtable
  newtable = {}
  for ii,xx in ipairs(tt) do
    if(table_count(newtable, xx) == 0) then
      newtable[#newtable+1] = xx
    end
  end
  return newtable
end

-- implode(separator, table)
function implode(d,p)
  local newstr
  newstr = ""
  if(#p == 1) then
    return p[1]
  end
  for ii = 1, (#p-1) do
    newstr = newstr .. p[ii] .. d
  end
  newstr = newstr .. p[#p]
  return newstr
end

-- Careful of random number seeding here- you will need to randomly
-- seed before calling this
function randomlist(l, samp)
  local newlist
  newlist = {}
  if not samp then 
    samp = 0 
  else
    samp = #l - samp
  end
  while #l > samp do
    local idx
    idx = math.random(1, #l)
    newlist[#newlist + 1] = l[idx]
    table.remove(l, idx)
  end
  return newlist
end

function StripDuplicates(t)
    local hash = {}
    local res = {}

    for _,v in ipairs(t) do
       if (not hash[v]) then
           res[#res+1] = v -- you could logger here instead of saving to result table if you wanted
           hash[v] = true
       end
    end
    return res
end

function ShuffleTable(t)
    shuffled = {}
    for i, v in ipairs(t) do
        local pos = math.random(1, #shuffled+1)
        table.insert(shuffled, pos, v)
    end
    return shuffled
end

function loadjson(filename)
    local path = system.pathForFile( filename, system.ResourceDirectory)
    
    local file = io.open( path, "r" )
    local religionTable = json.decode(file:read( "*a" ))
    
    io.close( file )
    file = nil    
    return religionTable
end

function fitImage( displayObject, fitWidth, fitHeight, enlarge )
    --
    -- first determine which edge is out of bounds
    --
    local scaleFactor = fitHeight / displayObject.height
    local newWidth = displayObject.width * scaleFactor
    if newWidth > fitWidth then
        scaleFactor = fitWidth / displayObject.width
    end
    if not enlarge and scaleFactor > 1 then
        return
    end
    displayObject:scale( scaleFactor, scaleFactor )
    return scaleFactor
end

function GetUserList(event)
    local result = nil
    if not event.error then    
        result = event.result
    end
    return result
end

function ParseRoll(formula)
    local result
    if string.match(formula, "*") then
        -- Found a *
        -- local formula = "2d6+3"
        local tempSplit = SplitString(formula, "*")
        local tempResult,rolls = rollDice(tempSplit[1])
        -- for i = 1, #rolls do
        --     logger( i, rolls[i] )
        -- end
        result = tempResult*tonumber(tempSplit[2])    
    else
        local tempResult,rolls = rollDice(formula)
        -- for i = 1, #rolls do
        --     logger( i, rolls[i] )
        -- end
        result = tempResult       
    end
    return result
end

function rollDice( dicePattern )
    -- Dice pattern 3d6+3k3
    -- First number : number of dice
    -- d : required string
    -- Second number : sides to the dice
    -- +/- : optional modifier
    -- ^/k : optional string; '^' keeps the high values, 'k' keeps the low values
    -- Third number : number of dice to keep, i.e. 4d6^3 keeps the best three numbers
    local dice = {}
    local random = math.random
    local total = 0
    -- Parse the string
    local count, sides, sign, modifier, keepHiLo, keep = string.match( dicePattern, "(%d+)[dD](%d+)([%+%-]*)(%d*)([%^k]*)(%d*)" )
    modifier = tonumber(modifier)
    keep = tonumber(keep)
    if ( modifier == nil ) then
        modifier = 0
    end
    if ( sign == "-" and modifier > 0 ) then
        modifier = modifier * -1
    end
    for i = 1, count do
        dice[i] = random( sides )
    end
    if ( keep ) then
        local function keepCompare( a, b )
            return a > b
        end
        if ( keepHiLo == "k" ) then
            table.sort( dice )
        else
            table.sort( dice, keepCompare )
        end
        for i = 1, keep do
            total = total + dice[i]
        end
    else
        for i = 1, count do
            total = total + dice[i]
        end
    end
    total = total + modifier
    return total, dice
end

function Roll(command)
    rolls = {}
    
    function parse (quantity, sides, modifier, times)
        local index = 0
        local sum = 0
        local best = 0
        local rolled = {}
        local selected = {}   
        
        if modifier == "" then table.insert(rolls,(quantity.."d"..sides))
        else table.insert(rolls,(quantity.."d"..sides..modifier..times)) end
        for r = 1, quantity do 
            rolled[r] = math.random(1,sides)
            table.insert(rolls,rolled[r]) 
        end
        for i, v in ipairs(rolled) do selected[i] = v end
        
            if modifier == "" then for i,v in ipairs (rolled) do sum = sum + v end 
        else
            for t = 1, quantity-times do
                if modifier == "h" then best = math.huge
                elseif modifier == "l" then best = 0 end
                for i,v in ipairs ( selected ) do
                    if (v < best and modifier == "h") or (v > best and modifier == "l") then
                        index = i
                        best = v
                    end
                end
                table.remove (selected,index)
            end
            for i, v in ipairs (selected) do sum = sum + v end
        end
        return sum
    end
    
    command = string.gsub(command,"(%d+)d(%d+)(%a)(%d+)",function(quantity, sides, modifier, times) return parse (quantity, sides, modifier, times) end)
    command = string.gsub(command,"(%d+)d(%d+)(%a)",function(quantity, sides, modifier) return parse (quantity, sides, modifier, 1) end)
    command = string.gsub(command,"0d(%d+)",function(sides) return 0 end)
    command = string.gsub(command,"(%d+)d(%d+)",function(quantity, sides, modifier, times) return parse (quantity, sides, "", 0) end)
    command = string.gsub(command,"d(%d+)",function(sides) return parse (1, sides, "", 0) end)
    return tonumber(command)
end

function SplitString (line,sep) 
    local res = {}
    local pos = 1
    sep = sep or ','
    while true do 
        local c = string.sub(line,pos,pos)
        if (c == "") then break end
        if (c == '"') then
            -- quoted value (ignore separator within)
            local txt = ""
            repeat
                local startp,endp = string.find(line,'^%b""',pos)
                txt = txt..string.sub(line,startp+1,endp-1)
                pos = endp + 1
                c = string.sub(line,pos,pos) 
                if (c == '"') then txt = txt..'"' end 
                -- check first char AFTER quoted string, if it is another
                -- quoted string without separator, then append it
                -- this is the way to "escape" the quote char in a quote. example:
                --   value1,"blub""blip""boing",value3  will result in blub"blip"boing  for the middle
            until (c ~= '"')
            table.insert(res,txt)
            assert(c == sep or c == "")
            pos = pos + 1
        else	
            -- no quotes used, just look for the first separator
            local startp,endp = string.find(line,sep,pos)
            if (startp) then 
                table.insert(res,string.sub(line,pos,startp-1))
                pos = endp + 1
            else
                -- no separator found -> use rest of string and terminate
                table.insert(res,string.sub(line,pos))
                break
            end 
        end
    end
    return res
end

function StripFilename(passedString)
    local tempString = "MOIST"
    local tempSplit = SplitString(passedString, "/")
    tempString = tempSplit[#tempSplit]
    return tempString
end

function InTable(passedTable,passedValue)
    local result = nil
    for key,value in pairs(passedTable) do
        if(passedValue==passedTable)then
            -- OK we've got a item called 'passedValue'
            -- so set the result to 'value'
            result = value
        end
    end
    return result
end

function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            logger(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        logger(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+4))
                        logger(indent..string.rep(" ",string.len(pos)+3).."}")
                    elseif (type(val)=="string") then
                        logger(indent.."["..pos..'] => "'..val..'"')
                    else
                        logger(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                logger(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        logger(tostring(t).." {")
        sub_print_r(t," ")
        logger("}")
    else
        sub_print_r(t,"  ")
    end
    logger()
end

function GUID()
    local guid = {};
    guid.char = {"A", "B", "C", "D", "E", "F","1","2","3","4","5","6","7","8","9"};
    guid.isHyphen = {[9]=1,[14]=1,[19]=1,[24]=1};
    guid.used = {};
    guid.loops = 0;
    guid.currentGuid = nil;
    while(true) do
        guid.loops = guid.loops +1;
        --If we can't get it in 20 tries than we have bigger problems.
        if(guid.loops > 20) then return false; end
        guid.pass = {};
        for z = 1,36 do
            if guid.isHyphen[z] then
                guid.x='-';
            else
                guid.a = math.random(1,#guid.char); -- randomly choose a character from the "guid.char" array
                guid.x = guid.char[guid.a]
            end
            table.insert(guid.pass, guid.x) -- add new index into array.
        end
        z = nil
        guid.currentGuid = tostring(table.concat(guid.pass)); -- concatenate all indicies of the array, then return concatenation.
        if not guid.used[guid.currentGuid] then
            
            guid.used[guid.currentGuid] = guid.currentGuid;
            return(guid.currentGuid);
        else
            --logger('Duplicated a Previously Created GUID.');
        end
    end
    return(grid.currentGuid)
end
