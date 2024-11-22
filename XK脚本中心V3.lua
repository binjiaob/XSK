if getgenv().ED_AntiKick then
	return
end

getgenv().ED_AntiKick = {
	Enabled = true, -- Set to false if you want to disable the Anti-Kick.
	SendNotifications = true, -- Set to true if you want to get notified for every event
	CheckCaller = true -- Set to true if you want to disable kicking by other executed scripts
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/binjiaob/XSK/refs/heads/main/XK%E7%94%A8%E6%88%B7%E7%95%8C%E9%9D%A2.txt", true))()
    local window = library:new("Mireng XKcore V3")
    local creds = window:Tab("关于", "6031097229")
    local bin = creds:section("信息", true)
    bin:Label("你的注入器:" .. identifyexecutor())
    bin:Label("你的地图id:"..game.PlaceId)
    bin:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
    
    bin:Button("复制一群【2000人】", function()
    setclipboard("915207093")
end)
    bin:Button("复制二群", function()
    setclipboard("882709292")
end)
    bin:Button("复制三群【1000人】", function()
    setclipboard("685243242")
end)
    bin:Button("复制四群", function()
    setclipboard("917126702")
end)
    bin:Button("复制五群", function()
    setclipboard("570967695")
end)
    bin:Button("复制六群", function()
    setclipboard("498113652")
end)

local creds = window:Tab("通用", "6035145364")
    local credits = creds:section("通用内容", true)
    
credits:Slider("修改速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

    credits:Slider('相机焦距上限', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)
  
  credits:Toggle("夜视脚本", "", false, function(state)
        if state then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)
    
    creditsd:Button(
        "XK飞行",
        function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%AC(%E5%8F%AF%E8%87%AA%E7%94%B1%E5%85%B3%E9%97%AD%E9%9A%90%E8%97%8F)%20%E6%B1%89%E5%8C%96%20(3)%20(1).txt"))()
        end
    )
  
    local creds = window:Tab("压力", "6035145364")
    local about = creds:section("通用内容", true)
    
about:Toggle("怪物提示","Valkiry",false,function(state)
    if state then
            local entityNames = {"Angler", "Eyefestation", "Blitz", "Pinkie", "Froger", "Chainsmoker", "Pandemonium", "Body"}  --enity
            local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() --Lib1
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    OrionLib:MakeNotification({
                    Name = "怪物已刷新【躲起来！】【Mireng XKCore】",
                    Content = "请注意刷新的怪物声音，因为我不会提示怪物的名字",
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
    
    about:Toggle("钥匙透视","Valkiry",false,function(state)
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
    
    about:Toggle("假门透视","Valkiry",false,function(state)
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
    
    about:Toggle("大门透视","Valkiry",false,function(state)
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
      
    about:Toggle("假柜子透视","Valkiry",false,function(state)
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
    
    about:Toggle("门透视","Valkiry",false,function(state)
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
    
    about:Toggle("发电机透视","Valkiry",false,function(state)
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
    
    about:Toggle("储物柜透视","Valkiry",false,function(state)
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