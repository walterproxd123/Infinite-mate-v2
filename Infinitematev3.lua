-- Infinite Mate - GUI Estilo Moderno (tipo XNox)
-- Compatible con Delta Executor

local gui = Instance.new("ScreenGui")
gui.Name = "InfiniteMate"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- CONTENEDOR PRINCIPAL
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 500, 0, 400)
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

local sections = {"Inicio", "Comandos", "Buscador de Scripts", "Ajustes", "Créditos"}
local buttons = {}
local pages = {}

local function createPage(name)
    local frame = Instance.new("Frame")
    frame.Name = name.."Page"
    frame.Size = UDim2.new(1, -130, 1, 0)
    frame.Position = UDim2.new(0, 130, 0, 0)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Visible = false
    frame.Parent = main
    pages[name] = frame
    return frame
end

-- Crear botones en sidebar y páginas
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

    createPage(name)
end

-- Función para cambiar entre páginas
local function switchPage(name)
    for n, page in pairs(pages) do
        page.Visible = (n == name)
    end
    for n, btn in pairs(buttons) do
        btn.BackgroundColor3 = (n == name) and Color3.fromRGB(0, 90, 255) or Color3.fromRGB(40, 40, 40)
    end
end

-- Activar primera página
switchPage("Inicio")

-- Botones sidebar conexión
for name, btn in pairs(buttons) do
    btn.MouseButton1Click:Connect(function()
        switchPage(name)
    end)
end

-- === PESTAÑA INICIO ===
local inicio = pages["Inicio"]

local titleInicio = Instance.new("TextLabel")
titleInicio.Text = "Inicio"
titleInicio.Size = UDim2.new(1, 0, 0, 50)
titleInicio.BackgroundTransparency = 1
titleInicio.TextColor3 = Color3.fromRGB(255, 255, 255)
titleInicio.Font = Enum.Font.GothamBold
titleInicio.TextSize = 24
titleInicio.Position = UDim2.new(0, 10, 0, 10)
titleInicio.TextXAlignment = Enum.TextXAlignment.Left
titleInicio.Parent = inicio

local loadBtn = Instance.new("TextButton")
loadBtn.Size = UDim2.new(0, 200, 0, 40)
loadBtn.Position = UDim2.new(0, 20, 0, 70)
loadBtn.Text = "Cargar Infinite Yield"
loadBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadBtn.Font = Enum.Font.Gotham
loadBtn.TextSize = 18
loadBtn.BorderSizePixel = 0
loadBtn.Parent = inicio

loadBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 200, 0, 40)
closeBtn.Position = UDim2.new(0, 20, 0, 120)
closeBtn.Text = "Cerrar GUI"
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextSize = 18
closeBtn.BorderSizePixel = 0
closeBtn.Parent = inicio

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- === PESTAÑA COMANDOS ===
local comandos = pages["Comandos"]

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
    btn.Parent = comandos
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createCommandButton("Fly", 20, function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y5xJt7yE"))()
    end)
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
    local conn
    conn = UIS.JumpRequest:Connect(function()
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

createCommandButton("Noclip (tecla N)", 155, function()
    local plr = game.Players.LocalPlayer
    local noclip = false
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.N then
            noclip = not noclip
            if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            end
        end
    end)
    game:GetService("RunService").Stepped:Connect(function()
        if noclip and plr.Character then
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
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:LoadAnimation(anim):Play()
    end
end)

-- === PESTAÑA BUSCADOR DE SCRIPTS ===
local buscador = pages["Buscador de Scripts"]

local scriptsList = {
    {"Blox Fruits – Auto Farm Hub", "https://raw.githubusercontent.com/marisdeptrai/Script-Free/main/Maris-Hub"},
    {"Blox Fruits – Mukuro Hub", "https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua"},
    {"Blox Fruits – Neva Hub", "https://raw.githubusercontent.com/jebblox/scriptdatabase2/main/scripts/nevahub.lua"},
    {"Blox Fruits – OP/Floodware Hub", "https://raw.githubusercontent.com/ztechs1234/Floodware/master/Floodware.lua"},
    {"Blox Fruits – Best Fruit Script", "https://raw.githubusercontent.com/xQuartyx/DonateMe/main/OldBf"},
    {"Brookhaven RP – IceMael OP Script", "https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"},
    {"Brookhaven RP – Rochips Universal", "https://raw.githubusercontent.com/Rochips/Script/main/Brookhaven.lua"},
    {"Brookhaven RP – SP Hub", "https://raw.githubusercontent.com/Joeyjojo11/SPHub/main/Main.lua"},
    {"Brookhaven RP – JulHub", "https://raw.githubusercontent.com/JulHub/JulHub/main/Loader.lua"},
    {"Grow a Garden – Universal Script", "https://raw.githubusercontent.com/Blackoutzx/GrowAGarden/main/Main.lua"},
}

for i, item in ipairs(scriptsList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 240, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, 20 + (i - 1) * 45)
    btn.Text = item[1]
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = buscador
    btn.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(item[2]))()
        end)
    end)
end

-- === PESTAÑA AJUSTES ===
local ajustes
