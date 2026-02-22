BEST TRADE SCAM BY wprxd_123

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeVortexTrade"
ScreenGui.Parent = game:GetService("CoreGui")  -- o game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 220)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Esquinas redondeadas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Stroke / borde glow
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.4
UIStroke.Parent = MainFrame

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Vortex Trade Scam"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.TextSize = 28
Title.Font = Enum.Font.GothamBlack
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title  -- solo arriba si quieres, pero simplificamos

-- Separador
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(0.9, 0, 0, 2)
Separator.Position = UDim2.new(0.05, 0, 0, 45)
Separator.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Separator.BorderSizePixel = 0
Separator.Parent = MainFrame

-- Toggle 1: Freeze Trade
local FreezeLabel = Instance.new("TextLabel")
FreezeLabel.Size = UDim2.new(0.65, 0, 0, 40)
FreezeLabel.Position = UDim2.new(0.05, 0, 0.35, 0)
FreezeLabel.BackgroundTransparency = 1
FreezeLabel.Text = "Freeze Trade"
FreezeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
FreezeLabel.TextSize = 20
FreezeLabel.Font = Enum.Font.GothamSemibold
FreezeLabel.TextXAlignment = Enum.TextXAlignment.Left
FreezeLabel.Parent = MainFrame

local FreezeToggle = Instance.new("TextButton")
FreezeToggle.Size = UDim2.new(0, 50, 0, 28)
FreezeToggle.Position = UDim2.new(0.88, 0, 0.35, 6)
FreezeToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
FreezeToggle.Text = ""
FreezeToggle.Parent = MainFrame

local FreezeCorner = Instance.new("UICorner")
FreezeCorner.CornerRadius = UDim.new(0, 14)
FreezeCorner.Parent = FreezeToggle

local FreezeCircle = Instance.new("Frame")
FreezeCircle.Size = UDim2.new(0, 24, 0, 24)
FreezeCircle.Position = UDim2.new(0, 2, 0, 2)
FreezeCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
FreezeCircle.Parent = FreezeToggle
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = FreezeCircle

-- Toggle 2: Force Accept
local ForceLabel = Instance.new("TextLabel")
ForceLabel.Size = UDim2.new(0.65, 0, 0, 40)
ForceLabel.Position = UDim2.new(0.05, 0, 0.58, 0)
ForceLabel.BackgroundTransparency = 1
ForceLabel.Text = "Force Accept"
ForceLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ForceLabel.TextSize = 20
ForceLabel.Font = Enum.Font.GothamSemibold
ForceLabel.TextXAlignment = Enum.TextXAlignment.Left
ForceLabel.Parent = MainFrame

local ForceToggle = Instance.new("TextButton")
ForceToggle.Size = UDim2.new(0, 50, 0, 28)
ForceToggle.Position = UDim2.new(0.88, 0, 0.58, 6)
ForceToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ForceToggle.Text = ""
ForceToggle.Parent = MainFrame

local ForceCorner = Instance.new("UICorner")
ForceCorner.CornerRadius = UDim.new(0, 14)
ForceCorner.Parent = ForceToggle

local ForceCircle = Instance.new("Frame")
ForceCircle.Size = UDim2.new(0, 24, 0, 24)
ForceCircle.Position = UDim2.new(0, 2, 0, 2)
ForceCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ForceCircle.Parent = ForceToggle
local ForceCircleCorner = Instance.new("UICorner")
ForceCircleCorner.CornerRadius = UDim.new(1, 0)
ForceCircleCorner.Parent = ForceCircle

-- Funcionalidad solo visual (toggle sin hacer nada más)
local function createToggleLogic(toggleBtn, circle)
    local enabled = false
    toggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
            circle.Position = UDim2.new(0, 24, 0, 2)
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            circle.Position = UDim2.new(0, 2, 0, 2)
            circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end

createToggleLogic(FreezeToggle, FreezeCircle)
createToggleLogic(ForceToggle, ForceCircle)

-- Pequeño drag (opcional, para mover la GUI)
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
