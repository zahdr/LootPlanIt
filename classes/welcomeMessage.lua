local _, LPI = ...;

function LPI.Ace:OnInitialize()
	print(string.format(
		"|cff0088ff%s v%s|r by %s. Type |cff0088ff/lpi|r to start!",
		LPI.title,
		LPI.version,
		LPI.author
	))
end
