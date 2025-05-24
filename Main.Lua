local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👾Trade Scam Script | Blox Fruit👾",
   LoadingTitle = "🔥Trade Scam Hub🔥",
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


