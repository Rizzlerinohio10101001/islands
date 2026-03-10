local key = getgenv().ScriptKey

if not key then
    game.Players.LocalPlayer:Kick("No key provided")
end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local username = Players.LocalPlayer.Name
local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

local url = "https://islandsting-production.up.railway.app/check?key="..key.."&hwid="..hwid.."&user="..username

local response = game:HttpGet(url)

local data = HttpService:JSONDecode(response)

if data.status == "valid" then

    loadstring(game:HttpGet("YOUR_MAIN_SCRIPT"))()

elseif data.status == "expired" then

    game.Players.LocalPlayer:Kick("Key expired")

elseif data.status == "blacklisted" then

    game.Players.LocalPlayer:Kick("You are blacklisted")

elseif data.status == "hwid_mismatch" then

    game.Players.LocalPlayer:Kick("HWID mismatch")

else

    game.Players.LocalPlayer:Kick("Invalid key")

end
