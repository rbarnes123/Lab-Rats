local smallOrb1 = Workspace.powerPole.shockOrbSmall
local smallOrb2 = Workspace.powerPole2.shockOrbSmall
local bigOrb = game.Workspace.shockOrb
local lightning1 = smallOrb1.ParticleEmitter
local lightning2 = smallOrb2.ParticleEmitter
local light1 = smallOrb1.PointLight
local light2 = smallOrb2.PointLight


-- turns on small orb if big turns on
local function changeOrbState()
	if bigOrb.PointLight.Enabled == true  then
		lightning1.Enabled = true
		lightning2.Enabled = true
		light1.Enabled = true
		light2.Enabled = true
	else
		lightning1.Enabled = false
		lightning2.Enabled = false
		light1.Enabled = false
		light2.Enabled = false
	end
end

bigOrb.PointLight:GetPropertyChangedSignal("Enabled"):Connect(changeOrbState)


