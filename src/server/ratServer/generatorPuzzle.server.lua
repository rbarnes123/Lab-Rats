-- Implements the generator logic puzzle requring a certain sequence of levers to be flipped
-- services
local replicatedStorage = game:GetService("ReplicatedStorage")

-- parts involved
local lever1 = game.Workspace.fuseBox.lever1
local lever2 = game.Workspace.fuseBox.lever2
local lever3 = game.Workspace.fuseBox.lever3
local lever4 = game.Workspace.fuseBox.lever4
local lever5 = game.Workspace.fuseBox.lever5
local lever6 = game.Workspace.fuseBox.lever6
local reset = game.Workspace.fuseBox.reset

-- control variables
local solutionString = "354261"
local playerString = ""
local l1Flipped = false
local l2Flipped = false
local l3Flipped = false
local l4Flipped = false
local l5Flipped = false
local l6Flipped = false
-- just controls which direction to move when switched for reset
local resetFlipped = false

-- checks if the input string matches the solution
local function compareInput()
    if solutionString == playerString then
        game.Workspace.fuseBox.powerUp.Playing = true
        game.Workspace.leverRoom.indicator.Part.PointLight.Enabled = true
        game.Workspace.leverRoom.indicator.Part.BrickColor = BrickColor.new("Bright red")
        -- turns on the shock orb when the puzzle is complete
        local event = replicatedStorage:FindFirstChild("Event")
        event:fire()
    end
end

-- checks if the lever is flipped or not on click. flips if it hasn't been
game.Workspace.fuseBox.button1.ClickDetector.MouseClick:Connect(function()
    if l1Flipped == false then
        l1Flipped = true
        playerString = playerString .. "1"
        compareInput()
        -- moves the lever and plays a sound
        lever1.Main.Handle.CFrame = lever1.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever1.Main.ToUnanchor.CFrame = lever1.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound3.Playing = true
    end
end)
game.Workspace.fuseBox.button2.ClickDetector.MouseClick:Connect(function()
    if l2Flipped == false then
        l2Flipped = true
        playerString = playerString .. "2"
        compareInput()
        -- moves the lever and plays a sound
        lever2.Main.Handle.CFrame = lever2.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever2.Main.ToUnanchor.CFrame = lever2.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound2.Playing = true
    end
end)
game.Workspace.fuseBox.button3.ClickDetector.MouseClick:Connect(function()
    if l3Flipped == false then
        l3Flipped = true
        playerString = playerString .. "3"
        compareInput()
        -- moves the lever and plays a sound
        lever3.Main.Handle.CFrame = lever3.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever3.Main.ToUnanchor.CFrame = lever3.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound1.Playing = true
    end
end)
game.Workspace.fuseBox.button4.ClickDetector.MouseClick:Connect(function()
    if l4Flipped == false then
        l4Flipped = true
        playerString = playerString .. "4"
        compareInput()
        -- moves the lever and plays a sound
        lever4.Main.Handle.CFrame = lever4.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever4.Main.ToUnanchor.CFrame = lever4.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound3.Playing = true
    end
end)
game.Workspace.fuseBox.button5.ClickDetector.MouseClick:Connect(function()
    if l5Flipped == false then
        l5Flipped = true
        playerString = playerString .. "5"
        compareInput()
        -- moves the lever and plays a sound
        lever5.Main.Handle.CFrame = lever5.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever5.Main.ToUnanchor.CFrame = lever5.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound2.Playing = true
    end
end)
game.Workspace.fuseBox.button6.ClickDetector.MouseClick:Connect(function()
    if l6Flipped == false then
        l6Flipped = true
        playerString = playerString .. "6"
        compareInput()
        -- moves the lever and plays a sound
        lever6.Main.Handle.CFrame = lever6.Main.Handle.CFrame * CFrame.new(0,-1,0)
        lever6.Main.ToUnanchor.CFrame = lever6.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        game.Workspace.fuseBox.leverSound1.Playing = true
    end
end)
-- flips everything back to off 
game.Workspace.fuseBox.resetButton.ClickDetector.MouseClick:Connect(function()
    -- moves reset lever back and forth based on flag
    game.Workspace.leverRoom.indicator.Part.PointLight.Enabled = false
    game.Workspace.leverRoom.indicator.Part.BrickColor = BrickColor.new("Smoky grey")
    if resetFlipped == false then
        reset.Main.Handle.CFrame = reset.Main.Handle.CFrame * CFrame.new(0,-1,0)
        reset.Main.ToUnanchor.CFrame = reset.Main.ToUnanchor.CFrame * CFrame.new(0,-1,0)
        resetFlipped = true
    else
        reset.Main.Handle.CFrame = reset.Main.Handle.CFrame * CFrame.new(0,1,0)
        reset.Main.ToUnanchor.CFrame = reset.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        resetFlipped = false
    end
    -- resets everything based on which levers were flipped already
    if l1Flipped == true then
        l1Flipped = false
        lever1.Main.Handle.CFrame = lever1.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever1.Main.ToUnanchor.CFrame = lever1.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
    end
    if l2Flipped == true then
        l2Flipped = false
        lever2.Main.Handle.CFrame = lever2.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever2.Main.ToUnanchor.CFrame = lever2.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        
    end
    if l3Flipped == true then
        l3Flipped = false
        lever3.Main.Handle.CFrame = lever3.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever3.Main.ToUnanchor.CFrame = lever3.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        
    end
    if l4Flipped == true then
        l4Flipped = false
        lever4.Main.Handle.CFrame = lever4.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever4.Main.ToUnanchor.CFrame = lever4.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        
    end
    if l5Flipped == true then
        l5Flipped = false
        lever5.Main.Handle.CFrame = lever5.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever5.Main.ToUnanchor.CFrame = lever5.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        
    end
    if l6Flipped == true then
        l6Flipped = false
        lever6.Main.Handle.CFrame = lever6.Main.Handle.CFrame * CFrame.new(0,1,0)
        lever6.Main.ToUnanchor.CFrame = lever6.Main.ToUnanchor.CFrame * CFrame.new(0,1,0)
        
    end
   playerString = ""
   game.Workspace.fuseBox.resetSound.Playing = true 
end)