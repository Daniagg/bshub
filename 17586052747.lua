local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
 
--// Services
 
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
--// Variables
 
local Camera = workspace.CurrentCamera
local Weapons = ReplicatedStorage.Weapons
local Debris = workspace.Debris
local RayIgnore = workspace.Ray_Ignore
local LocalPlayer = Players.LocalPlayer
 
local CurrentCamera = Camera
local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint
 
--// Aimbot Settings
 
local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 1.5
FOVring.Radius = 150
FOVring.Transparency = 1
FOVring.Color = Color3.fromRGB(200, 200, 200)
 
local AimSettings = {
    Enabled = false,
    TeamCheck = false,
    Smoothing = 1,
    EnableFOV = false
}
 
local ESPSettings = {
    Enabled = false,
    UseTeamColor = false,
    ChamsColor = Color3.fromRGB(200,200,200)
}
 
local Sounds = {
    KillSoundEnabled = false,
    HitSoundEnabled = false,    KillSound = nil,
    HitSound = nil,
}
 
--// Library
 
local Library = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


--// Window
 
local Window = Library:CreateWindow({
    Name = "ＨｉｖｒｉＷａｒｅ",
    LoadingTitle = ("Loading..."),
    LoadingSubtitle = "By vladhivirch666",
    Discord = {
        Enabled = true,
        Invite = "discord.gg/Tyq3YnM2yP", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Write key",
        Subtitle = "Get key in discord",
        Note = "discord.gg/Tyq3YnM2yP",
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        Key = {"bthb"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Home = Window:CreateTab("Home", 4483362458) -- Title, Image
local Combat = Window:CreateTab("Combat", 4483362458) -- Title, Image
local Misc = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Visuals = Window:CreateTab("Visuals", 4483362458) -- Title, Image
local TP = Window:CreateTab("TP", 4483362458) -- Title, Image
 
--// Version
 
local Version = "1.3.0"
 
--// Game
 
if true then
    function GetClosestPlayer(CFrame)
        local Ray = Ray.new(CFrame.Position, CFrame.LookVector).Unit
 
        local Target = nil
        local Mag = math.huge
 
        for _, v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= LocalPlayer and (v.Team ~= LocalPlayer.Team or (not AimSettings.TeamCheck)) then
                local Position = v.Character.Head.Position
                local MagBuff = (Position - Ray:ClosestPoint(Position)).Magnitude
                if MagBuff < Mag then
                    Mag = MagBuff
                    Target = v
                end
            end
        end
 
        return Target
    end
 
    do
        --// Home
        Home:CreateLabel("Version: ".. Version)
    end

    do
          --// TP
                function TP:TeleportTo(position)
                local player = game.Players.LocalPlayer
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
                end
                TP:CreateSection("Players")
                TP:CreateToggle({
                    Name = "TP To Nearest Enemy",
                    CurrentValue = false,
                    Flag = "TPEN",
                    Callback = function(Value)
                        _G.TPEN = Value
                end,
        })      
                TP:CreateSection("Vertigo")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-123, 1191, 26))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-174, 1174, 181))
                    end,
        })
                        TP:CreateSection("Nuke")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-1524, -174, -950))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-123, 1191, 26))
                    end,
        })
                        TP:CreateSection("Aztec")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-1329, 1560, -270))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-1680, 2566, -300))
                    end,
        })
                        TP:CreateSection("Train")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-850, 985, 116))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-1174, 990, -118))
                    end,
        })

                        TP:CreateSection("Inferno")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-356, 884, -892))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-686, 874, -774))
                    end,
        })

                        TP:CreateSection("Barcelona")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(71, -20, 145))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(112, -25, -206))
                    end,
        })

                        TP:CreateSection("Mirage")
                    TP:CreateButton({
                    Name = "CT Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(-46, 49, 106))
                    end,
        })
                    TP:CreateButton({
                    Name = "T Base",
                    Callback = function()
                        TP:TeleportTo(Vector3.new(172, 56, -15))
                    end,
        })

    end
 
    do
        --// Combat
 
        Combat:CreateSection("AimBot")
        Combat:CreateToggle({
            Name = "AimBot",
            CurrentValue = false,
            Flag = "Aimbot",
            Callback = function(Value)
                AimSettings.Enabled = true
            end,
        })
 
        Combat:CreateSection("Settings")
        Combat:CreateSlider({
            Name = "ZOV Radius",
            Range = {0, 2000},
            Increment = 1,
            CurrentValue = 150,
            Flag = "FOVRadius", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                FOVring.Radius = Value
            end,
        })
 
        Combat:CreateColorPicker({
            Name = "ZOV Color",
            Color = Color3.fromRGB(200,200,200),
            Flag = "FOVColor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                FOVring.Color = Value or Color3.fromRGB(200,200,200)
            end
        })
 
        Combat:CreateToggle({
            Name = "Use ZOV",
            CurrentValue = false,
            Flag = "UseFOV",
            Callback = function(Value)
                AimSettings.EnableFOV = Value
            end,
        })
 
        Combat:CreateToggle({
            Name = "Team Chpeck",
            CurrentValue = false,
            Flag = "TeamCheck",
            Callback = function(Value)
                AimSettings.TeamCheck = Value
            end,
        })
 
        Combat:CreateSection("Character")
        Combat:CreateToggle({
            Name = "SpinBot",
            CurrentValue = false,
            Flag = "Spinbot",
            Callback = function(Value)
                _G.SpinBot = Value
            end,
        })
 
        Combat:CreateSection("Settings")
        Combat:CreateSlider({
            Name = "SpinBot Settings",
            Range = {0, 15},
            Increment = 1,
            CurrentValue = 5,
            Flag = "FOVRadius", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.Speed = Value
            end,
        })
    end
 
    do
        --// Misc

        Misc:CreateSection("Exploits")
        Misc:CreateButton({
            Name = "Break the game for everyone(shoot)",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Bullets") then
                        Weapon:FindFirstChild("Bullets").Value = 999999
                        for _, Bullets in ipairs(Weapon:FindFirstChild("Bullets"):GetChildren()) do
                            Bullets.Value = 999999
                        end
                    end 
                end
            end,
        })
 
        Misc:CreateSection("Guns")
        Misc:CreateButton({
            Name = "Rapid fire",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("FireRate") then
                        Weapon:FindFirstChild("FireRate").Value = 0
                    end 
                end
            end,
        })

        Misc:CreateButton({
            Name = "No Spread",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Spread") then
                        Weapon:FindFirstChild("Spread").Value = 0
                        for _, Spread in ipairs(Weapon:FindFirstChild("Spread"):GetChildren()) do
                            Spread.Value = 0
                        end
                    end 
                end
            end,
        })

        Misc:CreateButton({
            Name = "Double Tap",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Bullets") then
                        Weapon:FindFirstChild("Bullets").Value = 2
                        for _, Bullets in ipairs(Weapon:FindFirstChild("Bullets"):GetChildren()) do
                            Bullets.Value = 2
                        end
                    end 
                end
            end,
        })

        Misc:CreateButton({
            Name = "Maximum hit chance(LAG!)",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Bullets") then
                        Weapon:FindFirstChild("Bullets").Value = 10
                        for _, Bullets in ipairs(Weapon:FindFirstChild("Bullets"):GetChildren()) do
                            Bullets.Value = 10
                        end
                    end 
                end
            end,
        })
 
        Misc:CreateButton({
            Name = "Instant Reload Time",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("ReloadTime") then
                        Weapon:FindFirstChild("ReloadTime").Value = 0.05
                    end 
                end
            end,
        })
 
        Misc:CreateButton({
            Name = "Instant Equip Time",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("EquipTime") then
                        Weapon:FindFirstChild("EquipTime").Value = 0.05
                    end 
                end
            end,
        })
 
        Misc:CreateButton({
            Name = "Infinite Ammo",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Ammo") and Weapon:FindFirstChild("StoredAmmo") then
                        Weapon:FindFirstChild("Ammo").Value = 9999999999
                        Weapon:FindFirstChild("StoredAmmo").Value = 1488
                    end 
                end
            end,
        })

        Misc:CreateButton({
            Name = "Auto Pistols And Snipers",
            Callback = function()
                for _, Weapon in ipairs(Weapons:GetChildren()) do
                    if Weapon:FindFirstChild("Auto") then
                        Weapon:FindFirstChild("Auto").Value = 1
                        for _, Auto in ipairs(Weapon:FindFirstChild("Auto"):GetChildren()) do
                            Auto.Value = 1
                        end
                    end 
                end
            end,
        })
 
        Misc:CreateSection("Sounds")
        Misc:CreateToggle({
            Name = "Hit Sound(no work)",
            CurrentValue = false,
            Flag = "HitSound", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                Sounds.HitSoundEnabled = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Kill Sound(just like hit sounds)",
            CurrentValue = false,
            Flag = "KillSound", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                Sounds.KillSoundEnabled = Value
            end,
        })
 
        Misc:CreateDropdown({
            Name = "Hit Sounds",
            Options = {'Bameware', 'Jonkler', 'Bubble', 'Pick', 'Pop', 'Rust', 'Skeet', 'Neverlose', 'Minecraft'},
            CurrentOption = {"Bubble"},
            MultipleOptions = false,
            Flag = "HitSounds", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Option)
                if Option == "Bameware" then
                    Sounds.HitSound = 3124331820
                elseif Option == "Jonkler" then
                    Sounds.HitSound = 140612138472947
                elseif Option == "Bubble" then
                    Sounds.HitSound = 6534947588
                elseif Option == "Pick" then
                    Sounds.HitSound = 1347140027    
                elseif Option == "Pop" then
                    Sounds.HitSound = 198598793
                elseif Option == "Rust" then
                    Sounds.HitSound = 1255040462 
                elseif Option == "Skeet" then
                    Sounds.HitSound = 5633695679
                elseif Option == "Neverlose" then
                    Sounds.HitSound = 6534948092
                elseif Option == "Minecraft" then
                    Sounds.HitSound = 4018616850
                end
                print(Option)
                print(Sounds.HitSound)
            end,
        })
 
        Misc:CreateDropdown({
            Name = "Kill Sounds",
            Options = {'Bameware', 'Jonkler', 'Bubble', 'Pick', 'Pop', 'Rust', 'Skeet', 'Neverlose', 'Minecraft'},
            CurrentOption = {"Bubble"},
            MultipleOptions = false,
            Flag = "KillSounds", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Option)
                if Option == "Bameware" then
                    Sounds.KillSound = 3124331820
                elseif Option == "Jonkler" then
                    Sounds.KillSound = 140612138472947
                elseif Option == "Bubble" then
                    Sounds.KillSound = 6534947588
                elseif Option == "Pick" then
                    Sounds.KillSound = 1347140027    
                elseif Option == "Pop" then
                    Sounds.KillSound = 198598793
                elseif Option == "Rust" then
                    Sounds.KillSound = 1255040462 
                elseif Option == "Skeet" then
                    Sounds.KillSound = 5633695679
                elseif Option == "Neverlose" then
                    Sounds.KillSound = 6534948092
                elseif Option == "Minecraft" then
                    Sounds.KillSound = 4018616850
                end
            end,
        })
 
        Misc:CreateSection("Effects")
        Misc:CreateToggle({
            Name = "Remove Scope",
            CurrentValue = false,
            Flag = "RemoveScope",
            Callback = function(Value)
                _G.RemoveScope = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Remove Flash",
            CurrentValue = false,
            Flag = "RemoveFlash",
            Callback = function(Value)
                _G.RemoveFlash = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Remove Smoke",
            CurrentValue = false,
            Flag = "RemoveSmoke",
            Callback = function(Value)
                _G.RemoveSmoke = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Remove Blood",
            CurrentValue = false,
            Flag = "RemoveBlood",
            Callback = function(Value)
                _G.RemoveBlood = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Remove Bullets Holes",
            CurrentValue = false,
            Flag = "RemoveBulletsHoles",
            Callback = function(Value)
                _G.RemoveBulletsHoles = Value
            end,
        })
 
        Misc:CreateSection("Movement")
        Misc:CreateToggle({
            Name = "Fast Bhop",
            CurrentValue = false,
            Flag = "Bhop", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.Bhop = Value
            end,
        })
 
        Misc:CreateSlider({
            Name = "Bhop Speed",
            Range = {0, 350},
            Increment = 1,
            CurrentValue = 100,
            Flag = "BhopSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.BhopSpeed = Value
            end,
        })
 
        Misc:CreateSection("Character")
        Misc:CreateToggle({
            Name = "Fly",
            CurrentValue = false,
            Flag = "Fly", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.Fly = Value
            end,
        })
 
        Misc:CreateToggle({
            Name = "Noclip",
            CurrentValue = false,
            Flag = "Noclip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.Noclip = Value
            end,
        })
 
        Misc:CreateSlider({
            Name = "Fly Speed",
            Range = {0, 120},
            Increment = 1,
            CurrentValue = 16,
            Flag = "FlySpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.FlySpeed = Value
            end,
        })
 
        Misc:CreateSection("Stuff")
        Misc:CreateButton({
            Name = "Infinite Cash",
            Callback = function()
                RunService.RenderStepped:Connect(function()
                    if LocalPlayer and LocalPlayer.Parent then
                        LocalPlayer.Cash.Value = 9550
                    end
                    task.wait()
                end)
            end,
        })

        Misc:CreateSlider({
            Name = "Kills",
            Range = {0, 1488},
            Increment = 1,
            CurrentValue = 0,
            Flag = "Kills", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.kills = Value
            end,
        })

        Misc:CreateSlider({
            Name = "MVPs",
            Range = {0, 1488},
            Increment = 1,
            CurrentValue = 0,
            Flag = "MVPs", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.MVPS = Value
            end,
        })

    end
 
    do
        --// Visuals
 
        Visuals:CreateSection("Cumera")
        Visuals:CreateSlider({
            Name = "Field Of View",
            Range = {0, 300},
            Increment = 1,
            CurrentValue = 90,
            Flag = "FieldOfView", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.FieldOfView = Value
            end,
        })
 
        Visuals:CreateSection("Character")
        Visuals:CreateToggle({
            Name = "Third Person",
            CurrentValue = false,
            Flag = "ThirdPerson",
            Callback = function(Value)
                _G.ThirdPerson = Value
            end,
        })
 
        Visuals:CreateSlider({
            Name = "Third Person Distance",
            Range = {0, 50},
            Increment = 1,
            CurrentValue = 10,
            Flag = "ThirdPersonDistance", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.ThirdPersonDistance = Value
            end,
        })
 
        Visuals:CreateSection("Players")

        Visuals:CreateButton({
            Name = "ESP",
            Callback = function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Daniagg/ESP.lua/refs/heads/main/esp.lua'))()
            end,
        })
 
        Visuals:CreateToggle({
            Name = "Chams",
            CurrentValue = false,
            Flag = "Chams",
            Callback = function(Value)
                ESPSettings.Enabled = Value
            end,
        })
 
        Visuals:CreateToggle({
            Name = "Use Team Color",
            CurrentValue = false,
            Flag = "TeamCheckChams",
            Callback = function(Value)
                ESPSettings.UseTeamColor = Value
            end,
        })
 
        Visuals:CreateColorPicker({
            Name = "Chams Color",
            Color = Color3.fromRGB(200,200,200),
            Flag = "ChamsColor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                ESPSettings.ChamsColor = Value
            end
        })
 
        Visuals:CreateSection("Arms")
        Visuals:CreateToggle({
            Name = "Arms Chams",
            CurrentValue = false,
            Flag = "ArmsChams",
            Callback = function(Value)
                _G.ArmsChams = Value
            end,
        })

        Visuals:CreateSlider({
            Name = "x",
            Range = {-10, 10},
            Increment = 1,
            CurrentValue = 0,
            Flag = "ARMXX", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.ARMXX = Value
            end,
        })

        Visuals:CreateSlider({
            Name = "y",
            Range = {-10, 10},
            Increment = 1,
            CurrentValue = 0,
            Flag = "ARMYY", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.ARMYY = Value
            end,
        })

        Visuals:CreateSlider({
            Name = "z",
            Range = {-10, 10},
            Increment = 1,
            CurrentValue = 0,
            Flag = "ARMZZ", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.ARMZZ = Value
            end,
        })
 
        Visuals:CreateSection("Guns")
        Visuals:CreateToggle({
            Name = "Guns Chams",
            CurrentValue = false,
            Flag = "GunsChams",
            Callback = function(Value)
                _G.GunsChams = Value
            end,
        })
 
        Visuals:CreateColorPicker({
            Name = "Guns Chams Color",
            Color = Color3.fromRGB(200,200,200),
            Flag = "GunsChamsColor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                _G.ChamsColor = Value
            end
        })
        Visuals:CreateSection("World")
        Visuals:CreateColorPicker({
            Name = "World Color",
            Color = Color3.fromRGB(255, 255, 255),
            Flag = "WRLDCOLOR",
            Callback = function(Value)
                _G.WRLDCOLOR = Value
            end
        })

        Visuals:CreateToggle({
            Name = "Bullet Tracer(VERYYYY BAD WORK)",
            CurrentValue = false,
            Flag = "BT",
            Callback = function(Value)
                _G.BT = Value
            end,
        })
    end
 
end

RunService.RenderStepped:Connect(function()
    if _G.BT == true then                    
        local Pressed2 = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        if Pressed2 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Daniagg/BulletTracer/refs/heads/main/BT.lua"))()
        end
    end
end)
 
LocalPlayer.Additionals.TotalDamage.Changed:Connect(function(Value)
    if Sounds.HitSoundEnabled == true then
        local HitSound = Instance.new("Sound")
		HitSound.Parent = game:GetService("SoundService")
		HitSound.SoundId = 'rbxassetid://'..Sounds.HitSound
		HitSound.Volume = 10
		HitSound:Play()
    end
end)
 
LocalPlayer.Status.Kills.Changed:Connect(function(Value)
    if Sounds.KillSoundEnabled == true then
        local KillSound = Instance.new("Sound")
		KillSound.Parent = game:GetService("SoundService")
		KillSound.SoundId = 'rbxassetid://'..Sounds.KillSound
		KillSound.Volume = 49
		KillSound:Play()
    end
end)
 
RunService.RenderStepped:Connect(function()
    if _G.RemoveScope == true then
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.ImageTransparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Size = UDim2.new(2,0,2,0)
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Position = UDim2.new(-0.5,0,-0.5,0)
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.ImageTransparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.Blur.ImageTransparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame1.Transparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame2.Transparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame3.Transparency = 1
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame4.Transparency = 1
    else
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.ImageTransparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Size = UDim2.new(1,0,1,0)
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Position = UDim2.new(0,0,0,0)
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.ImageTransparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.Blur.ImageTransparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame1.Transparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame2.Transparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame3.Transparency = 0
        LocalPlayer.PlayerGui.GUI.Crosshairs.Frame4.Transparency = 0
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.RemoveFlash == true then
        LocalPlayer.PlayerGui.Blnd.Enabled = false
    else
        LocalPlayer.PlayerGui.Blnd.Enabled = true
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.RemoveBulletsHoles == true then
        for i,v in pairs(Debris:GetChildren()) do
            if v.Name == "Bullet" then
                v:Remove()
            end
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.RemoveSmoke == true then
        for i,v in pairs(RayIgnore.Smokes:GetChildren()) do
            if v.Name == "Smoke" then
                v:Remove()
            end
        end
    end                    
    task.wait()
end)
RunService.RenderStepped:Connect(function()
    if _G.RemoveBlood == true then
        for i,v in pairs(Debris:GetChildren()) do
            if v.Name == "SurfaceGui" then
                v:Remove()
            end
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.Noclip == true then
        for _, Instance in pairs(LocalPlayer.Character:GetChildren()) do
            if Instance:IsA("BasePart") and Instance.CanCollide == true then
                Instance.CanCollide = false
            end
        end
    else
        for _, Instance in pairs(LocalPlayer.Character:GetChildren()) do
            if Instance:IsA("BasePart") and Instance.CanCollide == true then
                Instance.CanCollide = true
            end
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.Fly == true then
        if LocalPlayer.Character ~= nil then
            local Speed = _G.FlySpeed or 16
            local Velocity = Vector3.new(0, 1, 0)
 
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                Velocity = Velocity + (Camera.CoordinateFrame.lookVector * Speed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                Velocity = Velocity + (Camera.CoordinateFrame.rightVector * -Speed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                Velocity = Velocity + (Camera.CoordinateFrame.lookVector * -Speed)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                Velocity = Velocity + (Camera.CoordinateFrame.rightVector * Speed)
            end
 
            LocalPlayer.Character.HumanoidRootPart.Velocity = Velocity
            LocalPlayer.Character.Humanoid.PlatformStand = true
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.Bhop == true then
        if LocalPlayer.Character ~= nil and UserInputService:IsKeyDown(Enum.KeyCode.Space) and LocalPlayer.PlayerGui.GUI.Main.GlobalChat.Visible == false then
            LocalPlayer.Character.Humanoid.Jump = true
            local Speed = _G.BhopSpeed or 100
            local Dir = Camera.CFrame.LookVector * Vector3.new(1,0,1)
            local Move = Vector3.new()
 
            Move = UserInputService:IsKeyDown(Enum.KeyCode.W) and Move + Dir or Move
            Move = UserInputService:IsKeyDown(Enum.KeyCode.S) and Move - Dir or Move
            Move = UserInputService:IsKeyDown(Enum.KeyCode.D) and Move + Vector3.new(-Dir.Z,0,Dir.X) or Move
            Move = UserInputService:IsKeyDown(Enum.KeyCode.A) and Move + Vector3.new(Dir.Z,0,-Dir.X) or Move
            if Move.Unit.X == Move.Unit.X then
                Move = Move.Unit
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(Move.X * Speed, LocalPlayer.Character.HumanoidRootPart.Velocity.Y, Move.Z * Speed)
            end
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if AimSettings.Enabled == true then            
        local Pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        if Pressed then
            local CurrentTarget = GetClosestPlayer(Camera.CFrame)
            if CurrentTarget ~= nil then
                local SSHeadPoint = Camera:WorldToScreenPoint(CurrentTarget.Character.Head.Position)
                SSHeadPoint = Vector2.new(SSHeadPoint.X, SSHeadPoint.Y)
                if (SSHeadPoint - FOVring.Position).Magnitude < FOVring.Radius then
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, CurrentTarget.Character.Head.Position), AimSettings.Smoothing)
                end
            end
        end
    end

 
    if AimSettings.EnableFOV then
        FOVring.Visible = true
        FOVring.Position = workspace.CurrentCamera.ViewportSize/2
    else
        FOVring.Visible = false
    end
    task.wait()
end)
 
 
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character ~= nil and LocalPlayer.Character.Humanoid.Health > 0 then
        if _G.SpinBot then
            LocalPlayer.Character.Humanoid.AutoRotate = false
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(_G.Speed or 50), 0)
        else
            LocalPlayer.Character.Humanoid.AutoRotate = true
        end
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.ThirdPerson == true then
        if LocalPlayer.CameraMinZoomDistance ~= _G.ThirdPersonDistance or 10 then
            LocalPlayer.CameraMinZoomDistance = _G.ThirdPersonDistance or 10
            LocalPlayer.CameraMaxZoomDistance = _G.ThirdPersonDistance or 10
            workspace.ThirdPerson.Value = true
        end
    else
        if LocalPlayer.Character ~= nil then
            LocalPlayer.CameraMinZoomDistance = 0
            LocalPlayer.CameraMaxZoomDistance = 0
            workspace.ThirdPerson.Value = false
        end
    end
    task.wait()
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        LocalPlayer.Stats.xx.Value = _G.ARMXX or 0
        task.wait()
    end
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        LocalPlayer.Stats.yy.Value = _G.ARMYY or 0
        task.wait()
    end
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        LocalPlayer.Stats.zz.Value = _G.ARMZZ or 0
        task.wait()
    end
end)
 
RunService.RenderStepped:Connect(function()
    Camera.FieldOfView = _G.FieldOfView or 80
    task.wait()
end)

RunService.RenderStepped:Connect(function()
    Tpfunc = _G.TPEN
        if Tpfunc then
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Teams = game:GetService("Teams")

        function findClosestPlayer()
          local closestPlayer = nil
          local closestDistance = math.huge

          for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Team ~= nil then
              if player.Character and player.Character.PrimaryPart then
                local distance = (player.Character.PrimaryPart.Position - LocalPlayer.Character.PrimaryPart.Position).Magnitude
                if player.Team ~= LocalPlayer.Team then
                  if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                  end
                end
              end
            end
          end

          return closestPlayer
        end

        -- Ищем ближайшего игрока
        local closestPlayer = findClosestPlayer()

        if closestPlayer then
          local targetX = closestPlayer.Character.PrimaryPart.Position.X
          local targetY = closestPlayer.Character.PrimaryPart.Position.Y
          local targetZ = closestPlayer.Character.PrimaryPart.Position.Z

          if LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetX-2, targetY -1, targetZ)
        		print("Перемещен к ближайшему игроку")
          end
        end
        task.wait(0.1)
    end
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        LocalPlayer.Status.Kills.Value = _G.kills or 0
        task.wait()
    end
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        Lighting.ColorCorrection.TintColor = _G.WRLDCOLOR or Color3.fromRGB(255, 255, 255)
        task.wait()
    end
end)

RunService.RenderStepped:Connect(function()
    if Stats then
        LocalPlayer.Status.MVPs.Value = _G.MVPS or 0
        task.wait()
    end
end)

RunService.RenderStepped:Connect(function()
    if _G.GunsChams == true then
        for _, Stuff in ipairs(workspace.Camera:GetChildren()) do
            if Stuff:IsA("Model") and Stuff.Name == "Arms" then
                for _, AnotherStuff in ipairs(Stuff:GetChildren()) do
                    if AnotherStuff:IsA("MeshPart") or AnotherStuff:IsA("BasePart") then
                        AnotherStuff.Color = _G.ChamsColor or Color3.fromRGB(200,200,200)
                        AnotherStuff.Material = Enum.Material.ForceField
                    end
                end
            end
        end
    else
        for _, Stuff in ipairs(workspace.Camera:GetChildren()) do
            if Stuff:IsA("Model") and Stuff.Name == "Arms" then
                for _, AnotherStuff in ipairs(Stuff:GetChildren()) do
                    if AnotherStuff:IsA("MeshPart") or AnotherStuff:IsA("BasePart") then
                        AnotherStuff.Color = Color3.fromRGB(200,200,200)
                        AnotherStuff.Material = Enum.Material.Plastic
                    end
                end
            end
        end            
    end
    task.wait()
end)
 
RunService.RenderStepped:Connect(function()
    if _G.ArmsChams == true then
        for _, Stuff in ipairs(workspace.Camera:GetChildren()) do
            if Stuff:IsA("Model") and Stuff.Name == "Arms" then
                for _, AnotherStuff in ipairs(Stuff:GetChildren()) do
                    if AnotherStuff:IsA("Model") and AnotherStuff.Name ~= "AnimSaves" then
                        for _, Arm in ipairs(AnotherStuff:GetChildren()) do
                            if Arm:IsA("BasePart") then
                                Arm.Transparency = 1
                                for _, StuffInArm in ipairs(Arm:GetChildren()) do
                                    if StuffInArm:IsA("BasePart") then
                                        StuffInArm.Material = Enum.Material.ForceField
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end  
    else
        for _, Stuff in ipairs(workspace.Camera:GetChildren()) do
            if Stuff:IsA("Model") and Stuff.Name == "Arms" then
                for _, AnotherStuff in ipairs(Stuff:GetChildren()) do
                    if AnotherStuff:IsA("Model") and AnotherStuff.Name ~= "AnimSaves" then
                        for _, Arm in ipairs(AnotherStuff:GetChildren()) do
                            if Arm:IsA("BasePart") then
                                Arm.Transparency = 0
                                for _, StuffInArm in ipairs(Arm:GetChildren()) do
                                    if StuffInArm:IsA("BasePart") then
                                        StuffInArm.Material = Enum.Material.Plastic
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    task.wait()
end)

RunService.RenderStepped:Connect(function()
    for _, Player in ipairs(Players:GetChildren()) do
        if ESPSettings.Enabled == true then
            if ESPSettings.UseTeamColor == true then
                if Player.Character:FindFirstChild("Highlight") then
                    Player.Character.Highlight.FillColor = Player.TeamColor.Color
                else
                    local Highlight = Instance.new("Highlight", Player.Character)
                    Highlight.FillColor = Player.TeamColor.Color
                end
            else
                if Player.Character:FindFirstChild("Highlight") then
                    Player.Character.Highlight.FillColor = ESPSettings.ChamsColor or Color3.fromRGB(200,200,200)
                else
                    local Highlight = Instance.new("Highlight", Player.Character)
                    Highlight.FillColor = ESPSettings.ChamsColor or Color3.fromRGB(200,200,200)
                end
            end
        else
            if Player.Character:FindFirstChild("Highlight") then
                Player.Character.Highlight:Destroy()
            end
        end
    end
    task.wait()
end)

RunService.RenderStepped:Connect(function()
    for _, Player in ipairs(Players:GetChildren()) do
        if ESPSettings.box == true then
            
        else
        
        end
    end
    task.wait()
end)
