local _, LPI = ...;

LPI.Ace:RegisterChatCommand("lpi", "SlashCommand");

function LPI.Ace:SlashCommand(msg)
	if msg == "reset" then
		db:resetLootCouncilData()
	elseif msg == "v" then
		LPI:infoMessage(LPI.name .. " v" .. LPI.version)
	else
		lootImportOverview:draw()
	end
end