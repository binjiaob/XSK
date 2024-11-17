local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/binjiaob/XSK/refs/heads/main/UILibrary.lua.txt')))()
local Window = OrionLib:MakeWindow({IntroText = "XK脚本中心",Name = "请选择执行的脚本", HidePremium = false, SaveConfig = true, ConfigFolder = ""})

game:GetService("StarterGui"):SetCore("SendNotification",{ 
     Title = "XK脚本中心", 
     Text = "执行选择", 
     Icon = "rbxassetid://117494350103589", 
     Duration = 60, 
     Callback = bindable, 
     Button1 = "确定", 
     Button2 = "否定" 
 })

local WSBTab = Window:MakeTab({
	Name = "XK脚本中心V2",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})

WSBTab:AddButton({
    Name="XK脚本中心V2",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binjiaob/XSK/refs/heads/main/%E8%84%9A%E6%9C%AC%E4%B8%AD%E5%BF%83%E6%BA%90%E7%A0%81.lua"))()
    end
})

local coTab = Window:MakeTab({
	Name = "Mireng XKcore V3",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
coTab:AddButton({
    Name="吃掉世界",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binjiaob/XSK/refs/heads/main/%E5%90%83%E6%8E%89%E4%B8%96%E7%95%8C%E6%BA%90%E7%A0%81.lua"))()
    end
})  
coTab:AddButton({
    Name="Color or die",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/XSK/refs/heads/main/ColorDie.lua"))()
    end
})
coTab:AddButton({
    Name="xhxh backrooms[🇨🇳]",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/backrooms.x/refs/heads/main/XhxhRooms.lua"))()
    end
})