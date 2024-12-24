local a = game:GetService("Players")
local b = game:GetService("TweenService")
local c = game:GetService("UserInputService")
local d = game:GetService("Lighting")

local e = a.LocalPlayer
local f = e:WaitForChild("PlayerGui")

local function g(h, i)
    local j = Instance.new("UICorner")
    j.CornerRadius = UDim.new(0, i)
    j.Parent = h
end

local function k(l, m, n)
    local o = Instance.new("UIStroke")
    o.Color = m
    o.Thickness = n
    o.Parent = l
end

local function p(q, r)
    local s = Instance.new("UIGradient")
    s.Color = r
    s.Rotation = 45
    s.Parent = q
end

local t = Instance.new("ScreenGui")
t.Name = "EnhancedProfessionalGUI"
t.ResetOnSpawn = false
t.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
t.Parent = f

local u = Instance.new("UIScale")
u.Parent = t

local v = Instance.new("Frame")
v.Parent = t
v.AnchorPoint = Vector2.new(0.5, 0.5)
v.Position = UDim2.new(0.5, 0, 0.5, 0)
v.Size = UDim2.new(0, 200, 0, 300)
v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v.BackgroundTransparency = 1

local w = Instance.new("Frame")
w.Parent = v
w.AnchorPoint = Vector2.new(0.5, 0.5)
w.Position = UDim2.new(0.5, 0, 0.5, 0)
w.Size = UDim2.new(0, 200, 0, 300)
w.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
w.BackgroundTransparency = 1

local function x()
    local y = workspace.CurrentCamera.ViewportSize
    if y.X < 800 or y.Y < 600 then
        u.Scale = 0.5
        v.Size = UDim2.new(0.5, 0, 0.5, 0)
    else
        u.Scale = 1
        v.Size = UDim2.new(0, 200, 0, 300)
    end
end

x()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(x)

local z = Instance.new("BlurEffect")
z.Size = 10
z.Parent = game.Lighting

local A = Instance.new("Frame")
A.Name = "MainFrame"
A.Size = UDim2.new(0, 90, 0, 100)
A.Position = UDim2.new(0.5, -200, 0.5, -250)
A.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
A.BorderSizePixel = 0
A.ClipsDescendants = true
A.Parent = t
g(A, 20)

local B = Instance.new("ImageLabel")
B.Name = "BackgroundImage"
B.Size = UDim2.new(1, 0, 1, 0)
B.BackgroundTransparency = 1
B.Image = "rbxassetid://6073628839"
B.ImageTransparency = 0.7
B.Parent = A

p(B, ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 60))
}))

local C = Instance.new("Frame")
C.Name = "TitleBar"
C.Size = UDim2.new(1, 0, 0, 60)
C.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
C.BorderSizePixel = 0
C.Parent = A
g(C, 20)

local D = Instance.new("TextLabel")
D.Name = "TitleLabel"
D.Size = UDim2.new(1, -20, 1, 0)
D.Position = UDim2.new(0, 20, 0, 0)
D.BackgroundTransparency = 1
D.Font = Enum.Font.GothamBold
D.TextColor3 = Color3.new(1, 1, 1)
D.TextSize = 24
D.Text = "Ultimatives Multifunktions-GUI"
D.TextXAlignment = Enum.TextXAlignment.Left
D.Parent = C

local E = Instance.new("ScrollingFrame")
E.Name = "ContentFrame"
E.Size = UDim2.new(1, -40, 1, -80)
E.Position = UDim2.new(0, 20, 0, 70)
E.BackgroundTransparency = 1
E.BorderSizePixel = 0
E.ScrollBarThickness = 6
E.ScrollingDirection = Enum.ScrollingDirection.Y
E.AutomaticCanvasSize = Enum.AutomaticSize.Y
E.CanvasSize = UDim2.new(0, 0, 0, 0)
E.Parent = A

local function F(G, H, I, J, K)
    local L = Instance.new("TextButton")
    L.Name = G
    L.Size = UDim2.new(1, 0, 0, 70)
    L.Position = I
    L.BackgroundColor3 = J
    L.Font = Enum.Font.GothamSemibold
    L.TextColor3 = Color3.new(1, 1, 1)
    L.TextSize = 18
    L.Text = ""
    L.AutoButtonColor = false
    L.Parent = E
    g(L, 10)
    k(L, Color3.fromRGB(255, 255, 255), 2)
    
    local M = Instance.new("ImageLabel")
    M.Size = UDim2.new(0, 30, 0, 30)
    M.Position = UDim2.new(0, 20, 0.5, -15)
    M.BackgroundTransparency = 1
    M.Image = K
    M.Parent = L

    local N = Instance.new("TextLabel")
    N.Size = UDim2.new(1, -70, 1, 0)
    N.Position = UDim2.new(0, 70, 0, 0)
    N.BackgroundTransparency = 1
    N.Font = Enum.Font.GothamSemibold
    N.TextColor3 = Color3.new(1, 1, 1)
    N.TextSize = 18
    N.Text = H
    N.TextXAlignment = Enum.TextXAlignment.Left
    N.Parent = L
    
    local O = J
    local P = O:Lerp(Color3.new(1, 1, 1), 0.2)
    local Q = O:Lerp(Color3.new(0, 0, 0), 0.2)

    L.MouseEnter:Connect(function()
        b:Create(L, TweenInfo.new(0.3), {BackgroundColor3 = P}):Play()
    end)
    L.MouseLeave:Connect(function()
        b:Create(L, TweenInfo.new(0.3), {BackgroundColor3 = O}):Play()
    end)
    L.MouseButton1Down:Connect(function()
        b:Create(L, TweenInfo.new(0.1), {BackgroundColor3 = Q}):Play()
    end)
    L.MouseButton1Up:Connect(function()
        b:Create(L, TweenInfo.new(0.1), {BackgroundColor3 = P}):Play()
    end)
    
    return L
end

local function handleButtonClick(button, color)
    button.MouseButton1Down:Connect(function()
        b:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = color}):Play()
    end)
    button.MouseButton1Up:Connect(function()
        b:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = color}):Play()
    end)
end

local function R()
    if t then t:Destroy() end
    if z then z:Destroy() end
end

local function S()
    if b and A then
        b:Create(A, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        wait(0.5)
        R()
    end
end

local U = F("Website", "Awtns - Website", UDim2.new(0, 0, 0, 0), Color3.fromRGB(41, 128, 185), "rbxassetid://3926305904")
local V = F("HoHoHubScript", "HoHo Hub", UDim2.new(0, 0, 0, 90), Color3.fromRGB(39, 174, 96), "rbxassetid://3926307971")
local W = F("AzureScript", "Azure", UDim2.new(0, 0, 0, 180), Color3.fromRGB(230, 126, 34), "rbxassetid://3926305904")
local X = F("FlyScript", "Fly", UDim2.new(0, 0, 0, 270), Color3.fromRGB(155, 89, 182), "rbxassetid://3926307971")
local CO = F("CloseGUI", "Close GUI", UDim2.new(0, 0, 0, 360), Color3.fromRGB(231, 76, 60), "rbxassetid://3926305904")

U.MouseButton1Click:Connect(function()
    local Y = "https://awtns.com"
    if setclipboard then
        setclipboard(Y)
    end
    if os.execute then
        os.execute('start "" "' .. Y .. '"')
    end
end)

V.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end)
    if not success then
        warn("Failed to load HoHoHubScript: " .. err)
    end
end)

W.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end)
    if not success then
        warn("Failed to load AzureScript: " .. err)
    end
end)

X.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rich0242/Roblox-multi-script/refs/heads/main/fly.lua"))()
    end)
    if not success then
        warn("Failed to load FlyScript: " .. err)
    end
end)

CO.MouseButton1Click:Connect(function()
    S()
end)

if A and b then
    if workspace.CurrentCamera.ViewportSize.X < 800 or workspace.CurrentCamera.ViewportSize.Y < 600 then
        A.Size = UDim2.new(0, 250, 0, 300)
        A.Position = UDim2.new(0.5, -125, 0.5, -150)
    else
        A.Size = UDim2.new(0, 400, 0, 500)
        A.Position = UDim2.new(0.5, -200, 0.5, -250)
    end

    b:Create(A, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = A.Size, Position = A.Position}):Play()
end

local Z
local _ 
local a0

local function a1(a2)
    local a3 = a2.Position - _
    b:Create(A, TweenInfo.new(0.1), {Position = UDim2.new(a0.X.Scale, a0.X.Offset + a3.X, a0.Y.Scale, a0.Y.Offset + a3.Y)}):Play()
end

C.InputBegan:Connect(function(a4)
    if a4.UserInputType == Enum.UserInputType.MouseButton1 or a4.UserInputType == Enum.UserInputType.Touch then
        Z = true
        _ = a4.Position
        a0 = A.Position
        a4.Changed:Connect(function()
            if a4.UserInputState == Enum.UserInputState.End then
                Z = false
            end
        end)
    end
end)

c.InputChanged:Connect(function(a5)
    if Z and (a5.UserInputType == Enum.UserInputType.MouseMovement or a5.UserInputType == Enum.UserInputType.Touch) then
        a1(a5)
    end
end)
