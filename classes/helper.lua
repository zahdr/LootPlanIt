local _, LPI = ...;

function LPI:message(...)
    print(...)
end

function LPI:coloredMessage(color, ...)
    LPI:message(string.format("|c00%s%s", color, ...))
end

function LPI:debug(...)
    LPI:coloredMessage("fc0000", ...)
end

function LPI:infoMessage(...)
    LPI:coloredMessage("0088ff", ...)
end

function LPI:convertStringToTable(string)
    local dataTable = {}
    local trimmedString = string:sub(2, -2)

    for dataString in trimmedString:gmatch("{(.-)}") do
        local tmpTable = {}
        for value in dataString:gmatch("([^;]+)") do
            table.insert(tmpTable, value)
        end
        table.insert(dataTable, tmpTable)
    end
    return dataTable
end
