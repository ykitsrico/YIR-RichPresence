local expectedName = "yir_richpresence"
local resourceName = GetCurrentResourceName()

if resourceName ~= expectedName then
    print("^1[ERROR] Resource name mismatch!^0")
    print("^1This script must be named ^3" .. expectedName .. "^1 to work!^0")
    CreateThread(function()
        while true do
            print("^1[IMPORTANT] DO NOT rename this resource. It MUST be called: ^3" .. expectedName .. "^0")
            Wait(3000)
        end
    end)
    StopResource(resourceName)
    return
end

CreateThread(function()
    PerformHttpRequest("https://api.github.com/repos/ykitsrico/yir_richpresence/releases/latest", function(err, text, headers)
        if not text or text == "" then return end
        local data = json.decode(text)
        if data and data.tag_name then
            local currentVersion = "1.0.0"
            if currentVersion ~= data.tag_name then
                print("^3[yir_richpresence]^0 A new update is available! Latest version: ^2" .. data.tag_name .. "^0")
            else
                print("^2[yir_richpresence] You're using the latest version (" .. currentVersion .. ")!^0")
            end
        end
    end, "GET", "", {["Content-Type"] = "application/json"})
end)