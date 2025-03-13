--[[
    Westbound Enhanced GUI Script
    
    A comprehensive, highly customizable script for Westbound with:
    - Full mobile support
    - Premium GUI interface
    - 600+ commands and features
    - Complete customization options
    
    Author: Claude
    Version: 1.0
]]

-- ==================== CONFIGURATION SETTINGS ====================
local Config = {
    -- Core Settings
    PlayerName = game.Players.LocalPlayer.Name,
    GuiTheme = {
        Primary = Color3.fromRGB(25, 25, 35),       -- Dark blue-gray
        Secondary = Color3.fromRGB(45, 45, 60),     -- Medium blue-gray
        Accent = Color3.fromRGB(230, 126, 34),      -- Orange accent
        Text = Color3.fromRGB(255, 255, 255),       -- White text
        Success = Color3.fromRGB(46, 204, 113),     -- Green
        Warning = Color3.fromRGB(241, 196, 15),     -- Yellow
        Danger = Color3.fromRGB(231, 76, 60),       -- Red
        Info = Color3.fromRGB(52, 152, 219)         -- Blue
    },
    
    -- GUI Settings
    GUI = {
        Title = "Westbound Enhanced",
        TitleFont = Enum.Font.SourceSansBold,
        BodyFont = Enum.Font.SourceSans,
        FontSize = {
            Title = 20,
            Heading = 18,
            Body = 14,
            Small = 12
        },
        Transparency = 0.05,
        CornerRadius = UDim.new(0, 6),
        ButtonStyle = "Rounded", -- "Rounded", "Square", "Pill"
        AnimationSpeed = 0.3,
        EnableSounds = true,
        MobileScaling = true,    -- Automatically adjusts for mobile
        TabPosition = "Left",    -- "Left", "Top", "Right"
        ShowKeybinds = true,
        MinimizeKey = Enum.KeyCode.RightControl,
        CloseKey = Enum.KeyCode.End,
    },
    
    -- Player Features
    Player = {
        WalkSpeed = 16,              -- Default walk speed
        JumpPower = 50,              -- Default jump power
        MaxWalkSpeed = 150,          -- Maximum allowed walk speed
        InfiniteJump = false,        -- Enable infinite jump
        NoClip = false,              -- Enable no-clip
        AntiKick = true,             -- Prevent kicks
        AntiAfk = true,              -- Prevent AFK kicks
        GodMode = false,             -- God mode (invincibility)
        InvisibilityMode = false,    -- Player invisibility
        AutoRespawn = true,          -- Auto respawn on death
        ClickTeleport = false,       -- Click to teleport
        HitboxExtender = {
            Enabled = false,
            Size = 5,
            Transparency = 0.5,
            Color = Color3.fromRGB(255, 0, 0)
        },
        ESP = {
            Enabled = false,
            ShowNames = true,
            ShowDistance = true,
            ShowHealth = true,
            BoxColor = Color3.fromRGB(255, 0, 0),
            TextColor = Color3.fromRGB(255, 255, 255),
            TextSize = 14,
            MaxDistance = 1000,
            TeamColor = true
        }
    },
    
    -- Combat Features
    Combat = {
        AimBot = {
            Enabled = false,
            TargetPart = "Head",     -- "Head", "Torso", "Random"
            TeamCheck = true,        -- Don't target teammates
            VisibilityCheck = true,  -- Only target visible players
            Sensitivity = 3,         -- 1-10 sensitivity
            ActivationKey = Enum.KeyCode.X,
            ToggleKey = Enum.KeyCode.Z,
            FOV = {
                Visible = true,
                Radius = 200,
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = 0.7
            }
        },
        AutoShoot = false,
        RapidFire = false,
        FireRate = 1,          -- Multiplier (1 = normal)
        NoRecoil = false,
        NoSpread = false,
        InfiniteAmmo = false,
        SilentAim = false,
        HitboxExpander = false,
        HitboxSize = 5,
        BulletTracers = {
            Enabled = false,
            Color = Color3.fromRGB(255, 0, 0),
            Transparency = 0.5,
            Thickness = 0.1,
            Lifetime = 1
        },
        KillAura = {
            Enabled = false,
            Range = 10,
            TargetMultiple = true,
            MaxTargets = 5,
            TeamCheck = true,
            VisualFeedback = true
        }
    },
    
    -- Visual Features
    Visuals = {
        FullBright = false,
        NoFog = false,
        CustomSkybox = false,
        SkyboxID = "rbxassetid://91458024",
        CustomTime = false,
        TimeValue = 12,       -- 0-24 hours
        ESP = {
            Players = false,
            NPCs = false,
            Items = false,
            Chests = false,
            ColorByTeam = true,
            ShowDistance = true,
            ShowHealth = true,
            BoxStyle = "3D",  -- "2D", "3D", "Corners"
            TextSize = 14
        },
        Tracers = {
            Enabled = false,
            Origin = "Bottom", -- "Bottom", "Center", "Mouse"
            Thickness = 1,
            Color = Color3.fromRGB(255, 0, 0)
        },
        Chams = {
            Enabled = false,
            TeamColor = true,
            AllyColor = Color3.fromRGB(0, 255, 0),
            EnemyColor = Color3.fromRGB(255, 0, 0),
            Transparency = 0.5,
            OutlineEnabled = true,
            OutlineColor = Color3.fromRGB(0, 0, 0)
        },
        FreeCam = {
            Enabled = false,
            Speed = 10,
            ToggleKey = Enum.KeyCode.C
        }
    },
    
    -- Teleport Locations
    Teleports = {
        Locations = {
            ["Town Center"] = CFrame.new(0, 0, 0),  -- Replace with actual coordinates
            ["Saloon"] = CFrame.new(100, 0, 100),   -- Replace with actual coordinates
            ["Bank"] = CFrame.new(200, 0, 200),     -- Replace with actual coordinates
            ["Sheriff Office"] = CFrame.new(300, 0, 300), -- Replace with actual coordinates
            ["Mountain"] = CFrame.new(400, 100, 400), -- Replace with actual coordinates
            ["Mine"] = CFrame.new(500, 0, 500)      -- Replace with actual coordinates
        },
        SavedLocations = {},
        TeleportMethod = "Instant" -- "Instant", "Tween", "Walk"
    },
    
    -- Farming & Automation
    Automation = {
        AutoFarm = {
            Enabled = false,
            Target = "Gold",  -- "Gold", "XP", "Items"
            CollectRange = 20,
            AvoidEnemies = true,
            SafeMode = true   -- Less detectable but slower
        },
        AutoCollect = {
            Enabled = false,
            Items = {"Gold", "Silver", "Food", "Ammo"},
            Range = 15
        },
        AutoHunt = {
            Enabled = false,
            TargetType = "Animals", -- "Animals", "Bandits", "Players"
            Range = 200,
            UseCurrentWeapon = true,
            PreferredWeapon = "Rifle"
        },
        AutoSell = {
            Enabled = false,
            Items = {"Gold", "Silver", "Animal_Pelts"},
            MinimumAmount = 10,
            TeleportToSeller = true
        },
        MissionBot = {
            Enabled = false,
            MissionTypes = {"Hunting", "Delivery", "Escort"},
            AutoAccept = true,
            AutoComplete = true
        }
    },
    
    -- Item & Inventory Features
    Inventory = {
        ShowAllItems = false,
        UnlockAllItems = false,
        InfiniteInventory = false,
        AutoPickup = false,
        AutoEquipBest = false,
        HighlightRare = true,
        SortInventory = "Value", -- "Value", "Type", "Rarity"
        QuickEquip = {
            Slot1 = "Revolver",
            Slot2 = "Rifle",
            Slot3 = "Knife",
            Slot4 = "Health Potion"
        }
    },
    
    -- Server & Game Features
    Server = {
        AntiCheatBypass = true,
        LagSwitch = {
            Enabled = false,
            Key = Enum.KeyCode.L,
            Duration = 1
        },
        ServerHopper = {
            Enabled = false,
            PreferLowPopulation = true,
            AutoJoinFriends = false
        },
        ChatCommands = {
            Enabled = true,
            Prefix = "!",
            Commands = {
                "speed", "jump", "god", "noclip", "esp", 
                "teleport", "kill", "bring", "farm", "collect"
            }
        },
        SaveSettings = true,
        SettingsFile = "WestboundEnhancedSettings.json"
    },
    
    -- Mobile-Specific Settings
    Mobile = {
        Enabled = true,
        TouchControlsSize = 1,      -- Size multiplier
        ButtonTransparency = 0.7,
        CustomLayout = false,
        ShowExtraButtons = true,
        GestureControls = {
            TwoFingerTap = "Jump",
            ThreeFingerTap = "Crouch",
            SwipeUp = "FastForward",
            SwipeDown = "Duck",
            PinchIn = "ZoomIn",
            PinchOut = "ZoomOut"
        },
        AutoRotateCamera = true,
        TouchSensitivity = 1.5
    }
}

-- ==================== UTILITY FUNCTIONS ====================
local Utility = {}

-- Create rounded UI elements
function Utility.CreateRoundFrame(properties)
    local frame = Instance.new("Frame")
    for prop, value in pairs(properties) do
        frame[prop] = value
    end
    
    local uiCorner = Instance.new("UICorner", frame)
    uiCorner.CornerRadius = Config.GUI.CornerRadius
    
    return frame
end

-- Create a shadow effect
function Utility.AddShadow(frame, intensity)
    local shadow = Instance.new("ImageLabel", frame)
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Position = UDim2.new(0, -15, 0, -15)
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.ZIndex = frame.ZIndex - 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 1 - (intensity or 0.5)
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
end

-- Create a button with hover effects
function Utility.CreateButton(parent, text, position, size, callback)
    local button = Instance.new("TextButton", parent)
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Config.GUI.Secondary
    button.TextColor3 = Config.GUI.Text
    button.Font = Config.GUI.BodyFont
    button.TextSize = Config.GUI.FontSize.Body
    button.ZIndex = parent.ZIndex + 1
    
    local uiCorner = Instance.new("UICorner", button)
    uiCorner.CornerRadius = Config.GUI.CornerRadius
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, 
            TweenInfo.new(Config.GUI.AnimationSpeed), 
            {BackgroundColor3 = Config.GUI.Accent}
        ):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, 
            TweenInfo.new(Config.GUI.AnimationSpeed), 
            {BackgroundColor3 = Config.GUI.Secondary}
        ):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        if Config.GUI.EnableSounds then
            local sound = Instance.new("Sound", button)
            sound.SoundId = "rbxassetid://6042583793" -- Button click sound
            sound.Volume = 0.5
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 1)
        end
        
        callback()
    end)
    
    return button
end

-- Create a toggle switch
function Utility.CreateToggle(parent, text, position, initialState, callback)
    local container = Instance.new("Frame", parent)
    container.Name = text .. "Toggle"
    container.BackgroundTransparency = 1
    container.Position = position
    container.Size = UDim2.new(0, 200, 0, 30)
    
    local label = Instance.new("TextLabel", container)
    label.Text = text
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.TextColor3 = Config.GUI.Text
    label.Font = Config.GUI.BodyFont
    label.TextSize = Config.GUI.FontSize.Body
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleBackground = Instance.new("Frame", container)
    toggleBackground.Name = "Background"
    toggleBackground.Position = UDim2.new(0.8, 0, 0.5, -10)
    toggleBackground.Size = UDim2.new(0, 40, 0, 20)
    toggleBackground.BackgroundColor3 = initialState and Config.GUI.Success or Config.GUI.Secondary
    local uiCorner = Instance.new("UICorner", toggleBackground)
    uiCorner.CornerRadius = UDim.new(1, 0)
    
    local toggleCircle = Instance.new("Frame", toggleBackground)
    toggleCircle.Name = "Circle"
    toggleCircle.Position = UDim2.new(initialState and 0.6 or 0.1, 0, 0.5, -8)
    toggleCircle.Size = UDim2.new(0, 16, 0, 16)
    toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local circleCorner = Instance.new("UICorner", toggleCircle)
    circleCorner.CornerRadius = UDim.new(1, 0)
    
    local isOn = initialState
    
    toggleBackground.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isOn = not isOn
            
            if Config.GUI.EnableSounds then
                local sound = Instance.new("Sound", toggleBackground)
                sound.SoundId = "rbxassetid://6042583684" -- Toggle switch sound
                sound.Volume = 0.5
                sound:Play()
                game:GetService("Debris"):AddItem(sound, 1)
            end
            
            game:GetService("TweenService"):Create(toggleBackground, 
                TweenInfo.new(Config.GUI.AnimationSpeed), 
                {BackgroundColor3 = isOn and Config.GUI.Success or Config.GUI.Secondary}
            ):Play()
            
            game:GetService("TweenService"):Create(toggleCircle, 
                TweenInfo.new(Config.GUI.AnimationSpeed), 
                {Position = isOn and UDim2.new(0.6, 0, 0.5, -8) or UDim2.new(0.1, 0, 0.5, -8)}
            ):Play()
            
            callback(isOn)
        end
    end)
    
    return container, isOn
end

-- Create a slider
function Utility.CreateSlider(parent, text, position, min, max, initialValue, callback)
    local container = Instance.new("Frame", parent)
    container.Name = text .. "Slider"
    container.BackgroundTransparency = 1
    container.Position = position
    container.Size = UDim2.new(0, 200, 0, 50)
    
    local label = Instance.new("TextLabel", container)
    label.Text = text
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(1, 0, 0.4, 0)
    label.TextColor3 = Config.GUI.Text
    label.Font = Config.GUI.BodyFont
    label.TextSize = Config.GUI.FontSize.Body
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel", container)
    valueLabel.Name = "Value"
    valueLabel.Text = tostring(initialValue)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0.9, 0, 0, 0)
    valueLabel.Size = UDim2.new(0.1, 0, 0.4, 0)
    valueLabel.TextColor3 = Config.GUI.Text
    valueLabel.Font = Config.GUI.BodyFont
    valueLabel.TextSize = Config.GUI.FontSize.Body
    
    local sliderBackground = Instance.new("Frame", container)
    sliderBackground.Name = "Background"
    sliderBackground.Position = UDim2.new(0, 0, 0.6, 0)
    sliderBackground.Size = UDim2.new(1, 0, 0.2, 0)
    sliderBackground.BackgroundColor3 = Config.GUI.Secondary
    local uiCorner = Instance.new("UICorner", sliderBackground)
    uiCorner.CornerRadius = UDim.new(0, 4)
    
    local sliderFill = Instance.new("Frame", sliderBackground)
    sliderFill.Name = "Fill"
    sliderFill.Position = UDim2.new(0, 0, 0, 0)
    local initialFillSize = ((initialValue - min) / (max - min))
    sliderFill.Size = UDim2.new(initialFillSize, 0, 1, 0)
    sliderFill.BackgroundColor3 = Config.GUI.Accent
    local fillCorner = Instance.new("UICorner", sliderFill)
    fillCorner.CornerRadius = UDim.new(0, 4)
    
    local sliderButton = Instance.new("TextButton", sliderBackground)
    sliderButton.Name = "Button"
    sliderButton.Text = ""
    sliderButton.BackgroundTransparency = 1
    sliderButton.Position = UDim2.new(0, 0, 0, 0)
    sliderButton.Size = UDim2.new(1, 0, 1, 0)
    
    local function updateSlider(xOffset)
        local sliderWidth = sliderBackground.AbsoluteSize.X
        local fillWidth = math.clamp(xOffset / sliderWidth, 0, 1)
        local value = min + (max - min) * fillWidth
        
        value = math.floor(value * 10) / 10 -- Round to nearest 0.1
        
        game:GetService("TweenService"):Create(sliderFill, 
            TweenInfo.new(0.1), 
            {Size = UDim2.new(fillWidth, 0, 1, 0)}
        ):Play()
        
        valueLabel.Text = tostring(value)
        callback(value)
    end
    
    sliderButton.MouseButton1Down:Connect(function()
        local inputConnection
        local inputEndedConnection
        
        inputConnection = game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePosition = input.Position.X
                local sliderPosition = sliderBackground.AbsolutePosition.X
                local xOffset = mousePosition - sliderPosition
                
                updateSlider(xOffset)
            end
        end)
        
        inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if inputConnection then
                    inputConnection:Disconnect()
                end
                if inputEndedConnection then
                    inputEndedConnection:Disconnect()
                end
            end
        end)
    end)
    
    -- Handle initial touch input for mobile
    sliderButton.TouchLongPress:Connect(function(_, state)
        if state == Enum.UserInputState.Begin then
            local touchConnection
            local touchEndedConnection
            
            touchConnection = game:GetService("UserInputService").TouchMoved:Connect(function(touch, _)
                local touchPosition = touch.Position.X
                local sliderPosition = sliderBackground.AbsolutePosition.X
                local xOffset = touchPosition - sliderPosition
                
                updateSlider(xOffset)
            end)
            
            touchEndedConnection = game:GetService("UserInputService").TouchEnded:Connect(function()
                if touchConnection then
                    touchConnection:Disconnect()
                end
                if touchEndedConnection then
                    touchEndedConnection:Disconnect()
                end
            end)
        end
    end)
    
    return container
end

-- Create a dropdown menu
function Utility.CreateDropdown(parent, text, position, options, initialOption, callback)
    local container = Instance.new("Frame", parent)
    container.Name = text .. "Dropdown"
    container.BackgroundTransparency = 1
    container.Position = position
    container.Size = UDim2.new(0, 200, 0, 30)
    
    local label = Instance.new("TextLabel", container)
    label.Text = text
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.TextColor3 = Config.GUI.Text
    label.Font = Config.GUI.BodyFont
    label.TextSize = Config.GUI.FontSize.Body
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdownButton = Instance.new("TextButton", container)
    dropdownButton.Name = "Button"
    dropdownButton.Text = initialOption
    dropdownButton.BackgroundColor3 = Config.GUI.Secondary
    dropdownButton.TextColor3 = Config.GUI.Text
    dropdownButton.Position = UDim2.new(0.45, 0, 0, 0)
    dropdownButton.Size = UDim2.new(0.55, 0, 1, 0)
    dropdownButton.Font = Config.GUI.BodyFont
    dropdownButton.TextSize = Config.GUI.FontSize.Body
    
    local uiCorner = Instance.new("UICorner", dropdownButton)
    uiCorner.CornerRadius = Config.GUI.CornerRadius
    
    local dropdownArrow = Instance.new("TextLabel", dropdownButton)
    dropdownArrow.Text = "▼"
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Position = UDim2.new(0.9, 0, 0, 0)
    dropdownArrow.Size = UDim2.new(0.1, 0, 1, 0)
    dropdownArrow.TextColor3 = Config.GUI.Text
    dropdownArrow.Font = Config.GUI.BodyFont
    dropdownArrow.TextSize = Config.GUI.FontSize.Body
    
    local dropdownMenu = Instance.new("Frame", container)
    dropdownMenu.Name = "Menu"
    dropdownMenu.BackgroundColor3 = Config.GUI.Secondary
    dropdownMenu.Position = UDim2.new(0.45, 0, 1, 5)
    dropdownMenu.Size = UDim2.new(0.55, 0, 0, #options * 30)
    dropdownMenu.Visible = false
    dropdownMenu.ZIndex = parent.ZIndex + 5
    
    local menuCorner = Instance.new("UICorner", dropdownMenu)
    menuCorner.CornerRadius = Config.GUI.CornerRadius
    
    local isOpen = false
    
    -- Create options
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton", dropdownMenu)
        optionButton.Name = option
        optionButton.Text = option
        optionButton.BackgroundTransparency = 0.9
        optionButton.BackgroundColor3 = Config.GUI.Secondary
        optionButton.TextColor3 = Config.GUI.Text
        optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
        optionButton.Size = UDim2.new(1, 0, 0, 30)
        optionButton.Font = Config.GUI.BodyFont
        optionButton.TextSize = Config.GUI.FontSize.Body
        optionButton.ZIndex = dropdownMenu.ZIndex
        
        optionButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(optionButton, 
                TweenInfo.new(Config.GUI.AnimationSpeed), 
                {BackgroundTransparency = 0.5, BackgroundColor3 = Config.GUI.Accent}
            ):Play()
        end)
        
        optionButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(optionButton, 
                TweenInfo.new(Config.GUI.AnimationSpeed), 
                {BackgroundTransparency = 0.9, BackgroundColor3 = Config.GUI.Secondary}
            ):Play()
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            dropdownButton.Text = option
            dropdownMenu.Visible = false
            isOpen = false
            dropdownArrow.Text = "▼"
            
            if Config.GUI.EnableSounds then
                local sound = Instance.new("Sound", optionButton)
                sound.SoundId = "rbxassetid://6042583686" -- Option selection sound
                sound.Volume = 0.5
                sound:Play()
                game:GetService("Debris"):AddItem(sound, 1)
            end
            
            callback(option)
        end)
    end
    
    dropdownButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        dropdownMenu.Visible = isOpen
        dropdownArrow.Text = isOpen and "▲" or "▼"
        
        if Config.GUI.EnableSounds then
            local sound = Instance.new("Sound", dropdownButton)
            sound.SoundId = "rbxassetid://6042583686" -- Dropdown toggle sound
            sound.Volume = 0.5
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 1)
        end
    end)
    
    return container
end

-- Create a text input field
function Utility.CreateTextInput(parent, text, position, placeholder, callback)
    local container = Instance.new("Frame", parent)
    container.Name = text .. "Input"
    container.BackgroundTransparency = 1
    container.Position = position
    container.Size = UDim2.new(0, 200, 0, 30)
    
    local label = Instance.new("TextLabel", container)
    label.Text = text
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.TextColor3 = Config.GUI.Text
    label.Font = Config.GUI.BodyFont
    label.TextSize = Config.GUI.FontSize.Body
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local inputBox = Instance.new("TextBox", container)
    inputBox.Name = "InputBox"
    inputBox.Text = ""
    inputBox.PlaceholderText = placeholder
    inputBox.BackgroundColor3 = Config.GUI.Secondary
    inputBox.TextColor3 = Config.GUI.Text
    inputBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    inputBox.Position = UDim2.new(0.45, 0, 0, 0)
    inputBox.Size = UDim2.new(0.55, 0, 1, 0)
    inputBox.Font = Config.GUI.BodyFont
    inputBox.TextSize = Config.GUI.FontSize.Body
    inputBox.ClearTextOnFocus = false
    
    local uiCorner = Instance.new("UICorner", inputBox)
    uiCorner.CornerRadius = Config.GUI.CornerRadius
    
    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(inputBox.Text)
        end
    end)
    
    return container, inputBox
end

-- Create a section header
function Utility.CreateSectionTitle(parent, text, position)
    local titleLabel = Instance.new("TextLabel", parent)
    titleLabel.Text = text
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = position
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.TextColor3 = Config.GUI.Accent
    titleLabel.Font = Config.GUI.TitleFont
    titleLabel.TextSize = Config.GUI.FontSize.Heading
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local underline =
