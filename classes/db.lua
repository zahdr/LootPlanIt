local _, LPI = ...;

LPI.db = {}
db = LPI.db


local function sortByItemRating(a, b)
    local ratingA = tonumber(string.sub(a["itemRating"], 1, -2))
    local ratingB = tonumber(string.sub(b["itemRating"], 1, -2))
    
    return ratingA > ratingB
end

local function sortSubTablesByItemRating(tbl)
    for key, subTable in pairs(tbl) do
        if #subTable > 1 then
            table.sort(subTable, sortByItemRating)
        end
    end
end


function db:init()
    if not LootPlanItDB then
        LootPlanItDB = {}
    end
    
    if not LootPlanItDB.lootCouncil then
        LootPlanItDB.lootCouncil = {}
    end
    
    if not LootPlanItDB.lootCouncil.itemIds then
        LootPlanItDB.lootCouncil.itemIds = {}
    end

    if not LootPlanItDB.lootCouncil.metaData then
        LootPlanItDB.lootCouncil.metaData = {}
    end
end

function db:resetLootCouncilData()
    LootPlanItDB = {}
    LootPlanItDB.lootCouncil = {}
    LootPlanItDB.lootCouncil.itemIds = {}
    LootPlanItDB.lootCouncil.metaData = {}

    LPI:infoMessage("Deleted loot council items!")
end

function LPI:importLootCouncilData(data)
    local tmpTbl = {}

    if type(data) == "string" then
        data = LPI:convertStringToTable(data)
    end

    for _, entry in pairs(data) do
        local itemId = entry[1]
        local itemRating = entry[2]
        local itemPrio = entry[3]
        local playerName = entry[4]
        local bisReceived = entry[5]
        local topThreeReceived = entry[6]
        local playerParse = entry[7]
        
        if not tmpTbl[itemId] then
            tmpTbl[itemId] = {}
        end

        local record = {
            itemRating = itemRating,
            itemPrio = itemPrio,
            playerName = playerName,
            bisReceived = bisReceived,
            topThreeReceived = topThreeReceived,
            playerParse = playerParse
        }
        
        table.insert(tmpTbl[itemId], record)
    end
    
    sortSubTablesByItemRating(tmpTbl)
    LootPlanItDB.lootCouncil.itemIds = tmpTbl     
    LPI:infoMessage("Loot Council Items imported successfully!")
end

function LPI:getMetaDataImportTimeText() 
    if LootPlanItDB.lootCouncil.metaData.lastImport then
        return string.format(
            "\nCurrent data got imported at |cff0088ff%s",
            LootPlanItDB.lootCouncil.metaData.lastImport
        );
    else
        return "\nNO DATA FOUND"
    end
end

function LPI:writeMetaDataImportTime() 
    local date = date("%Y-%m-%d %H:%M:%S")
    LootPlanItDB.lootCouncil.metaData.lastImport = date
end


db:init()