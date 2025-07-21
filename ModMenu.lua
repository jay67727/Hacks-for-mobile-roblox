-- Roblox Mobile-Friendly Mod Menu
-- Author: You (replace with your name)
-- Press the Menu button to toggle the menu

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "ModMenuMobile"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 350)
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Mod Menu"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24

local function createButton(text, y, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(1, -20, 0, 50)
	btn.Position = UDim2.new(0, 10, 0, 50 + y * 60)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 20
	btn.Text = text
	btn.AutoButtonColor = true
	btn.MouseButton1Click:Connect(callback)
	btn.TextWrapped = true
	return btn
end

createButton("🚀 Speed Boost", 0, function()
	local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then humanoid.WalkSpeed = 100 end
end)

createButton("💨 High Jump", 1, function()
	local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then humanoid.JumpPower = 120 end
end)

createButton("🔁 Respawn", 2, function()
	LocalPlayer:LoadCharacter()
end)

createButton("🌙 Invisibility", 3, function()
	if LocalPlayer.Character then
		for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
				part.Transparency = 1
			end
		end
	end
end)

createButton("🔊 Play Sound", 4, function()
	local sound = Instance.new("Sound", workspace)
	sound.SoundId = "rbxassetid://9118823106"
	sound.Volume = 2
	sound:Play()
	game.Debris:AddItem(sound, 5)
end)

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 80, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 1, -50)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 18
toggleBtn.Text = "Menu"
toggleBtn.AutoButtonColor = true

toggleBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
