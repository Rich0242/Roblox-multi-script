local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function create(className, properties)
    local instance = Instance.new(className)
    for k, v in pairs(properties) do
        instance[k] = v
    end
    return instance
end

local colors = {
    background = Color3.fromRGB(25, 25, 35),
    foreground = Color3.fromRGB(35, 35, 45),
    accent1 = Color3.fromRGB(100, 180, 255),
    accent2 = Color3.fromRGB(255, 100, 100),
    text = Color3.fromRGB(240, 240, 240),
    textDark = Color3.fromRGB(255, 255, 255),
    buttonColors = {
        redz = Color3.fromRGB(231, 76, 60),         -- Red
        azure = Color3.fromRGB(100, 180, 255),       -- Light Blue
        fly = Color3.fromRGB(155, 89, 182),         -- Purple
        infinite = Color3.fromRGB(230, 126, 34),   -- Orange
        speedx = Color3.fromRGB(39, 174, 96)        -- Green
    }
}

local screenGui = create("ScreenGui", {
    Name = "BunnyHub",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Parent = playerGui
})

local mainFrame = create("Frame", {
    Name = "MainFrame",
    Size = UDim2.new(0, 700, 0, 500),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = colors.background,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Parent = screenGui
})

create("UICorner", {
    CornerRadius = UDim.new(0, 15),
    Parent = mainFrame
})

local titleBar = create("Frame", {
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 40),
    BackgroundColor3 = colors.foreground,
    BorderSizePixel = 0,
    Parent = mainFrame
})

create("UICorner", {
    CornerRadius = UDim.new(0, 15),
    Parent = titleBar
})

local titleText = create("TextLabel", {
    Name = "TitleText",
    Size = UDim2.new(1, -120, 1, 0),
    Position = UDim2.new(0, 20, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextColor3 = colors.text,
    TextSize = 22,
    Text = "Bunny Hub",
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = titleBar
})

local minimizeButton = create("TextButton", {
    Name = "MinimizeButton",
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -70, 0, 5),
    BackgroundColor3 = colors.accent1,
    Text = "-",
    TextColor3 = colors.text,
    Font = Enum.Font.GothamBold,
    TextSize = 20,
    Parent = titleBar
})

create("UICorner", {
    CornerRadius = UDim.new(0, 18),
    Parent = minimizeButton
})

local closeButton = create("TextButton", {
    Name = "CloseButton",
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -35, 0, 5),
    BackgroundColor3 = colors.accent2,
    Text = "X",
    TextColor3 = colors.text,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    Parent = titleBar
})

create("UICorner", {
    CornerRadius = UDim.new(0, 18),
    Parent = closeButton
})

local tabContainer = create("ScrollingFrame", {
    Name = "TabContainer",
    Size = UDim2.new(1, -20, 0, 30),
    Position = UDim2.new(0, 10, 0, 50),
    BackgroundTransparency = 1,
    ScrollBarThickness = 4,
    ScrollingDirection = Enum.ScrollingDirection.X,
    Parent = mainFrame
})

local tabLayout = create("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Left,
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 10),
    Parent = tabContainer
})

local function createTabButton(name, text, layoutOrder)
    local button = create("TextButton", {
        Name = name,
        Size = UDim2.new(0, 120, 1, 0),
        BackgroundColor3 = colors.foreground,
        Font = Enum.Font.GothamSemibold,
        TextColor3 = colors.text,
        TextSize = 16,
        Text = text,
        LayoutOrder = layoutOrder,
        Parent = tabContainer
    })

    create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = button
    })

    return button
end

local scriptsTab = createTabButton("ScriptsTab", "Scripts", 1)
local devInfoTab = createTabButton("DevInfoTab", "Dev-Infos", 2)
local customTab = createTabButton("CustomTab", "Custom", 3)
local logsTab = createTabButton("LogsTab", "Logs", 4)

tabContainer.CanvasSize = UDim2.new(0, tabLayout.AbsoluteContentSize.X, 0, 0)

local contentContainer = create("Frame", {
    Name = "ContentContainer",
    Size = UDim2.new(1, -20, 1, -90),
    Position = UDim2.new(0, 10, 0, 90),
    BackgroundTransparency = 1,
    ClipsDescendants = true,
    Parent = mainFrame
})

local scriptsFrame = create("ScrollingFrame", {
    Name = "ScriptsFrame",
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 6,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0),
    ClipsDescendants = true,
    Visible = true,
    Parent = contentContainer
})

local devInfoFrame = create("ScrollingFrame", {
    Name = "DevInfoFrame",
    Size = UDim2.new(1, 0, 1, 0),
    CanvasSize = UDim2.new(0, 0, 1, 720),
    ScrollBarThickness = 10,
    BackgroundTransparency = 1,
    Parent = contentContainer
})

local customFrame = create("Frame", {
    Name = "CustomFrame",
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Visible = false,
    Parent = contentContainer
})

local logsFrame = create("Frame", {
    Name = "LogsFrame",
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Visible = false,
    Parent = contentContainer
})

local logsLabel = create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 30),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextColor3 = colors.text,
    TextSize = 18,
    Text = "Execution Logs",
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = logsFrame
})

local logsTextBox = create("TextBox", {
    Size = UDim2.new(1, 0, 1, -40),
    Position = UDim2.new(0, 0, 0, 40),
    BackgroundColor3 = colors.foreground,
    Font = Enum.Font.Code,
    TextColor3 = colors.text,
    TextSize = 14,
    Text = "-- GUI Logs will appear here --",
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    ClearTextOnFocus = false,
    MultiLine = true,
    TextWrapped = true,
    ClipsDescendants = true,
    RichText = true,
    TextEditable = false,
    Parent = logsFrame
})

create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = logsTextBox
})

local function addLog(message)
    local timestamp = os.date("%H:%M:%S")
    local logMessage = string.format("\n[%s] %s", timestamp, message)
    logsTextBox.Text = logsTextBox.Text .. logMessage
    logsTextBox.CursorPosition = #logsTextBox.Text + 1
end

local function createButton(name, text, description, color, parent)
    local button = create("Frame", {
        Name = name,
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = color,
        Parent = parent
    })

    create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = button
    })

    create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 5),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextColor3 = colors.text,
        TextSize = 18,
        Text = text,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = button
    })

    create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 35),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextColor3 = colors.textDark,
        TextSize = 14,
        Text = description,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = button
    })

    local clickArea = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = button
    })

    return button, clickArea
end

local speedHubXButton, speedHubXClick = createButton(
    "speedHubXButton",
    "Speed Hub X",
    "Load Speed Hub X",
    colors.buttonColors.speedx,
    scriptsFrame
)

local redzHubButton, redzHubClick = createButton(
    "redzHubButton",
    "Redz Hub",
    "Load RedZ script",
    colors.buttonColors.redz,
    scriptsFrame
)

local azureButton, azureClick = createButton(
    "AzureButton",
    "Azure",
    "Load Azure script",
    colors.buttonColors.azure,
    scriptsFrame
)

local flyButton, flyClick = createButton(
    "FlyButton",
    "Fly",
    "Load fly script",
    colors.buttonColors.fly,
    scriptsFrame
)

local infiniteYieldButton, infiniteYieldClick = createButton(
    "InfiniteYieldButton",
    "Infinite Yield",
    "Load Infinite Yield admin script",
    colors.buttonColors.infinite,
    scriptsFrame
)

speedHubXButton.Position = UDim2.new(0, 0, 0, 0)
redzHubButton.Position = UDim2.new(0, 0, 0, 80)
azureButton.Position = UDim2.new(0, 0, 0, 160)
flyButton.Position = UDim2.new(0, 0, 0, 240)
infiniteYieldButton.Position = UDim2.new(0, 0, 0, 320)
scriptsFrame.CanvasSize = UDim2.new(0, 0, 0, 400)

local function createDevInfo(name, info, position)
    local infoFrame = create("Frame", {
        Name = name,
        Size = UDim2.new(1, 0, 0, 80),
        Position = position,
        BackgroundTransparency = 1,
        Parent = devInfoFrame
    })

    local numDevInfos = #devInfoFrame:GetChildren()
    devInfoFrame.CanvasSize = UDim2.new(0, 0, 0, numDevInfos * 91)
    
    create("TextLabel", {
        Size = UDim2.new(0.9, 0, 0, 30),
        Position = UDim2.new(0, 10, 0, 5),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextColor3 = colors.text,
        TextSize = 18,
        Text = name,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = infoFrame
    })

    create("TextLabel", {
        Size = UDim2.new(0.9, 0, 0, 20),
        Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextColor3 = colors.textDark,
        TextSize = 14,
        Text = info,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = infoFrame
    })

    return infoFrame
end

createDevInfo(
    "Creator & Lead Developer",
    "Mays (bunny24_024)",
    UDim2.new(0, 0, 0, 0)
)

createDevInfo(
    "Contributor & Quality Assurance",
    "AT1",
    UDim2.new(0, 0, 0, 90)
)

createDevInfo(
    "Software Version",
    "Bunny Hub 6.1",
    UDim2.new(0, 0, 0, 180)
)

createDevInfo(
    "Programming Language",
    "Luau - A Lua-based scripting language customized by Roblox",
    UDim2.new(0, 0, 0, 270)
)

createDevInfo(
    "Support & Contact (via Discord)",
    "bunny24_024",
    UDim2.new(0, 0, 0, 360)
)

createDevInfo(
    "Initial Release Date",
    "December 25, 2024",
    UDim2.new(0, 0, 0, 450)
)

createDevInfo(
    "Official Website",
    "Visit us at: https://www.awtns.com",
    UDim2.new(0, 0, 0, 540)
)

local customLabel = create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 30),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextColor3 = colors.text,
    TextSize = 18,
    Text = "Custom Script Execution",
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = customFrame
})

local customTextBox = create("TextBox", {
    Size = UDim2.new(1, 0, 1, -90),
    Position = UDim2.new(0, 0, 0, 40),
    BackgroundColor3 = colors.foreground,
    Font = Enum.Font.Code,
    TextColor3 = colors.text,
    TextSize = 14,
    Text = "-- Enter your custom Lua script here --",
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    ClearTextOnFocus = false,
    MultiLine = true,
    TextWrapped = true,
    ClipsDescendants = true,
    RichText = true,
    TextEditable = true,
    Parent = customFrame
})

create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = customTextBox
})

customTextBox.Focused:Connect(function()
    if customTextBox.Text == "-- Enter your custom Lua script here --" then
        customTextBox.Text = ""
    end
end)

customTextBox.FocusLost:Connect(function()
    if customTextBox.Text == "" then
        customTextBox.Text = "-- Enter your custom Lua script here --"
    end
end)

local executeCustomButton = create("TextButton", {
    Size = UDim2.new(0, 200, 0, 40),
    Position = UDim2.new(0.5, -100, 1, -45),
    BackgroundColor3 = colors.accent1,
    Font = Enum.Font.GothamBold,
    TextColor3 = colors.text,
    TextSize = 16,
    Text = "Execute Custom Script",
    Parent = customFrame
})

create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = executeCustomButton
})

local notificationQueue = {}
local function showNotification(message, duration)
    local notification = create("Frame", {
        Size = UDim2.new(0, 300, 0, 60),
        Position = UDim2.new(0.5, -150, 0, -70),
        BackgroundColor3 = colors.foreground,
        BorderSizePixel = 0,
        Parent = screenGui
    })

    create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = notification
    })

    create("TextLabel", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextColor3 = colors.text,
        TextSize = 14,
        Text = message,
        TextWrapped = true,
        Parent = notification
    })

    table.insert(notificationQueue, notification)

    local function updateNotificationPositions()
        for i, notif in ipairs(notificationQueue) do
            local targetPosition = UDim2.new(0.5, -150, 0, 20 + (i - 1) * 70)
            TweenService:Create(notif, TweenInfo.new(0.3), {Position = targetPosition}):Play()
        end
    end

    updateNotificationPositions()

    delay(duration or 3, function()
        local index = table.find(notificationQueue, notification)
        if index then
            table.remove(notificationQueue, index)
            updateNotificationPositions()
        end
        TweenService:Create(notification, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -150, 0, -70)}):Play()
        wait(0.3)
        notification:Destroy()
    end)
end

speedHubXClick.MouseButton1Click:Connect(function()
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end)
    if success then
        showNotification("Speed Hub X Script loaded successfully!", 3, "success")
        addLog("Loaded Speed Hub X Script")
    else
        showNotification("Failed to load Speed Hub X Script: " .. error, 3, "error")
        addLog("Failed to load Speed Hub X Script: " .. error)
    end
end)

redzHubClick.MouseButton1Click:Connect(function()
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end)
    if success then
        showNotification("redzHub Script loaded successfully!", 3)
        addLog("Loaded redzHubScript")
    else
        showNotification("Failed to load redzHub Script: " .. error, 3)
        addLog("Failed to load redzHub Script: " .. error)
    end
end)

azureClick.MouseButton1Click:Connect(function()
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end)
    if success then
        showNotification("AzureScript loaded successfully!", 3)
        addLog("Loaded AzureScript")
    else
        showNotification("Failed to load AzureScript: " .. error, 3)
        addLog("Failed to load AzureScript: " .. error)
    end
end)

flyClick.MouseButton1Click:Connect(function()
    local success, error = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rich0242/Roblox-multi-script/refs/heads/main/fly.lua"))()
    end)
    if success then
        showNotification("FlyScript loaded successfully!", 3)
        addLog("Loaded FlyScript")
    else
        showNotification("Failed to load FlyScript: " .. error, 3)
        addLog("Failed to load FlyScript: " .. error)
    end
end)

infiniteYieldClick.MouseButton1Click:Connect(function()
    local success, error = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    if success then
        showNotification("Infinite Yield loaded successfully!", 3)
        addLog("Loaded Infinite Yield")
    else
        showNotification("Failed to load Infinite Yield: " .. error, 3)
        addLog("Failed to load Infinite Yield: " .. error)
    end
end)

executeCustomButton.MouseButton1Click:Connect(function()
    if customTextBox.Text == "" or customTextBox.Text == "-- Enter your custom Lua script here --" then
        showNotification("Custom script field is empty!", 3)
        addLog("Failed to execute custom script: Custom script field is empty")
        return
    end

    local success, error = pcall(function()
        loadstring(customTextBox.Text)()
    end)
    if success then
        showNotification("Custom script executed successfully!", 3)
        addLog("Executed custom script")
    else
        showNotification("Failed to execute custom script: " .. error, 3)
        addLog("Failed to execute custom script: " .. error)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.3)
    screenGui:Destroy()
end)

local minimized = false
local lastSize = UDim2.new(0, 700, 0, 500)
local isMobile = false

local function updateGuiSize()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    isMobile = viewportSize.X < 700 or viewportSize.Y < 500
    
    if isMobile then
        lastSize = UDim2.new(0, 300, 0, 360)
    else
        lastSize = UDim2.new(0, 700, 0, 500)
    end
    
    if not minimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = lastSize,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
    end
    
    tabContainer.Size = UDim2.new(1, -20, 0, 30)
    tabContainer.Position = UDim2.new(0, 10, 0, 50)
    contentContainer.Size = UDim2.new(1, -20, 1, -90)
    contentContainer.Position = UDim2.new(0, 10, 0, 90)
    tabContainer.CanvasSize = UDim2.new(0, tabLayout.AbsoluteContentSize.X, 0, 0)
end

minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        lastSize = mainFrame.Size
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, lastSize.X.Offset, 0, 40)}):Play()
        titleText.Text = "BH"
        titleText.Position = UDim2.new(0, 10, 0, 0)
        minimizeButton.Position = UDim2.new(1, -70, 0, 5)
        closeButton.Position = UDim2.new(1, -35, 0, 5)
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = lastSize}):Play()
        titleText.Text = "Bunny Hub"
        titleText.Position = UDim2.new(0, 20, 0, 0)
        minimizeButton.Position = UDim2.new(1, -70, 0, 5)
        closeButton.Position = UDim2.new(1, -35, 0, 5)
    end
end)

local function switchTab(tabName)
    scriptsFrame.Visible = tabName == "Scripts"
    devInfoFrame.Visible = tabName == "Dev-Infos"
    customFrame.Visible = tabName == "Custom"
    logsFrame.Visible = tabName == "Logs"
    
    scriptsTab.BackgroundColor3 = tabName == "Scripts" and colors.accent1 or colors.foreground
    devInfoTab.BackgroundColor3 = tabName == "Dev-Infos" and colors.accent1 or colors.foreground
    customTab.BackgroundColor3 = tabName == "Custom" and colors.accent1 or colors.foreground
    logsTab.BackgroundColor3 = tabName == "Logs" and colors.accent1 or colors.foreground
end

scriptsTab.MouseButton1Click:Connect(function()
    switchTab("Scripts")
end)

devInfoTab.MouseButton1Click:Connect(function()
    switchTab("Dev-Infos")
end)

customTab.MouseButton1Click:Connect(function()
    switchTab("Custom")
end)

logsTab.MouseButton1Click:Connect(function()
    switchTab("Logs")
end)

local dragging = false
local dragStart
local dragInput
local startPos

local function updateDrag(input)
    if not dragging then return end
    
    local delta = input.Position - dragStart
    local targetPosition = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
    
    mainFrame.Position = targetPosition
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        local connection
        connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                connection:Disconnect()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 700, 0, 500),
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

local blurEffect = create("BlurEffect", {
    Name = "EnhancedGUIBlur",
    Size = 0,
    Parent = Lighting
})

local blurEffectEnabled = true

local function toggleBlurEffect()
    if blurEffectEnabled then
        TweenService:Create(blurEffect, TweenInfo.new(0.5), {Size = 0}):Play()
    else
        TweenService:Create(blurEffect, TweenInfo.new(0.5), {Size = 10}):Play()
    end
    blurEffectEnabled = not blurEffectEnabled
end

minimizeButton.MouseButton1Click:Connect(toggleBlurEffect)

TweenService:Create(blurEffect, TweenInfo.new(0.5), {Size = 10}):Play()

screenGui.Destroying:Connect(function()
    if Lighting:FindFirstChild("EnhancedGUIBlur") then
        Lighting.EnhancedGUIBlur:Destroy()
    end
end)

local function applyButtonHoverEffect(button)
    local originalColor = button.BackgroundColor3
    local hoverColor = Color3.new(
        math.min(originalColor.R * 1.2, 1),
        math.min(originalColor.G * 1.2, 1),
        math.min(originalColor.B * 1.2, 1)
    )

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
    end)
end

applyButtonHoverEffect(speedHubXButton)
applyButtonHoverEffect(redzHubButton)
applyButtonHoverEffect(azureButton)
applyButtonHoverEffect(flyButton)
applyButtonHoverEffect(infiniteYieldButton)
applyButtonHoverEffect(executeCustomButton)

updateGuiSize()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateGuiSize)

local function checkMainServices()
    local services = {
        Players,
        TweenService,
        UserInputService,
        RunService,
        Lighting,
        player,
        playerGui
    }

    for _, service in ipairs(services) do
        if not service then
            return false
        end
    end
    return true
end

local function checkGuiComponents()
    local components = {
        screenGui,
        scriptsFrame,
        speedHubXButton,
        redzHubButton,
        azureButton,
        flyButton,
        infiniteYieldButton,
        mainFrame,
        devInfoFrame,
        tabsFrame,
        contentsFrame
    }

    for _, component in ipairs(components) do
        if not component then
            return false
        end
    end
    return true
end

if checkMainServices() then
    if checkGuiComponents() then
        showNotification("Bunny Hub loaded successfully!")
    else
        showNotification("GUI components failed to load", 3, "error")
    end
else
    showNotification("Core services failed to load", 3, "error")
end

switchTab("Scripts")
