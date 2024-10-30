local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK"))()

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/refs/heads/main/Vape.txt")() 

local OpenUI = Instance.new("ScreenGui") 
local ImageButton = Instance.new("ImageButton") 
local UICorner = Instance.new("UICorner") 
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
ImageButton.Parent = OpenUI 
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
ImageButton.BackgroundTransparency = 0.500 
ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
ImageButton.Size = UDim2.new(0, 50, 0, 50) 
ImageButton.Image = "rbxassetid://117494350103589" 
ImageButton.Draggable = true 
UICorner.CornerRadius = UDim.new(0, 200) 
UICorner.Parent = ImageButton 
ImageButton.MouseButton1Click:Connect(function() 
  if uihide == false then
	uihide = true
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
else
	uihide = false
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
		end 
		
end)

uihide = false

local win = lib:Window("XKHUB--监狱人生",Color3.fromRGB(255, 24, 24), Enum.KeyCode.RightControl)

local tab = win:Tab("主要功能")
local tab1 = win:Tab("传动功能")
local tab2 = win:Tab("其余功能")

        local isAutoKillRunning = false -- 变量来跟踪自动终止循环的状态
        local function AutoKillLoop()
            while isAutoKillRunning do
                for i, v in next, game:GetService("Players"):GetChildren() do
                    pcall(function()
                        if v ~= game:GetService("Players").LocalPlayer and not v.Character:FindFirstChildOfClass("ForceField") and v.Character.Humanoid.Health > 0 then
                            while v.Character:WaitForChild("Humanoid").Health > 0 and isAutoKillRunning do
                                wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                                for x, c in next, game:GetService("Players"):GetChildren() do
                                    if c ~= game:GetService("Players").LocalPlayer then
                                        game.ReplicatedStorage.meleeEvent:FireServer(c)
                                    end
                                end
                            end
                        end
                    end)
                    wait()
                end
            end
        end
        
        local function AutoJump()
            while isAutoKillRunning do
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
                    if humanoid.Sit then
                        humanoid.Jump = true
                    end
                end
                wait()
            end
        end

local ez = Instance.new("Folder")
ez.Name = "nikodoors"
ez.Parent = game:service"ReplicatedStorage"
local ez = Instance.new("Folder")
ez.Name = "nikofences"
ez.Parent = game:service"ReplicatedStorage"

local Parts = {}
local States = {}
local plr = game.Players.LocalPlayer
local char = plr.Character

tab:Toggle("杀死光环", false, function(state)
    States.KillAura = state
        if state then
            print("Kill Aura On")
            CreateKillPart()
        else
            print("Kill Aura Off")
            if Parts[1] and Parts[1].Name == "KillAura" then
                Parts[1]:Destroy()
                Parts[1] = nil
            end
         end
        end)
        
        function CreateKillPart()
            if Parts[1] then
             pcall(function()
                 Parts[1]:Destroy()
             end)
             Parts[1] = nil
        end
        local Part = Instance.new("Part",plr.Character)
        local hilight = Instance.new("Highlight",Part)
        hilight.FillTransparency = 1
    
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.Material = Enum.Material.SmoothPlastic
        Part.Transparency = .98
        Part.Material = Enum.Material.SmoothPlastic
        Part.BrickColor = BrickColor.White()
        Part.Size = Vector3.new(20,2,20)
        Part.Name = "KillAura"
        Parts[1] = Part
        end
    
        task.spawn(function()
        repeat task.wait()until plr.Character and char and char:FindFirstChildOfClass("Humanoid")
    
        if States.KillAura then
            CreateKillPart()
        end
      end)
      
    game:GetService("RunService").Stepped:Connect(function()
        if States.KillAura then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 then
                        local args = {
                            [1] = v
                        }
                        for i =1,2 do
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                            end)
                        end
    
                    end
                end
            end
        end  
     end)



tab:Button("变成警察", function()
workspace.Remote.TeamEvent:FireServer("Bright blue");
end)

tab:Button("变成囚犯", function()
workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

tab:Button("子弹追踪", function()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
function ClosestChar()
    local Max, Close = math.huge
    for I,V in pairs(GetPlayers(Players)) do
        if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
            local Torso = FindFirstChild(V.Character, "Torso")
            if Torso then
                local Pos, OnScreen = WTSP(Camera, Torso.Position)
                if OnScreen then
                    local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                    if Dist < Max then
                        Max = Dist
                        Close = V.Character
                    end
                end
            end
        end
    end
    return Close
end

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Torso, Character.Torso.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
 
OrionLib:MakeNotification({
                    Name = "子弹追踪开启"..game.PlaceId,
                    Content = "XKHUB",
                    Time = 2
                })
end)

tab:Toggle("杀死全部人", false, function(state)
    if state then
                print("Toggle On")
                isAutoKillRunning = true
                spawn(AutoKillLoop)
                spawn(AutoJump) -- Start the automatic jump function
            else
                print("Toggle Off")
                isAutoKillRunning = false
            end
        end)
        
tab:Toggle("声音卡顿所有人", false, function(bool)
    getgenv().spamSoond = bool
        if bool then
            spamSound()
        end
end)

function spamSound()
	while getgenv().spamSoond == true do
		local class_check = game.IsA
		local sound = Instance.new('Sound')
		local sound_stop = sound.Play
		local get_descendants = game.GetDescendants

		for i,v in next, get_descendants(game) do 
			if class_check(v,"Sound") then
				sound_stop(v)
			end
		end

		get_descendants = nil
		sound:Remove()
		get_descendants = nil
		sound_stop = nil
        task.wait()
	end
end

tab:Toggle("移除所有门", false, function(state)
    if state then
        print("Toggle On")
        for i,v in pairs(workspace.Doors:GetChildren()) do
             v.Parent = game:service"ReplicatedStorage".nikodoors
    
        end
    else
        print("Toggle Off")
        for i,v in pairs(game:service"ReplicatedStorage".nikodoors:GetChildren()) do
            v.Parent = workspace.Doors
        end
    end
end)

tab:Button("击杀所有罪犯", function()
    wait(0.1)
	Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 10
			repeat
				wait()
				i = i-1
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
			until i == 0
		end
	end
end)

tab1:Button("食堂", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.0059204101562, 99.98993682861328, 2289.23095703125)
end)

tab1:Button("下水道", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.4256591796875, 78.69828033447266, 2416.18359375)
end)

tab1:Button("警车库", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
end)

tab1:Button("院子", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
end)

tab1:Button("罪犯复活点", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
end)

tab1:Button("监狱外面", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end)

tab1:Button("建议内", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
end)

tab1:Button("警卫室", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
end)

tab2:Button("自瞄［请使用认人忍者注入器］", function()
local fov = 40 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(231, 231, 236) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)