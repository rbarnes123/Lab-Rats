-- handles shock orb state
--services
local replicatedStorage = game:GetService("ReplicatedStorage")
-- parts
local orb = Workspace.shockOrb
local lightning = orb.ParticleEmitter
local light = orb.PointLight
local sound = orb["Electric Shock Loop"]
local flickerSound = orb.lightFlicker
local color = orb.Color

local smallOrb1 = game.Workspace.powerPole.shockOrbSmall
local smallOrb2 = game.Workspace.powerPole2.shockOrbSmall
-- checks if generator is on or not
local generatorPower = game.Workspace.leverRoom.indicator.Part.PointLight


-- when generator turns on the orb will output MARIA in morse code
local event = game.ReplicatedStorage:WaitForChild("Event")
-- when final lever is flipped flicker plays if there is an error
local flicker = replicatedStorage:FindFirstChild("flicker")


flicker.Event:Connect(function()
	flickerSound.Playing = true
	-- changes light color to match sound
	orb.BrickColor = BrickColor.new("Really red")
    smallOrb1.BrickColor = BrickColor.new("Really red")
    smallOrb2.BrickColor = BrickColor.new("Really red")
	task.wait(0.25)
	orb.BrickColor = BrickColor.new("Royal blue")
    smallOrb1.BrickColor = BrickColor.new("Royal blue")
    smallOrb2.BrickColor = BrickColor.new("Royal blue")
	task.wait(0.1)
	orb.BrickColor = BrickColor.new("Really red")
    smallOrb1.BrickColor = BrickColor.new("Really red")
    smallOrb2.BrickColor = BrickColor.new("Really red")
	task.wait(0.1)
	orb.BrickColor = BrickColor.new("Royal blue")
    smallOrb1.BrickColor = BrickColor.new("Royal blue")
    smallOrb2.BrickColor = BrickColor.new("Royal blue")
	task.wait(0.1)
	orb.BrickColor = BrickColor.new("Really red")
    smallOrb1.BrickColor = BrickColor.new("Really red")
    smallOrb2.BrickColor = BrickColor.new("Really red")
	task.wait(0.25)
	orb.BrickColor = BrickColor.new("Royal blue")
    smallOrb1.BrickColor = BrickColor.new("Royal blue")
    smallOrb2.BrickColor = BrickColor.new("Royal blue")

end)

event.Event:Connect(function()
	while generatorPower.Enabled == true do
		--  M = --
		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(3) -- - dashes are 3 seconds

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false
		wait(1) --  space time between parts of letters is one second

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true
		wait(3) -- -

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false
		wait(3) --  end of M space between letters is 3 seconds

		-- A = .-
		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- . dots are also one second

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(1) -- space

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(3) -- -

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false


		wait(3) -- end of A
		-- R = .-.

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- . 

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(1) -- space 

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(3) -- -

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(1)-- space

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- . 

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(3) -- end of R

		-- i = ..
		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- . 

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(1) -- space

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- . 

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(3) -- end of i

		--A = .-
		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(1) -- .

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(1) -- space

		lightning.Enabled = true
		light.Enabled = true
		sound.Looped = true
		sound.Playing = true

		wait(3) -- -

		lightning.Enabled = false
		light.Enabled = false
		sound.Playing = false

		wait(5) -- end of A and of word
	end
end)