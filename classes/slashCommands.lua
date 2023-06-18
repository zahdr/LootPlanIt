local _, LPI = ...;

LPI.Ace:RegisterChatCommand("lpi", "SlashCommand");

function LPI.Ace:SlashCommand()
	lootImportOverview:draw()
end