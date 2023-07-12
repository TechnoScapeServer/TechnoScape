
--======================================================================================================================================================
--=======================================================To USE AS An Export============================================================================
--======================================================================================================================================================

local CurrentTextOpacity = 255
local IsTextVisible = false


local function DrawAdvancedText(x, y, sc, text, r, g, b, a, font, jus)
    SetTextFont(font)
    SetTextScale(sc, sc)
    SetTextJustification(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y - 0.005)
end

-- local function DrawUIElements()
--     DrawRect(0.5, 0.92, 0.40, 0.07, 0, 0, 0, 150)
--     DrawRect(0.5, 0.965, 0.40, 0.0025, 180, 180, 180, 150)
-- end

local function HideText()
    IsTextVisible = false
end

local function ShowText(text, duration)
    IsTextVisible = true
    local splittext1 = string.sub(text, 0, 98)
    local splittext2 = string.sub(text, 99)

    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        while IsTextVisible do
            Citizen.Wait(0)

            -- Calculate the elapsed time
            local elapsedTime = GetGameTimer() - startTime

            -- Draw UI elements
            --DrawUIElements()

            -- Draw text with current opacity
            DrawAdvancedText(0.5, 0.91, 0.6, tostring(splittext1), 3,216,243, CurrentTextOpacity, 6, 0)
            DrawAdvancedText(0.5, 0.94, 0.6, tostring(splittext2), 3,216,243, CurrentTextOpacity, 6, 0)

            -- Check if the specified duration has passed
            if GetGameTimer() - startTime >= duration then
                IsTextVisible = false
            end
        end
    end)
end


-- Exported functions
exports('showTextUI', ShowText)


-- RegisterCommand('exportdialogue', function()
--     ShowText('~r~ Person: '..'~s~ This is an example text', 5000) -- Display the text for 5 seconds (5000 milliseconds)
-- end)


--======================================================================================================================================================
--=======================================================To USE AS A TRIGGER EVENT======================================================================
--======================================================================================================================================================

RegisterNetEvent('tsrp-dialogue:showtext', function(text)
    IsTextVisible = true
    local splittext1 = string.sub(text, 0, 98)
    local splittext2 = string.sub(text, 99)

    -- Draw UI elements
    --DrawUIElements()

    DrawAdvancedText(0.9, 0.1, 0.6, tostring(splittext1), 255, 255, 0, CurrentTextOpacity, 6, 0)
    DrawAdvancedText(0.9, 0.1, 0.6, tostring(splittext2), 255, 255, 0, CurrentTextOpacity, 6, 0)
end)

RegisterNetEvent('tsrp-dialogue:hidetext', HideText)


RegisterCommand('hidetext', HideText)



-- Example usage

--[[
RegisterCommand('triggerdialogue', function()
    test = true
    while test do
        Wait(0)
    TriggerEvent('tsrp-dialogue:showtext', "This is an Example")
    end

    TriggerEvent('tsrp-dialogue:hidetext')
end)

RegisterCommand('hidedialogue', function()
    test = false
    TriggerEvent('tsrp-dialogue:hidetext')
end)
--]]
