-- gets local player's camera and changes it
--services
local replicatedStorage = game:GetService("ReplicatedStorage")

-- control variables
local lockJoin = replicatedStorage:WaitForChild("lockJoin")
local lockExit = replicatedStorage:WaitForChild("lockExit")


lockJoin.OnClientEvent:Connect(function(part)
    -- gets camera of current player to change
    local camera = game.Workspace.CurrentCamera
    camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = part.CFrame
end)

lockExit.OnClientEvent:Connect(function()
    local camera  = game.Workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Custom
end)

