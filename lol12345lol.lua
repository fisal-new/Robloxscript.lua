-- سكربت Westbound المطور
-- إصدار 1.0
-- يدعم الأجهزة المحمولة بنسبة 100%

-- الإعدادات القابلة للتعديل (قم بتغيير هذه القيم فقط)
local SETTINGS = {
    -- إحداثيات البنك (يمكنك تغييرها بسهولة)
    BANK_COORDINATES = {
        X = 123.45,
        Y = 67.89,
        Z = 12.34
    },
    
    -- إعدادات أخرى يمكن تعديلها بسهولة
    AUTO_COLLECT_MONEY = true,        -- تجميع المال تلقائياً
    AUTO_DEPOSIT_MONEY = true,        -- إيداع المال تلقائياً
    COLLECT_INTERVAL = 60,            -- الفاصل الزمني بين عمليات التجميع (بالثواني)
    DEPOSIT_INTERVAL = 120,           -- الفاصل الزمني بين عمليات الإيداع (بالثواني)
    
    -- إعدادات الحماية
    ANTI_KICK = true,                 -- حماية ضد الطرد
    ANTI_BAN = true,                  -- حماية ضد الحظر
    HIDE_USERNAME = true,             -- إخفاء اسم المستخدم
    
    -- إعدادات الجوال
    MOBILE_SUPPORT = true,            -- دعم الأجهزة المحمولة
    MOBILE_UI_SCALE = 1.5,            -- حجم واجهة المستخدم للجوال
    MOBILE_CONTROLS = true            -- تمكين عناصر التحكم للجوال
}

-- المتغيرات العامة (لا تقم بتعديلها)
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- تحقق من المنصة
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- التحقق من منصة التشغيل وضبط الإعدادات
if isMobile and SETTINGS.MOBILE_SUPPORT then
    print("تم رصد جهاز محمول - تفعيل دعم الجوال")
    -- ضبط إعدادات الجوال
    setupMobileSupport()
else
    print("تم رصد جهاز سطح مكتب - تشغيل الوضع العادي")
end

-- إنشاء واجهة المستخدم
local function createUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WestboundScript"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 300, 0, 350)
    MainFrame.Position = UDim2.new(0.8, 0, 0.5, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.Parent = ScreenGui
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = isMobile and 18 * SETTINGS.MOBILE_UI_SCALE or 18
    Title.Text = "Westbound Script v1.0"
    Title.Font = Enum.Font.SourceSansBold
    Title.Parent = MainFrame
    
    -- إضافة الأزرار والوظائف
    addButtons(MainFrame)
    
    -- تعديل حجم واجهة المستخدم للجوال
    if isMobile then
        MainFrame.Size = UDim2.new(0, 300 * SETTINGS.MOBILE_UI_SCALE, 0, 350 * SETTINGS.MOBILE_UI_SCALE)
    end
    
    -- جعل الواجهة قابلة للسحب
    makeDraggable(MainFrame)
    
    return ScreenGui
end

-- إضافة الأزرار
local function addButtons(parent)
    local buttonsInfo = {
        {name = "GoToBank", text = "الذهاب إلى البنك", position = UDim2.new(0, 10, 0, 40)},
        {name = "CollectMoney", text = "تجميع المال", position = UDim2.new(0, 10, 0, 80)},
        {name = "DepositMoney", text = "إيداع المال", position = UDim2.new(0, 10, 0, 120)},
        {name = "ToggleAutoCollect", text = "تبديل التجميع التلقائي", position = UDim2.new(0, 10, 0, 160)},
        {name = "ToggleAutoDeposit", text = "تبديل الإيداع التلقائي", position = UDim2.new(0, 10, 0, 200)},
        {name = "AntiKick", text = "حماية ضد الطرد: " .. (SETTINGS.ANTI_KICK and "مفعل" or "معطل"), position = UDim2.new(0, 10, 0, 240)},
        {name = "AntiBan", text = "حماية ضد الحظر: " .. (SETTINGS.ANTI_BAN and "مفعل" or "معطل"), position = UDim2.new(0, 10, 0, 280)},
        {name = "HideUsername", text = "إخفاء اسم المستخدم: " .. (SETTINGS.HIDE_USERNAME and "مفعل" or "معطل"), position = UDim2.new(0, 10, 0, 320)}
    }
    
    for _, info in ipairs(buttonsInfo) do
        local button = Instance.new("TextButton")
        button.Name = info.name
        button.Size = UDim2.new(0, 280, 0, 30)
        button.Position = info.position
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = isMobile and 16 * SETTINGS.MOBILE_UI_SCALE or 16
        button.Text = info.text
        button.Font = Enum.Font.SourceSans
        button.BorderSizePixel = 0
        button.Parent = parent
        
        -- تطبيق الوظائف على الأزرار
        button.MouseButton1Click:Connect(function()
            if info.name == "GoToBank" then
                teleportToBank()
            elseif info.name == "CollectMoney" then
                collectMoney()
            elseif info.name == "DepositMoney" then
                depositMoney()
            elseif info.name == "ToggleAutoCollect" then
                SETTINGS.AUTO_COLLECT_MONEY = not SETTINGS.AUTO_COLLECT_MONEY
                button.Text = "تبديل التجميع التلقائي: " .. (SETTINGS.AUTO_COLLECT_MONEY and "مفعل" or "معطل")
            elseif info.name == "ToggleAutoDeposit" then
                SETTINGS.AUTO_DEPOSIT_MONEY = not SETTINGS.AUTO_DEPOSIT_MONEY
                button.Text = "تبديل الإيداع التلقائي: " .. (SETTINGS.AUTO_DEPOSIT_MONEY and "مفعل" or "معطل")
            elseif info.name == "AntiKick" then
                SETTINGS.ANTI_KICK = not SETTINGS.ANTI_KICK
                button.Text = "حماية ضد الطرد: " .. (SETTINGS.ANTI_KICK and "مفعل" or "معطل")
            elseif info.name == "AntiBan" then
                SETTINGS.ANTI_BAN = not SETTINGS.ANTI_BAN
                button.Text = "حماية ضد الحظر: " .. (SETTINGS.ANTI_BAN and "مفعل" or "معطل")
            elseif info.name == "HideUsername" then
                SETTINGS.HIDE_USERNAME = not SETTINGS.HIDE_USERNAME
                button.Text = "إخفاء اسم المستخدم: " .. (SETTINGS.HIDE_USERNAME and "مفعل" or "معطل")
                toggleUsernameVisibility()
            end
        end)
    end
end

-- جعل الإطار قابل للسحب
local function makeDraggable(frame)
    local dragToggle = nil
    local dragSpeed = 0.1
    local dragInput = nil
    local dragStart = nil
    local dragPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        game:GetService("TweenService"):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end
    
    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not UserInputService:GetFocusedTextBox() then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

-- دعم الجوال
local function setupMobileSupport()
    -- إضافة عناصر تحكم للجوال
    if SETTINGS.MOBILE_CONTROLS then
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "MobileControls"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = Player:WaitForChild("PlayerGui")
        
        -- إضافة زر الانتقال السريع
        local teleportButton = Instance.new("TextButton")
        teleportButton.Name = "TeleportButton"
        teleportButton.Size = UDim2.new(0, 70 * SETTINGS.MOBILE_UI_SCALE, 0, 70 * SETTINGS.MOBILE_UI_SCALE)
        teleportButton.Position = UDim2.new(0.1, 0, 0.7, 0)
        teleportButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        teleportButton.TextSize = 18 * SETTINGS.MOBILE_UI_SCALE
        teleportButton.Text = "انتقال"
        teleportButton.Font = Enum.Font.SourceSansBold
        teleportButton.BackgroundTransparency = 0.5
        teleportButton.BorderSizePixel = 0
        teleportButton.Parent = ScreenGui
        
        -- إضافة وظيفة الانتقال السريع
        teleportButton.MouseButton1Click:Connect(function()
            -- فتح قائمة الانتقال السريع
            openTeleportMenu()
        end)
    end
end

-- قائمة الانتقال السريع
local function openTeleportMenu()
    local teleportLocations = {
        {name = "البنك", func = teleportToBank},
        {name = "المدينة", func = function() teleportToLocation(Vector3.new(100, 50, 200)) end},
        {name = "المتجر", func = function() teleportToLocation(Vector3.new(150, 50, 250)) end},
        {name = "السجن", func = function() teleportToLocation(Vector3.new(200, 50, 300)) end}
    }
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TeleportMenu"
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    
    local MenuFrame = Instance.new("Frame")
    MenuFrame.Name = "MenuFrame"
    MenuFrame.Size = UDim2.new(0, 200 * SETTINGS.MOBILE_UI_SCALE, 0, 250 * SETTINGS.MOBILE_UI_SCALE)
    MenuFrame.Position = UDim2.new(0.5, -100 * SETTINGS.MOBILE_UI_SCALE, 0.5, -125 * SETTINGS.MOBILE_UI_SCALE)
    MenuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MenuFrame.BorderSizePixel = 0
    MenuFrame.Parent = ScreenGui
    
    local
