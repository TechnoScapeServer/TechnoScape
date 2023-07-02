Thanks for purchasing cyber hud please

- if the seatbelt doesn't work add this to server.cfg setr game_enableFlyThroughWindscreen true
- if you want to use cyber notification you need to integrate to your server by using the event down below
- if you want to disable hud when another ui is active you can use the event down below
    
-- Client script usage
TriggerEvent("codem-cyberhud:Notify", message, type, time)

-- Server script usage
TriggerClientEvent("codem-cyberhud:Notify", source, message, type, time)


-- Types
error
succes
info


-- Hide hud
   TriggerEvent("codem-cyberhud:Displayhud", false)

-- Show hud    
   TriggerEvent("codem-cyberhud:Displayhud", true)   


-- For support please join Codem discord
https://discord.gg/zj3QsUfxWs