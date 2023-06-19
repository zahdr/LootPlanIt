local _, LPI = ...;

function LPI.Ace:OnInitialize()
	print(string.format(
		"|cff0088ff%s %s|r by %s. Type |cff0088ff/lpi|r to start! |cff0088ff/lpi h|r to show help menu.",
		LPI.title,
		LPI.version,
		LPI.author
	))
end
