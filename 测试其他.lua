local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK%E7%94%A8%E6%88%B7%E7%95%8C%E9%9D%A2.txt", true))()
    local window = library:new("Xhxh's backrooms")
    local creds = window:Tab("关于", "6031097229")
        local bin = creds:section("信息", true)
    bin:Label("你的注入器:" .. identifyexecutor())
    bin:Label("地图ID:"..game.PlaceId)
    bin:Label("用户名:"..game.Players.LocalPlayer.Character.Name)
    bin:Label("有些功能不知道能不能用"..game.PlaceId)
    bin:Label("只是做了个小服务器脚本")
    bin:Label("乱搞的，别喷")
    bin:Label("功能不是很多")
    bin:Label("XK")
        
    local creds = window:Tab("通用", "6035145364")
    local about = creds:section("通用内容", true)
    
about:Slider('修改速度', 'WalkspeedSlider', 16, 16, 99999,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

    about:Slider('修改跳跃', 'JumpPowerSlider', 50, 50, 99999,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

    about:Slider('修改重力', 'GravitySlider', 198, 198, 99999,false,function(Value)
    game.Workspace.Gravity = Value
end)

    about:Slider('修改高度', 'Slider', 2, 2, 9999,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
end)

    about:Slider('相机焦距上限', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

    about:Slider('相机焦距【正常为70】', 'Sliderflag', 70, 0.1, 250, false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
end)

    about:Slider('健康值上限', 'Sliderflag',  120, 120, 999999,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
end)

    about:Slider('玩家健康值', 'Sliderflag',  120, 120, 999999,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.Health = Value
end)

about:Button(
        "无限跳跃",
        function()
         loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()   
        end
    )
    
about:Toggle("夜视", "", false, function(state)
        if state then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)
    
about:Button(
        "飞行V3",
        function()
            loadstring(game:HttpGet("https://pastebin.com/raw/UVAj0uWu"))()
        end
    )
  
        local creds = window:Tab("功能", "6035145364")
    local about = creds:section("内容", true)
        
about:Button(
        "牢大安慰告示牌【传送】",
        function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-328.5845031738281, 25.902616500854492, 839.1260986328125)
        end
    )
    
about:Button(
        "获取枪【传送】",
        function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(241.3916473388672, 25.939472198486328, 887.3378295898438)
        end
    )
    
    about:Button(
        "A60 VS Rush 【传送】",
        function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-355.3669738769531, 1346.1978759765625, 995.461181640625)
        end
    )
    
    about:Button(
        "DOORS彩蛋【传送】",
        function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97772216796875, 53.54102325439453, 699.5234375)
        end
    )
    
    about:Button(
        "传送至A-90【Dex显示A60】",
        function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(533.6226806640625, 14.097269058227539, -145.69972229003906)
        end
    )
    
    about:Toggle("怪物透视","Valkiry",false,function(state)
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
                    if instance:IsA("Model") and instance.Name == "stare" then
                        createBillboard(instance, "怪物", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "stare" then
                        createBillboard(instance, "怪物", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if _G.Tree2ESPInstances then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    about:Toggle("A90透视","Valkiry",false,function(state)
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
                    if instance:IsA("Model") and instance.Name == "A60" then
                        createBillboard(instance, "A90(但是作者标的是A60)", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "A60" then
                        createBillboard(instance, "怪物", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if _G.Tree2ESPInstances then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    about:Toggle("老大飞机透视","Valkiry",false,function(state)
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
                    if instance:IsA("Model") and instance.Name == "Helicopter" then
                        createBillboard(instance, "牢大的飞机", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Helicopter" then
                        createBillboard(instance, "牢大的飞机", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if _G.Tree2ESPInstances then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
    end)
    
    about:Button(
        "移除很多东西【测试】",
        function()
            game:GetService('Workspace').InviteSigns:Destroy()
    game:GetService('Workspace').Game.Props["Bloxy Cola"]:Destroy()
    game:GetService('Workspace').Game.Props.Dumpster:Destroy()
    game:GetService('Workspace').Game.PropsGetChildren()[64]:Destroy()
    game:GetService('Workspace').Game.Propsworkspace:GetChildren()[63]:Destroy()
    game:GetService('Workspace').Game.Props['stare']:Destroy()
    game:GetService('Workspace').Game.Props.Hydrant:Destroy()
    game:GetService('Workspace').Game.Props['workspace.stare']:Destroy()
    game:GetService('Workspace').Game.Props["Bloxy Cola"]:Destroy()
    game:GetService('Workspace').Game.Props['Wood Fence']:Destroy()
    game:GetService('Workspace').Game.Props.BusStop:Destroy()
    game:GetService('Workspace').Game.Props.Roadblock:Destroy()
    game:GetService('Workspace').Game.Props.Bollard:Destroy()
    game:GetService('Workspace').Game.Props.Light:Destroy()
    game:GetService('Workspace').Game.Props.Roadblock:Destroy()
    game:GetService('Workspace').Game.Props.Glass:Destroy()
    game:GetService('Workspace').Game.Props.Bench:Destroy()
    game:GetService('Workspace').Game.Props["Trash Bin"]:Destroy()
    game:GetService('Workspace').Game.Props.Bollard:Destroy()
    game:GetService('Workspace').Game.Props["Office Chair"]:Destroy()
    game:GetService('Workspace').Game.Props.Table:Destroy()
    game:GetService("Workspace").BankRobbery.BankWalls:Destroy()
    game:GetService("Workspace").BankRobbery.AlarmLightModel:Destroy()
    game:GetService("Workspace").BankRobbery.AlarmLights:Destroy()
        end
    )
    