CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local streetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)

        local activityText = Config.Activity.roamingText

        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 2.23694

            if speed > Config.Activity.drivingSpeed then
                activityText = Config.Activity.drivingText
            elseif speed > Config.Activity.cruisingSpeed then
                activityText = Config.Activity.cruisingText
            else
                activityText = Config.Activity.stoppedText
            end
        end

        local playerName = GetPlayerName(PlayerId())
        SetDiscordAppId(Config.DiscordAppId)
        SetRichPresence(string.format("%s %s %s", playerName, activityText, streetName))

        SetDiscordRichPresenceAsset(Config.LargeIcon)
        SetDiscordRichPresenceAssetText(Config.LargeIconText)
        SetDiscordRichPresenceAction(Config.DiscordButton.index, Config.DiscordButton.text, Config.DiscordButton.link)

        Wait(3000)
    end
end)