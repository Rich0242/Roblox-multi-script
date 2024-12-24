local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function createRoundedCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

local function createStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness
    stroke.Parent = parent
end

local function createGradient(parent, colorSequence)
    local gradient = Instance.new("UIGradient")
    gradient.Color = colorSequence
    gradient.Rotation = 45
    gradient.Parent = parent
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnhancedProfessionalGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local uiScale = Instance.new("UIScale")
uiScale.Parent = screenGui

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.Size = UDim2.new(0, 200, 0, 300)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
frame.BackgroundTransparency = 1 

local MainFrame = Instance.new("Frame")
MainFrame.Parent = frame
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
MainFrame.BackgroundTransparency = 1 

local function updateScale()
    local screenSize = workspace.CurrentCamera.ViewportSize
    if screenSize.X < 800 or screenSize.Y < 600 then
        uiScale.Scale = 0.75 
        frame.Size = UDim2.new(0.75, 0, 0.75, 0)
    else
        uiScale.Scale = 1 
        frame.Size = UDim2.new(0, 200, 0, 300)
    end
end

updateScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)

local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 10
blurEffect.Parent = game.Lighting

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 90, 0, 100)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
createRoundedCorner(mainFrame, 20)

local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Name = "BackgroundImage"
backgroundImage.Size = UDim2.new(1, 0, 1, 0)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = "rbxassetid://6073628839"
backgroundImage.ImageTransparency = 0.7
backgroundImage.Parent = mainFrame

createGradient(backgroundImage, ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 60))
}))

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame
createRoundedCorner(titleBar, 20)

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 24
titleLabel.Text = "Ultimatives Multifunktions-GUI"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -40, 1, -80)
contentFrame.Position = UDim2.new(0, 20, 0, 70)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 6
contentFrame.ScrollingDirection = Enum.ScrollingDirection.Y
contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.Parent = mainFrame

local function createButton(name, text, position, color, icon)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, 0, 0, 70)
    button.Position = position
    button.BackgroundColor3 = color
    button.Font = Enum.Font.GothamSemibold
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 18
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = contentFrame
    createRoundedCorner(button, 10)
    createStroke(button, Color3.fromRGB(255, 255, 255), 2)
    
    local iconImage = Instance.new("ImageLabel")
    iconImage.Size = UDim2.new(0, 30, 0, 30)
    iconImage.Position = UDim2.new(0, 20, 0.5, -15)
    iconImage.BackgroundTransparency = 1
    iconImage.Image = icon
    iconImage.Parent = button

    local buttonText = Instance.new("TextLabel")
    buttonText.Size = UDim2.new(1, -70, 1, 0)
    buttonText.Position = UDim2.new(0, 70, 0, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.Font = Enum.Font.GothamSemibold
    buttonText.TextColor3 = Color3.new(1, 1, 1)
    buttonText.TextSize = 18
    buttonText.Text = text
    buttonText.TextXAlignment = Enum.TextXAlignment.Left
    buttonText.Parent = button
    
    local originalColor = color
    local hoverColor = originalColor:Lerp(Color3.new(1, 1, 1), 0.2)
    local clickColor = originalColor:Lerp(Color3.new(0, 0, 0), 0.2)

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {BackgroundColor3 = originalColor}):Play()
    end)
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = clickColor}):Play()
    end)
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    return button
end

local function cleanupGUI()
    screenGui:Destroy()
    blurEffect:Destroy()
end

local function executeActionAndClose(action)
    action()
    TweenService:Create(mainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    wait(0.5)
    cleanupGUI()
end

local MainWebsite = createButton("Website", "Awtns - Website", UDim2.new(0, 0, 0, 0), Color3.fromRGB(41, 128, 185), "rbxassetid://3926305904")
local HoHoHubScript = createButton("HoHoHubScript", "HoHo Hub", UDim2.new(0, 0, 0, 90), Color3.fromRGB(39, 174, 96), "rbxassetid://3926307971")
local AzureScript = createButton("AzureScript", "Azure", UDim2.new(0, 0, 0, 180), Color3.fromRGB(230, 126, 34), "rbxassetid://3926305904")
local FlyScript = createButton("FlyScript", "Fly", UDim2.new(0, 0, 0, 270), Color3.fromRGB(155, 89, 182), "rbxassetid://3926307971")

MainWebsite.MouseButton1Click:Connect(function()
    local url = "https://awtns.com"

    if setclipboard then
        setclipboard(url)
    end

    if os.execute then
        os.execute('start "" "' .. url .. '"')
    end

    executeActionAndClose(function()
    end)
end)

HoHoHubScript.MouseButton1Click:Connect(function()
    executeActionAndClose(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end)
end)

AzureScript.MouseButton1Click:Connect(function()
    executeActionAndClose(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end)
end)

FlyScript.MouseButton1Click:Connect(function()
    executeActionAndClose(function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end)
end)

mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 500), Position = UDim2.new(0.5, -200, 0.5, -250)}):Play()

local dragging
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    TweenService:Create(mainFrame, TweenInfo.new(0.1), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateDrag(input)
    end
end)
