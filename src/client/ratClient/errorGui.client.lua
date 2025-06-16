-- controls the gui for Errors with the final lever
--(lets the player know if they are missing a part or puzzle)

--services
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
-- parts used
local player = game.Players.LocalPlayer
local errorGui = player.PlayerGui:WaitForChild("leverErrorGui")
local errorGuiOpen = replicatedStorage:WaitForChild("errorGuiOpen")

-- displays gui elements based on state of puzzles
errorGuiOpen.OnClientEvent:Connect(function(genFlag,serumFlag,bodyFlag)
    -- extends time gui is open based on how many errors there are
    local openTime = 0
    errorGui.Enabled = true
    -- checks if power is on
    if genFlag == false then
        errorGui.Frame.genBox.Visible = true
        openTime = openTime + 2.25
    else
        errorGui.Frame.genBox.Visible = false
    end
    -- checks if serum has been injected 
    if serumFlag == false then
        errorGui.Frame.serumBox.Visible = true
        openTime = openTime + 2.25
    else
        errorGui.Frame.serumBox.Visible = false
    end
    -- checks if body has been placed
    if bodyFlag == false then
        errorGui.Frame.bodyBox.Visible = true
        openTime = openTime + 2.25
    else
        errorGui.Frame.bodyBox.Visible = false
    end
    -- waits and then closes the Gui
    task.wait(openTime)
    errorGui.Enabled = false
end)