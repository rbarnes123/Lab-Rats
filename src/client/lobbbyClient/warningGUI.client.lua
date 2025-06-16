--closes the warning for flashing lights when the player clicks close
--services
local players = game:GetService("Players")
--vars
local warningGUI = players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("flashWarning")
local frame = warningGUI.Frame
local exit = frame:FindFirstChild("exit")

exit.MouseButton1Click:Connect(function()
	warningGUI.Enabled = false
end)