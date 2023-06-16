local _, LPI = ...;

LPI.Ace:RegisterChatCommand("lpi", "SlashCommand");

function LPI.Ace:SlashCommand()
	lootImportOverview:draw()
end



--[[

LPI.commands = {
	commandDescriptions = {
		robert = "robert ist ein macher",
		kevin = "kevin slacklings"
	},
	commandShortcuts = {
		r = "robert",
		k = "kevin"
	},
	dictionary = {
		robert = function() print("rrrrobert"); end,
		kevin = function() print("kkkkkkevin"); end,
	}
};

--]]