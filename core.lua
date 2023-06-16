local appName, LPI = ...;

LPI.classes = {};

LPI.name = appName;
LPI.version = GetAddOnMetadata(LPI.name, "Version");
LPI.author = GetAddOnMetadata(LPI.name, "Author");
LPI.title = GetAddOnMetadata(LPI.name, "Title");

LPI.Ace = LibStub("AceAddon-3.0"):NewAddon(LPI.name, "AceConsole-3.0", "AceComm-3.0", "AceTimer-3.0");
