local _, LPI = ...;

LPI.Ace:RegisterChatCommand("lpi", "runSlashCommand");

LPI.slashCommands = {
	["commands"] = {
		help = function() LPI:printHelp(); end,
		version = function() LPI:printAddonVersion(); end,
		reset = function() db:resetLootCouncilData(); end,
		import = function() lootImportOverview:draw(); end,
	},
	["commandsShort"] = {
		h = "help",
		v = "version",
		r = "reset",
		i = "import",
	},
}

function LPI.Ace:runSlashCommand(...)
	local command = ...

	if command == "" then
		LPI:printHelp()
	else
		if LPI.slashCommands.commands[command] then
			LPI.slashCommands.commands[command]()
		elseif LPI.slashCommands.commandsShort[command] then
			local commandLongified = LPI.slashCommands.commandsShort[command]

			LPI.slashCommands.commands[commandLongified]()
		else
			print("|cffff0000Unknown command|r: " .. command .. ". Type |cff0088ff/lpi help|r if you need any help")
		end
	end
end

function LPI:printHelp()
	LPI:infoMessage("/lpi help or /lpi h to show this menu")
	LPI:infoMessage("/lpi import or /lpi i to open import gui")
	LPI:infoMessage("/lpi version or /lpi v to print current version to chat")
	LPI:infoMessage("/lpi reset or /lpi r to reset database if some update fails or a random bug occurs")
end

function LPI:printAddonVersion()
	LPI:infoMessage(LPI.name .. " " .. LPI.version)
end
