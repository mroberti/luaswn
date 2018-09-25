Trade = class("Trade")

function Trade:init(data)
    local tradeTable = loadjson("tables/trade.json")
    self.tech_level="TL4"
    self.selling = {}
    self.wanted = {}
    self.unwanted = {}
    self.other = {}
    local sellingRange = choice({2, 2, 3, 3, 3, 3, 4})
    local wantedRange = choice({2, 2, 3, 3, 3, 3, 4})
    local unwantedRange = choice({1, 2, 3})
    print("sellingRange "..sellingRange)
    while( #self.selling < sellingRange )
    do
        local tradeItem = choice(tradeTable["trade_item"][self.tech_level])
        local itemDetails = tradeTable["item_detail"][tradeItem]
        local tons = ParseRoll(itemDetails.tons)
        local price = itemDetails.base_price
        local theString = tons.." x "..tradeItem..": "..price.." credits"
        table.insert(self.selling,theString)
        -- local price = tradeTable["item_detail"][tradeItem]["base_price"]
        -- local tons = tradeTable["item_detail"][tradeItem]["tons"]
        -- print("Tons "..ParseRoll(tons))
        -- -- Strip any duplicates...
        self.selling=StripDuplicates(self.selling)
    end
    print("")
    print("Selling:")
    print("----------------")
    print("Price Per Ton: "..self.selling[1])
    if(#self.selling>1)then
        for i=2, #self.selling do
            print("               "..self.selling[i])
        end
        print("")
        print("")
    end
    print("Purchase Prices:")
    print("----------------")
    while( #self.wanted < wantedRange )
    do
        local tradeItem = choice(tradeTable["trade_item"][self.tech_level])
        local itemDetails = tradeTable["item_detail"][tradeItem]
        local price = itemDetails.base_price * (ParseRoll(itemDetails.wanted_value)/100)
        local theString = tradeItem..": "..price.." credits"
        table.insert(self.wanted,theString)
        -- local price = tradeTable["item_detail"][tradeItem]["base_price"]
        -- local tons = tradeTable["item_detail"][tradeItem]["tons"]
        -- print("Tons "..ParseRoll(tons))
        -- -- Strip any duplicates...
        self.wanted=StripDuplicates(self.wanted)
    end
    print("Wanted:   "..self.wanted[1])
    if(#self.wanted>1)then
        for i=2, #self.wanted do
            print("          "..self.wanted[i])
        end
        print("")
        print("")
    end

    while( #self.unwanted < unwantedRange )
    do
        local tradeItem = choice(tradeTable["trade_item"][self.tech_level])
        local itemDetails = tradeTable["item_detail"][tradeItem]
        local price = itemDetails.base_price * (ParseRoll(itemDetails.wanted_value)/100)
        local theString = tradeItem..": "..price.." credits"
        table.insert(self.unwanted,theString)
        -- local price = tradeTable["item_detail"][tradeItem]["base_price"]
        -- local tons = tradeTable["item_detail"][tradeItem]["tons"]
        -- print("Tons "..ParseRoll(tons))
        -- -- Strip any duplicates...
        self.unwanted=StripDuplicates(self.unwanted)
    end

    print("Unwanted: "..self.unwanted[1])
    if(#self.unwanted>1)then
        for i=2, #self.wanted do
            print("          "..self.unwanted[i])
        end
        print("")
        print("")
    end

    local size = #tradeTable["trade_item"][self.tech_level]

    while( #self.other < size )
    do
        local tradeItem = choice(tradeTable["trade_item"][self.tech_level])
        local itemDetails = tradeTable["item_detail"][tradeItem]
        local price
        local tempNum = RAND(1,2)
        if(tempNum==1)then
            price = itemDetails.base_price - (itemDetails.base_price*(ParseRoll(itemDetails.standard_value)/100))
        else
            price = itemDetails.base_price + (itemDetails.base_price*(ParseRoll(itemDetails.standard_value)/100))
        end
        local theString = tradeItem..": "..price.." credits"
        -- TODO remove that specific trade item from the table
        -- table.remove(tradeTable["trade_item"],tradeTable["trade_item"][self.tech_level])
        -- so there's gonna be duplicates for now... 
        table.insert(self.other,theString)
    end

    print("Other: "..self.other[1])
    if(#self.other>1)then
        for i=2, #self.other do
            print("       "..self.other[i])
        end
        print("")
        print("")
    end


    if(debug)then

    end
end

function Trade:Serialize()
    return self.element
end
--= Return Factory
return Trade