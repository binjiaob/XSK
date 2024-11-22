local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK%E7%94%A8%E6%88%B7%E7%95%8C%E9%9D%A2.txt", false))()
    local window = library:new("压力")   
    
    local creds = window:Tab("压力", "6035145364")
    local about = creds:section("通用内容", true)
    
    about:Toggle("怪物提示","Valkiry",false,function(state)
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
    
    about:Toggle("章鱼哥透视","Valkiry",false,function(state)
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
   
    about:Toggle("自动躲避","Valkiry",false,function(state)
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