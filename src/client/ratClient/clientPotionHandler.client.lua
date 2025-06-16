-- Adds or removes potions to player's inventory based on interactions with elixer puzzle

-- services
local replicatedStorage = game:GetService("ReplicatedStorage")

-- parts used
local potionRoom = game.Workspace:WaitForChild("potionRoom")

-- because of how the client loading works I need to call waitForChild on each part of the path to each prox prompt
local blueBarrel = potionRoom:WaitForChild("blueBarrel")
local blueBody = blueBarrel:WaitForChild("body")
local redBarrel = potionRoom:WaitForChild("redBarrel")
local greenBarrel = potionRoom:WaitForChild("greenBarrel")
local blackBarrel = potionRoom:WaitForChild("blackBarrel")
local yellowBarrel = potionRoom:WaitForChild("yellowBarrel")
-- barrel prox prompts
local bluePrompt = blueBody.ProximityPrompt
local redPrompt = potionRoom.redBarrel.body.ProximityPrompt
--local greenPrompt = potionRoom.greenBarrel.body.ProximityPrompt
--local blackPrompt = potionRoom.blackBarrel.body.ProximityPrompt
local yellowPrompt = potionRoom.yellowBarrel.body.ProximityPrompt

-- remote events
local giveTool = replicatedStorage:FindFirstChild("giveTool")
local removeTool = replicatedStorage:FindFirstChild("removeTool")

-- control variables
-- set to name of tool to clone from workspace based on barrel triggered
local desiredChem  = ""

bluePrompt.Triggered:Connect(function()
    desiredChem = "Azulite"
    giveTool:FireServer(desiredChem)

end)

redPrompt.Triggered:Connect(function()
    desiredChem = "Reddium"
    giveTool:FireServer(desiredChem)

end)

--blackPrompt.Triggered:Connect(function()
 --   desiredChem = "Obscurite"
 --   giveTool:FireServer(desiredChem)

--end)

--greenPrompt.Triggered:Connect(function()
  --  desiredChem = "Verdium"
   -- giveTool:FireServer(desiredChem)
--end)


yellowPrompt.Triggered:Connect(function()
    desiredChem = "Goldora"
    giveTool:FireServer(desiredChem)
end)