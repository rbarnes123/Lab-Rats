local joinedEvent = game.ReplicatedStorage:WaitForChild("joinQueue")
local leftEvent = game.ReplicatedStorage:WaitForChild("leaveQueue")

joinedEvent.OnClientEvent:Connect(function(part)
	local camera  = game.Workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = part.CFrame
	
end)

leftEvent.OnClientEvent:Connect(function()
	local camera  = game.Workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Custom
end)
