-- Script Handles the implementation of the Simon Says puzzle
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local player
-- parts involved in puzzle(lights, buttons, start switch)
local startSwitch = Workspace.SimonWall.SimonStart.ProximityPrompt

local light1 = Workspace.SimonWall.Light1
local button1 = Workspace.SimonWall.Light1Button.ClickDetector

local light2 = Workspace.SimonWall.Light2
local button2 = Workspace.SimonWall.Light2Button.ClickDetector

local light3 = Workspace.SimonWall.Light3
local button3 = Workspace.SimonWall.Light3Button.ClickDetector

local light4 = Workspace.SimonWall.Light4
local button4 = Workspace.SimonWall.Light4Button.ClickDetector
-- gets the tool from storage to be spawned later
local bodyTool = replicatedStorage:FindFirstChild("FrankeinRatBody")
-- control variables for the puzzle's loop
local numCorrect = 0
local playerInput = ""
local puzzle = ""
local puzzleIndex = 1
local correctFlag = true
-- allows one copy of the body to be picked up
local touchDB = false
-- puzzle only takes input when pattern not displaying
local inputDB = True
 
-- toggles passed light on and off and plays the sound
local function tgLight(light)
    light.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
    light.simonSound:Play()
    -- if script triggers light toggle, waits to switch
    task.wait(0.2)
    light.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
end

-- compares user input to answer in puzzle
local function checkPuzzle(playerInput)
    if puzzleIndex <= #puzzle then
        if puzzle:sub(puzzleIndex,puzzleIndex) == playerInput then
            puzzleIndex += 1
        else
            correctFlag = false
            puzzleIndex = 1
        end
    end
end

-- gets button input
button1.MouseClick:Connect(function()
    if inputDB == false then
        playerInput = "1"
        tgLight(light1)
        checkPuzzle(playerInput)
    end
end)
button2.MouseClick:Connect(function()
    if inputDB == false then
        playerInput = "2"
        tgLight(light2)
        checkPuzzle(playerInput)
    end
end)
button3.MouseClick:Connect(function()
    if inputDB == false then
        playerInput = "3"
        tgLight(light3)
        checkPuzzle(playerInput)
    end
end)
button4.MouseClick:Connect(function()
    if inputDB == false then
        playerInput = "4"
        tgLight(light4)
        checkPuzzle(playerInput)
    end
end)
light3.simonSound.PlaybackRegionsEnabled = true
light3.simonSound.PlaybackRegion = NumberRange.new(0,0.5)

local function simonHandler()
    -- main loop moves to next stage of the puzzle if previous was correct
    while numCorrect < 10 do
        playerInput = ""
        -- handles which part of the puzzle the user is in
        if numCorrect == 0 then
            inputDB = true
            tgLight(light3)
            puzzle = "3"
            inputDB = false
        elseif numCorrect == 1 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            puzzle = "31"
            inputDB = false
        elseif numCorrect == 2 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            puzzle = "311"
            inputDB = false
        elseif numCorrect == 3 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            puzzle = "3112"
            inputDB = false
        elseif numCorrect == 4 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            puzzle = "31123"
            inputDB = false
        elseif numCorrect == 5 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light4)
            puzzle = "311234"
            inputDB = false
        elseif numCorrect == 6 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light4)
            task.wait(0.5)
            tgLight(light3)
            puzzle = "3112343"
            inputDB = false
        elseif numCorrect == 7 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light4)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light2)
            puzzle = "31123432"
            inputDB = false
        elseif numCorrect == 8 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light4)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light4)
            puzzle = "311234324"
            inputDB = false
        elseif numCorrect == 9 then
            inputDB = true
            tgLight(light3)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light1)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light4)
            task.wait(0.5)
            tgLight(light3)
            task.wait(0.5)
            tgLight(light2)
            task.wait(0.5)
            tgLight(light4)
            task.wait(0.5)
            tgLight(light1)
            puzzle = "3112343241"
            inputDB = false
        else
            print("how")
        end
        -- change loop below to have it wait until either the player is wrong or the length matches 
        while correctFlag == true and puzzleIndex <= #puzzle do
            task.wait(2)
        end
        -- if puzzle correct, add a light to the pattern and reset 
        if correctFlag == true then
            numCorrect += 1
            puzzleIndex = 1
        else
            inputDB = true
            light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
            light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
            light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
            light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
            light1.errorSound.Playing = true
            task.wait(1)
            light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
            light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
            light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
            light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
            -- reset correct flag
            correctFlag = true
        end
        task.wait(1)
    end
    -- when puzzle is complete, all lights stay red, and the body drops from the ceiling
    light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
    light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
    light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
    light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
    inputDB = true
    -- get body from storage and spawn it inside the pipe
    local body = bodyTool:Clone()
    body.Parent = game.Workspace
    -- drop body and play sounds
    body.ratBodyTool.hatch.Playing = true
    body.ratBodyTool.Anchored = true
    task.wait(1)
    body.ratBodyTool.Anchored = false
    task.wait(.25)
    body.ratBodyTool.splat.Playing = true
    body.ratBodyTool.glow.Enabled = true
    -- add body to all player's backpacks when touched
    task.wait(3)
    body.ratBodyTool.Touched:Connect(function()
        if touchDB == false then 
            touchDB = true
            for _, player in players:GetPlayers() do
                -- adds the body to the player, 
                if player:FindFirstChild("Backpack") then
                    local playerTool = bodyTool:Clone()
                    playerTool.Parent = player.Backpack
                    -- hides body copies
                    playerTool.ratBodyTool.Transparency = 1
                    playerTool.ratBodyTool.LeftArm.Transparency = 1
                    playerTool.ratBodyTool.RightArm.Transparency = 1
                    playerTool.ratBodyTool.legs.Transparency = 1
                    playerTool.ratBodyTool.legs.RightLeg.Transparency = 1
                    playerTool.ratBodyTool.CanCollide = false
                    playerTool.ratBodyTool.Anchored = true
                end
            end
            -- deletes the body upon player pickup
            body:Destroy()
        end
    end)
end
-- starts the puzzle
startSwitch.Triggered:Connect(function()
   startSwitch.Enabled = false
   simonHandler()
end)