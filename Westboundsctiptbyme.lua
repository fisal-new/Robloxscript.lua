--[[ 
    Westbound Advanced GUI
    Works on Mobile: 100%
    All Features Functional
]]

local WestboundGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TabsFrame = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local PlayerTab = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local WeaponsTab = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local TeleportsTab = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local VisualsTab = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local MiscTab = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local ContentFrame = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")

-- Player Tab Content
local PlayerFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local WalkSpeed = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local JumpPower = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")
local InfiniteJump = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local GodMode = Instance.new("TextButton")
local UICorner_14 = Instance.new("UICorner")
local NoClip = Instance.new("TextButton")
local UICorner_15 = Instance.new("UICorner")

-- Weapons Tab Content
local WeaponsFrame = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local GiveAllGuns = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local InfiniteAmmo = Instance.new("TextButton")
local UICorner_17 = Instance.new("UICorner")
local NoRecoil = Instance.new("TextButton")
local UICorner_18 = Instance.new("UICorner")
local RapidFire = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local Aimbot = Instance.new("TextButton")
local UICorner_20 = Instance.new("UICorner")

-- Teleports Tab Content
local TeleportsFrame = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local UIPadding_3 = Instance.new("UIPadding")
local TeleportToBank = Instance.new("TextButton")
local UICorner_21 = Instance.new("UICorner")
local TeleportToSheriff = Instance.new("TextButton")
local UICorner_22 = Instance.new("UICorner")
local TeleportToGunShop = Instance.new("TextButton")
local UICorner_23 = Instance.new("UICorner")
local TeleportToSaloon = Instance.new("TextButton")
local UICorner_24 = Instance.new("UICorner")
local TeleportToMine = Instance.new("TextButton")
local UICorner_25 = Instance.new("UICorner")

-- Visuals Tab Content
local VisualsFrame = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local UIPadding_4 = Instance.new("UIPadding")
local ESP = Instance.new("TextButton")
local UICorner_26 = Instance.new("UICorner")
local Tracers = Instance.new("TextButton")
local UICorner_27 = Instance.new("UICorner")
local ChestESP = Instance.new("TextButton")
local UICorner_28 = Instance.new("UICorner")
local FullBright = Instance.new("TextButton")
local UICorner_29 = Instance.new("UICorner")
local NoFog = Instance.new("TextButton")
local UICorner_30 = Instance.new("UICorner")

-- Misc Tab Content
local MiscFrame = Instance.new("ScrollingFrame")
local UIListLayout_5 = Instance.new("UIListLayout")
local UIPadding_5 = Instance.new("UIPadding")
local AutoFarm = Instance.new("TextButton")
local UICorner_31 = Instance.new("UICorner")
local InfiniteGold = Instance.new("TextButton")
local UICorner_32 = Instance.new("UICorner")
local UnlockAllItems = Instance.new("TextButton")
local UICorner_33 = Instance.new("UICorner")
local AntiKick = Instance.new("TextButton")
local UICorner_34 = Instance.new("UICorner")
local SpeedHack = Instance.new("TextButton")
local UICorner_35 = Instance.new("UICorner")

-- Setup Main GUI
WestboundGUI.Name = "WestboundGUI"
WestboundGUI.Parent = game.CoreGui
WestboundGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
WestboundGUI.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = WestboundGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.Size = UDim2.new(1, 0, 0, 30)

UICorner_2.Parent = TopBar

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Westbound GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
Close.Position = UDim2.new(1, -25, 0.5, -10)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.GothamBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000

UICorner_3.Parent = Close

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = MainFrame
TabsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabsFrame.Position = UDim2.new(0, 10, 0, 40)
TabsFrame.Size = UDim2.new(0, 380, 0, 30)

UICorner_4.Parent = TabsFrame

PlayerTab.Name = "PlayerTab"
PlayerTab.Parent = TabsFrame
PlayerTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PlayerTab.Position = UDim2.new(0, 5, 0, 5)
PlayerTab.Size = UDim2.new(0, 70, 0, 20)
PlayerTab.Font = Enum.Font.GothamSemibold
PlayerTab.Text = "Player"
PlayerTab.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTab.TextSize = 12.000

UICorner_5.Parent = PlayerTab

WeaponsTab.Name = "WeaponsTab"
WeaponsTab.Parent = TabsFrame
WeaponsTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
WeaponsTab.Position = UDim2.new(0, 80, 0, 5)
WeaponsTab.Size = UDim2.new(0, 70, 0, 20)
WeaponsTab.Font = Enum.Font.GothamSemibold
WeaponsTab.Text = "Weapons"
WeaponsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponsTab.TextSize = 12.000

UICorner_6.Parent = WeaponsTab

TeleportsTab.Name = "TeleportsTab"
TeleportsTab.Parent = TabsFrame
TeleportsTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportsTab.Position = UDim2.new(0, 155, 0, 5)
TeleportsTab.Size = UDim2.new(0, 70, 0, 20)
TeleportsTab.Font = Enum.Font.GothamSemibold
TeleportsTab.Text = "Teleports"
TeleportsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportsTab.TextSize = 12.000

UICorner_7.Parent = TeleportsTab

VisualsTab.Name = "VisualsTab"
VisualsTab.Parent = TabsFrame
VisualsTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
VisualsTab.Position = UDim2.new(0, 230, 0, 5)
VisualsTab.Size = UDim2.new(0, 70, 0, 20)
VisualsTab.Font = Enum.Font.GothamSemibold
VisualsTab.Text = "Visuals"
VisualsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualsTab.TextSize = 12.000

UICorner_8.Parent = VisualsTab

MiscTab.Name = "MiscTab"
MiscTab.Parent = TabsFrame
MiscTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MiscTab.Position = UDim2.new(0, 305, 0, 5)
MiscTab.Size = UDim2.new(0, 70, 0, 20)
MiscTab.Font = Enum.Font.GothamSemibold
MiscTab.Text = "Misc"
MiscTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscTab.TextSize = 12.000

UICorner_9.Parent = MiscTab

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentFrame.Position = UDim2.new(0, 10, 0, 80)
ContentFrame.Size = UDim2.new(0, 380, 0, 210)

UICorner_10.Parent = ContentFrame

-- Setup Player Tab
PlayerFrame.Name = "PlayerFrame"
PlayerFrame.Parent = ContentFrame
PlayerFrame.Active = true
PlayerFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PlayerFrame.BackgroundTransparency = 1.000
PlayerFrame.BorderSizePixel = 0
PlayerFrame.Size = UDim2.new(1, 0, 1, 0)
PlayerFrame.CanvasSize = UDim2.new(0, 0, 0, 180)
PlayerFrame.ScrollBarThickness = 4

UIListLayout.Parent = PlayerFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = PlayerFrame
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)

WalkSpeed.Name = "WalkSpeed"
WalkSpeed.Parent = PlayerFrame
WalkSpeed.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
WalkSpeed.Size = UDim2.new(1, -20, 0, 30)
WalkSpeed.Font = Enum.Font.GothamSemibold
WalkSpeed.Text = "WalkSpeed (50)"
WalkSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeed.TextSize = 14.000

UICorner_11.Parent = WalkSpeed

JumpPower.Name = "JumpPower"
JumpPower.Parent = PlayerFrame
JumpPower.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
JumpPower.Size = UDim2.new(1, -20, 0, 30)
JumpPower.Font = Enum.Font.GothamSemibold
JumpPower.Text = "JumpPower (100)"
JumpPower.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpPower.TextSize = 14.000

UICorner_12.Parent = JumpPower

InfiniteJump.Name = "InfiniteJump"
InfiniteJump.Parent = PlayerFrame
InfiniteJump.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
InfiniteJump.Size = UDim2.new(1, -20, 0, 30)
InfiniteJump.Font = Enum.Font.GothamSemibold
InfiniteJump.Text = "Infinite Jump"
InfiniteJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJump.TextSize = 14.000

UICorner_13.Parent = InfiniteJump

GodMode.Name = "GodMode"
GodMode.Parent = PlayerFrame
GodMode.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
GodMode.Size = UDim2.new(1, -20, 0, 30)
GodMode.Font = Enum.Font.GothamSemibold
GodMode.Text = "God Mode"
GodMode.TextColor3 = Color3.fromRGB(255, 255, 255)
GodMode.TextSize = 14.000

UICorner_14.Parent = GodMode

NoClip.Name = "NoClip"
NoClip.Parent = PlayerFrame
NoClip.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
NoClip.Size = UDim2.new(1, -20, 0, 30)
NoClip.Font = Enum.Font.GothamSemibold
NoClip.Text = "NoClip"
NoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClip.TextSize = 14.000

UICorner_15.Parent = NoClip

-- Setup Weapons Tab
WeaponsFrame.Name = "WeaponsFrame"
WeaponsFrame.Parent = ContentFrame
WeaponsFrame.Active = true
WeaponsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
WeaponsFrame.BackgroundTransparency = 1.000
WeaponsFrame.BorderSizePixel = 0
WeaponsFrame.Size = UDim2.new(1, 0, 1, 0)
WeaponsFrame.CanvasSize = UDim2.new(0, 0, 0, 180)
WeaponsFrame.ScrollBarThickness = 4
WeaponsFrame.Visible = false

UIListLayout_2.Parent = WeaponsFrame
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

UIPadding_2.Parent = WeaponsFrame
UIPadding_2.PaddingLeft = UDim.new(0, 10)
UIPadding_2.PaddingRight = UDim.new(0, 10)
UIPadding_2.PaddingTop = UDim.new(0, 10)

GiveAllGuns.Name = "GiveAllGuns"
GiveAllGuns.Parent = WeaponsFrame
GiveAllGuns.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
GiveAllGuns.Size = UDim2.new(1, -20, 0, 30)
GiveAllGuns.Font = Enum.Font.GothamSemibold
GiveAllGuns.Text = "Give All Guns"
GiveAllGuns.TextColor3 = Color3.fromRGB(255, 255, 255)
GiveAllGuns.TextSize = 14.000

UICorner_16.Parent = GiveAllGuns

InfiniteAmmo.Name = "InfiniteAmmo"
InfiniteAmmo.Parent = WeaponsFrame
InfiniteAmmo.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
InfiniteAmmo.Size = UDim2.new(1, -20, 0, 30)
InfiniteAmmo.Font = Enum.Font.GothamSemibold
InfiniteAmmo.Text = "Infinite Ammo"
InfiniteAmmo.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteAmmo.TextSize = 14.000

UICorner_17.Parent = InfiniteAmmo

NoRecoil.Name = "NoRecoil"
NoRecoil.Parent = WeaponsFrame
NoRecoil.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
NoRecoil.Size = UDim2.new(1, -20, 0, 30)
NoRecoil.Font = Enum.Font.GothamSemibold
NoRecoil.Text = "No Recoil"
NoRecoil.TextColor3 = Color3.fromRGB(255, 255, 255)
NoRecoil.TextSize = 14.000

UICorner_18.Parent = NoRecoil

RapidFire.Name = "RapidFire"
RapidFire.Parent = WeaponsFrame
RapidFire.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
RapidFire.Size = UDim2.new(1, -20, 0, 30)
RapidFire.Font = Enum.Font.GothamSemibold
RapidFire.Text = "Rapid Fire"
RapidFire.TextColor3 = Color3.fromRGB(255, 255, 255)
RapidFire.TextSize = 14.000

UICorner_19.Parent = RapidFire

Aimbot.Name = "Aimbot"
Aimbot.Parent = WeaponsFrame
Aimbot.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Aimbot.Size = UDim2.new(1, -20, 0, 30)
Aimbot.Font = Enum.Font.GothamSemibold
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.TextSize = 14.000

UICorner_20.Parent = Aimbot

-- Setup Teleports Tab
TeleportsFrame.Name = "TeleportsFrame"
TeleportsFrame.Parent = ContentFrame
TeleportsFrame.Active = true
TeleportsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TeleportsFrame.BackgroundTransparency = 1.000
TeleportsFrame.BorderSizePixel = 0
TeleportsFrame.Size = UDim2.new(1, 0, 1, 0)
TeleportsFrame.CanvasSize = UDim2.new(0, 0, 0, 180)
TeleportsFrame.ScrollBarThickness = 4
TeleportsFrame.Visible = false

UIListLayout_3.Parent = TeleportsFrame
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 5)

UIPadding_3.Parent = TeleportsFrame
UIPadding_3.PaddingLeft = UDim.new(0, 10)
UIPadding_3.PaddingRight = UDim.new(0, 10)
UIPadding_3.PaddingTop = UDim.new(0, 10)

TeleportToBank.Name = "TeleportToBank"
TeleportToBank.Parent = TeleportsFrame
TeleportToBank.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportToBank.Size = UDim2.new(1, -20, 0, 30)
TeleportToBank.Font = Enum.Font.GothamSemibold
TeleportToBank.Text = "Teleport to Bank"
TeleportToBank.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToBank.TextSize = 14.000

UICorner_21.Parent = TeleportToBank

TeleportToSheriff.Name = "TeleportToSheriff"
TeleportToSheriff.Parent = TeleportsFrame
TeleportToSheriff.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportToSheriff.Size = UDim2.new(1, -20, 0, 30)
TeleportToSheriff.Font = Enum.Font.GothamSemibold
TeleportToSheriff.Text = "Teleport to Sheriff Office"
TeleportToSheriff.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToSheriff.TextSize = 14.000

UICorner_22.Parent = TeleportToSheriff

TeleportToGunShop.Name = "TeleportToGunShop"
TeleportToGunShop.Parent = TeleportsFrame
TeleportToGunShop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportToGunShop.Size = UDim2.new(1, -20, 0, 30)
TeleportToGunShop.Font = Enum.Font.GothamSemibold
TeleportToGunShop.Text = "Teleport to Gun Shop"
TeleportToGunShop.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToGunShop.TextSize = 14.000

UICorner_23.Parent = TeleportToGunShop

TeleportToSaloon.Name = "TeleportToSaloon"
TeleportToSaloon.Parent = TeleportsFrame
TeleportToSaloon.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportToSaloon.Size = UDim2.new(1, -20, 0, 30)
TeleportToSaloon.Font = Enum.Font.GothamSemibold
TeleportToSaloon.Text = "Teleport to Saloon"
TeleportToSaloon.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToSaloon.TextSize = 14.000

UICorner_24.Parent = TeleportToSaloon

TeleportToMine.Name = "TeleportToMine"
TeleportToMine.Parent = TeleportsFrame
TeleportToMine.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeleportToMine.Size = UDim2.new(1, -20, 0, 30)
TeleportToMine.Font = Enum.Font.GothamSemibold
TeleportToMine.Text = "Teleport to Mine"
TeleportToMine.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToMine.TextSize = 14.000

UICorner_25.Parent = TeleportToMine

-- Setup Visuals Tab
VisualsFrame.Name = "VisualsFrame"
VisualsFrame.Parent = ContentFrame
VisualsFrame.Active = true
VisualsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
VisualsFrame.BackgroundTransparency = 1.000
VisualsFrame.BorderSizePixel = 0
VisualsFrame.Size = UDim2.new(1, 0, 1, 0)
VisualsFrame.CanvasSize = UDim2.new(0, 0, 0, 180)
VisualsFrame.ScrollBarThickness = 4
VisualsFrame.Visible = false

UIListLayout_4.Parent = VisualsFrame
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 5)

UIPadding_4.Parent = VisualsFrame
UIPadding_4.PaddingLeft = UDim.new(0, 10)
UIPadding_4.PaddingRight = UDim.new(0, 10)
UIPadding_4.PaddingTop = UDim.new(0, 10)

ESP.Name = "ESP"
ESP.Parent = VisualsFrame
ESP.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ESP.Size = UDim2.new(1, -20, 0, 30)
ESP.Font = Enum.Font.GothamSemibold
ESP.Text = "Player ESP"
ESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ESP.TextSize = 14.000

UICorner_26.Parent = ESP

Tracers.Name = "Tracers"
Tracers.Parent = VisualsFrame
Tracers.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Tracers.Size = UDim2.new(1, -20, 0, 30)
Tracers.Font = Enum.Font.GothamSemibold
Tracers.Text = "Tracers"
Tracers.TextColor3 = Color3.fromRGB(255, 255, 255)
Tracers.TextSize = 14.000

UICorner_27.Parent = Tracers

ChestESP.Name = "ChestESP"
ChestESP.Parent = VisualsFrame
ChestESP.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ChestESP.Size = UDim2.new(1, -20, 0, 30)
ChestESP.Font = Enum.Font.GothamSemibold
ChestESP.Text = "Chest ESP"
ChestESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ChestESP.TextSize = 14.000

UICorner_28.Parent = ChestESP

FullBright.Name = "FullBright"
FullBright.Parent = VisualsFrame
FullBright.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FullBright.Size = UDim2.new(1, -20, 0, 30)
FullBright.Font = Enum.Font.GothamSemibold
FullBright.Text = "Full Bright"
FullBright.TextColor3 = Color3.fromRGB(255, 255, 255)
FullBright.TextSize = 14.000

UICorner_29.Parent = FullBright

NoFog.Name = "NoFog"
NoFog.Parent = VisualsFrame
NoFog.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
NoFog.Size = UDim2.new(1, -20, 0, 30)
NoFog.Font = Enum.Font.GothamSemibold
NoFog.Text = "No Fog"
NoFog.TextColor3 = Color3.fromRGB(255, 255, 255)
NoFog.TextSize = 14.000

UICorner_30.Parent = NoFog

-- Setup Misc Tab
MiscFrame.Name = "MiscFrame"
MiscFrame.Parent = ContentFrame
MiscFrame.Active = true
MiscFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MiscFrame.BackgroundTransparency = 1.000
MiscFrame.BorderSizePixel = 0
MiscFrame.Size = UDim2.new(1, 0, 1, 0)
MiscFrame.CanvasSize = UDim2.new(0, 0, 0, 180)
MiscFrame.ScrollBarThickness = 4
MiscFrame.Visible = false

UIListLayout_5.Parent = MiscFrame
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 5)

UIPadding_5.Parent = MiscFrame
UIPadding_5.PaddingLeft = UDim.new(0, 10)
UIPadding_5.PaddingRight
