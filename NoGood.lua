-- Checks if script is already executed
if getrenv().meiosis then
    return
end
getrenv().meiosis = true

-- Services
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local repstor = game:GetService("ReplicatedStorage")
local runserv = game:GetService("RunService")
local uis = game:GetService("UserInputService")

-- Variables
local cam = workspace.CurrentCamera
local client = getsenv(plr.PlayerGui.Client)
local espFolder = Instance.new("Folder",game.CoreGui)

-- Cheat Variables
local rage = false
local shootCooldown = false
local antiAim = "OFF"
local triggerbot = false
local visual = false
local plrChams = false
local thirdPerson = false
local hoop = nil
local target = nil

-- Cheat Backups
local speedBackup = client.speedupdate

-- Metatables
local mt = getrawmetatable(game)
setreadonly(mt,false)
local nc = mt.__namecall

mt.__namecall = newcclosure(
	function(self,...)
		local args = {...}
		local namecall = getnamecallmethod()
		if namecall == "FindPartOnRayWithIgnoreList" then
			if target and plr.Character and rage then
				args[1] = Ray.new(workspace.CurrentCamera.CFrame.p, (target.CFrame.p - workspace.CurrentCamera.CFrame.p).unit * 500)
			end
		end
		if namecall == "FireServer" and tostring(self) == "ControlTurn" then
			if plr.Character and rage and antiAim then
				args[1] = -0.96247750520706
			end
		end
		return nc(self,unpack(args))
	end
)

-- Cheat Functions

-- UILib
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/T6sQMcLY", true))()

local visTab = lib:Create("Visuals")

local chams = lib:AddToggle("Chams",function(state)
	plrChams = state
	for i,v in next,plrs:GetPlayers() do
		if v.Team ~= plr.Team and v.Character and v.Character.HumanoidRootPart and v.Character.Humanoid.Health > 0 and plrChams then
			chamPlr(v)
		end
	end
end)

-- Sellout Shit
local sellout1 = lib:Create("Hello Bonk and")
local sellout2 = lib:Create("EenPotjeMetJam")
local sellout3 = lib:Create("Enjoy Best Cheat")
local sellout4 = lib:Create("NoPaste Ofc")

lib:build()
