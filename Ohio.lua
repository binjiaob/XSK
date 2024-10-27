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

 local win = lib:Window("XKHUB 丨 ohio ",Color3.fromRGB(255, 24, 24), Enum.KeyCode.RightControl) 
  
 local setup = win:Tab("其余")

 setup:Label("作者：XUAN_RT")
 
setup:Button("移除声音",function()
for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "Sounds" then
v:Destroy()
end
end
end)
setup:Colorpicker("更改用户界面颜色",Color3.fromRGB(44, 120, 224), function(t) 
 lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255)) 
 end)
 
 
 local tab = win:Tab("自动化")

tab:Toggle("自动残血逃跑", false, function(v)
paolu1 = Value
        if paolu1 then
            paolu2()
        end
    end    
})
paolu2 = function()
    while paolu1 do
    wait(0.1)
    if game:GetService('Players').LocalPlayer.Character.Humanoid.Health <= 35 then
        local og1 = CFrame.new(175.191, 13.937, -132.69)
        local og3 = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        og3.CFrame = og1
        wait(20)
    end
    end
end)

tab:Toggle("自动收集物品现金", false, function(v)
    ItemFarm = v
        
        if ItemFarm then
            pcall(function()
                ItemFarmFunc()
            end)
        end
end)

tab:Toggle("自动黑保险", false, function(v)
AutoSafe3 = Value
        if AutoSafe3 then
            AutoSafe4()
        end
    end    
})
AutoSafe4 = function()
    while AutoSafe3 do
        wait()
        local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
        local epoh2 = game:GetService('Players')
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
            BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 16
            local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
            epoh3.CFrame = epoh1
            wait(1)
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            BankDoor.Door.Attachment.ProximityPrompt.Enabled = false
        end
        local JewelSafes = game:GetService("Workspace").Game.Entities.JewelSafe
        local foundModel = false
        for _, model in pairs(JewelSafes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                epoh3.CFrame = epoh1
                wait(1)
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 16
                if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    wait(5)
                    model:Destroy()
                end
            end
        end
        if not foundModel then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '黑保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

function GetItems()
   local cache = {}
   
   for i,v in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
       table.insert(cache,v)
   end
   
   for i,v in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
       table.insert(cache,v)
   end
   
   return cache
end

function Collect(item)
    if item:FindFirstChildOfClass("ClickDetector") then
        fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
    elseif item:FindFirstChildOfClass("Part") then
        local maincrap = item:FindFirstChildOfClass("Part")
        fireclickdetector(maincrap:FindFirstChildOfClass("ClickDetector"))
    end
end

ItemFarmFunc = function()
    while ItemFarm and task.wait() do
        local allitems = GetItems()
        
        for i,v in pairs(allitems) do
            if ItemFarm == false then break end
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame
                task.wait(0.5)
                Collect(v)
                task.wait(0.5)
            end)
            continue
        end
    end
end

tab:Toggle("自动挂机", false, function(v)
Afk1 = Value
        if Afk1 then
            Afk2()
        end
end)

tab:Toggle("自动小保箱", false, function(v)
SmallChest1 = Value
        if SmallChest1 then
            SmallChest2()
        end
    end    
})
SmallChest2 = function()
    while SmallChest1 do
    wait()
    local SmallChes = game:GetService('Workspace').Game.Entities.SmallChest
        local foundModel = false
        for _, model in pairs(SmallChes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                local epoh2 = game:GetService('Players')
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                epoh3.CFrame = epoh1
                wait(0.3)
                model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldBegin()
                model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldEnd()
                wait(0.3)
                local epoh1 = CFrame.new(240.52850341796875, -120, -620)
                epoh3.CFrame = epoh1
                break
            end
        end
        if not foundModel then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '小宝箱未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

tab:Toggle("自动大宝箱", false, function(v)
LargeChest1 = Value
        if LargeChest1 then
            LargeChest2()
        end
    end    
})
LargeChest2 = function()
    while LargeChest1 do
    wait()
    local LargeChes = game:GetService('Workspace').Game.Entities.LargeChest
        local foundModel = false
        for _, model in pairs(LargeChes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                local epoh2 = game:GetService('Players')
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                epoh3.CFrame = epoh1
                wait(0.3)
                model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldBegin()
                model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldEnd()
                wait(0.3)
                local epoh1 = CFrame.new(240.52850341796875, -120, -620)
                epoh3.CFrame = epoh1
                break
            end
        end
        if not foundModel then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '大宝箱未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

tab:Toggle("自动金保险", false, function(v)
AutoSafe1 = Value
        if AutoSafe1 then
            AutoSafe2()
        end
    end    
})
AutoSafe2 = function()
    while AutoSafe1 do
        wait()
        local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
        local epoh2 = game:GetService('Players')
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
            BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 16
            local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
            epoh3.CFrame = epoh1
            wait(1)
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            BankDoor.Door.Attachment.ProximityPrompt.Enabled = false
        end
        local GoldJewelSafes = game:GetService("Workspace").Game.Entities.GoldJewelSafe
        local foundModel = false
        for _, model in pairs(GoldJewelSafes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                epoh3.CFrame = epoh1
                wait(1)
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 16
                if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    wait(5)
                    model:Destroy()
                    break
                end
            end
        end
        if not foundModel then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '金保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

tab:Toggle("自动珠宝店", false, function(v)
AutoSafe1 = Value
        if AutoSafe1 then
            AutoSafe2()
        end
    end    
})
AutoSafe2 = function()
    while AutoSafe1 do
        wait()
        local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
        local epoh2 = game:GetService('Players')
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
            BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 16
            local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
            epoh3.CFrame = epoh1
            wait(1)
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            BankDoor.Door.Attachment.ProximityPrompt.Enabled = false
        end
        local GoldJewelSafes = game:GetService("Workspace").Game.Entities.GoldJewelSafe
        local foundModel = false
        for _, model in pairs(GoldJewelSafes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                epoh3.CFrame = epoh1
                wait(1)
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 16
                if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    wait(5)
                    model:Destroy()
                    break
                end
            end
        end
        if not foundModel then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '金保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

tab:Toggle("自动抢银行", false, function(v)
    AutoRobBank = v
        
        if AutoRobBank then
            pcall(function()
                AutoRobBankFunc()
            end)
        end
end)

AutoRobBankFunc = function()
    while AutoRobBank and task.wait() do
        local bankthing = game:GetService("Workspace").BankRobbery.BankCash
        if #bankthing.Cash:GetChildren() > 0 then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bankthing.Main.CFrame
           task.wait()
           fireproximityprompt(game:GetService("Workspace").BankRobbery.BankCash.Main.Attachment.ProximityPrompt)
        end
    end
end

local tab = win:Tab("传送")

tab:Toggle("银行", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1083.1456298828125, 8.1697998046875, -378.3573303222656)
end)

tab:Toggle("珠宝店", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1590.5399169921875, 8.369791984558105, -691.6185302734375)
end)

tab:Toggle("医院", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1128.8800048828125, 6.244926452636719, -967.571533203125)
end)

tab:Toggle("杂货店", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(935.0187377929688, 6.24599027633667, -918.5844116210938)
end)

tab:Toggle("武器店", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1594.6844482421875, 6.245392322540283, -615.3121337890625)
end)

tab:Toggle("军事基地", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(751.8846435546875, 25.26483154296875, -1335.423583984375)
end)

tab:Toggle("沙滩", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.0576171875, 16.618757247924805, 22.5679931640625)
end)

tab:Toggle("警察局", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(654.2907104492188, 9.037808418273926, -896.7333984375)
end)

tab:Toggle("加油站", false, function(v)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(473.80145263671875, -6.308847904205322, -272.1710205078125)
end)

local tab = win:Tab("通知")

tab:Toggle("银行刷新提示", false, function(v)
Bank1 = Value
        if Bank1 then
            Bank2()
        end
    end    
})
Bank2 = function()
    while Bank1 do
    wait(0.1)
    local Bank = game:GetService('Workspace').BankRobbery.BankCash.Cash:FindFirstChild('Bundle')
        if Bank then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '银行已刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)

tab:Toggle("珠宝店刷新提示", false, function(v)
Gem1 = Value
        if Gem1 then
            Gem2()
        end
    end    
})
Gem2 = function()
    while Gem1 do
    wait(0.1)
    local Ge = game:GetService('Workspace').GemRobbery:FindFirstChild('Rubble')
        if Ge then
            OrionLib:MakeNotification({
                Name = '提示：',
                Content = '珠宝店已刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end)