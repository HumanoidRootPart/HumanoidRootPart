		    local player = game.Players.LocalPlayer
local character1 = player.Character
local mouse = player:GetMouse()

local fakebody = Instance.new("Part", character1)
fakebody.Transparency = 1
fakebody.Anchored = true
fakebody.CanCollide = false
fakebody.Position = character1.Head.Position
fakebody.Name = "FPart"
wait()

_G.ReanimationType = "PDeath" --PDeath, Fling, Simple

loadstring(game:HttpGet("https://raw.githubusercontent.com/GelatekWasTaken/Reanimation.lua/main/Main/Main.lua"))()

function GetPlayer(name)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.DisplayName:lower():sub(1, #name) == name:lower() or v.Name:lower():sub(1, #name) == name:lower() then
			return v
		end
	end    
end

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local char = plr.Character
local killing = false
local victim = nil

plr.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 6) == "/kill " then
		if plrs:FindFirstChild(string.sub(msg, 7)) then
			victim = plrs:FindFirstChild(string.sub(msg, 7))
			killing = true
			wait(2)
			killing = false
		else
			if GetPlayer(string.sub(msg, 7)) then
				victim = GetPlayer(string.sub(msg, 7))
				killing = true
				wait(2)
				killing = false
			else
				print("Player not found!")
			end
		end
	end
end)

plrs.PlayerRemoving:Connect(function(player)
	if player == victim then
		killing = false
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:Wait() do
		if killing == false then
			character1.Reanimate.FPart.Position = game.Players.LocalPlayer.Character.Torso.Position
		else
			if victim.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
				character1.Reanimate.FPart.Position = victim.Character.Torso.Position
			else
				character1.Reanimate.FPart.Position = victim.Character.UpperTorso.Position
			end
		end
	end
end)
