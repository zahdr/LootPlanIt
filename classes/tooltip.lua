local _, LPI = ...;

local function compareItemRating(a, b)
    local ratingA = tonumber(a.itemRating:sub(1, -2)) / 100
    local ratingB = tonumber(b.itemRating:sub(1, -2)) / 100

    return ratingA > ratingB
end

function tooltipAddPrios(tooltip)
	local _, itemLink = tooltip:GetItem()
	local itemId = tostring(GetItemInfoFromHyperlink(itemLink))
	local loopStop = 0
	
	if LootPlanItDB.lootCouncil.itemIds[itemId] then
		table.sort(LootPlanItDB.lootCouncil.itemIds[itemId], compareItemRating)
		for _, record in pairs(LootPlanItDB.lootCouncil.itemIds[itemId]) do
			if loopStop == 0 then
				loopStop = 1
				tooltip:AddLine(" ")
				tooltip:AddLine(string.format("|c00%s%s", "0088ff", LPI.title .. " Rating"))
			end
			tooltip:AddLine("   " .. record.itemRating .. "   P" .. record.itemPrio .. "  " .. record.playerName)
		end
		if loopStop == 1 then
			tooltip:AddLine(" ")
		end
	end
end

GameTooltip:HookScript("OnTooltipSetItem", tooltipAddPrios)
