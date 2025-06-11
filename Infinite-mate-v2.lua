-- Infinite Mate - GUI Estilo Moderno (tipo XNox)
-- Compatible con Delta Executor

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "InfiniteMate"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- CONTENEDOR PRINCIPAL
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.3, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- MENÚ LATERAL
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 130, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local sections = {"Inicio", "Comandos", "Ajustes", "Librería de Scripts", "Créditos"}
local buttons = {}

for i, name in pairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, 40 * (i - 1))
    btn.Text = name
    btn.BackgroundColor3 = i == 1 and Color3.fromRGB(0, 90, 255) or Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    btn.BorderSizePixel = 0
    btn.Name = name
    btn.Parent = sidebar
    buttons[name] = btn
end

-- CONTENIDO PRINCIPAL: INICIO
local content = Instance.new("Frame")
content.Name = "InicioPage"
content.Size = UDim2.new(1, -130, 1, 0)
content.Position = UDim2.new(0, 130, 0, 0)
content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
content.BorderSizePixel = 0
content.Parent = main

local title = Instance.new("TextLabel")
title.Text = "Inicio"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Position = UDim2.new(0, 10, 0, 10)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = content

local loadBtn = Instance.new("TextButton")
loadBtn.Size = UDim2.new(0, 200, 0, 40)
loadBtn.Position = UDim2.new(0, 20, 0, 70)
loadBtn.Text = "Cargar Comandos"
loadBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadBtn.Font = Enum.Font.Gotham
loadBtn.TextSize = 18
loadBtn.BorderSizePixel = 0
loadBtn.Parent = content

loadBtn.MouseButton1Click:Connect(function()
    local success, errorMsg = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    if not success then
        warn("Error al cargar Infinite Yield: " .. errorMsg)
    end
end)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 200, 0, 40)
closeBtn.Position = UDim2.new(0, 20, 0, 120)
closeBtn.Text = "Cerrar"
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextSize = 18
closeBtn.BorderSizePixel = 0
closeBtn.Parent = content

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- PESTAÑA DE COMANDOS
local comandosFrame = Instance.new("Frame")
comandosFrame.Name = "ComandosPage"
comandosFrame.Size = content.Size
comandosFrame.Position = content.Position
comandosFrame.BackgroundColor3 = content.BackgroundColor3
comandosFrame.Visible = false
comandosFrame.Parent = main

local function createCommandButton(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = comandosFrame
    btn.MouseButton1Click:Connect(callback)
end

createCommandButton("Fly", 20, function()
    local success, errorMsg = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y5xJt7yE"))()
    end)
    if not success then
        warn("Error al ejecutar Fly: " .. errorMsg)
    end
end)

createCommandButton("Speed x3", 65, function()
    local plr = game.Players.LocalPlayer
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.WalkSpeed = 48
    end
end)

createCommandButton("Infinite Jump", 110, function()
    local plr = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")
    UIS.JumpRequest:Connect(function()
        plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

createCommandButton("Noclip (tecla N)", 155, function()
    local plr = game.Players.LocalPlayer
    local noclip = false
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.N then
            noclip = not noclip
            plr.Character.Humanoid:ChangeState(11)
        end
    end)
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, v in pairs(plr.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

createCommandButton("Dance", 200, function()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://33796059"
    local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:LoadAnimation(anim):Play()
    end
end)

-- CAMBIO ENTRE PESTAÑAS
for name, button in pairs(buttons) do
    button.MouseButton1Click:Connect(function()
        for _, b in pairs(buttons) do
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
        button.BackgroundColor3 = Color3.fromRGB(0, 90, 255)

        content.Visible = false
        comandosFrame.Visible = false

        if name == "Inicio" then
            content.Visible = true
            title.Text = "Inicio"
        elseif name == "Comandos" then
            comandosFrame.Visible = true
        end
    end)
end
