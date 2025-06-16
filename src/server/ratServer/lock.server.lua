-- Implements the lock to enter key obtained from the shock orb message
-- Services
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
--Parts Used
local lock = game.Workspace.lock
local wheel1 = lock.wheel1
local wheel2 = lock.wheel2
local wheel3 = lock.wheel3
local wheel4 = lock.wheel4
local wheel5 = lock.wheel5
local largeOrb = game.Workspace.shockOrb
local smallOrb1 = game.Workspace.powerPole.shockOrbSmall
local smallOrb2 = game.Workspace.powerPole2.shockOrbSmall
-- Control Variables
-- current index in the letter array for each wheel
local currIndex1 = 2
local currIndex2 = 10
local currIndex3 = 15
local currIndex4 = 8
local currIndex5 = 25
-- moves index up or down based on click
local up1 = wheel1.up.ClickDetector
local down1 = wheel1.down.ClickDetector

local up2 = wheel2.up.ClickDetector
local down2 = wheel2.down.ClickDetector

local up3 = wheel3.up.ClickDetector
local down3 = wheel3.down.ClickDetector

local up4 = wheel4.up.ClickDetector
local down4 = wheel4.down.ClickDetector

local up5 = wheel5.up.ClickDetector
local down5 = wheel5.down.ClickDetector

-- flag for helping with wrapping
local up = false
local down = false
-- stops wheel from changing when puzzle is solved
local lockSolved = false
local allSolved = false
-- flag for gui later
local serumFlag = true
local genFlag = true
local bodyFlag = true
-- checks if other puzzles have been completed or not(helps with lever later)
local serum = game.Workspace.surgeryTable.frankeinRatBody.Injector.serum
local body = game.Workspace.surgeryTable.frankeinRatBody.RightArm
local generator = game.Workspace.leverRoom.indicator.Part.PointLight

-- wheel sections
local top1 = wheel1.wheelTop.SurfaceGui.TextBox
local mid1 = wheel1.wheelMid.SurfaceGui.TextBox
local bot1 = wheel1.wheelBot.SurfaceGui.TextBox

local top2 = wheel2.wheelTop.SurfaceGui.TextBox
local mid2 = wheel2.wheelMid.SurfaceGui.TextBox
local bot2 = wheel2.wheelBot.SurfaceGui.TextBox

local top3 = wheel3.wheelTop.SurfaceGui.TextBox
local mid3 = wheel3.wheelMid.SurfaceGui.TextBox
local bot3 = wheel3.wheelBot.SurfaceGui.TextBox

local top4 = wheel4.wheelTop.SurfaceGui.TextBox
local mid4 = wheel4.wheelMid.SurfaceGui.TextBox
local bot4 = wheel4.wheelBot.SurfaceGui.TextBox

local top5 = wheel5.wheelTop.SurfaceGui.TextBox
local mid5 = wheel5.wheelMid.SurfaceGui.TextBox
local bot5 = wheel5.wheelBot.SurfaceGui.TextBox


--  Array with letters A-Z
local letters = {'A','B','C','D','E','F','G','H','I','J','K',
'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}

--click sound for when each button is moved
local clickSound = game.Workspace.lock.click

-- solution to the puzzle
local solution = "MARIA"
-- holds letters in the middle level of the lock
local lockLetters = ""
-- for teleporting camera to lock puzzle and handling the reward
local prompt = lock.ratLever.Base.ProximityPrompt
local lockCamera = lock.camera
local exit = lock.lockExit.ClickDetector
local chains = lock.ratLever.chains
local lockJoin = replicatedStorage:FindFirstChild("lockJoin")
local lockExit = replicatedStorage:FindFirstChild("lockExit")
local flicker = replicatedStorage:FindFirstChild("flicker")
-- remote event to control error gui
local errorGuiOpen = replicatedStorage:FindFirstChild("errorGuiOpen")
-- gui for each wheel starts as letters based on curr index
-- wheelTop = currIndex - 1
-- wheelMid = currIndex
-- wheelBOt = currIndex + 1
-- sets letters based on index
local function SetLetters(up,down,changedIndex,changedTop,changedMid,changedBot)
    -- checks if user selected up or down
    if up  == true then 
        -- resets flag 
        up = false
        changedTop.Text = changedMid.Text
        -- checks if change needs to wrap or not
        if changedIndex == 25 then
            changedMid.Text = changedBot.Text
            changedIndex = changedIndex + 1
            -- wraps because mid is = end of alphabet(z) so bot needs to be A
            changedBot.Text = letters[1]
            return changedIndex
        -- handles wrapping of changedIndex
        elseif changedIndex == 26 then
            changedMid.Text = changedBot.Text
            changedIndex = 1
            changedBot.Text = letters[changedIndex + 1]
            return changedIndex
        else
            changedMid.Text = changedBot.Text
            changedIndex = changedIndex + 1
            changedBot.Text = letters[changedIndex + 1]
            return changedIndex 
        end
    elseif down == true then
        -- resets flag
        down = false
        changedBot.Text = changedMid.Text
        --checks if wrap is needed or not
        if changedIndex == 2 then
            changedMid.Text = changedTop.Text
            changedIndex = changedIndex - 1
            -- wraps because mid is last letter(A) so top must become z
            changedTop.Text = letters[26]
            return changedIndex
        -- handles wrapping of changedIndex
        elseif changedIndex == 1 then
            changedMid.Text = changedTop.Text
            changedIndex = 26
            changedTop.Text = letters[changedIndex - 1]
            return changedIndex
        else
            changedMid.Text = changedTop.Text
            changedIndex = changedIndex - 1
            changedTop.Text = letters[changedIndex - 1]
            return changedIndex
        end
    -- neither up or down was selected(initialization stage)
    else
        print("init")
        top1.Text = letters[currIndex1 - 1]
        mid1.Text = letters[currIndex1]
        bot1.Text = letters[currIndex1 + 1]

        top2.Text = letters[currIndex2 - 1]
        mid2.Text = letters[currIndex2]
        bot2.Text = letters[currIndex2 + 1]

        top3.Text = letters[currIndex3 - 1]
        mid3.Text = letters[currIndex3]
        bot3.Text = letters[currIndex3 + 1]

        top4.Text = letters[currIndex4 - 1]
        mid4.Text = letters[currIndex4]
        bot4.Text = letters[currIndex4 + 1]

        top5.Text = letters[currIndex5 - 1]
        mid5.Text = letters[currIndex5]
        bot5.Text = letters[currIndex5 + 1]
    end
end

-- controls gui text based on whether lock has been solved or not
local function controlPrompt ()

    if lockSolved == false then
        prompt.ActionText = "Unlock"
    elseif allSolved == false then
        prompt.ActionText = "Science?"
    else
        prompt.Enabled = false
    end
end

-- function compares letters in mid to solution
local function check()
    -- reset string
    lockLetters = ""
    -- append each letter currently in solution part of lock
    lockLetters = lockLetters .. mid1.Text
    lockLetters = lockLetters .. mid2.Text
    lockLetters = lockLetters .. mid3.Text
    lockLetters = lockLetters .. mid4.Text
    lockLetters = lockLetters .. mid5.Text
    if lockLetters == solution then
        lockSolved = true
        lock.chainBreak.Playing = true
        -- loops through chain model and unanchors all the links
        for _, part in pairs(chains:GetDescendants()) do
            if part:IsA("BasePart") then -- Covers Part, MeshPart, etc.
                part.Anchored = false
            end
        end
        controlPrompt()
    end
end

-- calls setLetters so set based on initial values
SetLetters()

-- on Arrow click, changes index, calls SetLetters and then check
up1.MouseClick:Connect(function()
    if lockSolved == false then
        up = true
        down = false
        currIndex1 = SetLetters(up,down,currIndex1,top1,mid1,bot1)
        clickSound.Playing = true
        check()
    end
end)

down1.MouseClick:Connect(function()
    if lockSolved == false then
        up = false
        down = true
        currIndex1 = SetLetters(up,down,currIndex1,top1,mid1,bot1)
        clickSound.Playing = true
        check()
    end
end)

up2.MouseClick:Connect(function()
    if lockSolved == false then
        up = true
        down = false
        clickSound.Playing = true
        currIndex2 = SetLetters(up,down,currIndex2,top2,mid2,bot2)
        check()
    end
end)

down2.MouseClick:Connect(function()
    if lockSolved == false then
        up = false
        down = true
        clickSound.Playing = true
        currIndex2 = SetLetters(up,down,currIndex2,top2,mid2,bot2)
        check()
    end
end)

up3.MouseClick:Connect(function()
    if lockSolved == false then
        up = true
        down = false
        clickSound.Playing = true
        currIndex3 = SetLetters(up,down,currIndex3,top3,mid3,bot3)
        check()
    end
end)

down3.MouseClick:Connect(function()
    if lockSolved == false then
        up = false
        down = true
        clickSound.Playing = true
        currIndex3 = SetLetters(up,down,currIndex3,top3,mid3,bot3)
        check()
    end
end)

up4.MouseClick:Connect(function()
    if lockSolved == false then
        up = true
        down = false
        clickSound.Playing = true
        currIndex4 = SetLetters(up,down,currIndex4,top4,mid4,bot4)
        check()
    end
end)

down4.MouseClick:Connect(function()
    if lockSolved == false then
        up = false
        down = true
        clickSound.Playing = true
        currIndex4 = SetLetters(up,down,currIndex4,top4,mid4,bot4)
        check()
    end
end)

up5.MouseClick:Connect(function()
    if lockSolved == false then
        up = true
        down = false
        clickSound.Playing = true
        currIndex5 = SetLetters(up,down,currIndex5,top5,mid5,bot5)
        check()
    end
end)

down5.MouseClick:Connect(function()
    if lockSolved == false then
        up = false
        down = true
        clickSound.Playing = true
        currIndex5 = SetLetters(up,down,currIndex5,top5,mid5,bot5)
        check()
    end
end)

controlPrompt()

-- different effect depending on lock state
prompt.Triggered:Connect(function(localPlayer)
    if lockSolved == false then
        -- fire join event send lockCamera and localPlayer
        lockJoin:FireClient(localPlayer,lockCamera)
    -- checks if all puzzles have been finished
    else
        if serum.Transparency ~= 1 and body.Transparency ~= 1 and generator.Enabled == true then
            allSolved = true
            controlPrompt()
            -- orb changes to red
            largeOrb.BrickColor = BrickColor.new("Really red")
            smallOrb1.BrickColor = BrickColor.new("Really red")
            smallOrb2.BrickColor = BrickColor.new("Really red")
            -- lightning sound plays
            local lightning = game.Workspace.surgeryTable.lightning
            lightning.Playing = true
            task.wait(3)
            -- deletes body from table
            local ratHead = game.Workspace.surgeryTable.frankenRat
            local ratBody = game.Workspace.surgeryTable.frankeinRatBody
            ratHead:Destroy()
            ratBody:Destroy()
            -- spawns frankeinrat
            local fkRat = replicatedStorage:FindFirstChild("frankeinRat")
            fkRat = fkRat:Clone()
            fkRat.Parent = game.Workspace
            --frankeinrat roars
            local roar = game.Workspace.surgeryTable.roar
            roar.Playing = true
            -- disables collision on far wall so frankeinrat can escape
            local exitGlass = game.Workspace.exitGlass
            exitGlass.CanCollide = false
            -- plays glass breaking sound when frakeinrat reaches the window
            task.wait(2)
            local glassBreak = exitGlass.glassBreak
            glassBreak.Playing = true

        else
            -- checks if there is power or not, if power but something wrong there will be a flicker
            if generator.Enabled == false then
                genFlag = false
            -- flicker to indicate there is an error
            else
                flicker:fire()
                genFlag = true
            end
            if serum.Transparency == 1 then
                serumFlag = false
            else
                serumFlag = true
            end
            if body.Transparency == 1 then
                bodyFlag = false
            else 
                bodyFlag = true
            end
            errorGuiOpen:FireClient(localPlayer,genFlag,serumFlag,bodyFlag)
        end
    end
end)

exit.MouseClick:Connect(function(localPlayer)
    lockExit:FireClient(localPlayer)
end)
