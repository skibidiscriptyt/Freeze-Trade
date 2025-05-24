local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👾Mivi | Blox Fruit👾",
   LoadingTitle = "🔥Mivi Hub🔥",
   LoadingSubtitle = "Made By: Gang Scripter Hub",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Example Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "ARkQD6RU2R", -- Just the code, no discord.gg/
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Trade Scam Script | Key System",
      Subtitle = "Link In Discord Server",
      Note = "Join Server From Misc Tab",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://raw.githubusercontent.com/skibidiscriptyt/monthlykeys/main/key.txt"}
   }
})

local MainTab = Window:CreateTab("👾Trade Scam")

-- TextBox for Target Username
local targetUsername = ""
MainTab:CreateInput({
    Name = "Target Username",
    PlaceholderText = "Enter target player's username",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        targetUsername = text
    end
})

-- Button: Add Best Items
MainTab:CreateButton({
    Name = "Add Best Items",
    Callback = function()
        print("Add best items for "..targetUsername)
        -- Your item transfer code here
    end
})

-- Button: Freeze Trade
MainTab:CreateButton({
    Name = "Freeze Trade",
    Callback = function()
        print("Freeze trade with "..targetUsername)
        -- Your freeze trade code here
    end
})

-- Button: Insert Noob Fruit
MainTab:CreateButton({
    Name = "Insert Noob Fruit",
    Callback = function()
        print("Insert noob fruit for "..targetUsername)
        -- Your insert noob fruit code here
    end
})

-- Button: Auto Accept Trade
MainTab:CreateButton({
    Name = "Auto Accept",
    Callback = function()
        print("Auto accept trade for "..targetUsername)
        -- Your auto accept code here
    end
})

local RaidBossTab = Window:CreateTab("🔥Raid Boss")

RaidBossTab:CreateButton({
    Name = "Start Auto Raid",
    Callback = function()
        print("Starting raid logic...")
        -- Put your raid script here
    end
})

local PermTab = Window:CreateTab("🍍Perm")

local permUsername = ""
PermTab:CreateInput({
    Name = "Player Username",
    PlaceholderText = "Enter player username",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        permUsername = text
    end
})

local permFruit = ""
PermTab:CreateInput({
    Name = "Permanent Fruit",
    PlaceholderText = "Enter fruit name (e.g., Dragon, Leopard)",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        permFruit = text
    end
})

PermTab:CreateButton({
    Name = "GET",
    Callback = function()
        if permUsername ~= "" and permFruit ~= "" then
            local saveData = {
                username = permUsername,
                fruit = permFruit
            }
            writefile("permfruit.txt", game:GetService("HttpService"):JSONEncode(saveData))
            print("Gave perm fruit: "..permFruit.." to "..permUsername)
            -- You can add real game logic here for giving fruit, this is just logging
        else
            warn("Please fill in both fields!")
        end
    end
})

if isfile("permfruit.txt") then
    local saved = game:GetService("HttpService"):JSONDecode(readfile("permfruit.txt"))
    print("Loaded saved fruit: "..saved.fruit.." for "..saved.username)
    -- Optionally give the fruit again or display it
end

local FarmTab = Window:CreateTab("🌾Farm")

FarmTab:CreateButton({
    Name = "Farm Level",
    Callback = function()
        print("Started auto-farming level...")
        -- Add your level farming automation here
    end
})

FarmTab:CreateButton({
    Name = "Farm Mastery",
    Callback = function()
        print("Started auto-farming mastery (Fruit/Sword)...")
        -- Add your mastery farming logic here
    end
})

FarmTab:CreateButton({
    Name = "Farm Chest",
    Callback = function()
        print("Teleporting to all chests...")
        -- Add logic to loop through and teleport to chest locations
    end
})

FarmTab:CreateButton({
    Name = "Farm Fruits",
    Callback = function()
        print("Checking for dropped fruits...")
        local fruitFound = false

        for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
            if obj:IsA("Tool") and obj.Name:lower():find("fruit") then
                fruitFound = true
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Handle.CFrame
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, obj.Handle, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, obj.Handle, 1)
                print("Collected fruit: "..obj.Name)
                break
            end
        end

        if not fruitFound then
            warn("NO FRUIT FOUND! HOPPING SERVER...")
            -- Add server hop code here:
            local Http = game:GetService("HttpService")
            local TPS = game:GetService("TeleportService")
            local PlaceID = game.PlaceId
            local servers = {}

            local function Hop()
                local req = request({
                    Url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Desc&limit=100"
                })
                local body = Http:JSONDecode(req.Body)
                for _,v in pairs(body.data) do
                    if v.playing < v.maxPlayers then
                        TPS:TeleportToPlaceInstance(PlaceID, v.id)
                        break
                    end
                end
            end

            Hop()
        end
    end
})
