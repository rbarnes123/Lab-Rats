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
-- debounces for starting puzzle loop, grabbing body, lights taking input if puzzle incorrect
local DB = false
local touchDB = false
local correctDB = false
-- gets button input
button1.MouseClick:Connect(function()
    if correctDB == false then
        playerInput = playerInput.."1"
        light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light3.simonSound.Playing = true
        task.wait(0.5)
        light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
    end
    
end)
button2.MouseClick:Connect(function()
    if correctDB == false then
        playerInput = playerInput.."2"
        light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light3.simonSound.Playing = true
        task.wait(0.5)
        light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
    end
end)
button3.MouseClick:Connect(function()
    if correctDB == false then
        playerInput = playerInput.."3"
        light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light3.simonSound.Playing = true
        task.wait(0.5)
        light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
    end
end)
button4.MouseClick:Connect(function()
    if correctDB == false then
        playerInput = playerInput.."4"
        light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light3.simonSound.Playing = true
        task.wait(0.5)
        light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
    end
end)
light3.simonSound.PlaybackRegionsEnabled = true
light3.simonSound.PlaybackRegion = NumberRange.new(0,0.5)
local function simonHandler()
    -- main loop moves to next stage of the puzzle if previous was correct
    if DB == false then
        DB = true
        while numCorrect < 10 do
            playerInput = ""
            -- handles which part of the puzzle the user is in
            if numCorrect == 0 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound:play()
                task.wait(0.5)
                -- 3 off
                light3.simonSound:stop()
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "3"
            elseif numCorrect == 1 then
                -- light 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "31"
            elseif numCorrect == 2 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "311"
            elseif numCorrect == 3 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "3112"
            elseif numCorrect == 4 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "31123"
            elseif numCorrect == 5 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off 4 on
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "311234"
            elseif numCorrect == 6 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off 4 on
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off 3 on
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "3112343"
            elseif numCorrect == 7 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off 4 on
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off 3 on
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 2 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 2 off
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "31123432"
            elseif numCorrect == 8 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off 4 on
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off 3 on
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 2 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 2 off 4 on
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "311234324"
            elseif numCorrect == 9 then
                -- 3 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 1 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 1 on again
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off 2 on
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 2 off 3 on
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 3 off 4 on
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off 3 on
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 3 off 2 on
                light3.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 2 off 4 on
                light2.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                -- 4 off 1 on 
                task.wait(0.5)
                light4.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                task.wait(0.5)
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
                light3.simonSound.Playing = true
                task.wait(0.5)
                -- 1 off
                light1.Glass_LIGHT.BrickColor = BrickColor.new("Really black")
                puzzle = "3112343241"
            else
                print("how")
            end

            while #playerInput < #puzzle do
                task.wait(2)
            end
            if puzzle == playerInput then
                numCorrect += 1
            else
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
                numCorrect = 0
            end
            task.wait(1)
        end
        -- when puzzle is complete, all lights turn stay red, and the body drops from the ceiling
        light1.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light2.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light3.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        light4.Glass_LIGHT.BrickColor = BrickColor.new("Persimmon")
        correctDB = True
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
end
-- starts the puzzle
startSwitch.Triggered:Connect(function()
   startSwitch.Enabled = false
   simonHandler()
end)