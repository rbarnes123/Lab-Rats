-- Script handles interactions with the table and puzzle rewards
-- Services
local players = game:GetService("Players")
-- Workspace Parts
local table = game.Workspace.surgeryTable
local body = table.frankeinRatBody
local prompt = body.ProximityPrompt
local serum = body.Injector
-- Control Variables
local bodyFlag = false
local serumFlag = false

-- changes prompt text based on event stage
local function controlPrompt()
    if bodyFlag == false then 
        prompt.ActionText = "Place Body"
    elseif bodyFlag  == true and serumFlag == false then
        prompt.ActionText = "Inject serum"
    elseif bodyFlag == true and serumFlag == true then
        prompt.Enabled = false 
    end
end

-- for every player in the instance, check if item is equipped or in backback and delete it
local function deletefromPlayers(item)
    for _, player in ipairs(players:GetPlayers()) do
        local character = player.Character
        -- if item in backpack delete it
        local backpackItem = player.Backpack:FindFirstChild(item.Name)
        if(backpackItem ~= nil) then
            backpackItem:Destroy()
        end
        -- if item in hand delete it
        local heldItem = character:FindFirstChild(item.Name)
        if(heldItem ~= nil) then
            heldItem:Destroy()
        end
        -- if item in starter gear delete it
        local starterItem = player.StarterGear:FindFirstChild(item.Name)
        if(starterItem ~= nil) then
            starterItem:Destroy()
        end
    end
end

prompt.Triggered:Connect(function(localPlayer)
    -- gets player's character
    local character = localPlayer.Character
    -- checks if the required part is in the backpack
    controlPrompt()
    if bodyFlag == false then
        for _, item in localPlayer.Backpack:GetChildren() do
            -- if body in inventory place it on table
            if item.Name == "FrankeinRatBody" then
                bodyFlag = true
                body.LeftArm.Transparency = 0
                body.RightArm.Transparency = 0
                body.tableLegs.Transparency = 0
                body.tableLegs.RightLeg.Transparency = 0
                body.Transparency = 0
                -- body is placed, remove from inventory
                deletefromPlayers(item)
                controlPrompt()
            end
        end
        -- if body not in backpack checks hand
        local bodyInHand = character:FindFirstChild("FrankeinRatBody")
        if(bodyInHand ~= nil) then
            bodyFlag = true
            body.LeftArm.Transparency = 0
            body.RightArm.Transparency = 0
            body.tableLegs.Transparency = 0
            body.tableLegs.RightLeg.Transparency = 0
            body.Transparency = 0
            -- body is placed, remove from inventory
            deletefromPlayers(bodyInHand)
            controlPrompt()
        end
    -- body placed, check serum
    else
        for _, item in localPlayer.Backpack:GetChildren() do
            -- if serum in inventory place it on table
            if item.Name == "RatSerum" then
                serum.pusher.Transparency = 0
                serum.metal.Transparency = 0
                serum.serum.Transparency = 0
                serum.glass.Transparency = 0.6
                deletefromPlayers(item)
                serumFlag = true
                controlPrompt()
            end
        end
        -- if not in backpak checks hand for item(places and destroys if there)
        local serumInHand = character:FindFirstChild("RatSerum")
        if(serumInHand ~= nil) then
            serum.pusher.Transparency = 0
            serum.metal.Transparency = 0
            serum.serum.Transparency = 0
            serum.glass.Transparency = 0.6
            deletefromPlayers(serumInHand)
            serumFlag = true
            controlPrompt()
        end
    end
end)