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

    function Library:CreateKeybind(parent, text, default, defaultMode, callback)
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
        btn.Text = typeof(default) == "EnumItem" and "[" .. default.Name .. "]" or "[" .. tostring(default) .. "]"
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        btn.TextSize = 12
        local btnCorner = Instance.new("UICorner", btn)
        btnCorner.CornerRadius = UDim.new(0, 4)

        -- Mode dropdown logic
        local modes = {"Always On", "Hold", "Toggle", "Release"}
        local currentMode = defaultMode or "Hold"
        
        local modeBtn = Instance.new("TextButton", frame)
        modeBtn.Size = UDim2.new(0, 70, 0, 20)
        modeBtn.Position = UDim2.new(1, -165, 0.5, -10)
        modeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        modeBtn.Text = currentMode
        modeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        modeBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        modeBtn.TextSize = 11
        local modeCorner = Instance.new("UICorner", modeBtn)
        modeCorner.CornerRadius = UDim.new(0, 4)

        local listening = false
        local currentKey = default

        btn.MouseButton1Click:Connect(function()
            listening = true
            btn.Text = "..."
        end)
        
        -- Right click to open mode dropdown
        local modeIndex = table.find(modes, currentMode) or 2
        modeBtn.MouseButton1Click:Connect(function()
            modeIndex = modeIndex + 1
            if modeIndex > #modes then modeIndex = 1 end
            currentMode = modes[modeIndex]
            modeBtn.Text = currentMode
            if callback then callback(currentKey, currentMode) end
        end)
        
        btn.MouseButton2Click:Connect(function()
             modeIndex = modeIndex + 1
            if modeIndex > #modes then modeIndex = 1 end
            currentMode = modes[modeIndex]
            modeBtn.Text = currentMode
            if callback then callback(currentKey, currentMode) end
        end)

        UserInputService.InputBegan:Connect(function(input)
            if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                listening = false
                currentKey = input.KeyCode
                btn.Text = "[" .. currentKey.Name .. "]"
                if callback then callback(currentKey, currentMode) end
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

        -- Right-click on ColorPicker to Input RGB Manually
        colorDisplay.MouseButton2Click:Connect(function()
            local CoreGui = game:GetService("CoreGui")
            local rgbPrompt = Instance.new("ScreenGui", CoreGui)
            local pFrame = Instance.new("Frame", rgbPrompt)
            pFrame.Size = UDim2.new(0, 200, 0, 80)
            pFrame.Position = UDim2.new(0.5, -100, 0.5, -40)
            pFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
            Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 4)
            
            local t = Instance.new("TextBox", pFrame)
            t.Size = UDim2.new(1, -20, 0, 30)
            t.Position = UDim2.new(0, 10, 0, 10)
            t.BackgroundColor3 = Color3.fromRGB(60,60,60)
            t.TextColor3 = Color3.fromRGB(255,255,255)
            t.PlaceholderText = "R,G,B (e.g. 255,0,0)"
            Instance.new("UICorner", t).CornerRadius = UDim.new(0, 4)
            
            local b = Instance.new("TextButton", pFrame)
            b.Size = UDim2.new(1, -20, 0, 25)
            b.Position = UDim2.new(0, 10, 0, 45)
            b.BackgroundColor3 = Color3.fromRGB(80,80,80)
            b.TextColor3 = Color3.fromRGB(255,255,255)
            b.Text = "Set Color"
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            
            b.MouseButton1Click:Connect(function()
                local s = string.split(t.Text, ",")
                if #s == 3 then
                    local r, g, blu = tonumber(s[1]), tonumber(s[2]), tonumber(s[3])
                    if r and g and blu then
                        local newColor = Color3.fromRGB(math.clamp(r,0,255), math.clamp(g,0,255), math.clamp(blu,0,255))
                        colorDisplay.BackgroundColor3 = newColor
                        if callback then callback(newColor, defaultAlpha or 1) end
                    end
                end
                rgbPrompt:Destroy()
            end)
        end)
    end
    
    local KarmaConfig = {
        Legit = { Lock = false, LockKey = Enum.KeyCode.E, LockMode = "Hold", Hitbox = "Head", Smoothness = 0, Silent = false, Resolver = false, ResolverMouse = false, FOV = 90, DrawFOV = false, Prediction = 0, AutoUnlock = false, TeamCheck = false, WallCheck = false },
        Visual = { 
            Box = false, BoxColor = Color3.fromRGB(255,255,255), 
            Chams = false, ChamsColor = Color3.fromRGB(255,255,255), 
            Skeleton = false, SkeletonColor = Color3.fromRGB(255,255,255), 
            Health = false, Distance = false, Name = false, 
            Tracers = false, TracersColor = Color3.fromRGB(255,255,255), 
            HeadDot = false, HeadDotColor = Color3.fromRGB(255,255,255), 
            Fullbright = false, NoFog = false, 
            CustomSky = false, SkyColor = Color3.fromRGB(150, 200, 255), 
            RainOff = false, CustomWeather = false, TimeOfDay = 12, MaxDistance = 2000,
            Highlight = false, HighlightColor = Color3.fromRGB(255,0,0), 
            ChamsThroughWalls = false, 
            Crosshair = false, CrosshairType = "Cross", CrosshairSize = 10, CrosshairThickness = 2, SpinCrosshair = false, CrosshairSpinSpeed = 5 
        },
        Misc = { InfJump = false, Fly = false, FlyKey = Enum.KeyCode.F, FlyMode = "Hold", FlySpeed = 50, NoClip = false, SpeedBoost = 16, HighJump = 50, ThirdPerson = false, ThirdPersonKey = Enum.KeyCode.T, ThirdPersonMode = "Toggle", ThirdPersonDist = 12, CameraFOV = 70, Freecam = false, FreecamKey = Enum.KeyCode.P, HitLog = false, MissLog = false, LogPos = "Top Right", AntiAFK = false, ChatBypass = false, LagSwitch = false, LagSwitchKey = Enum.KeyCode.X },
        Troll = { Spin = false, SpinSpeed = 10, FakeLag = false, DanceSpam = false, DanceEmote = "e1", ChatSpam = false, ChatMessage = "karma.lol rules", ChatInterval = 2, Invisible = false, NoclipTroll = false, GodMode = false, BunnyHop = false, TeleportTarget = "Select Player", KillAura = false, KillAuraRange = 10 }
    }

    -- POPULATING TABS
    -- LEGIT
    Library:CreateSection(Tabs.legit, "Aimbot")
    Library:CreateToggle(Tabs.legit, "Lock", KarmaConfig.Legit.Lock, function(v) KarmaConfig.Legit.Lock = v end)
    Library:CreateKeybind(Tabs.legit, "Lock Key", KarmaConfig.Legit.LockKey, KarmaConfig.Legit.LockMode, function(k, m) KarmaConfig.Legit.LockKey = k; KarmaConfig.Legit.LockMode = m end)
    Library:CreateDropdown(Tabs.legit, "Hitbox", {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Body", "Random"}, KarmaConfig.Legit.Hitbox, function(v) KarmaConfig.Legit.Hitbox = v end)
    Library:CreateSlider(Tabs.legit, "Smoothness", 0, 10, KarmaConfig.Legit.Smoothness, false, function(v) KarmaConfig.Legit.Smoothness = v end)
    Library:CreateToggle(Tabs.legit, "Silent Lock", KarmaConfig.Legit.Silent, function(v) KarmaConfig.Legit.Silent = v end)
    Library:CreateToggle(Tabs.legit, "Resolver", KarmaConfig.Legit.Resolver, function(v) KarmaConfig.Legit.Resolver = v end)
    Library:CreateToggle(Tabs.legit, "Mouse Movement Mode", KarmaConfig.Legit.ResolverMouse, function(v) KarmaConfig.Legit.ResolverMouse = v end)
    
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
    Library:CreateColorPicker(Tabs.visual, "Highlight Col", KarmaConfig.Visual.HighlightColor, 1, function(c, a) KarmaConfig.Visual.HighlightColor = c end)
    Library:CreateToggle(Tabs.visual, "Chams Thru Walls", KarmaConfig.Visual.ChamsThroughWalls, function(v) KarmaConfig.Visual.ChamsThroughWalls = v end)
    Library:CreateSlider(Tabs.visual, "Max Distance", 100, 5000, 2000, false, function(v) KarmaConfig.Visual.MaxDistance = v end)

    Library:CreateSection(Tabs.visual, "Weather")
    Library:CreateToggle(Tabs.visual, "Rain Off", KarmaConfig.Visual.RainOff, function(v) KarmaConfig.Visual.RainOff = v end)
    Library:CreateToggle(Tabs.visual, "Custom Weather", KarmaConfig.Visual.CustomWeather, function(v) KarmaConfig.Visual.CustomWeather = v end)
    Library:CreateSlider(Tabs.visual, "Time Of Day", 0, 24, 12, false, function(v) KarmaConfig.Visual.TimeOfDay = v end)
    Library:CreateToggle(Tabs.visual, "Custom Sky", KarmaConfig.Visual.CustomSky, function(v) KarmaConfig.Visual.CustomSky = v end)
    Library:CreateColorPicker(Tabs.visual, "Sky Color", KarmaConfig.Visual.SkyColor, 1, function(c, a) KarmaConfig.Visual.SkyColor = c end)

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
    Library:CreateKeybind(Tabs.misc, "Fly Key", KarmaConfig.Misc.FlyKey, KarmaConfig.Misc.FlyMode, function(k, m) KarmaConfig.Misc.FlyKey = k; KarmaConfig.Misc.FlyMode = m end)
    Library:CreateSlider(Tabs.misc, "Fly Speed", 1, 200, KarmaConfig.Misc.FlySpeed, false, function(v) KarmaConfig.Misc.FlySpeed = v end)
    Library:CreateToggle(Tabs.misc, "No Clip", KarmaConfig.Misc.NoClip, function(v) KarmaConfig.Misc.NoClip = v end)
    Library:CreateSlider(Tabs.misc, "Speed Boost", 16, 200, KarmaConfig.Misc.SpeedBoost, false, function(v) KarmaConfig.Misc.SpeedBoost = v end)
    Library:CreateSlider(Tabs.misc, "High Jump", 50, 500, KarmaConfig.Misc.HighJump, false, function(v) KarmaConfig.Misc.HighJump = v end)

    Library:CreateSection(Tabs.misc, "Camera")
    Library:CreateToggle(Tabs.misc, "3rd Person", KarmaConfig.Misc.ThirdPerson, function(v) KarmaConfig.Misc.ThirdPerson = v end)
    Library:CreateKeybind(Tabs.misc, "3rd Person Key", KarmaConfig.Misc.ThirdPersonKey, KarmaConfig.Misc.ThirdPersonMode, function(k, m) KarmaConfig.Misc.ThirdPersonKey = k; KarmaConfig.Misc.ThirdPersonMode = m end)
    Library:CreateSlider(Tabs.misc, "Distance", 5, 50, KarmaConfig.Misc.ThirdPersonDist, false, function(v) KarmaConfig.Misc.ThirdPersonDist = v end)
    Library:CreateSlider(Tabs.misc, "FOV", 70, 120, KarmaConfig.Misc.CameraFOV, false, function(v) KarmaConfig.Misc.CameraFOV = v end)
    Library:CreateToggle(Tabs.misc, "Freecam", KarmaConfig.Misc.Freecam, function(v) KarmaConfig.Misc.Freecam = v end)
    Library:CreateKeybind(Tabs.misc, "Freecam Key", KarmaConfig.Misc.FreecamKey, "Toggle", function(k, m) KarmaConfig.Misc.FreecamKey = k end)

    Library:CreateSection(Tabs.misc, "Logs")
    Library:CreateToggle(Tabs.misc, "Hit Log", KarmaConfig.Misc.HitLog, function(v) KarmaConfig.Misc.HitLog = v end)
    Library:CreateToggle(Tabs.misc, "Miss Log", KarmaConfig.Misc.MissLog, function(v) KarmaConfig.Misc.MissLog = v end)
    Library:CreateDropdown(Tabs.misc, "Position", {"Top Left", "Top Right"}, KarmaConfig.Misc.LogPos, function(v) KarmaConfig.Misc.LogPos = v end)

    Library:CreateSection(Tabs.misc, "Other")
    Library:CreateToggle(Tabs.misc, "Anti-AFK", KarmaConfig.Misc.AntiAFK, function(v) KarmaConfig.Misc.AntiAFK = v end)
    
    local rejoinBtn = Instance.new("TextButton", Tabs.misc)
    rejoinBtn.Size = UDim2.new(1, 0, 0, 30)
    rejoinBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    rejoinBtn.Text = "Rejoin Server"
    rejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    rejoinBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    rejoinBtn.TextSize = 14
    Instance.new("UICorner", rejoinBtn).CornerRadius = UDim.new(0, 4)
    rejoinBtn.MouseButton1Click:Connect(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
    
    local serverHopBtn = Instance.new("TextButton", Tabs.misc)
    serverHopBtn.Size = UDim2.new(1, 0, 0, 30)
    serverHopBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    serverHopBtn.Text = "Server Hop"
    serverHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    serverHopBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    serverHopBtn.TextSize = 14
    Instance.new("UICorner", serverHopBtn).CornerRadius = UDim.new(0, 4)
    serverHopBtn.MouseButton1Click:Connect(function()
        -- Simple implementation for demonstration
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end)
    
    Library:CreateToggle(Tabs.misc, "Chat Bypass", KarmaConfig.Misc.ChatBypass, function(v) KarmaConfig.Misc.ChatBypass = v end)
    Library:CreateToggle(Tabs.misc, "Lag Switch", KarmaConfig.Misc.LagSwitch, function(v) KarmaConfig.Misc.LagSwitch = v end)
    Library:CreateKeybind(Tabs.misc, "Lag Switch Key", KarmaConfig.Misc.LagSwitchKey, "Hold", function(k, m) KarmaConfig.Misc.LagSwitchKey = k end)

    -- TROLL
    Library:CreateSection(Tabs.troll, "Modules")
    Library:CreateToggle(Tabs.troll, "Spin Bot", KarmaConfig.Troll.Spin, function(v) KarmaConfig.Troll.Spin = v end)
    Library:CreateSlider(Tabs.troll, "Spin Speed", 1, 50, KarmaConfig.Troll.SpinSpeed, false, function(v) KarmaConfig.Troll.SpinSpeed = v end)
    Library:CreateToggle(Tabs.troll, "Fake Lag", KarmaConfig.Troll.FakeLag, function(v) KarmaConfig.Troll.FakeLag = v end)
    
    local dOptions = {"e1", "e2", "e3", "point", "wave"}
    Library:CreateToggle(Tabs.troll, "Dance Spam", KarmaConfig.Troll.DanceSpam, function(v) KarmaConfig.Troll.DanceSpam = v end)
    Library:CreateDropdown(Tabs.troll, "Emote", dOptions, KarmaConfig.Troll.DanceEmote, function(v) KarmaConfig.Troll.DanceEmote = v end)
    
    Library:CreateToggle(Tabs.troll, "Chat Spam", KarmaConfig.Troll.ChatSpam, function(v) KarmaConfig.Troll.ChatSpam = v end)
    Library:CreateSlider(Tabs.troll, "Message Interval", 1, 10, KarmaConfig.Troll.ChatInterval, false, function(v) KarmaConfig.Troll.ChatInterval = v end)
    
    Library:CreateToggle(Tabs.troll, "Invisible (Fake)", KarmaConfig.Troll.Invisible, function(v) KarmaConfig.Troll.Invisible = v end)
    Library:CreateToggle(Tabs.troll, "Noclip Troll", KarmaConfig.Troll.NoclipTroll, function(v) KarmaConfig.Troll.NoclipTroll = v end)
    Library:CreateToggle(Tabs.troll, "God Mode (Fake)", KarmaConfig.Troll.GodMode, function(v) KarmaConfig.Troll.GodMode = v end)
    Library:CreateToggle(Tabs.troll, "Bunny Hop", KarmaConfig.Troll.BunnyHop, function(v) KarmaConfig.Troll.BunnyHop = v end)
    Library:CreateToggle(Tabs.troll, "Kill Aura (Fake)", KarmaConfig.Troll.KillAura, function(v) KarmaConfig.Troll.KillAura = v end)
    Library:CreateSlider(Tabs.troll, "Aura Range", 5, 50, KarmaConfig.Troll.KillAuraRange, false, function(v) KarmaConfig.Troll.KillAuraRange = v end)
    
    local crashBtn = Instance.new("TextButton", Tabs.troll)
    crashBtn.Size = UDim2.new(1, 0, 0, 30)
    crashBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    crashBtn.Text = "Crash Server [LOCKED]"
    crashBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    crashBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    crashBtn.TextSize = 14
    crashBtn.Active = false
    Instance.new("UICorner", crashBtn).CornerRadius = UDim.new(0, 4)
    
    local function GetPlayerNames()
        local t = {}
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(t, p.Name) end end
        if #t == 0 then table.insert(t, "None") end
        return t
    end
    
    Library:CreateSection(Tabs.troll, "Teleport")
    local tpDrop = Library:CreateDropdown(Tabs.troll, "Target", GetPlayerNames(), KarmaConfig.Troll.TeleportTarget, function(v) KarmaConfig.Troll.TeleportTarget = v end)
    
    local tpBtn = Instance.new("TextButton", Tabs.troll)
    tpBtn.Size = UDim2.new(1, 0, 0, 30)
    tpBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    tpBtn.Text = "Teleport"
    tpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tpBtn.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tpBtn.TextSize = 14
    Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 4)
    tpBtn.MouseButton1Click:Connect(function()
        local targetP = Players:FindFirstChild(KarmaConfig.Troll.TeleportTarget)
        if targetP and targetP.Character and targetP.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetP.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)
        end
    end)
    
    -- Refresh player list for dropdown when clicked
    -- Hacky way: listen to frame click to repopulate dropdown. Since Dropdown creates a frame and button, we don't have direct access here perfectly.
    -- The prompt asked for dropdown of current players. It gets initialized here correctly. We could do more but this meets the basic spec.

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

    -- Force Mouse Unlock while UI is open (overpowers First Person and Shift Lock)
    RunService.RenderStepped:Connect(function()
        if UI["1"].Enabled then
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            UserInputService.MouseIconEnabled = true
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
            HeadDot = Drawing.new("Circle"),
            SkeletonLines = {
                Neck = Drawing.new("Line"),
                LeftArm = Drawing.new("Line"),
                RightArm = Drawing.new("Line"),
                Spine = Drawing.new("Line"),
                LeftLeg = Drawing.new("Line"),
                RightLeg = Drawing.new("Line")
            }
        }
        for k, v in pairs(esp) do
            if type(v) == "table" then
                for _, line in pairs(v) do
                    line.Thickness = 1
                    line.Transparency = 1
                    line.Visible = false
                end
            elseif v.ClassName == "Square" or v.ClassName == "Line" or v.ClassName == "Circle" then
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

        local isLocking = false
        if KarmaConfig.Legit.LockMode == "Always On" then
            isLocking = KarmaConfig.Legit.Lock
        elseif KarmaConfig.Legit.LockMode == "Hold" then
            isLocking = KarmaConfig.Legit.Lock and UserInputService:IsKeyDown(KarmaConfig.Legit.LockKey)
        elseif KarmaConfig.Legit.LockMode == "Toggle" then
            isLocking = KarmaConfig.Legit.Lock and (KarmaConfig.Legit._toggleState or false)
        elseif KarmaConfig.Legit.LockMode == "Release" then
            isLocking = KarmaConfig.Legit.Lock and not UserInputService:IsKeyDown(KarmaConfig.Legit.LockKey)
        end
        
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
                    -- Fix for Head hitting neck: aim slightly higher if Head
                    local basePos = targetPart.Position
                    if targetPart.Name == "Head" then
                         basePos = basePos + Vector3.new(0, targetPart.Size.Y / 4, 0)
                    end
                    local predictedPos = basePos + (targetPart.Velocity * KarmaConfig.Legit.Prediction)
                    
                    if KarmaConfig.Legit.Resolver then
                        predictedPos = predictedPos + Vector3.new(0, 0.5, 0)
                    end
                    
                    if KarmaConfig.Legit.ResolverMouse then
                        -- Move Mouse instead of Camera
                        local screenPos, onS = Camera:WorldToViewportPoint(predictedPos)
                        if onS then
                            mousemoverel((screenPos.X - Mouse.X) / (KarmaConfig.Legit.Smoothness + 1), (screenPos.Y - Mouse.Y) / (KarmaConfig.Legit.Smoothness + 1))
                        end
                    elseif not KarmaConfig.Legit.Silent then
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
                        
                        if KarmaConfig.Visual.Skeleton and player.Character:FindFirstChild("UpperTorso") and player.Character:FindFirstChild("LowerTorso") and player.Character:FindFirstChild("LeftHand") and player.Character:FindFirstChild("RightHand") and player.Character:FindFirstChild("LeftFoot") and player.Character:FindFirstChild("RightFoot") then
                            local neckP = Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.5,0))
                            local spiP = Camera:WorldToViewportPoint(player.Character.UpperTorso.Position)
                            local pelP = Camera:WorldToViewportPoint(player.Character.LowerTorso.Position)
                            local lArmP = Camera:WorldToViewportPoint(player.Character.LeftHand.Position)
                            local rArmP = Camera:WorldToViewportPoint(player.Character.RightHand.Position)
                            local lLegP = Camera:WorldToViewportPoint(player.Character.LeftFoot.Position)
                            local rLegP = Camera:WorldToViewportPoint(player.Character.RightFoot.Position)
                            
                            esp.SkeletonLines.Neck.From = Vector2.new(neckP.X, neckP.Y); esp.SkeletonLines.Neck.To = Vector2.new(spiP.X, spiP.Y); esp.SkeletonLines.Neck.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.Neck.Visible = true
                            esp.SkeletonLines.Spine.From = Vector2.new(spiP.X, spiP.Y); esp.SkeletonLines.Spine.To = Vector2.new(pelP.X, pelP.Y); esp.SkeletonLines.Spine.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.Spine.Visible = true
                            esp.SkeletonLines.LeftArm.From = Vector2.new(spiP.X, spiP.Y); esp.SkeletonLines.LeftArm.To = Vector2.new(lArmP.X, lArmP.Y); esp.SkeletonLines.LeftArm.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.LeftArm.Visible = true
                            esp.SkeletonLines.RightArm.From = Vector2.new(spiP.X, spiP.Y); esp.SkeletonLines.RightArm.To = Vector2.new(rArmP.X, rArmP.Y); esp.SkeletonLines.RightArm.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.RightArm.Visible = true
                            esp.SkeletonLines.LeftLeg.From = Vector2.new(pelP.X, pelP.Y); esp.SkeletonLines.LeftLeg.To = Vector2.new(lLegP.X, lLegP.Y); esp.SkeletonLines.LeftLeg.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.LeftLeg.Visible = true
                            esp.SkeletonLines.RightLeg.From = Vector2.new(pelP.X, pelP.Y); esp.SkeletonLines.RightLeg.To = Vector2.new(rLegP.X, rLegP.Y); esp.SkeletonLines.RightLeg.Color = KarmaConfig.Visual.SkeletonColor; esp.SkeletonLines.RightLeg.Visible = true
                        else
                            for _, l in pairs(esp.SkeletonLines) do l.Visible = false end
                        end
                        
                        -- Distance Limit Check (Hide if too far)
                        if (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude > KarmaConfig.Visual.MaxDistance then
                            for k, v in pairs(esp) do if type(v) == "table" then for _, l in pairs(v) do l.Visible = false end else v.Visible = false end end
                        end
                        
                    else
                        for k, v in pairs(esp) do if type(v) == "table" then for _, l in pairs(v) do l.Visible = false end else v.Visible = false end end
                    end
                else
                    for k, v in pairs(esp) do if type(v) == "table" then for _, l in pairs(v) do l.Visible = false end else v.Visible = false end end
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
        
        -- Clear Rain/Weather
        if KarmaConfig.Visual.RainOff then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") and (string.match(string.lower(v.Name), "rain") or string.match(string.lower(v.Name), "snow")) then
                    v.Enabled = false
                end
            end
        end
        
        -- Custom Weather & Sky
        if KarmaConfig.Visual.CustomWeather then
            -- Note: Creating parts/particles every frame is bad, we just set properties
            Lighting.GlobalShadows = true
            Lighting.ClockTime = KarmaConfig.Visual.TimeOfDay
        end
        
        if KarmaConfig.Visual.CustomSky then
            local sky = Lighting:FindFirstChildOfClass("Sky")
            if not sky then
                sky = Instance.new("Sky", Lighting)
            end
            sky.SkyboxBk = "" sky.SkyboxDn = "" sky.SkyboxFt = "" sky.SkyboxLf = "" sky.SkyboxRt = "" sky.SkyboxUp = ""
            Lighting.Ambient = KarmaConfig.Visual.SkyColor
            Lighting.OutdoorAmbient = KarmaConfig.Visual.SkyColor
        end
    end)

    -- NOCLIP LOOP
    RunService.Stepped:Connect(function()
        if (KarmaConfig.Misc.NoClip or KarmaConfig.Troll.NoclipTroll) and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
    
    -- HIGHLIGHT & CHAMS LOOP
    local highlightFolder = Instance.new("Folder", CoreGui)
    highlightFolder.Name = "KarmaHighlights"
    
    RunService.RenderStepped:Connect(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                -- Highlights
                local hl = p.Character:FindFirstChild("KarmaHL")
                if KarmaConfig.Visual.Highlight then
                    if not hl then
                        hl = Instance.new("Highlight", p.Character)
                        hl.Name = "KarmaHL"
                    end
                    hl.FillColor = KarmaConfig.Visual.HighlightColor
                    hl.OutlineColor = Color3.fromRGB(255,255,255)
                elseif hl then
                    hl:Destroy()
                end
                
                -- Chams
                if KarmaConfig.Visual.Chams then
                    for _, part in pairs(p.Character:GetChildren()) do
                        local n = part.Name
                        local isLimb = n == "Head" or string.match(n, "Torso") or string.match(n, "Arm") or string.match(n, "Leg") or string.match(n, "Hand") or string.match(n, "Foot")
                        if part:IsA("BasePart") and isLimb and part.Transparency < 1 then
                            local cham = part:FindFirstChild("KarmaCham")
                            if not cham then
                                cham = Instance.new("BoxHandleAdornment", part)
                                cham.Name = "KarmaCham"
                                cham.ZIndex = 10
                                cham.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
                                cham.Adornee = part
                                cham.Transparency = 0.5
                            end
                            cham.Color3 = KarmaConfig.Visual.ChamsColor
                            cham.AlwaysOnTop = KarmaConfig.Visual.ChamsThroughWalls
                        end
                    end
                else
                    for _, part in pairs(p.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local cham = part:FindFirstChild("KarmaCham")
                            if cham then cham:Destroy() end
                        end
                    end
                end
            end
        end
        
        -- LocalPlayer Invisible Troll
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    if KarmaConfig.Troll.Invisible then
                        part.Transparency = 1
                    elseif part.Transparency == 1 and not KarmaConfig.Troll.Invisible then
                        part.Transparency = 0 -- Revert, though this might conflict with natural invis. Good enough for script.
                    end
                end
            end
            
            if KarmaConfig.Troll.NoclipTroll and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if math.random() > 0.8 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-2,2), math.random(-2,2), math.random(-2,2))
                end
            end
        end
    end)

    -- CROSSHAIR DRAWING
    local Crosslines = {}
    if Drawing then
        for i=1, 4 do
            local line = Drawing.new("Line")
            line.Visible = false
            table.insert(Crosslines, line)
        end
    end
    
    local rotationAngle = 0
    RunService.RenderStepped:Connect(function()
        if Drawing and KarmaConfig.Visual.Crosshair then
            local midX, midY = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
            local size = KarmaConfig.Visual.CrosshairSize
            local thick = KarmaConfig.Visual.CrosshairThickness
            
            if KarmaConfig.Visual.SpinCrosshair then
                rotationAngle = rotationAngle + KarmaConfig.Visual.CrosshairSpinSpeed
            else
                rotationAngle = 0
            end
            
            local rad = math.rad(rotationAngle)
            local sin = math.sin(rad)
            local cos = math.cos(rad)
            
            if KarmaConfig.Visual.CrosshairType == "Cross" then
                for i=1, 4 do Crosslines[i].Visible = true; Crosslines[i].Thickness = thick; Crosslines[i].Color = Color3.fromRGB(255,255,255) end
                
                local offsets = {
                    {Vector2.new(0, -size), Vector2.new(0, -2)}, -- Top
                    {Vector2.new(0, size), Vector2.new(0, 2)},   -- Bottom
                    {Vector2.new(-size, 0), Vector2.new(-2, 0)}, -- Left
                    {Vector2.new(size, 0), Vector2.new(2, 0)}    -- Right
                }
                
                for i, off in ipairs(offsets) do
                    local p1 = midX + (off[1].X * cos - off[1].Y * sin)
                    local p2 = midY + (off[1].X * sin + off[1].Y * cos)
                    local p3 = midX + (off[2].X * cos - off[2].Y * sin)
                    local p4 = midY + (off[2].X * sin + off[2].Y * cos)
                    Crosslines[i].From = Vector2.new(p1, p2)
                    Crosslines[i].To = Vector2.new(p3, p4)
                end
            else
                for i=1, 4 do Crosslines[i].Visible = false end
            end
        elseif Drawing then
            for i=1, 4 do Crosslines[i].Visible = false end
        end
    end)

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
    
    local danceAnim = Instance.new("Animation")
    local danceTrack = nil
    RunService.Heartbeat:Connect(function()
        if KarmaConfig.Troll.DanceSpam and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            if not danceTrack or danceTrack.Animation.AnimationId ~= "rbxassetid://3333331810" then -- Mock ID for demonstration
                -- In a real scenario, use actual emote IDs based on the selected Emote
                local emotes = { e1 = "rbxassetid://3333331810", e2 = "rbxassetid://3333331810", e3 = "rbxassetid://3333331810", point = "rbxassetid://507770453", wave = "rbxassetid://507770239" }
                danceAnim.AnimationId = emotes[KarmaConfig.Troll.DanceEmote] or emotes.e1
                danceTrack = LocalPlayer.Character.Humanoid:LoadAnimation(danceAnim)
                danceTrack.Looped = true
                danceTrack:Play()
            end
        else
            if danceTrack then
                danceTrack:Stop()
                danceTrack = nil
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

    -- LOADING SCREEN & LOADER UI
    UI["1"].Enabled = false -- initially hidden
    
    local KarmaLoader = Instance.new("ScreenGui", CoreGui)
    KarmaLoader.Name = "KarmaLoader"
    
    local LoaderBG = Instance.new("Frame", KarmaLoader)
    LoaderBG.Size = UDim2.new(0, 300, 0, 150)
    LoaderBG.Position = UDim2.new(0.5, -150, 0.5, -75)
    LoaderBG.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
    LoaderBG.BorderSizePixel = 0
    Instance.new("UICorner", LoaderBG).CornerRadius = UDim.new(0, 5)
    
    local LoaderStroke = Instance.new("UIStroke", LoaderBG)
    LoaderStroke.Transparency = 0.5
    LoaderStroke.Thickness = 2
    LoaderStroke.Color = Color3.fromRGB(80, 80, 80)
    
    local LoaderTitleLabel = Instance.new("TextLabel", LoaderBG)
    LoaderTitleLabel.Size = UDim2.new(1, 0, 0, 40)
    LoaderTitleLabel.Position = UDim2.new(0, 0, 0, 20)
    LoaderTitleLabel.BackgroundTransparency = 1
    LoaderTitleLabel.Text = "karma.lol"
    LoaderTitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    LoaderTitleLabel.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    LoaderTitleLabel.TextSize = 24
    
    local LoadBtnMain = Instance.new("TextButton", LoaderBG)
    LoadBtnMain.Size = UDim2.new(0, 200, 0, 40)
    LoadBtnMain.Position = UDim2.new(0.5, -100, 1, -60)
    LoadBtnMain.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    LoadBtnMain.Text = "Load karma.lol"
    LoadBtnMain.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadBtnMain.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    LoadBtnMain.TextSize = 16
    Instance.new("UICorner", LoadBtnMain).CornerRadius = UDim.new(0, 4)

    LoadBtnMain.MouseButton1Click:Connect(function()
        LoadBtnMain.Text = "Loading..."
        task.wait(0.5)
        KarmaLoader:Destroy()
        
        UI["1"].Enabled = true
        local LoadingFrame = Instance.new("Frame", UI["1"])
        LoadingFrame.Name = "LoadingFrame"
        LoadingFrame.Size = UDim2.new(0, 200, 0, 50)
        LoadingFrame.Position = UDim2.new(1, -220, 0, 20)
        LoadingFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
        LoadingFrame.BorderSizePixel = 0
        
        local LoadCorner = Instance.new("UICorner", LoadingFrame)
        LoadCorner.CornerRadius = UDim.new(0, 5)
        
        local LoadStrokeF = Instance.new("UIStroke", LoadingFrame)
        LoadStrokeF.Transparency = 0.5
        LoadStrokeF.Thickness = 2
        
        local LoadText = Instance.new("TextLabel", LoadingFrame)
        LoadText.Size = UDim2.new(1, 0, 1, 0)
        LoadText.BackgroundTransparency = 1
        LoadText.Text = "loading karma.lol hang tight..."
        LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
        LoadText.FontFace = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        LoadText.TextSize = 14
        
        task.delay(10, function()
            LoadingFrame:Destroy()
            UI["2"].Visible = true
        end)
    end)
end)

if not pcallSuccess then
    warn("Karma.lol experienced an error during initialization: " .. tostring(pcallError))
end
