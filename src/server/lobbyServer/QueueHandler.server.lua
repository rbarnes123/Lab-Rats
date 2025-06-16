local TeleportService = game:GetService("TeleportService")
local RP = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local mainGameID = 82411006341991

local queueFolder = game.Workspace.Queue

local joinedEvent = RP.joinQueue
local leftEvent = RP. leaveQueue

local playerLimit = 4

local countDownTime = 10

for _, queueRoom in ipairs(queueFolder:GetChildren()) do 
		local enterHitbox = queueRoom.enter
		local exitHitbox = queueRoom.exit
		local enterPos = queueRoom.enterPos
		local exitPos = queueRoom.exitPos
		
		local playersInQueueFolder = queueRoom.PlayersInQueue
		local UIBillboard = queueRoom.UI:WaitForChild("UI").BillboardGui
		local playersUI = UIBillboard.Players
		local timerUI = UIBillboard.Timer 
		playersUI.Text = #playersInQueueFolder:GetChildren().."/"..playerLimit
		timerUI.Text = countDownTime .. " Seconds"
		
		local countdownCoroutine 
		
		enterHitbox.Touched:Connect(function(other)
			local db = false
			-- checks if player is already in queue
			if not(#playersInQueueFolder:GetChildren() >= playerLimit) and not db and other.Parent:FindFirstChild("Humanoid") then
				db = true
				
				other.Parent.PrimaryPart.CFrame = enterPos.CFrame
				-- if player not in queue it gets added
				if not playersInQueueFolder:FindFirstChild(other.Parent.Name) then
					local newPlayer = Instance.new("StringValue",playersInQueueFolder)
					newPlayer.Name = other.Parent.Name
					newPlayer.Value = other.Parent.Name
				end
				-- if countdown not running sets value to nil so count doesn't display
				if countdownCoroutine ~= nil and coroutine.status(countdownCoroutine) == "dead"  then
					countdownCoroutine = nil
				end
				
				if countdownCoroutine == nil then
					countdownCoroutine = coroutine.create(function()
						countdownTeleport(playersInQueueFolder,UIBillboard)
					end)
				coroutine.resume(countdownCoroutine)
				end
				
				playersUI.Text = #playersInQueueFolder:GetChildren().."/"..playerLimit
				
				local player = Players:GetPlayerFromCharacter(other.Parent)
				joinedEvent:FireClient(player,exitPos)
				
				task.wait(.2)
				db = false

			end 
		end)
		
		exitHitbox.Touched:Connect(function(other)
			local db = false
			if not db and other.Parent:FindFirstChild("Humanoid") then
				db = true
				
				other.Parent.PrimaryPart.CFrame = exitPos.CFrame
				
				if playersInQueueFolder:FindFirstChild(other.Parent.Name) then
					playersInQueueFolder:FindFirstChild(other.Parent.Name):Destroy()
				end
				
				if #playersInQueueFolder:GetChildren() == 0 and countdownCoroutine ~= nil then
					coroutine.close(countdownCoroutine)
					countdownCoroutine = nil
					timerUI.Text = countDownTime.. " Seconds"
				end
				
				playersUI.Text = #playersInQueueFolder:GetChildren().."/"..playerLimit
				
				local player =  Players:GetPlayerFromCharacter(other.Parent)
				leftEvent:FireClient(player,exitPos)
			
				task.wait(.2)
				db = false
			end
		end)
end


function countdownTeleport(folder,Billboard)
	for i = countDownTime, 1, -1 do
		Billboard.Timer.Text = i .. " Seconds"
		task.wait(1)
	end
	
	Billboard.Timer.Text = "Teleporting..."
	local party = {}
	
	for _, player in pairs(folder:GetChildren()) do
		table.insert(party, Players:FindFirstChild(player.Name))
	end
	
	local reservedServer = TeleportService:ReserveServer(mainGameID)
	TeleportService:TeleportToPrivateServer(mainGameID,reservedServer,party)
	
	for _, player in pairs(folder:GetChildren()) do 
		player:Destroy()
	end
	Billboard.Timer.Text = countDownTime.. " Seconds"
	Billboard.Players.Text = "0/"..playerLimit
end