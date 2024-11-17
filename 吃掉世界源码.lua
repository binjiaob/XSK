local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/XK%E7%94%A8%E6%88%B7%E7%95%8C%E9%9D%A2.txt", true))()
    local window = library:new("Mireng XKcore")
    local creds = window:Tab("关于", "6031097229")
        local bin = creds:section("信息", true)
    bin:Label("你的注入器:" .. identifyexecutor())
    bin:Label("地图ID:"..game.PlaceId)
    bin:Label("用户名:"..game.Players.LocalPlayer.Character.Name)
    bin:Label("有些功能不知道能不能用"..game.PlaceId)
    bin:Label("mir")
    bin:Label("XK")
    bin:Label("英文名字:吃掉世界")
        
    local creds = window:Tab("吃掉世界", "6035145364")
    local about = creds:section("脚本", true)

    local EAT = false
    local sell = false
    local throw = false
    local buy = false
    
    about:Toggle("自动购买吃掉速度", "", false, function(state)
    buy = state
    if buy then
        while buy do
        game:GetService("ReplicatedStorage").Events.PurchaseEvent:FireServer("EatSpeed")
        wait()
    end
end
end)
    
    about:Toggle("自动购买乘数", "", false, function(state)
    buy = state
    if buy then
        while buy do
        game:GetService("ReplicatedStorage").Events.PurchaseEvent:FireServer("Multiplier")
        wait()
    end
end
end)
    
    about:Toggle("自动购买行走速度", "", false, function(state)
    buy = state
    if buy then
        while buy do
        game:GetService("ReplicatedStorage").Events.PurchaseEvent:FireServer("Speed")
        wait()
    end
end
end)

about:Toggle("自动抓", "", false, function(state)
    sell = state
    if sell then
        while sell do
            local args = {
    [1] = false,
    [2] = false
}
game:GetService("Players").LocalPlayer.Character.Events.Grab:FireServer(unpack(args))
            wait()
            end
        end
end)

    about:Toggle("自动吃", "", false, function(state)
    EAT = state
    if EAT then
        while EAT do
        game:GetService("Players").LocalPlayer.Character.Events.Eat:FireServer()
        wait()
    end
end
end)
    
about:Toggle("自动丢", "", false, function(state)
    throw = state
    if throw then
        while throw do
        game:GetService("Players").LocalPlayer.Character.Events.Throw:FireServer()
        wait()
    end
end
end)

about:Toggle("自动购买最大尺寸", "", false, function(state)
    buy = state
    if buy then
        while buy do
        game:GetService("ReplicatedStorage").Events.PurchaseEvent:FireServer("MaxSize")
        wait()
    end
end
end)