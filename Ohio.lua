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

tab:Toggle("自动收集物品现金", false, function(v)
    ItemFarm = v
        
        if ItemFarm then
            pcall(function()
                ItemFarmFunc()
            end)
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

tab:Dropdown("传送",{"银行""珠宝店","医院","杂货店","武器店","军事基地","沙滩","加油站","警察局"},function(Value)
if Value == "银行" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1083.1456298828125, 8.1697998046875, -378.3573303222656)
elseif Value == "珠宝店" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1590.5399169921875, 8.369791984558105, -691.6185302734375)
elseif Value == "医院" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1128.8800048828125, 6.244926452636719, -967.571533203125)
elseif Value == "杂货店" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(935.0187377929688, 6.24599027633667, -918.5844116210938)
elseif Value == "武器店" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1594.6844482421875, 6.245392322540283, -615.3121337890625)
elseif Value == "军事基地" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(751.8846435546875, 25.26483154296875, -1335.423583984375)
elseif Value == "沙滩" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.0576171875, 16.618757247924805, 22.5679931640625)
elseif Value == "加油站" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(473.80145263671875, -6.308847904205322, -272.1710205078125)
elseif Value == "警察局" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(654.2907104492188, 9.037808418273926, -896.7333984375)
end
end)


