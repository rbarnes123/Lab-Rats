-- displays the lever puzzle's instructions in a more readable gui
-- services
local players = game:GetService("Players")
-- parts/gui
local player = game.Players.LocalPlayer
local gui = player.PlayerGui:WaitForChild("leverPuzzleInstructions")
local fuseBox = game.Workspace:WaitForChild("fuseBox")
local open = fuseBox.fuseDoor.fuseBoxInstructions:WaitForChild("open")
local close = gui.close

open.MouseClick:Connect(function()
	gui.Enabled = true
end)

close.MouseButton1Click:Connect(function()
	gui.Enabled = false
end)