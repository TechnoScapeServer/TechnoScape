
-- EDIT DEFAULT METADATA FOR CERTAIN ITEMS


QBCore =  exports[Config.QBCoreResource]:GetCoreObject()

function defaultMetadata(source, itemData, currentMetadata)

local Player = QBCore.Functions.GetPlayer(source)
local info = currentMetadata

--------------------------------------------------------------
--EDIT STARTS HERE
--------------------------------------------------------------

                if itemData["name"] == "id_card" then
                    info.citizenid = Player.PlayerData.citizenid
                    info.firstname = Player.PlayerData.charinfo.firstname
                    info.lastname = Player.PlayerData.charinfo.lastname
                    info.birthdate = Player.PlayerData.charinfo.birthdate
                    info.gender = Player.PlayerData.charinfo.gender
                    info.nationality = Player.PlayerData.charinfo.nationality
                elseif itemData["name"] == "driver_license" then
                    info.firstname = Player.PlayerData.charinfo.firstname
                    info.lastname = Player.PlayerData.charinfo.lastname
                    info.birthdate = Player.PlayerData.charinfo.birthdate
                    info.type = "Class C Driver License"
                elseif itemData["name"] == "harness" then
                    info.uses = 20
                elseif itemData["name"] == "markedbills" then
                    info.worth = math.random(5000, 10000)
                elseif itemData["name"] == "labkey" then
                    info.lab = exports["qb-methlab"]:GenerateRandomLab()
                elseif itemData["name"] == "printerdocument" then
                    info.url = "https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png"
                end


--------------------------------------------------------------
--EDIT ENDS HERE
--------------------------------------------------------------

return info

end