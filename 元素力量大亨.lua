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
    local window = library:new("XK SCRIPT")   
    
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
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(20, 5, 314)
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
    
    local creds = window:Tab("元素力量大亨", "6035145364")
    local HEHE = creds:section("内容", true)
   
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

HEHE:Textbox("飞车速度设置", 'TextBoxfalg', "输入速度的数字", function(s)
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

HEHE:Toggle("开启飞车", 'Toggleflag', false, function(state)
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
    
    local creds = window:Tab("拔剑", "7743875358")
    local about = creds:section("脚本", true)

    local EAT = false
    local sell = false
    local throw = false
    local buy = false
    
    about:Toggle("自动增加力量【会增加但是不会显示出点击的】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = "Click",
    [2] = false
}

game:GetService("ReplicatedStorage").ClickEvent:FireServer(unpack(args))
        wait()
    end
end
end)

    about:Toggle("自动购买宠物", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = "W4E1",
    [2] = "Buy1"
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
        wait()
    end
end
end)
    
    about:Toggle("自动升级力量倍数【×2】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("1"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
    
    about:Toggle("自动升级力量倍数【×3】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("2"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
    
    about:Toggle("自动升级力量倍数【×4】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("3"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
    
    about:Toggle("自动升级力量倍数【×5】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("4"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
   
   
    
    about:Toggle("自动升级力量倍数【×6】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("5"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
    
    about:Toggle("自动升级力量的倍数【×7】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("6"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)

about:Toggle("自动升级力量倍数【×8】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("7"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)

about:Toggle("自动升级力量倍数【×9】", "", false, function(state)
    buy = state
    if buy then
        while buy do
    local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("8"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)

about:Toggle("自动升级力量倍数【×10】", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = game:GetService("ReplicatedStorage").Items.Pencil:FindFirstChild("9"),
    [2] = false
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent.ClickChangeEvent:FireServer(unpack(args))
        wait()
    end
end
end)
    
about:Toggle("力量倍数×155", "", false, function(state)
    buy = state
    if buy then
        while buy do
        local args = {
    [1] = "Click",
    [2] = false
}

game:GetService("ReplicatedStorage").ClickEvent:FireServer(unpack(args))
        wait()
    end
end
end)

about:Toggle("自动打怪前提", "", false, function(state)
    if state then
        while state do
            game:GetService("ReplicatedStorage").RemoveC:FireServer(1)
            wait()
            end
        end
end)
about:Toggle("自动打怪", "", false, function(state)
    if state then
        while state do
            game:GetService("ReplicatedStorage").HALLOWEEN2024FOLDER.WinBossEvent:FireServer(26)
            wait()
            end
        end
end)
about:Toggle("自动传送到活动区域", "", false, function(state)
    if state then
        while state do
            game:GetService("ReplicatedStorage").PortalC:FireServer("-4", game:GetService("Players").LocalPlayer.Character, false)
            wait()
            end
        end
end)

        local creds = window:Tab("DOORS", "7733779610")
            local nb = creds:section("脚本", true)    
            
nb:Toggle("mspaint汉化11月28日", 'Toggleflag', false, function(state)
    getgenv().Spy="mspaint" loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuAnZang/XKscript/refs/heads/main/DOORS.txt"))()
end)
        
    local bin = creds:section("脚本", true)    

HEHE:Textbox("速度请输入【1】需要一点一点走否则会拉回", "tpwalking", "输入速度", function(king)
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

bin:Toggle("怪物提示","Valkiry",false,function(state)
    if state then
            local entityNames = {"BackdoorRush", "BackdoorLookman", "RushMoving", "AmbushMoving", "Eyes", "JeffTheKiller", "Dread", "A60", "A120"}  --enity
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    OrionLib:MakeNotification({
                    Name = "警告WARN！",
                    Content = "怪物刷新，躲起来！",
                    Time = 3
                })     
                
                                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()

                    OrionLib:MakeNotification({
                    Name = "by 小玄奘",
                    Content = "DOORS",
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

bin:Toggle("书透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "Wardrobe" then
                        createBillboard(instance, "柜子", Color3.new(128, 42, 42)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Wardrobe" then
                        createBillboard(instance, "柜子", Color3.new(128, 42, 42)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)

bin:Toggle("钥匙透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "LiveHintBook" then
                        createBillboard(instance, "书", Color3.new(255, 192, 203)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "LiveHintBook" then
                        createBillboard(instance, "书", Color3.new(255, 192, 203)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)

bin:Toggle("金币透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "GoldPile" then
                        createBillboard(instance, "金币", Color3.new(95, 0, 255)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "GoldPile" then
                        createBillboard(instance, "金币", Color3.new(95, 0, 255)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    bin:Toggle("断路器透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "LiveBreakerPolePickup" then
                        createBillboard(instance, "断路器", Color3.new(0, 255, 255)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "LiveBreakerPolePickup" then
                        createBillboard(instance, "断路器", Color3.new(0, 255, 255)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)

bin:Toggle("钥匙透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "KeyObtain" then
                        createBillboard(instance, "钥匙", Color3.new(255, 255, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "KeyObtain" then
                        createBillboard(instance, "钥匙", Color3.new(255, 255, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    bin:Toggle("门透视","Sign",false,function(state)
if state then
            _G.doorESPInstances = {}
            local esptable = {doors = {}}
            local flags = {espdoors = true}

            local function esp(what, color, core, name)
                local parts
                
                if typeof(what) == "Instance" then
                    if what:IsA("Model") then
                        parts = what:GetChildren()
                    elseif what:IsA("BasePart") then
                        parts = {what, table.unpack(what:GetChildren())}
                    end
                elseif typeof(what) == "table" then
                    parts = what
                end
                
                local bill
                local boxes = {}
                
                for i, v in pairs(parts) do
                    if v:IsA("BasePart") then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Size = v.Size
                        box.AlwaysOnTop = true
                        box.ZIndex = 1
                        box.AdornCullingMode = Enum.AdornCullingMode.Never
                        box.Color3 = color
                        box.Transparency = 1
                        box.Adornee = v
                        box.Parent = game.CoreGui
                        
                        table.insert(boxes, box)
                        
                        task.spawn(function()
                            while box do
                                if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                                    box.Adornee = nil
                                    box.Visible = false
                                    box:Destroy()
                                end  
                                task.wait()
                            end
                        end)
                    end
                end
                
                if core and name then
                    bill = Instance.new("BillboardGui", game.CoreGui)
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(0, 400, 0, 100)
                    bill.Adornee = core
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
                    txt.BackgroundColor3 = color
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
                
                local ret = {}
                
                ret.delete = function()
                    for i, v in pairs(boxes) do
                        v.Adornee = nil
                        v.Visible = false
                        v:Destroy()
                    end
                    
                    if bill then
                        bill.Enabled = false
                        bill.Adornee = nil
                        bill:Destroy() 
                    end
                end
                
                return ret 
            end

            local function setup(room)
                local door = room:WaitForChild("Door"):WaitForChild("Door")
                
                task.wait(0.1)
                local h = esp(door, Color3.fromRGB(90, 255, 40), door, "门")
                table.insert(esptable.doors, h)
                
                door:WaitForChild("Open").Played:Connect(function()
                    h.delete()
                end)
                
                door.AncestryChanged:Connect(function()
                    h.delete()
                end)
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i, room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end

            table.insert(_G.doorESPInstances, esptable)

        else
            if _G.doorESPInstances then
                for _, instance in pairs(_G.doorESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.doorESPInstances = nil
            end
        end
    end)
    
    local Doo = creds:section("怪物透视", true)
    
    Doo:Toggle("Rush透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "RushMoving" then
                        createBillboard(instance, "Rush", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "RushMoving" then
                        createBillboard(instance, "Rush", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("Ambush透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "AmbushMoving" then
                        createBillboard(instance, "Ambush", Color3.new(0, 255, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "AmbushMoving" then
                        createBillboard(instance, "Ambush", Color3.new(0, 255, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("杰夫透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "JeffTheKiller" then
                        createBillboard(instance, "未知", Color3.new(255, 94, 13)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "JeffTheKiller" then
                        createBillboard(instance, "未知", Color3.new(25, 88, 70)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("隐藏怪透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "Dread" then
                        createBillboard(instance, "隐藏怪", Color3.new(444, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Dread" then
                        createBillboard(instance, "隐藏怪", Color3.new(444, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    
    
    
    Doo:Toggle("眼睛怪物透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "Eyes" then
                        createBillboard(instance, "眼睛", Color3.new(0, 0, 95)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Eyes" then
                        createBillboard(instance, "眼睛", Color3.new(0, 0, 95)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("A60透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "A60" then
                        createBillboard(instance, "A60", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "A60" then
                        createBillboard(instance, "A60", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("A120透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "A120" then
                        createBillboard(instance, "A120", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "A120" then
                        createBillboard(instance, "A120", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    
    Doo:Toggle("后门Lookman透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "BackdoorLookman" then
                        createBillboard(instance, "影子", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "BackdoorLookman" then
                        createBillboard(instance, "影子", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    Doo:Toggle("后门Rush透视","Valkiry",false,function(state)
    EAT = state
        if EAT then
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
                    if instance:IsA("Model") and instance.Name == "BackdoorRush" then
                        createBillboard(instance, "绿色rush", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "BackdoorRush" then
                        createBillboard(instance, "绿色rush", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)

    local creds = window:Tab("压力", "7743875358")
    local xxxk = creds:section("功能", true)
    
    xxxk:Toggle("怪物提示","Valkiry",false,function(state)
    if state then
            local entityNames = {"Angler", "Eyefestation", "Blitz", "Pinkie", "Froger", "Chainsmoker", "Pandemonium", "Body"}  --enity
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    OrionLib:MakeNotification({
                    Name = "怪物刷新",
                    Content = "怪物出现",
                    Time = 3
                })     
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
    
    xxxk:Toggle("发电机透视","Valkiry",false,function(state)
    if state then
            _G.EncounterGeneratorESPInstances = {}
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

            local function monitorEncounterGenerator()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "EncounterGenerator" then
                        createBillboard(instance, "EncounterGenerator", Color3.new(50, 10, 25)) -- Change color as neededPipesDoorESPInstances
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "EncounterGenerator" then
                        createBillboard(instance, "EncounterGenerator", Color3.new(50, 10, 25)) -- Change color as needed
                    end
                end)
            end

            monitorEncounterGenerator()
            table.insert(_G.EncounterGeneratorESPInstances, esptable)
				
        else
            if _G.EncounterGeneratorESPInstances then
                for _, instance in pairs(_G.EncounterGeneratorESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.EncounterGeneratorESPInstances = nil
            end
        end
    end)
    
    xxxk:Toggle("储物柜透视","Valkiry",false,function(state)
    if state then
            _G.ItemLockerESPInstances = {}
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

            local function monitorItemLocker()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "ItemLocker" then
                        createBillboard(instance, "储物柜", Color3.new(50, 10, 255)) -- Change color as neededPipesDoorESPInstances
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "ItemLocker" then
                        createBillboard(instance, "储物柜", Color3.new(50, 10, 255)) -- Change color as needed
                    end
                end)
            end

            monitorItemLocker()
            table.insert(_G.ItemLockerESPInstances, esptable)
				
        else
            if _G.ItemLockerESPInstances then
                for _, instance in pairs(_G.ItemLockerESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.ItemLockerESPInstances = nil
            end
        end
    end)
    
    xxxk:Toggle("章鱼哥透视","Valkiry",false,function(state)
    if state then
            _G.BodyESPInstances = {}
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

            local function monitorBody()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "Body" then
                        createBillboard(instance, "章鱼哥", Color3.new(50, 100, 25)) -- Change color as neededPipesDoorESPInstances
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Body" then
                        createBillboard(instance, "章鱼哥", Color3.new(50, 100, 25)) -- Change color as needed
                    end
                end)
            end

            monitorBody()
            table.insert(_G.BodyESPInstances, esptable)
				
        else
            if _G.BodyESPInstances then
                for _, instance in pairs(_G.BodyESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.BodyESPInstances = nil
            end
        end
    end)
    
    xxxk:Toggle("门透视","Valkiry",false,function(state)
    if state then
            _G.NormalDoorESPInstances = {}
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

            local function monitorNormalDoor()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "NormalDoor" then
                        createBillboard(instance, "门", Color3.new(125, 125, 125)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "NormalDoor" then
                        createBillboard(instance, "门", Color3.new(125, 125, 125)) -- Change color as needed
                    end
                end)
            end

            monitorNormalDoor()
            table.insert(_G.NormalDoorESPInstances, esptable)
				
        else
            if _G.NormalDoorESPInstances then
                for _, instance in pairs(_G.NormalDoorESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.NormalDoorESPInstances = nil
            end
        end
    end)
    
        xxxk:Toggle("大门透视","Valkiry",false,function(state)
    if state then
            _G.bigRoomDoorESPInstances = {}
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

            local function monitorBigRoomDoor()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "BigRoomDoor" then
                        createBillboard(instance, "大门", Color3.new(125, 125, 125)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "BigRoomDoor" then
                        createBillboard(instance, "大门", Color3.new(125, 125, 125)) -- Change color as needed
                    end
                end)
            end

            monitorBigRoomDoor()
            table.insert(_G.bigRoomDoorESPInstances, esptable)
                
        else
            if _G.bigRoomDoorESPInstances then
                for _, instance in pairs(_G.bigRoomDoorESPInstances) do
                    for _, v in pairs(instance.doors) do
                        if v:FindFirstChild("BillboardGui") then
                            v.BillboardGui:Destroy()
                        end
                    end
                end
                _G.bigRoomDoorESPInstances = nil
            end
        end
    end)
      
    xxxk:Toggle("假柜子透视","Valkiry",false,function(state)
    if state then
            _G.MonsterLockerESPInstances = {}
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

            local function monitorMonsterLocker()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "MonsterLocker" then
                        createBillboard(instance, "假柜子", Color3.new(50, 10, 25)) -- Change color as neededPipesDoorESPInstances
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "MonsterLocker" then
                        createBillboard(instance, "假柜子", Color3.new(50, 10, 25)) -- Change color as needed
                    end
                end)
            end

            monitorMonsterLocker()
            table.insert(_G.MonsterLockerESPInstances, esptable)
				
        else
            if _G.MonsterLockerESPInstances then
                for _, instance in pairs(_G.MonsterLockerESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.MonsterLockerESPInstances = nil
            end
        end
    end)
    
        xxxk:Toggle("钥匙透视","Valkiry",false,function(state)
    if state then
            _G.keyCardESPInstances = {}
            local esptable = {keyCards = {}}

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

            local function monitorNormalKeyCard()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "NormalKeyCard" then
                        createBillboard(instance, "钥匙", Color3.new(1, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "NormalKeyCard" then
                        createBillboard(instance, "钥匙", Color3.new(1, 0, 0)) -- Change color as needed
                    end
                end)
            end

            local function monitorInnerKeyCard()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "InnerKeyCard" then
                        createBillboard(instance, "InnerKeyCard", Color3.new(255, 255, 255)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "InnerKeyCard" then
                        createBillboard(instance, "InnerKeyCard", Color3.new(255, 255, 255)) -- Change color as needed
                    end
                end)
            end

            monitorNormalKeyCard()
            monitorInnerKeyCard()
            table.insert(_G.keyCardESPInstances, esptable)
				
        else
            if _G.keyCardESPInstances then
                for _, instance in pairs(_G.keyCardESPInstances) do
                    for _, v in pairs(instance.keyCards) do
                        v.delete()
                    end
                end
                _G.keyCardESPInstances = nil
            end
        end
    end)
    
    xxxk:Toggle("假门透视","Valkiry",false,function(state)
    if state then
            _G.TricksterRoomESPInstances = {}
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

            local function monitorTricksterRoom()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "TricksterRoom" then
                        createBillboard(instance, "假门", Color3.new(50, 10, 25)) -- Change color as neededPipesDoorESPInstances
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "TricksterRoom" then
                        createBillboard(instance, "假门", Color3.new(50, 10, 25)) -- Change color as needed
                    end
                end)
            end

            monitorTricksterRoom()
            table.insert(_G.TricksterRoomESPInstances, esptable)
				
        else
            if _G.TricksterRoomESPInstances then
                for _, instance in pairs(_G.TricksterRoomESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.TricksterRoomESPInstances = nil
            end
        end
    end)
   
    xxxk:Toggle("自动躲避","Valkiry",false,function(state)
    if state then
            local entityNames = {"Angler", "Blitz", "Pinkie", "Froger", "Chainsmoker", "Pandemonium"} -- List of entities to monitor
            local platformHeight = 900 -- Height for the safe platform
            local platformSize = Vector3.new(1000, 1, 1000) -- Size of the platform
            local platform -- Variable to hold the created platform
            local entityTriggerMap = {} -- Map to keep track of which entities triggered the platform
            local playerOriginalPositions = {} -- Table to store original positions of players
            local isMonitoring = true

            -- Function to create or update the safe platform
            local function createSafePlatform()
                if platform then
                    platform:Destroy() -- Remove existing platform if any
                end

                platform = Instance.new("Part")
                platform.Size = platformSize
                platform.Position = Vector3.new(0, platformHeight, 0) -- Center position
                platform.Anchored = true
                platform.Parent = workspace
            end

            -- Function to teleport a player to the safe platform
            local function teleportPlayerToPlatform(player)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPosition = platform.Position + Vector3.new(0, platform.Size.Y / 2 + 5, 0)
                    playerOriginalPositions[player.UserId] = player.Character.HumanoidRootPart.CFrame -- Store original position
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                end
            end

            -- Function to teleport a player back to their original position
            local function teleportPlayerBack(player)
                if playerOriginalPositions[player.UserId] then
                    player.Character.HumanoidRootPart.CFrame = playerOriginalPositions[player.UserId]
                    playerOriginalPositions[player.UserId] = nil -- Clear the stored position
                end
            end

            -- Function to handle entity detection
            local function onChildAdded(child)
                if table.find(entityNames, child.Name) then
                    -- Create platform and teleport players when entity is detected
                    createSafePlatform()
                    entityTriggerMap[child] = true -- Mark entity as having triggered the platform
                    for _, player in pairs(game.Players:GetPlayers()) do
                        teleportPlayerToPlatform(player)
                    end
                end
            end

            -- Function to handle entity removal
            local function onChildRemoved(child)
                if entityTriggerMap[child] then
                    -- Entity was previously responsible for creating the platform
                    entityTriggerMap[child] = nil -- Remove entity from the map
                    -- Teleport players back to their original positions
                    for _, player in pairs(game.Players:GetPlayers()) do
                        teleportPlayerBack(player)
                    end
                end
            end

            -- Connect the ChildAdded and ChildRemoved events
            local addConnection = workspace.ChildAdded:Connect(onChildAdded)
            local removeConnection = workspace.ChildRemoved:Connect(onChildRemoved)

            -- Loop to keep the script running based on the toggle state
            while isMonitoring do
                task.wait(1) -- Adjust the wait time as needed

                if not state then
                    -- Cleanup if defense is turned off
                    if platform then
                        -- Keep the platform, but ensure players are teleported back
                        for _, player in pairs(game.Players:GetPlayers()) do
                            teleportPlayerBack(player)
                        end
                    end
                    isMonitoring = false
                    addConnection:Disconnect() -- Disconnect the event listener
                    removeConnection:Disconnect() -- Disconnect the event listener
                end
            end 
        else
            -- Cleanup if defense is turned off
            if platform then
                -- Keep the platform, but ensure players are teleported back
                for _, player in pairs(game.Players:GetPlayers()) do
                    teleportPlayerBack(player)
                end
            end
        end
    end)