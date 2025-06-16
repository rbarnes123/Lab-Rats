local player = game.Players.LocalPlayer
local tool = player.Backpack:WaitForChild("Frankeinrat Body")
local character = player.character or player.characterAdded:wait()
local mouth = character:FindFirstChild("mouth")

tool.Equipped:Connect(function()
    if mouth and tool:FindFirstChild("Handle") then
        local grip = Instance.new("Motor6D")
        grip.Name = "RightGrip"
        grip.Part0 = mouth
        grip.Part1 = tool.Handle
        grip.C0 = CFrame.new(0,0,0)
        grip.C1 = CFrame.new(0,0,0)
        grip.Parent = mouth
    end
end)

tool.Unequipped:Connect(function()
    if mouth and mouth:FindFirstChild("RightGrip") then
        mouth.RightGrip:Destroy()
    end
end)