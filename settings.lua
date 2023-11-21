local utils = require("utils")
local settings = {}

local OPERATING_SYSTEMS = { "Windows", "Linux / MacOS" }

settings.build = function ()

    local userSettings = {}

    local userSystem = {
        name = "",
        startApp = function(osName)
                utils.enableUTF8()
                utils.clearScreen(osName)
        end,
        turn = 1
    }

    local gameSettings = {
        turn = 1
    }

    userSettings[#userSettings+1] = userSystem
    userSettings[#userSettings+1] = gameSettings

    return userSettings
end

settings.selectOS = function()
    while true do
        print("Antes de começar sua aventura, informe seu sistema Operacional:")

        for i = 1, #OPERATING_SYSTEMS, 1 do
            print(string.format("%d. %s", i, OPERATING_SYSTEMS[i]))
        end

        local CHOSEN_SO = OPERATING_SYSTEMS[utils.ask()]

        if CHOSEN_SO then
            return CHOSEN_SO
        end
    end
end

return settings
