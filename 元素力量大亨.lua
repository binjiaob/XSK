local bin = {
    playernamedied = "",
    dropdown = {}
}

function shuaxinlb(zji)
    bin.dropdown = {}
    if zji == true then
        for _, player in pairs(game.Players:GetPlayers()) do
            table.insert(bin.dropdown, player.Name)
        end
    else
        local lp = game.Players.LocalPlayer
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= lp then
                table.insert(bin.dropdown, player.Name)
            end
        end
    end
end
local function teleportPlayer()
    if bin.toggleTeleportState and bin.playernamedied then
        local localPlayer = game.Players.LocalPlayer
        local targetPlayer = game.Players:FindFirstChild(bin.playernamedied)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character.HumanoidRootPart then
            local localHumanoidRootPart = localPlayer.Character.HumanoidRootPart
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition) * CFrame.new(0, 5, 0)
        end
    end
end
local virtualUser = game:GetService('VirtualUser')
virtualUser:CaptureController()

function teleportTo(CFrame) 
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
end
wait(0.1)
shuaxinlb(true)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuAnZang/XKscript/refs/heads/main/mrahfWst.txt", false))()
    local window = library:new("元素力量大亨")   
    
    local creds = window:Tab("传送玩家", "6035145364")
    local Section = creds:section("内容", true)

Section:Dropdown("选择玩家", 'Dropdown', bin.dropdown, function(v)
    bin.playernamedied = v
end)

Section:Toggle("查看玩家", 'Toggleflag', false, function(state)
    if state then
        game:GetService('Workspace').CurrentCamera.CameraSubject =
            game:GetService('Players'):FindFirstChild(bin.playernamedied).Character.Humanoid
    else
        local lp = game.Players.LocalPlayer
        game:GetService('Workspace').CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

Section:Button("传送到玩家旁边", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(bin.playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    else
        Notify("传送失败：未找到玩家或玩家没有角色/HumanoidRootPart")
    end
end)

Section:Toggle("传送", 'ToggleTeleport', false, function(state)
    if state then
        bin.toggleTeleportState = true
    else
        bin.toggleTeleportState = false
    end
end)

game:GetService("RunService").Heartbeat:Connect(teleportPlayer)
    
    local creds = window:Tab("脚本", "6035145364")
    local HEHE = creds:section("通用内容", true)
   
   HEHE:Textbox("速度永远不掉【推荐1和2】", "tpwalking", "输入速度", function(king)
local tspeed = king
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)
   
   HEHE:Slider("自动刷步行速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 100, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

HEHE:Slider("跳跃高度", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 100, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

HEHE:Textbox("飞行速度设置", 'TextBoxfalg', "输入速度的数字", function(s)
    while (true) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
        wait()
        local BV = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        local BG = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
        BG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BG.D = 5000
        BG.P = 50000
        BG.CFrame = game.Workspace.CurrentCamera.CFrame
        BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * s
    end
end)

HEHE:Toggle("开启飞行", 'Toggleflag', false, function(state)
    if state then
        local BV = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        local BG = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
        BG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        BG.D = 5000
        BG.P = 50000
        BG.CFrame = game.Workspace.CurrentCamera.CFrame
        BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
    end
end)

HEHE:Toggle(
    "穿墙",
    "text",
    false,
    function(Value)
        if Value then
            Noclip = true
            Stepped =
                game.RunService.Stepped:Connect(
                function()
                    if Noclip == true then
                        for a, b in pairs(game.Workspace:GetChildren()) do
                            if b.Name == game.Players.LocalPlayer.Name then
                                for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                    end
                                end
                            end
                        end
                    else
                        Stepped:Disconnect()
                    end
                end
            )
        else
            Noclip = false
        end
    end
)

running = false

   HEHE:Toggle("钱箱刷新提示【无法关闭】","Valkiry",false,function(state)
    running = state
     if state then
            local entityNames = {"BalloonCrate", "Eyefestation", "Blitz", "Pinkie", "Froger", "Chainsmoker", "Pandemonium", "Body"}  --enity
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    OrionLib:MakeNotification({
                    Name = "By Xuan",
                    Content = "钱箱已刷新",
                    Time = 7
                })    
                 
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()

                    OrionLib:MakeNotification({
                    Name = "温馨提示",
                    Content = "周围可能存在玩家，请开启玩家ESP或者钱箱ESP前往",
                    Time = 7
                })
                
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
            end

            local function onChildAdded(child)
                if table.find(entityNames, child.Name) then
                    repeat
                        task.wait()
                    until plr:DistanceFromCharacter(child:GetPivot().Position) < 1000 or not child:IsDescendantOf(workspace)
                    
                    if child:IsDescendantOf(workspace) then
                        notifyEntitySpawn(child)
                    end
                end
            end

            -- Infinite loop to keep the script running and check for hintrush flag
            local running = true
            while running do
                local connection = workspace.ChildAdded:Connect(onChildAdded)
                
                repeat
                    task.wait(1) -- Adjust the wait time as needed
                until not flags.hint or not running
                
                connection:Disconnect()
            end 
        else 
            -- Close message or any other cleanup if needed
            running = false
        end
    end)
    
    local eat = false
    
HEHE:Toggle("钱箱透视【无法关闭】","Valkiry",false,function(state)
    running = state
        if state then
            _G.Tree2ESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorTree2()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "BalloonCrate" then
                        createBillboard(instance, "钱箱", Color3.new(0, 255, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "BalloonCrate" then
                        createBillboard(instance, "钱箱", Color3.new(0, 255, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if eat then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    local creds = window:Tab("关于", "6035145364")
    local bin = creds:section("公告", true)
    
    bin:Label("XKscript")
    bin:Label("作者:认准神兽【小玄奘】")
    bin:Label("元素力量大亨")
    bin:Label("XK脚本中心")
    bin:Label("更新时间11月27日")
    bin:Label("2024年")