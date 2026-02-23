-- Denis by lajx

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- ===== GUI =====
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Parent = screenGui
label.Size = UDim2.new(0, 300, 0, 50)
label.Position = UDim2.new(0.5, -150, 0, 20)
label.BackgroundTransparency = 0.3
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.TextColor3 = Color3.fromRGB(0, 255, 0)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold
label.Text = "Denis by lajx"

-- ===== Configuración =====
local normalSpeed = 16
local fastSpeed = 50
local slowSpeed = 8
local flySpeed = 50

local flyingUp = false
local flyingDown = false

-- ===== Controles =====
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = fastSpeed
	elseif input.KeyCode == Enum.KeyCode.LeftControl then
		humanoid.WalkSpeed = slowSpeed
	elseif input.KeyCode == Enum.KeyCode.E then
		flyingUp = true
	elseif input.KeyCode == Enum.KeyCode.Q then
		flyingDown = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.LeftControl then
		humanoid.WalkSpeed = normalSpeed
	elseif input.KeyCode == Enum.KeyCode.E then
		flyingUp = false
	elseif input.KeyCode == Enum.KeyCode.Q then
		flyingDown = false
	end
end)

-- ===== Movimiento vertical =====
RunService.RenderStepped:Connect(function()
	if flyingUp then
		rootPart.Velocity = Vector3.new(rootPart.V
