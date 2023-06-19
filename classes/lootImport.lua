local _, LPI = ...;

LPI.AceGUI = LibStub("AceGUI-3.0");

local AceGUI = LPI.AceGUI;

LPI.classes.lootImport = {};
LPI.classes.lootImport.overview = {};
LPI.classes.lootImport.import = {};

lootImportOverview = LPI.classes.lootImport.overview;
lootImport = LPI.classes.lootImport.import;

function lootImportOverview:draw()
    local window = AceGUI:Create("Frame");
    window:SetTitle(LPI.title .. " v" .. LPI.version);
    window:SetLayout("Flow");
    window:SetWidth(490);
    window:SetHeight(150);
    window:EnableResize(false);
    window.statustext:GetParent():Hide();
    
    local labelTimestamp = AceGUI:Create("Label");
    labelTimestamp:SetFullWidth(true);
    labelTimestamp:SetText(LPI:getMetaDataImportTimeText());
    labelTimestamp:SetJustifyH("MIDDLE");
    labelTimestamp:SetFontObject(_G["GameFontNormal"]);
    window:AddChild(labelTimestamp);

    partingLine = AceGUI:Create("SimpleGroup");
    partingLine:SetLayout("FILL");
    partingLine:SetFullWidth(true);
    partingLine:SetHeight(15);
    window:AddChild(partingLine);

    local buttonImport = AceGUI:Create("Button");
    buttonImport:SetWidth(150);
    buttonImport:SetText("Import");
    buttonImport:SetCallback("OnClick", 
        function() 
            lootImport:draw();
            AceGUI:Release(window)
        end);
    window:AddChild(buttonImport);

    local buttonShare = AceGUI:Create("Button");
    buttonShare:SetWidth(150);
    buttonShare:SetText("Share");
    buttonShare:SetCallback("OnClick", 
        function() 
            LPI:debug("SHARE ACTION MISSING"); 
        end);
    window:AddChild(buttonShare);

    local buttonClear = AceGUI:Create("Button");
    buttonClear:SetWidth(150);
    buttonClear:SetText("Clear data");
    buttonClear:SetCallback("OnClick", 
        function() 
            db:resetLootCouncilData()
            LPI:infoMessage("Deleted Loot Council Items!")
            AceGUI:Release(window)
            lootImportOverview:draw()
        end);
    window:AddChild(buttonClear);
end

function lootImport:draw()
    local window = AceGUI:Create("Frame");
    window:SetTitle(LPI.title .. " v" .. LPI.version);
    window:SetLayout("Flow");
    window:SetWidth(500);
    window:SetHeight(500);
    window:EnableResize(false);
    window.statustext:GetParent():Hide();

    local labelInfo = AceGUI:Create("Label");
    labelInfo:SetFullWidth(true);
    labelInfo:SetText("\nInsert data below and press \"Import\"")
    labelInfo:SetFontObject(_G["GameFontNormal"]);
    window:AddChild(labelInfo);

    local boxInput = AceGUI:Create("MultiLineEditBox");
    boxInput:SetFocus();
    boxInput:SetFullWidth(true);
    boxInput:SetNumLines(25);
    boxInput:SetMaxLetters(999999999);
    boxInput:DisableButton(1);
    boxInput:SetLabel();
    window:AddChild(boxInput);


    local buttonImport = AceGUI:Create("Button");
    buttonImport:SetWidth(150);
    buttonImport:SetText("Import");
    buttonImport:SetCallback("OnClick", 
        function() 
            local data = boxInput:GetText()
            db:resetLootCouncilData()
            LPI:importLootCouncilData(data)
            LPI:writeMetaDataImportTime() 
            AceGUI:Release(window)
            lootImportOverview:draw()
        end);
    window:AddChild(buttonImport);
end
