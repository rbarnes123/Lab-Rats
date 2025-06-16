-- handles the logic for the elixer puzzle
-- this includes the chemical vat, mixer, and oven logic

--services
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- remote events
local giveTool = replicatedStorage:FindFirstChild("giveTool")
local removeTool = replicatedStorage:FindFirstChild("removeTool")

-- parts used
local potionRoom = game.Workspace.potionRoom
-- vat where chemicals are added towards solution
local vat = potionRoom.vat
local vatPrompt = vat.Part.ProximityPrompt
local vatSpawn = vat.vatSpawn
--explosion sound when you get it wrong
local boom = vat.boom

-- trashcan
local trashCan = potionRoom.trashCan
local trashPrompt = trashCan.ProximityPrompt

-- Mixing table 
local mixer = potionRoom.mixer
local p1
local p1Tray =  mixer.p1Tray
local p1Prompt = p1Tray.ProximityPrompt
local p1Indicator = mixer.p1Indicator
local p2
local p2Tray = mixer.p2Tray
local p2Prompt = p2Tray.ProximityPrompt
local p2Indicator = mixer.p2Indicator
-- potion returned from mixing 2 others
local mixFolder = game.Workspace.mixerPotions
local mixPrompt = p1Indicator.mixPrompt
-- mix sounds
local mixDing = mixer.mixDing
local mixSound = mixer.mixSound

-- Oven
local oven = potionRoom.oven
local ovenPrompt = oven.wood.stick.ProximityPrompt
local fire = oven.wood.stick.fire
-- potion oven will interact with
local pOven
-- oven sounds
local ovenStart = oven.ovenStart
local flames = oven.flames
local ovenDing = oven.ovenDing


-- control variables 
-- number of potions added to vat and value of vat
local potionsAdded = 0
local vatVal = 0
--flags for if potion has been added to mixer/oven
local p1Added = false
local p2Added = false
local pOvenAdded = false
local pMixed = false

-- checks if both potions have been added if so, enables mix prompt
local function checkMix()
    if p1Added == true and p2Added == true then
        mixPrompt.Enabled = true
    end
end
-- splits a string into words based on whitespace
local function split(str)
    local result = {}
    for part in string.gmatch(str, "%S+") do
        table.insert(result, part)
    end
    return result
end

trashPrompt.Triggered:Connect(function(localPlayer)
    local items = localPlayer.Character:GetChildren()
    print(items)
    if items[9].Bottle then
        items[9]:Destroy()
    end
end)

giveTool.OnServerEvent:Connect(function(player,desiredChem)
    -- gets folder of tools in storage and tool itself
    local PotionTools = replicatedStorage:WaitForChild("PotionTools")
    local cloneMe = PotionTools:FindFirstChild(desiredChem)
    local clone = Instance.new("Tool")
    -- gets player and character 
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character

    -- check if potion is in hand or backpack before cloning
    if(backpack:FindFirstChild(desiredChem) == nil) then
        if(character:FindFirstChild(desiredChem) == nil) then
            -- if not in hand or backpack, fires event to add specific tool to player's backpack
            clone = cloneMe:Clone()
            clone.Parent = backpack
        end
    end
end)


-- adds a potion to p1 if one is equipped
p1Prompt.Triggered:Connect(function(localPlayer)
    local character = localPlayer.Character
    local items = character:GetChildren()
    -- no potion yet, clone from player to p1, delete from player, check if mixing is available
    if p1Added == false then
        if(items[9]) then 
            -- clone potion
            local p1Clone = items[9]:Clone()
            p1Clone.Parent = game.Workspace.mixerPotions.p1
            p1Clone.Bottle.CFrame = p1Tray.CFrame + Vector3.new(0,0.5,0)
            p1Clone.Bottle.Anchored = true 
            p1Added = true
            -- change indicator
            p1Indicator.BrickColor = BrickColor.new("Lime green")
            p1Prompt.Enabled = false
            -- delete from player
            items[9]:Destroy()
            -- checks if player can mix
            checkMix()
        end
    end
end)

-- adds potion to p2 if a potion is equipped
p2Prompt.Triggered:Connect(function(localPlayer)
    local character = localPlayer.Character
    local items = character:GetChildren()
    -- no potion yet, clone from player, to p1, delete from player, change p1 prompt
    if p2Added == false then
        if(items[9]) then 
            -- clone item to tray
            local p2Clone = items[9]:Clone()
            p2Clone.Parent = game.Workspace.mixerPotions.p2
            p2Clone.Bottle.CFrame = p2Tray.CFrame + Vector3.new(0,0.5,0)
            p2Clone.Bottle.Anchored = true 
            p2Added = true
            -- change indicator
            p2Indicator.BrickColor = BrickColor.new("Lime green")
            p2Prompt.Enabled = false
            -- delete from player
            items[9]:Destroy()
            -- checks if player can mix
            checkMix()
        end
    end
end)

mixPrompt.Triggered:Connect(function(localPlayer)
    local p1Value
    local p2Value
    local p3Value 
    -- if not mixed, mixes potions into a new one
    if pMixed == false then
        -- play mixing sound here 
        -- destroys p1 and p2, creates p3(mixed potion) 
        for _, item in game.Workspace.mixerPotions.p1:GetChildren() do 
            p1Value = item.Value.Value
            print("p1 value= ", p1Value)
            item:Destroy()
        end
        for _, item in game.Workspace.mixerPotions.p2:GetChildren() do 
            p2Value = item.Value.Value
            print("p2 value= ", p2Value)
            item:Destroy()
        end
        p3Value = p1Value + p2Value
        --plays mix sound, hides prompt
        mixPrompt.Enabled = false
        mixSound.Playing = true
        task.wait(6)
        -- plays done sound shows prompt again
        mixDing.Playing = true
        mixPrompt.Enabled = true

        -- checks for a potion with the same value as the mixed one, if not, it becomes a mystery potion
        for _, item in replicatedStorage.PotionTools:GetChildren() do
            -- clones item that = value and puts it in output
            local floored = math.floor(p3Value)
            if floored == item.Value.Value then
                local p3 = item:Clone()
                p3.Parent = game.Workspace.mixerPotions.output
                p3.Bottle.CFrame = mixer.top.CFrame - Vector3.new(1,0.5,-2)
                task.wait(0.25)
                p3.Bottle.Anchored = true
                p3.Value.Value = p3Value
            end
        end
        print(p3Value)
        -- if no item's value matched, becomes a mysteryPotion
        if(#game.Workspace.mixerPotions.output:GetChildren() == 0) then
            local p3 = replicatedStorage.PotionTools:FindFirstChild("MysteryElixer"):Clone()
            p3.Parent = game.Workspace.mixerPotions.output
            p3.Value.Value = p3Value
            if(p3Value == 15) then
                p3.Name = "Omnium"
                p3.purplePotion.Liquid.BrickColor = BrickColor.new("Lily white")
            end
            p3.Bottle.CFrame = mixer.top.CFrame - Vector3.new(1,0.5,1)
            task.wait(0.25)
            p3.Bottle.Anchored = true
        end
        print("mixed value = ",p3Value)
        pMixed = true 
        mixPrompt.ActionText = "Take"
    else 
        -- potion already mixed, clones to player's inventory, destroys p3

        --clones to player's inventory
        local p3 = game.Workspace.mixerPotions.output:GetChildren()[1]
        local clone = p3:Clone()
        clone.Parent = localPlayer:FindFirstChild("Backpack")
        -- hides the potion underground 
        clone.Bottle.CFrame = CFrame.new(0,-1000,0)
        -- destroys p3
        p3:Destroy()

        --resets indicators, p1 p2 prompts and hides mix prompt
        p2Indicator.BrickColor = BrickColor.new("Really red")
        p1Indicator.BrickColor = BrickColor.new("Really red")
        p1Prompt.Enabled = true
        p2Prompt.Enabled = true
        -- resets flags for p1 and p2
        p1Added = false
        p2Added = false
        -- resets mixer once potion is taken
        pMixed = false
        mixPrompt.Enabled = false
        mixPrompt.ActionText = "Mix"
    end
end)
-- cooks an item into a new one(adds 1 to its value)
ovenPrompt.Triggered:Connect(function(localPlayer)
    local character = localPlayer.Character
    local items = character:GetChildren()
    -- potion not added yet, clones from player and deletes it 
    if pOvenAdded == false then
        -- checks if player has equipped an item or not
        if items[9].Bottle then
            -- if equipped, clones to oven, deletes from player
            pOven = items[9]:Clone()
            pOven.Parent = game.Workspace.ovenFolder
            pOven.Bottle.CFrame = oven.wood.stick.CFrame + Vector3.new(0,0.5,0)
            pOven.Bottle.Anchored = true
            items[9]:Destroy()

            -- turns on fire, plays cooking sounds
            fire.Enabled = true
            ovenStart.Playing = true
            task.wait(1)
            flames.Playing = true
            -- increments value of potion and changes color to match the value
            pOven.Value.Value = pOven.Value.Value + .25
            print(pOven.Value.Value)
            -- splits string so I can change name of item based on how cooked it is
            local split = split(pOven.Name," ")
            if(split[2]) then 
                pOven.Name = split[2]
            end
            --0.25 is cooked
            if pOven.Value.Value - math.floor(pOven.Value.Value) == .25 then
                pOven.Name = "Cooked " .. pOven.Name
            --0.5 is crispy
            elseif pOven.Value.Value - math.floor(pOven.Value.Value) == .5 then
                pOven.Name = "Crispy " .. pOven.Name

            -- 0.75 is burnt
            elseif pOven.Value.Value - math.floor(pOven.Value.Value) == .75 then
                pOven.Name = "Burnt " .. pOven.Name
            end

            -- waits for the cooking to finish
            ovenPrompt.Enabled = false
            task.wait(10)
            fire.Enabled = false
            flames.Playing = false
            ovenDing.Playing = true

            -- changes prompt and flag
            ovenPrompt.ActionText = "Take"
            pOvenAdded = true
            ovenPrompt.Enabled = true
        end
    else 
      -- removes from oven, adds to player
      pOven.Parent = localPlayer:FindFirstChild("Backpack")
      -- moves cFrame to hide potion
      pOven.Bottle.CFrame = CFrame.new(0,-1000,0)
      -- resets prompt and flag
      pOvenAdded = false
      ovenPrompt.ActionText = "Cook"
    end

end)

-- resets the vat if the potion combo was wrong, plays an explosion as well
local function explode()
    local vatPos = vat.Part.CFrame.Position
    vatVal = 0
    potionsAdded = 0
    --plays explosion sound
    --flings players near vat
    local explosion = Instance.new("Explosion")

    explosion.Position = vatPos
    explosion.DestroyJointRadiusPercent = 0
	explosion.ExplosionType = Enum.ExplosionType.NoCraters
    explosion.BlastRadius = 50
    boom.Playing = true
    explosion.Parent = vat
end

-- responds to each prompt being triggered(passes player and then will clone or remove to appropriate place)
vatPrompt.Triggered:Connect(function(localPlayer)
    -- checks if a potion is equipped
    local items = localPlayer.Character:GetChildren()
    if(items[9].Bottle) then
        -- if potion equipped, adds it to vat
        potionsAdded = potionsAdded + 1
        local potion = items[9]
        potion.Parent = game.Workspace
        potion.Bottle.CFrame = vatSpawn.CFrame
        potion.Bottle.Anchored = false
        potion.Bottle.CanCollide = false
        -- plays sounds, updates vat value, destroys potion
        vatVal = vatVal + potion.Value.Value
        --waits for potion to fall into vat and then destroys it
        print("vatVal = ",vatVal)
        print(potionsAdded)
        task.wait(1.5)
        potion:Destroy()
        -- checks if potion added was correct
        if(potionsAdded == 1) then
            -- potion is correct
            if(vatVal ~= 5.25) then
                explode()
            end
        elseif potionsAdded == 2 then
            if(vatVal ~= 8.25) then
                explode()
            end
        elseif potionsAdded == 3 then
            if(vatVal ~= 15.25) then
                explode()
            end
        elseif potionsAdded == 4 then
            if(vatVal ~= 19.75) then
                explode()
            end
        elseif potionsAdded == 5 then
            if(vatVal ~= 34.75) then
                explode()
            -- all parts correct, adds ratSerum to players' inventory
            else 
                -- plays confetti sound and shows confetti
                local confetti = vat.confetti
                local emitter = vat.Part.emitter
                confetti.Playing = true
                emitter.Enabled = true

                for _, player in players:GetChildren() do
                    local ratSerum = replicatedStorage:FindFirstChild("RatSerum")
                    local serumClone = ratSerum:Clone()
                    serumClone.Parent = player:FindFirstChild("Backpack")
                end
                -- waits and then turns off confetti
                task.wait(2)
                emitter.Enabled = false
            end
        else
            explode()
        end
    end
end)
