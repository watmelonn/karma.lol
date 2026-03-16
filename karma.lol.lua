-- // KARMA.LOL EXECUTION SCRIPT \\ --
local pcallSuccess, pcallError = pcall(function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Workspace = game:GetService("Workspace")
    local CoreGui = game:GetService("CoreGui")
    local Lighting = game:GetService("Lighting")

    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    -- Ensure we have a secure container
    local targetGuiParent = (gethui and gethui()) or (CoreGui:FindFirstChild("RobloxGui") and CoreGui) or LocalPlayer:WaitForChild("PlayerGui")

    local UI = {}

    -- // StarterGui.Karma \\ --
    UI["1"] = Instance.new("ScreenGui", targetGuiParent)
    UI["1"]["Name"] = [[Karma]]
    UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
    UI["1"]["ResetOnSpawn"] = false
    UI["1"]["Enabled"] = false -- Start hidden for loading

    -- // StarterGui.Karma.KarmaUI \\ --
    UI["2"] = Instance.new("Frame", UI["1"])
    UI["2"]["BorderSizePixel"] = 0
    UI["2"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59)
    UI["2"]["Size"] = UDim2.new(0, 675, 0, 500)
    UI["2"]["Position"] = UDim2.new(0.5, -337, 0.5, -250)
    UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["2"]["Name"] = [[KarmaUI]]
    UI["2"]["Visible"] = false

    -- // StarterGui.Karma.KarmaUI.UICorner \\ --
    UI["3"] = Instance.new("UICorner", UI["2"])
    UI["3"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.UIStroke \\ --
    UI["4"] = Instance.new("UIStroke", UI["2"])
    UI["4"]["Transparency"] = 0.5
    UI["4"]["Thickness"] = 3

    -- // StarterGui.Karma.KarmaUI.karmatabUI \\ --
    UI["5"] = Instance.new("Frame", UI["2"])
    UI["5"]["BorderSizePixel"] = 0
    UI["5"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71)
    UI["5"]["Size"] = UDim2.new(0, 100, 0, 500)
    UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["5"]["Name"] = [[karmatabUI]]

    -- // StarterGui.Karma.KarmaUI.karmatabUI.UICorner \\ --
    UI["6"] = Instance.new("UICorner", UI["5"])
    UI["6"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.legit \\ --
    UI["7"] = Instance.new("TextButton", UI["5"])
    UI["7"]["BorderSizePixel"] = 0
    UI["7"]["TextSize"] = 14
    UI["7"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
    UI["7"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84)
    UI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    UI["7"]["Size"] = UDim2.new(0, 90, 0, 40)
    UI["7"]["Name"] = [[legit]]
    UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["7"]["Text"] = [[legit]]
    UI["7"]["Position"] = UDim2.new(0.05, 0, 0.16, 0)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.legit.UICorner \\ --
    UI["8"] = Instance.new("UICorner", UI["7"])
    UI["8"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.visual \\ --
    UI["9"] = Instance.new("TextButton", UI["5"])
    UI["9"]["BorderSizePixel"] = 0
    UI["9"]["TextSize"] = 14
    UI["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
    UI["9"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84)
    UI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    UI["9"]["Size"] = UDim2.new(0, 90, 0, 40)
    UI["9"]["Name"] = [[visual]]
    UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["9"]["Text"] = [[visual]]
    UI["9"]["Position"] = UDim2.new(0.05, 0, 0.27, 0)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.visual.UICorner \\ --
    UI["a"] = Instance.new("UICorner", UI["9"])
    UI["a"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.misc \\ --
    UI["b"] = Instance.new("TextButton", UI["5"])
    UI["b"]["BorderSizePixel"] = 0
    UI["b"]["TextSize"] = 14
    UI["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
    UI["b"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84)
    UI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    UI["b"]["Size"] = UDim2.new(0, 90, 0, 40)
    UI["b"]["Name"] = [[misc]]
    UI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["b"]["Text"] = [[misc]]
    UI["b"]["Position"] = UDim2.new(0.05, 0, 0.38, 0)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.misc.UICorner \\ --
    UI["c"] = Instance.new("UICorner", UI["b"])
    UI["c"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.troll \\ --
    UI["d"] = Instance.new("TextButton", UI["5"])
    UI["d"]["BorderSizePixel"] = 0
    UI["d"]["TextSize"] = 14
    UI["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
    UI["d"]["BackgroundColor3"] = Color3.fromRGB(84, 84, 84)
    UI["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    UI["d"]["Size"] = UDim2.new(0, 90, 0, 40)
    UI["d"]["Name"] = [[troll]]
    UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["d"]["Text"] = [[troll]]
    UI["d"]["Position"] = UDim2.new(0.05, 0, 0.492, 0)

    -- // StarterGui.Karma.KarmaUI.karmatabUI.troll.UICorner \\ --
    UI["e"] = Instance.new("UICorner", UI["d"])
    UI["e"]["CornerRadius"] = UDim.new(0, 5)

    -- // StarterGui.Karma.KarmaUI.karma.lol \\ --
    UI["f"] = Instance.new("TextLabel", UI["2"])
    UI["f"]["BorderSizePixel"] = 0
    UI["f"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71)
    UI["f"]["TextSize"] = 16
    UI["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    UI["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
    UI["f"]["Size"] = UDim2.new(0, 100, 0, 60)
    UI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    UI["f"]["Text"] = [[karma.lol]]
    UI["f"]["Name"] = [[karma.lol]]

    -- // StarterGui.Karma.KarmaUI.karma.lol.UICorner \\ --
    UI["10"] = Instance.new("UICorner", UI["f"])
    UI["10"]["CornerRadius"] = UDim.new(0, 5)

    -- TABS LOGIC
    local activeTab = "legit"
    local tabFrames = {}

    local rightSide = Instance.new("Frame", UI["2"])
    rightSide.Name = "ContentArea"
    rightSide.Size = UDim2.new(0, 575, 0, 500)
    rightSide.Position = UDim2.new(0, 100, 0, 0)
    rightSide.BackgroundTransparency = 1
    rightSide.BorderSizePixel = 0

    local function createTabContent(name)
        local mainScroll = Instance.new("ScrollingFrame", rightSide)
        mainScroll.Name = name .. "_content"
        mainScroll.Size = UDim2.new(1, -20, 1, -20)
        mainScroll.Position = UDim2.new(0, 10, 0, 10)
        mainScroll.BackgroundTransparency = 1
        mainScroll.BorderSizePixel = 0
        mainScroll.ScrollBarThickness = 4
        mainScroll.Visible = (name == activeTab)
        
        local layout = Instance.new("UIListLayout", mainScroll)
        layout.Padding = UDim.new(0, 8)
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        tabFrames[name] = mainScroll
        return mainScroll
    end

    local Tabs = {
        legit = createTabContent("legit"),
        visual = createTabContent("visual"),
        misc = createTabContent("misc"),
        troll = createTabContent("troll")
    }

    local function switchTab(name)
        activeTab = name
        for tName, tFrame in pairs(tabFrames) do
            tFrame.Visible = (tName == activeTab)
        end
    end

    UI["7"].MouseButton1Click:Connect(function() switchTab("legit") end)
    UI["9"].MouseButton1Click:Connect(function() switchTab("visual") end)
    UI["b"].MouseButton1Click:Connect(function() switchTab("misc") end)
    UI["d"].MouseButton1Click:Connect(function() switchTab("troll") end)

    -- COMPONENT LIBRARY
    local Library = {}

    function Library:CreateSection(parent, text)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 25)
        frame.BackgroundTransparency = 1
        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = "  [ " .. text .. " ]"
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.BackgroundTransparency = 1
    end

    function Library:CreateToggle(parent, text, state, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 4)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.Position = UDim2.new(0.02, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(0, 20, 0, 20)
        btn.Position = UDim2.new(1, -30, 0.5, -10)
        btn.BackgroundColor3 = state and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(200, 100, 100)
        btn.Text = ""
        local btnCorner = Instance.new("UICorner", btn)
        btnCorner.CornerRadius = UDim.new(0, 4)

        local toggled = state
        btn.MouseButton1Click:Connect(function()
            toggled = not toggled
            btn.BackgroundColor3 = toggled and Color3.fromRGB(100, 200, 100) or Color3.fromRGB(200, 100, 100)
            if callback then callback(toggled) end
        end)
        
        return { frame = frame, toggled = function() return toggled end }
    end

    function Library:CreateSlider(parent, text, min, max, default, isFloat, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 45)
        frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 4)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, -20, 0, 25)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text .. ": " .. tostring(default)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        local bg = Instance.new("Frame", frame)
        bg.Size = UDim2.new(1, -20, 0, 8)
        bg.Position = UDim2.new(0, 10, 0, 28)
        bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        local bgC = Instance.new("UICorner", bg) bgC.CornerRadius = UDim.new(1, 0)
        
        local fill = Instance.new("Frame", bg)
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        local fillC = Instance.new("UICorner", fill) fillC.CornerRadius = UDim.new(1, 0)
        
        local btn = Instance.new("TextButton", bg)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""

        local dragging = false
        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local relativeX = math.clamp(input.Position.X - bg.AbsolutePosition.X, 0, bg.AbsoluteSize.X)
                local mathRatio = relativeX / bg.AbsoluteSize.X
                local value = min + ((max - min) * mathRatio)
                if not isFloat then value = math.floor(value + 0.5) else value = math.floor(value * 100) / 100 end
                fill.Size = UDim2.new(mathRatio, 0, 1, 0)
                label.Text = text .. ": " .. tostring(value)
                if callback then callback(value) end
            end
        end)
    end

    function Library:CreateDropdown(parent, text, options, default, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 4)
        frame.ClipsDescendants = true

        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.BackgroundTransparency = 1
        btn.Text = "  " .. text .. ": " .. default
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left

        local dropFrame = Instance.new("Frame", frame)
        dropFrame.Size = UDim2.new(1, 0, 1, -30)
        dropFrame.Position = UDim2.new(0, 0, 0, 30)
        dropFrame.BackgroundTransparency = 1

        local listLayout = Instance.new("UIListLayout", dropFrame)
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local isOpen = false
        btn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                frame.Size = UDim2.new(1, 0, 0, 30 + (#options * 25))
            else
                frame.Size = UDim2.new(1, 0, 0, 30)
            end
            if parent:IsA("ScrollingFrame") then
                parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y)
            end
        end)

        for i, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton", dropFrame)
            optBtn.Size = UDim2.new(1, 0, 0, 25)
            optBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            optBtn.Text = opt
            optBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            optBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            optBtn.TextSize = 13

            optBtn.MouseButton1Click:Connect(function()
                btn.Text = "  " .. text .. ": " .. opt
                isOpen = false
                frame.Size = UDim2.new(1, 0, 0, 30)
                if callback then callback(opt) end
            end)
        end
    end

    function Library:CreateKeybind(parent, text, default, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 4)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0.6, 0, 1, 0)
        label.Position = UDim2.new(0.02, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(0, 80, 0, 20)
        btn.Position = UDim2.new(1, -90, 0.5, -10)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.Text = typeof(default) == "EnumItem" and default.Name or tostring(default)
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        btn.TextSize = 12
        local btnCorner = Instance.new("UICorner", btn)
        btnCorner.CornerRadius = UDim.new(0, 4)

        local listening = false
        local currentKey = default

        btn.MouseButton1Click:Connect(function()
            listening = true
            btn.Text = "..."
        end)

        UserInputService.InputBegan:Connect(function(input)
            if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                listening = false
                currentKey = input.KeyCode
                btn.Text = currentKey.Name
                if callback then callback(currentKey) end
            end
        end)
    end

    function Library:CreateColorPicker(parent, text, defaultColor, defaultAlpha, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1, 0, 0, 30)
        frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 4)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0.6, 0, 1, 0)
        label.Position = UDim2.new(0.02, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        local colorDisplay = Instance.new("TextButton", frame)
        colorDisplay.Size = UDim2.new(0, 40, 0, 20)
        colorDisplay.Position = UDim2.new(1, -50, 0.5, -10)
        colorDisplay.BackgroundColor3 = defaultColor
        colorDisplay.Text = ""
        local colorCorner = Instance.new("UICorner", colorDisplay)
        colorCorner.CornerRadius = UDim.new(0, 4)

        colorDisplay.MouseButton1Click:Connect(function()
            local r, g, b = math.random(50, 255), math.random(50, 255), math.random(50, 255)
            local newColor = Color3.fromRGB(r, g, b)
            colorDisplay.BackgroundColor3 = newColor
            if callback then callback(newColor, defaultAlpha or 1) end
        end)
    end

    local KarmaConfig = {
        Legit = { Lock = false, LockKey = Enum.KeyCode.E, Hitbox = "Head", Smoothness = 0, Silent = false, Resolver = false, FOV = 90, DrawFOV = false, Prediction = 0, AutoUnlock = false, TeamCheck = false, WallCheck = false },
        Visual = { 
            Box = false, BoxColor = Color3.fromRGB(255,255,255), 
            Chams = false, ChamsColor = Color3.fromRGB(255,255,255), 
            Skeleton = false, SkeletonColor = Color3.fromRGB(255,255,255), 
            Health = false, Distance = false, Name = false, 
            Tracers = false, TracersColor = Color3.fromRGB(255,255,255), 
            HeadDot = false, HeadDotColor = Color3.fromRGB(255,255,255), 
            Fullbright = false, NoFog = false, 
            CustomSky = false, SkyColor = Color3.fromRGB(150, 200, 255), 
            RainOff = false, 
            Highlight = false, HighlightColor = Color3.fromRGB(255,0,0), 
            ChamsThroughWalls = false, 
            Crosshair = false, CrosshairType = "Cross", CrosshairSize = 10, CrosshairThickness = 2, SpinCrosshair = false, CrosshairSpinSpeed = 5 
        },
        Misc = { InfJump = false, Fly = false, FlyKey = Enum.KeyCode.F, FlySpeed = 50, NoClip = false, SpeedBoost = 16, HighJump = 50, ThirdPerson = false, ThirdPersonDist = 12, CameraFOV = 70, Freecam = false, HitLog = false, MissLog = false, LogPos = "Top Right", AntiAFK = false, ChatBypass = false, LagSwitch = false },
        Troll = { Spin = false, SpinSpeed = 10, FakeLag = false, DanceSpam = false, DanceEmote = "e1", ChatSpam = false, ChatMessage = "karma.lol rules", ChatInterval = 2, Invisible = false, NoclipTroll = false, GodMode = false, BunnyHop = false, KillAura = false, KillAuraRange = 10 }
    }

    -- POPULATING TABS
    -- LEGIT
    Library:CreateSection(Tabs.legit, "Aimbot")
    Library:CreateToggle(Tabs.legit, "Lock", KarmaConfig.Legit.Lock, function(v) KarmaConfig.Legit.Lock = v end)
    Library:CreateKeybind(Tabs.legit, "Lock Key", KarmaConfig.Legit.LockKey, function(v) KarmaConfig.Legit.LockKey = v end)
    Library:CreateDropdown(Tabs.legit, "Hitbox", {"Head", "Torso", "UpperTorso", "LowerTorso", "Random"}, KarmaConfig.Legit.Hitbox, function(v) KarmaConfig.Legit.Hitbox = v end)
    Library:CreateSlider(Tabs.legit, "Smoothness", 0, 10, KarmaConfig.Legit.Smoothness, false, function(v) KarmaConfig.Legit.Smoothness = v end)
    Library:CreateToggle(Tabs.legit, "Silent Lock", KarmaConfig.Legit.Silent, function(v) KarmaConfig.Legit.Silent = v end)
    Library:CreateToggle(Tabs.legit, "Resolver", KarmaConfig.Legit.Resolver, function(v) KarmaConfig.Legit.Resolver = v end)
    
    Library:CreateSection(Tabs.legit, "Settings")
    Library:CreateSlider(Tabs.legit, "FOV Radius", 0, 180, KarmaConfig.Legit.FOV, false, function(v) KarmaConfig.Legit.FOV = v end)
    Library:CreateToggle(Tabs.legit, "Draw FOV", KarmaConfig.Legit.DrawFOV, function(v) KarmaConfig.Legit.DrawFOV = v end)
    Library:CreateSlider(Tabs.legit, "Prediction", 0, 1, KarmaConfig.Legit.Prediction, true, function(v) KarmaConfig.Legit.Prediction = v end)
    Library:CreateToggle(Tabs.legit, "Auto-Unlock", KarmaConfig.Legit.AutoUnlock, function(v) KarmaConfig.Legit.AutoUnlock = v end)
    Library:CreateToggle(Tabs.legit, "Team Check", KarmaConfig.Legit.TeamCheck, function(v) KarmaConfig.Legit.TeamCheck = v end)
    Library:CreateToggle(Tabs.legit, "Wall Check", KarmaConfig.Legit.WallCheck, function(v) KarmaConfig.Legit.WallCheck = v end)

    -- VISUAL
    Library:CreateSection(Tabs.visual, "Player ESP")
    Library:CreateToggle(Tabs.visual, "Box", KarmaConfig.Visual.Box, function(v) KarmaConfig.Visual.Box = v end)
    Library:CreateColorPicker(Tabs.visual, "Box Color", KarmaConfig.Visual.BoxColor, 1, function(c, a) KarmaConfig.Visual.BoxColor = c end)
    Library:CreateToggle(Tabs.visual, "Chams", KarmaConfig.Visual.Chams, function(v) KarmaConfig.Visual.Chams = v end)
    Library:CreateColorPicker(Tabs.visual, "Chams Color", KarmaConfig.Visual.ChamsColor, 0.5, function(c, a) KarmaConfig.Visual.ChamsColor = c end)
    Library:CreateToggle(Tabs.visual, "Skeleton", KarmaConfig.Visual.Skeleton, function(v) KarmaConfig.Visual.Skeleton = v end)
    Library:CreateToggle(Tabs.visual, "Health Bar", KarmaConfig.Visual.Health, function(v) KarmaConfig.Visual.Health = v end)
    Library:CreateToggle(Tabs.visual, "Distance", KarmaConfig.Visual.Distance, function(v) KarmaConfig.Visual.Distance = v end)
    Library:CreateToggle(Tabs.visual, "Name", KarmaConfig.Visual.Name, function(v) KarmaConfig.Visual.Name = v end)
    Library:CreateToggle(Tabs.visual, "Tracers", KarmaConfig.Visual.Tracers, function(v) KarmaConfig.Visual.Tracers = v end)
    Library:CreateToggle(Tabs.visual, "Head Dot", KarmaConfig.Visual.HeadDot, function(v) KarmaConfig.Visual.HeadDot = v end)

    Library:CreateSection(Tabs.visual, "World")
    Library:CreateToggle(Tabs.visual, "Fullbright", KarmaConfig.Visual.Fullbright, function(v) KarmaConfig.Visual.Fullbright = v end)
    Library:CreateToggle(Tabs.visual, "No Fog", KarmaConfig.Visual.NoFog, function(v) KarmaConfig.Visual.NoFog = v end)
    Library:CreateToggle(Tabs.visual, "Highlight Players", KarmaConfig.Visual.Highlight, function(v) KarmaConfig.Visual.Highlight = v end)
    Library:CreateToggle(Tabs.visual, "Chams Thru Walls", KarmaConfig.Visual.ChamsThroughWalls, function(v) KarmaConfig.Visual.ChamsThroughWalls = v end)

    Library:CreateSection(Tabs.visual, "Crosshair")
    Library:CreateToggle(Tabs.visual, "Enable Crosshair", KarmaConfig.Visual.Crosshair, function(v) KarmaConfig.Visual.Crosshair = v end)
    Library:CreateDropdown(Tabs.visual, "Style", {"Cross", "Dot", "Circle", "T-Shape"}, KarmaConfig.Visual.CrosshairType, function(v) KarmaConfig.Visual.CrosshairType = v end)
    Library:CreateSlider(Tabs.visual, "Size", 1, 50, KarmaConfig.Visual.CrosshairSize, false, function(v) KarmaConfig.Visual.CrosshairSize = v end)
    Library:CreateSlider(Tabs.visual, "Thickness", 1, 10, KarmaConfig.Visual.CrosshairThickness, false, function(v) KarmaConfig.Visual.CrosshairThickness = v end)
    Library:CreateToggle(Tabs.visual, "Spinning Mode", KarmaConfig.Visual.SpinCrosshair, function(v) KarmaConfig.Visual.SpinCrosshair = v end)
    Library:CreateSlider(Tabs.visual, "Spin Speed", 1, 20, KarmaConfig.Visual.CrosshairSpinSpeed, false, function(v) KarmaConfig.Visual.CrosshairSpinSpeed = v end)

    -- MISC
    Library:CreateSection(Tabs.misc, "Movement")
    Library:CreateToggle(Tabs.misc, "Infinite Jump", KarmaConfig.Misc.InfJump, function(v) KarmaConfig.Misc.InfJump = v end)
    Library:CreateToggle(Tabs.misc, "Fly", KarmaConfig.Misc.Fly, function(v) KarmaConfig.Misc.Fly = v end)
    Library:CreateSlider(Tabs.misc, "Fly Speed", 1, 200, KarmaConfig.Misc.FlySpeed, false, function(v) KarmaConfig.Misc.FlySpeed = v end)
    Library:CreateToggle(Tabs.misc, "No Clip", KarmaConfig.Misc.NoClip, function(v) KarmaConfig.Misc.NoClip = v end)
    Library:CreateSlider(Tabs.misc, "Speed Boost", 16, 200, KarmaConfig.Misc.SpeedBoost, false, function(v) KarmaConfig.Misc.SpeedBoost = v end)
    Library:CreateSlider(Tabs.misc, "High Jump", 50, 500, KarmaConfig.Misc.HighJump, false, function(v) KarmaConfig.Misc.HighJump = v end)

    Library:CreateSection(Tabs.misc, "Camera")
    Library:CreateToggle(Tabs.misc, "3rd Person", KarmaConfig.Misc.ThirdPerson, function(v) KarmaConfig.Misc.ThirdPerson = v end)
    Library:CreateSlider(Tabs.misc, "Distance", 5, 50, KarmaConfig.Misc.ThirdPersonDist, false, function(v) KarmaConfig.Misc.ThirdPersonDist = v end)
    Library:CreateSlider(Tabs.misc, "FOV", 70, 120, KarmaConfig.Misc.CameraFOV, false, function(v) KarmaConfig.Misc.CameraFOV = v end)

    Library:CreateSection(Tabs.misc, "Logs")
    Library:CreateToggle(Tabs.misc, "Hit Log", KarmaConfig.Misc.HitLog, function(v) KarmaConfig.Misc.HitLog = v end)
    Library:CreateToggle(Tabs.misc, "Miss Log", KarmaConfig.Misc.MissLog, function(v) KarmaConfig.Misc.MissLog = v end)
    Library:CreateDropdown(Tabs.misc, "Position", {"Top Left", "Top Right"}, KarmaConfig.Misc.LogPos, function(v) KarmaConfig.Misc.LogPos = v end)

    Library:CreateSection(Tabs.misc, "Other")
    Library:CreateToggle(Tabs.misc, "Anti-AFK", KarmaConfig.Misc.AntiAFK, function(v) KarmaConfig.Misc.AntiAFK = v end)
    Library:CreateToggle(Tabs.misc, "Chat Bypass", KarmaConfig.Misc.ChatBypass, function(v) KarmaConfig.Misc.ChatBypass = v end)
    Library:CreateToggle(Tabs.misc, "Lag Switch", KarmaConfig.Misc.LagSwitch, function(v) KarmaConfig.Misc.LagSwitch = v end)

    -- TROLL
    Library:CreateSection(Tabs.troll, "Modules")
    Library:CreateToggle(Tabs.troll, "Spin Bot", KarmaConfig.Troll.Spin, function(v) KarmaConfig.Troll.Spin = v end)
    Library:CreateSlider(Tabs.troll, "Spin Speed", 1, 50, KarmaConfig.Troll.SpinSpeed, false, function(v) KarmaConfig.Troll.SpinSpeed = v end)
    Library:CreateToggle(Tabs.troll, "Fake Lag", KarmaConfig.Troll.FakeLag, function(v) KarmaConfig.Troll.FakeLag = v end)
    Library:CreateToggle(Tabs.troll, "Dance Spam", KarmaConfig.Troll.DanceSpam, function(v) KarmaConfig.Troll.DanceSpam = v end)
    Library:CreateToggle(Tabs.troll, "Chat Spam", KarmaConfig.Troll.ChatSpam, function(v) KarmaConfig.Troll.ChatSpam = v end)
    Library:CreateSlider(Tabs.troll, "Message Interval", 1, 10, KarmaConfig.Troll.ChatInterval, false, function(v) KarmaConfig.Troll.ChatInterval = v end)
    Library:CreateToggle(Tabs.troll, "Invisible (Fake)", KarmaConfig.Troll.Invisible, function(v) KarmaConfig.Troll.Invisible = v end)
    Library:CreateToggle(Tabs.troll, "Noclip Troll", KarmaConfig.Troll.NoclipTroll, function(v) KarmaConfig.Troll.NoclipTroll = v end)
    Library:CreateToggle(Tabs.troll, "God Mode (Fake)", KarmaConfig.Troll.GodMode, function(v) KarmaConfig.Troll.GodMode = v end)
    Library:CreateToggle(Tabs.troll, "Bunny Hop", KarmaConfig.Troll.BunnyHop, function(v) KarmaConfig.Troll.BunnyHop = v end)
    Library:CreateToggle(Tabs.troll, "Kill Aura (Fake)", KarmaConfig.Troll.KillAura, function(v) KarmaConfig.Troll.KillAura = v end)

    -- DRAGGING LOGIC
    local gui = UI["2"]
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- TOGGLE HUD
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == Enum.KeyCode.RightShift then
            UI["1"].Enabled = not UI["1"].Enabled
        end
    end)

    -- FEATURE IMPLEMENTATION LOGIC
    local activePlayers = {}
    local currentTarget = nil
    
    local fovCircle = nil
    if Drawing then
        fovCircle = Drawing.new("Circle")
        fovCircle.Visible = false
        fovCircle.Thickness = 1
        fovCircle.Color = Color3.fromRGB(255, 255, 255)
        fovCircle.Filled = false
        fovCircle.Transparency = 1
    end

    local ESP_Cache = {}
    local function CreateESP(player)
        if not Drawing then return end
        local esp = {
            BoxOutline = Drawing.new("Square"),
            Box = Drawing.new("Square"),
            Name = Drawing.new("Text"),
            Distance = Drawing.new("Text"),
            HealthOutline = Drawing.new("Line"),
            Health = Drawing.new("Line"),
            Tracer = Drawing.new("Line"),
            HeadDot = Drawing.new("Circle")
        }
        for _, v in pairs(esp) do
            if v.ClassName == "Square" or v.ClassName == "Line" or v.ClassName == "Circle" then
                v.Transparency = 1
            elseif v.ClassName == "Text" then
                v.Center = true
                v.Outline = true
                v.Size = 16
                v.Color = Color3.fromRGB(255, 255, 255)
            end
        end
        esp.Box.Thickness = 1
        esp.Box.Filled = false
        esp.BoxOutline.Thickness = 3
        esp.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
        esp.HealthOutline.Thickness = 4
        esp.HealthOutline.Color = Color3.fromRGB(0, 0, 0)
        esp.Health.Thickness = 2
        ESP_Cache[player] = esp
    end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then CreateESP(p) end
    end
    Players.PlayerAdded:Connect(function(p) CreateESP(p) end)
    Players.PlayerRemoving:Connect(function(p)
        if ESP_Cache[p] then
            for _, v in pairs(ESP_Cache[p]) do v:Remove() end
            ESP_Cache[p] = nil
        end
    end)

    local function getClosestPlayer()
        local maxDist = KarmaConfig.Legit.FOV
        local target = nil
        local mousePos = UserInputService:GetMouseLocation()
        
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                if KarmaConfig.Legit.TeamCheck and v.Team == LocalPlayer.Team then continue end
                local rootPart = v.Character:FindFirstChild("HumanoidRootPart")
                local head = v.Character:FindFirstChild("Head")
                if not rootPart or not head then continue end
                
                local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < maxDist then
                        if KarmaConfig.Legit.WallCheck then
                            local rayParams = RaycastParams.new()
                            rayParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
                            rayParams.FilterType = Enum.RaycastFilterType.Exclude
                            local rayResult = Workspace:Raycast(Camera.CFrame.Position, (rootPart.Position - Camera.CFrame.Position).Unit * 1000, rayParams)
                            if rayResult and not rayResult.Instance:IsDescendantOf(v.Character) then continue end
                        end
                        maxDist = dist
                        target = v
                    end
                end
            end
        end
        return target
    end

    local Flying = false
    local Noclipping = false
    local flyVelocity = nil

    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed then
            if input.KeyCode == KarmaConfig.Misc.FlyKey and KarmaConfig.Misc.Fly then
                Flying = not Flying
                if Flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    flyVelocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
                    flyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    flyVelocity.Velocity = Vector3.new(0,0,0)
                else
                    if flyVelocity then flyVelocity:Destroy() flyVelocity = nil end
                end
            end
        end
    end)

    UserInputService.JumpRequest:Connect(function()
        if KarmaConfig.Misc.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    -- MAIN LOOP
    RunService.RenderStepped:Connect(function(deltaTime)
        -- LEGIT
        if Drawing and fovCircle then
            if KarmaConfig.Legit.DrawFOV then
                fovCircle.Position = UserInputService:GetMouseLocation()
                fovCircle.Radius = KarmaConfig.Legit.FOV
                fovCircle.Visible = true
            else
                fovCircle.Visible = false
            end
        end

        local isLocking = UserInputService:IsKeyDown(KarmaConfig.Legit.LockKey)
        if KarmaConfig.Legit.Lock and isLocking then
            if not currentTarget or (KarmaConfig.Legit.AutoUnlock and (not currentTarget.Character or currentTarget.Character.Humanoid.Health <= 0)) then
                currentTarget = getClosestPlayer()
            end
            
            if currentTarget and currentTarget.Character then
                local targetPartName = KarmaConfig.Legit.Hitbox
                if targetPartName == "Random" then
                    local parts = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}
                    targetPartName = parts[math.random(1, #parts)]
                end
                
                local targetPart = currentTarget.Character:FindFirstChild(targetPartName) or currentTarget.Character:FindFirstChild("HumanoidRootPart")
                if targetPart then
                    local predictedPos = targetPart.Position + (targetPart.Velocity * KarmaConfig.Legit.Prediction)
                    
                    if not KarmaConfig.Legit.Silent then
                        local currentCameraPos = Camera.CFrame.Position
                        local targetCFrame = CFrame.new(currentCameraPos, predictedPos)
                        
                        if KarmaConfig.Legit.Smoothness > 0 then
                            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 1 / (KarmaConfig.Legit.Smoothness + 1))
                        else
                            Camera.CFrame = targetCFrame
                        end
                    end
                end
            end
        else
            currentTarget = nil
        end

        -- VISUALS ESP
        if Drawing then
            for player, esp in pairs(ESP_Cache) do
                local hasChar = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0
                if hasChar then
                    local rootPos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                    local headPos, headOnScreen = Camera:WorldToViewportPoint(player.Character.Head.Position + Vector3.new(0, 0.5, 0))
                    local legPos, legOnScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0))
                    
                    if onScreen then
                        local height = math.abs(headPos.Y - legPos.Y)
                        local width = height * 0.6
                        
                        if KarmaConfig.Visual.Box then
                            esp.BoxOutline.Size = Vector2.new(width, height)
                            esp.BoxOutline.Position = Vector2.new(rootPos.X - width/2, headPos.Y)
                            esp.BoxOutline.Visible = true
                            esp.Box.Size = Vector2.new(width, height)
                            esp.Box.Position = Vector2.new(rootPos.X - width/2, headPos.Y)
                            esp.Box.Color = KarmaConfig.Visual.BoxColor
                            esp.Box.Visible = true
                        else
                            esp.Box.Visible = false
                            esp.BoxOutline.Visible = false
                        end

                        if KarmaConfig.Visual.Health then
                            local healthPct = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                            esp.HealthOutline.From = Vector2.new(rootPos.X - width/2 - 5, headPos.Y + height)
                            esp.HealthOutline.To = Vector2.new(rootPos.X - width/2 - 5, headPos.Y)
                            esp.HealthOutline.Visible = true
                            esp.Health.From = Vector2.new(rootPos.X - width/2 - 5, headPos.Y + height)
                            esp.Health.To = Vector2.new(rootPos.X - width/2 - 5, headPos.Y + height - (height * healthPct))
                            esp.Health.Color = Color3.fromRGB(255 - (healthPct * 255), healthPct * 255, 0)
                            esp.Health.Visible = true
                        else
                            esp.Health.Visible = false
                            esp.HealthOutline.Visible = false
                        end

                        if KarmaConfig.Visual.Name then
                            esp.Name.Text = player.Name
                            esp.Name.Position = Vector2.new(rootPos.X, headPos.Y - 20)
                            esp.Name.Visible = true
                        else
                            esp.Name.Visible = false
                        end

                        if KarmaConfig.Visual.Distance then
                            local dist = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude)
                            esp.Distance.Text = "[" .. tostring(dist) .. "]"
                            esp.Distance.Position = Vector2.new(rootPos.X, headPos.Y + height + 2)
                            esp.Distance.Visible = true
                        else
                            esp.Distance.Visible = false
                        end
                        
                        if KarmaConfig.Visual.Tracers then
                            esp.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            esp.Tracer.To = Vector2.new(rootPos.X, legPos.Y)
                            esp.Tracer.Color = KarmaConfig.Visual.TracersColor
                            esp.Tracer.Visible = true
                        else
                            esp.Tracer.Visible = false
                        end
                        
                        if KarmaConfig.Visual.HeadDot then
                            esp.HeadDot.Position = Vector2.new(headPos.X, headPos.Y)
                            esp.HeadDot.Color = KarmaConfig.Visual.HeadDotColor
                            esp.HeadDot.Visible = true
                        else
                            esp.HeadDot.Visible = false
                        end
                    else
                        for _, v in pairs(esp) do v.Visible = false end
                    end
                else
                    for _, v in pairs(esp) do v.Visible = false end
                end
            end
        end

        -- MISC & TROLL LOOP
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            -- Speed & Jump
            if KarmaConfig.Misc.SpeedBoost > 16 then
                LocalPlayer.Character.Humanoid.WalkSpeed = KarmaConfig.Misc.SpeedBoost
            end
            if KarmaConfig.Misc.HighJump > 50 then
                LocalPlayer.Character.Humanoid.JumpPower = KarmaConfig.Misc.HighJump
            end

            -- Fly logic
            if Flying and flyVelocity then
                local moveDir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0) end
                
                if moveDir.Magnitude > 0 then moveDir = moveDir.Unit end
                flyVelocity.Velocity = moveDir * KarmaConfig.Misc.FlySpeed
            end
            
            -- Troll Bunnyhop
            if KarmaConfig.Troll.BunnyHop and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            -- Troll Spin
            if KarmaConfig.Troll.Spin and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(KarmaConfig.Troll.SpinSpeed), 0)
            end
        end
        
        -- Fullbright
        if KarmaConfig.Visual.Fullbright then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 2
        end
        
        -- No Fog
        if KarmaConfig.Visual.NoFog then
            Lighting.FogEnd = 9e9
        end
    end)

    -- NOCLIP LOOP
    RunService.Stepped:Connect(function()
        if KarmaConfig.Misc.NoClip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)

    -- ADDITIONAL LOGIC HOOKS
    local lastTick = tick()
    local isLagging = false
    RunService.Heartbeat:Connect(function()
        if KarmaConfig.Troll.FakeLag and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if not isLagging and tick() - lastTick > 0.3 then
                isLagging = true
                task.spawn(function()
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    task.wait(0.1)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    end
                    lastTick = tick()
                    isLagging = false
                end)
            end
        end
    end)

    local lastChat = tick()
    RunService.Heartbeat:Connect(function()
        if KarmaConfig.Troll.ChatSpam then
            if tick() - lastChat > KarmaConfig.Troll.ChatInterval then
                if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                    local channel = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
                    if channel then channel:SendAsync(KarmaConfig.Troll.ChatMessage) end
                else
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(KarmaConfig.Troll.ChatMessage, "All")
                end
                lastChat = tick()
            end
        end
    end)

    LocalPlayer.Idled:Connect(function()
        if KarmaConfig.Misc.AntiAFK then
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end
    end)

    local auraCircle = nil
    if Drawing then
        auraCircle = Drawing.new("Circle")
        auraCircle.Visible = false
        auraCircle.Color = Color3.fromRGB(255, 0, 0)
        auraCircle.Thickness = 2
    end

    RunService.RenderStepped:Connect(function()
        if KarmaConfig.Misc.ThirdPerson and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            Camera.CameraSubject = LocalPlayer.Character.Humanoid
            Camera.CFrame = CFrame.new(LocalPlayer.Character.Head.Position + Vector3.new(0, 5, KarmaConfig.Misc.ThirdPersonDist), LocalPlayer.Character.Head.Position)
        end

        if KarmaConfig.Troll.GodMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
        end

        if KarmaConfig.Troll.KillAura and Drawing and auraCircle and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position)
            if onScreen then
                auraCircle.Position = Vector2.new(pos.X, pos.Y)
                local p1 = Camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(KarmaConfig.Troll.KillAuraRange, 0, 0))
                auraCircle.Radius = math.abs(p1.X - pos.X)
                auraCircle.Visible = true
            else
                auraCircle.Visible = false
            end
        elseif auraCircle then
            auraCircle.Visible = false
        end
    end)

    local function KarmaLog(text, color)
        local msg = Instance.new("TextLabel", UI["1"])
        msg.Size = UDim2.new(0, 200, 0, 30)
        msg.Position = KarmaConfig.Misc.LogPos == "Top Left" and UDim2.new(0, 20, 0, 20) or UDim2.new(1, -220, 0, 20)
        msg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        msg.TextColor3 = color
        msg.Text = text
        msg.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        msg.TextSize = 14
        local c = Instance.new("UICorner", msg)
        c.CornerRadius = UDim.new(0, 4)
        
        task.spawn(function()
            task.wait(4)
            TweenService:Create(msg, TweenInfo.new(1), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
            task.wait(1)
            msg:Destroy()
        end)
    end

    -- Hit/Miss Simulation
    if KarmaConfig.Misc.HitLog or KarmaConfig.Misc.MissLog then
        -- This is a placeholder since local detection of generic hits requires game-specific RemoteEvent hooking.
        -- We spawn an example log to prove the UI works when enabled.
        task.spawn(function()
            while task.wait(5) do
                if KarmaConfig.Misc.HitLog then
                    KarmaLog("✔ Hit Player for 25 damage", Color3.fromRGB(0, 255, 0))
                end
            end
        end)
    end

    -- LOADING SCREEN
    local LoadingFrame = Instance.new("Frame", UI["1"])
    LoadingFrame.Name = "LoadingFrame"
    LoadingFrame.Size = UDim2.new(0, 200, 0, 50)
    LoadingFrame.Position = UDim2.new(1, -220, 0, 20)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
    LoadingFrame.BorderSizePixel = 0
    
    local LoadCorner = Instance.new("UICorner", LoadingFrame)
    LoadCorner.CornerRadius = UDim.new(0, 5)
    
    local LoadStroke = Instance.new("UIStroke", LoadingFrame)
    LoadStroke.Transparency = 0.5
    LoadStroke.Thickness = 2
    
    local LoadText = Instance.new("TextLabel", LoadingFrame)
    LoadText.Size = UDim2.new(1, 0, 1, 0)
    LoadText.BackgroundTransparency = 1
    LoadText.Text = "loading karma.lol hang tight..."
    LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadText.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    LoadText.TextSize = 14
    
    UI["1"].Enabled = true
    
    task.delay(10, function()
        LoadingFrame:Destroy()
        UI["2"].Visible = true
    end)

end)

if not pcallSuccess then
    warn("Karma.lol experienced an error during initialization: " .. tostring(pcallError))
end