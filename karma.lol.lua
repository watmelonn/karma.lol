-- // KARMA.LOL V2 — FULL REWRITE \\ --
local pcallSuccess, pcallError = pcall(function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Workspace = game:GetService("Workspace")
    local CoreGui = game:GetService("CoreGui")
    local Lighting = game:GetService("Lighting")
    local StarterGui = game:GetService("StarterGui")
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")

    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()
    local targetGuiParent = (gethui and gethui()) or CoreGui

    -- Cleanup previous instance
    if targetGuiParent:FindFirstChild("KarmaV2") then targetGuiParent:FindFirstChild("KarmaV2"):Destroy() end
    if targetGuiParent:FindFirstChild("KarmaV2Loader") then targetGuiParent:FindFirstChild("KarmaV2Loader"):Destroy() end

    local JosefinSans = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local JosefinBold = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local MonoFont = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)

    local Connections = {}
    local DrawingObjects = {}

    local function AddConnection(conn)
        table.insert(Connections, conn)
        return conn
    end

    local function AddDrawing(obj)
        table.insert(DrawingObjects, obj)
        return obj
    end

    -- ========================
    -- LOADER
    -- ========================
    local LoaderGui = Instance.new("ScreenGui", targetGuiParent)
    LoaderGui.Name = "KarmaV2Loader"
    LoaderGui.ResetOnSpawn = false
    LoaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local loaderFrame = Instance.new("Frame", LoaderGui)
    loaderFrame.Size = UDim2.new(0, 320, 0, 160)
    loaderFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
    loaderFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
    loaderFrame.BorderSizePixel = 0
    Instance.new("UICorner", loaderFrame).CornerRadius = UDim.new(0, 8)
    local loaderStroke = Instance.new("UIStroke", loaderFrame)
    loaderStroke.Transparency = 0.5
    loaderStroke.Thickness = 2

    local loaderTitle = Instance.new("TextLabel", loaderFrame)
    loaderTitle.Size = UDim2.new(1, 0, 0, 40)
    loaderTitle.Position = UDim2.new(0, 0, 0, 15)
    loaderTitle.BackgroundTransparency = 1
    loaderTitle.Text = "karma.lol v2"
    loaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    loaderTitle.FontFace = JosefinBold
    loaderTitle.TextSize = 18

    local loaderSub = Instance.new("TextLabel", loaderFrame)
    loaderSub.Size = UDim2.new(1, 0, 0, 20)
    loaderSub.Position = UDim2.new(0, 0, 0, 50)
    loaderSub.BackgroundTransparency = 1
    loaderSub.Text = "executor ready. click load."
    loaderSub.TextColor3 = Color3.fromRGB(160, 160, 160)
    loaderSub.FontFace = JosefinSans
    loaderSub.TextSize = 13

    local loadBtn = Instance.new("TextButton", loaderFrame)
    loadBtn.Size = UDim2.new(0, 200, 0, 40)
    loadBtn.Position = UDim2.new(0.5, -100, 0, 78)
    loadBtn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
    loadBtn.Text = "Load"
    loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadBtn.FontFace = JosefinSans
    loadBtn.TextSize = 15
    loadBtn.BorderSizePixel = 0
    Instance.new("UICorner", loadBtn).CornerRadius = UDim.new(0, 5)

    local progressBg = Instance.new("Frame", loaderFrame)
    progressBg.Size = UDim2.new(0, 200, 0, 6)
    progressBg.Position = UDim2.new(0.5, -100, 0, 124)
    progressBg.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    progressBg.BorderSizePixel = 0
    progressBg.Visible = false
    Instance.new("UICorner", progressBg).CornerRadius = UDim.new(1, 0)

    local progressFill = Instance.new("Frame", progressBg)
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    progressFill.BorderSizePixel = 0
    Instance.new("UICorner", progressFill).CornerRadius = UDim.new(1, 0)

    -- ========================
    -- MAIN UI (hidden until loader completes)
    -- ========================
    local ScreenGui = Instance.new("ScreenGui", targetGuiParent)
    ScreenGui.Name = "KarmaV2"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Enabled = false

    local KarmaUI = Instance.new("Frame", ScreenGui)
    KarmaUI.Name = "KarmaUI"
    KarmaUI.Size = UDim2.new(0, 750, 0, 520)
    KarmaUI.Position = UDim2.new(0.5, -375, 0.5, -260)
    KarmaUI.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
    KarmaUI.BorderSizePixel = 0
    Instance.new("UICorner", KarmaUI).CornerRadius = UDim.new(0, 5)
    local mainStroke = Instance.new("UIStroke", KarmaUI)
    mainStroke.Transparency = 0.5
    mainStroke.Thickness = 3

    -- Sidebar
    local Sidebar = Instance.new("Frame", KarmaUI)
    Sidebar.Name = "karmatabUI"
    Sidebar.Size = UDim2.new(0, 110, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 5)

    -- Logo
    local Logo = Instance.new("TextLabel", Sidebar)
    Logo.Size = UDim2.new(0, 110, 0, 55)
    Logo.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
    Logo.BorderSizePixel = 0
    Logo.Text = "karma.lol v2"
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.FontFace = JosefinBold
    Logo.TextSize = 14
    Instance.new("UICorner", Logo).CornerRadius = UDim.new(0, 5)

    -- Version label at bottom
    local VersionLabel = Instance.new("TextLabel", Sidebar)
    VersionLabel.Size = UDim2.new(1, 0, 0, 20)
    VersionLabel.Position = UDim2.new(0, 0, 1, -25)
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Text = "v2.0"
    VersionLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
    VersionLabel.FontFace = JosefinSans
    VersionLabel.TextSize = 11

    -- Tab buttons
    local tabNames = {"legit", "visual", "misc", "troll", "lua"}
    local tabButtons = {}
    local tabFrames = {}
    local activeTab = "legit"

    for i, name in ipairs(tabNames) do
        local btn = Instance.new("TextButton", Sidebar)
        btn.Name = name
        btn.Size = UDim2.new(0, 95, 0, 38)
        btn.Position = UDim2.new(0.5, -47, 0, 55 + (i - 1) * 46)
        btn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        btn.BorderSizePixel = 0
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.FontFace = JosefinSans
        btn.TextSize = 14
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        tabButtons[name] = btn
    end

    -- Content area
    local ContentArea = Instance.new("Frame", KarmaUI)
    ContentArea.Name = "ContentArea"
    ContentArea.Size = UDim2.new(0, 640, 0, 520)
    ContentArea.Position = UDim2.new(0, 110, 0, 0)
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0

    local function createTabPanel(name, canvasH)
        local scroll = Instance.new("ScrollingFrame", ContentArea)
        scroll.Name = name .. "_content"
        scroll.Size = UDim2.new(1, -20, 1, -20)
        scroll.Position = UDim2.new(0, 10, 0, 10)
        scroll.BackgroundTransparency = 1
        scroll.BorderSizePixel = 0
        scroll.ScrollBarThickness = 4
        scroll.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
        scroll.CanvasSize = UDim2.new(0, 0, 0, canvasH or 800)
        scroll.Visible = (name == activeTab)
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

        local layout = Instance.new("UIListLayout", scroll)
        layout.Padding = UDim.new(0, 6)
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        local pad = Instance.new("UIPadding", scroll)
        pad.PaddingRight = UDim.new(0, 8)

        tabFrames[name] = scroll
        return scroll
    end

    local Tabs = {
        legit = createTabPanel("legit", 900),
        visual = createTabPanel("visual", 1400),
        misc = createTabPanel("misc", 1200),
        troll = createTabPanel("troll", 1100),
        lua = createTabPanel("lua", 50)
    }

    local function switchTab(name)
        activeTab = name
        for tName, tFrame in pairs(tabFrames) do
            tFrame.Visible = (tName == name)
        end
        for tName, btn in pairs(tabButtons) do
            btn.BackgroundColor3 = (tName == name) and Color3.fromRGB(110, 110, 110) or Color3.fromRGB(84, 84, 84)
        end
    end

    for name, btn in pairs(tabButtons) do
        btn.MouseButton1Click:Connect(function() switchTab(name) end)
    end
    tabButtons["legit"].BackgroundColor3 = Color3.fromRGB(110, 110, 110)

    -- ========================
    -- DRAGGING
    -- ========================
    do
        local dragging, dragStart, startPos
        KarmaUI.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = KarmaUI.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        KarmaUI.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                if dragging then
                    local delta = input.Position - dragStart
                    KarmaUI.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end
        end)
    end

    -- ========================
    -- CONFIG
    -- ========================
    local C = {
        Legit = {
            Lock = false, LockKey = Enum.KeyCode.E, LockMode = "Hold",
            Hitbox = "Head", Smoothness = 0, Silent = false,
            Resolver = false, ResolverMouse = false,
            FOV = 90, DrawFOV = false, FOVColor = Color3.fromRGB(255,255,255),
            Prediction = 0, AutoUnlock = false, TeamCheck = false,
            WallCheck = false, ClosestTarget = true, MaxDist = 2000
        },
        Visual = {
            Box = false, BoxColor = Color3.fromRGB(255,255,255),
            Chams = false, ChamsColor = Color3.fromRGB(255,0,255),
            Skeleton = false, SkeletonColor = Color3.fromRGB(255,255,255),
            HealthBar = false, HealthText = false,
            Distance = false, DistColor = Color3.fromRGB(255,255,255),
            Name = false, NameColor = Color3.fromRGB(255,255,255),
            Tracers = false, TracerColor = Color3.fromRGB(255,255,255),
            HeadDot = false, HeadDotColor = Color3.fromRGB(255,0,0),
            WeaponLabel = false, WeaponColor = Color3.fromRGB(200,200,200),
            TeamColorBoxes = false,
            VisibleCheck = false, VisibleColor = Color3.fromRGB(0,255,0), HiddenColor = Color3.fromRGB(255,0,0),
            BoxStyle = "Full Box", ESPRefresh = 30,
            Fullbright = false, NoFog = false,
            CustomSky = false, SkyColor = Color3.fromRGB(100,150,255),
            WeatherOff = false,
            HighlightAll = false, HighlightColor = Color3.fromRGB(255,0,0),
            RemoveTextures = false, NeonWorld = false, NeonColor = Color3.fromRGB(0,255,255),
            TimeOfDay = 12, AmbientColor = false, AmbientVal = Color3.fromRGB(255,255,255),
            FogColor = false, FogVal = Color3.fromRGB(128,128,128),
            Crosshair = false, CrossStyle = "Cross", CrossColor = Color3.fromRGB(255,255,255),
            CrossSize = 12, CrossThick = 2, CrossGap = 3,
            CrossSpin = false, CrossSpinSpeed = 5,
            CrossOutline = false
        },
        Misc = {
            InfJump = false, Fly = false, FlyKey = Enum.KeyCode.F, FlyMode = "Toggle",
            FlySpeed = 50, NoClip = false, SpeedBoost = 16, HighJump = 50,
            BunnyHop = false, LowGrav = false, GravVal = 80,
            ThirdPerson = false, TPKey = Enum.KeyCode.T, TPMode = "Toggle", TPDist = 12,
            CamFOV = 70, Freecam = false, FreecamKey = Enum.KeyCode.P, FreecamSpeed = 20,
            HitLog = false, MissLog = false, LogPos = "Top Right", MaxLogs = 5,
            AntiAFK = false, ChatBypass = false,
            LagSwitch = false, LagKey = Enum.KeyCode.X,
            UnlockFPS = false, DisableAnims = false,
            AimlockIndicator = false, ClockHUD = false, FPSCounter = false
        },
        Troll = {
            Spin = false, SpinSpeed = 10,
            FakeLag = false, DanceSpam = false, DanceEmote = "e1",
            ChatSpam = false, ChatMsg = "karma.lol v2", ChatInterval = 2,
            Invisible = false, GodMode = false,
            TeleportTarget = "", FollowPlayer = false, FollowTarget = "",
            BigHead = false, BigHeadSize = 5,
            Giant = false, GiantSize = 2,
            Rainbow = false, ForceField = false
        }
    }

    -- Stored originals for cleanup
    local Originals = {
        WalkSpeed = 16, JumpPower = 50, Gravity = 196.2,
        FOV = 70, Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient,
        Brightness = Lighting.Brightness, FogEnd = Lighting.FogEnd,
        FogColor = Lighting.FogColor, TimeOfDay = Lighting.TimeOfDay
    }

    -- ========================
    -- COMPONENT LIBRARY
    -- ========================
    local activeColorPicker = nil

    local Library = {}

    function Library:Section(parent, text)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 24)
        f.BackgroundTransparency = 1
        f.BorderSizePixel = 0
        local l = Instance.new("TextLabel", f)
        l.Size = UDim2.new(1, 0, 1, 0)
        l.Text = "  — " .. text .. " —"
        l.TextColor3 = Color3.fromRGB(180, 180, 180)
        l.FontFace = JosefinBold
        l.TextSize = 13
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.BackgroundTransparency = 1
    end

    function Library:Checkbox(parent, text, default, callback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 28)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(1, -50, 1, 0)
        lbl.Position = UDim2.new(0, 8, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.FontFace = JosefinSans
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(0, 22, 0, 22)
        btn.Position = UDim2.new(1, -30, 0.5, -11)
        btn.BackgroundColor3 = default and Color3.fromRGB(130, 130, 130) or Color3.fromRGB(84, 84, 84)
        btn.Text = default and "✔" or ""
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.FontFace = JosefinSans
        btn.BorderSizePixel = 0
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

        local state = default
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.BackgroundColor3 = state and Color3.fromRGB(130, 130, 130) or Color3.fromRGB(84, 84, 84)
            btn.Text = state and "✔" or ""
            if callback then callback(state) end
        end)
        return {frame = f, getState = function() return state end, setState = function(v) state = v; btn.BackgroundColor3 = v and Color3.fromRGB(130,130,130) or Color3.fromRGB(84,84,84); btn.Text = v and "✔" or "" end}
    end

    function Library:CheckboxColor(parent, text, default, defaultColor, cbCallback, colorCallback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 28)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(1, -80, 1, 0)
        lbl.Position = UDim2.new(0, 8, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.FontFace = JosefinSans
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        -- Color swatch
        local swatch = Instance.new("TextButton", f)
        swatch.Size = UDim2.new(0, 22, 0, 22)
        swatch.Position = UDim2.new(1, -58, 0.5, -11)
        swatch.BackgroundColor3 = defaultColor
        swatch.Text = ""
        swatch.BorderSizePixel = 0
        Instance.new("UICorner", swatch).CornerRadius = UDim.new(0, 4)
        Instance.new("UIStroke", swatch).Thickness = 1

        -- Checkbox
        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(0, 22, 0, 22)
        btn.Position = UDim2.new(1, -30, 0.5, -11)
        btn.BackgroundColor3 = default and Color3.fromRGB(130, 130, 130) or Color3.fromRGB(84, 84, 84)
        btn.Text = default and "✔" or ""
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.FontFace = JosefinSans
        btn.BorderSizePixel = 0
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

        local state = default
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.BackgroundColor3 = state and Color3.fromRGB(130, 130, 130) or Color3.fromRGB(84, 84, 84)
            btn.Text = state and "✔" or ""
            if cbCallback then cbCallback(state) end
        end)

        swatch.MouseButton1Click:Connect(function()
            Library:OpenColorPicker(swatch, swatch.BackgroundColor3, 1, function(c, a)
                swatch.BackgroundColor3 = c
                if colorCallback then colorCallback(c, a) end
            end)
        end)

        return {frame = f, swatch = swatch, getState = function() return state end}
    end

    function Library:Slider(parent, text, min, max, default, step, callback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 40)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local isFloat = (step and step < 1)
        local formatVal = function(v)
            if isFloat then return string.format("%.2f", v) else return tostring(math.floor(v + 0.5)) end
        end

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(1, -16, 0, 20)
        lbl.Position = UDim2.new(0, 8, 0, 1)
        lbl.BackgroundTransparency = 1
        lbl.Text = text .. ": " .. formatVal(default)
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.FontFace = JosefinSans
        lbl.TextSize = 12
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local bg = Instance.new("Frame", f)
        bg.Size = UDim2.new(1, -16, 0, 8)
        bg.Position = UDim2.new(0, 8, 0, 24)
        bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        bg.BorderSizePixel = 0
        Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new("Frame", bg)
        fill.Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
        fill.BorderSizePixel = 0
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local hitBtn = Instance.new("TextButton", bg)
        hitBtn.Size = UDim2.new(1, 0, 1, 8)
        hitBtn.Position = UDim2.new(0, 0, 0, -4)
        hitBtn.BackgroundTransparency = 1
        hitBtn.Text = ""

        local isDragging = false
        hitBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
            end
        end)
        AddConnection(UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = false
            end
        end))
        AddConnection(UserInputService.InputChanged:Connect(function(input)
            if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local rx = math.clamp(input.Position.X - bg.AbsolutePosition.X, 0, bg.AbsoluteSize.X)
                local ratio = rx / bg.AbsoluteSize.X
                local val = min + (max - min) * ratio
                if step and step >= 1 then val = math.floor(val / step + 0.5) * step end
                if isFloat then val = math.floor(val * 100) / 100 end
                val = math.clamp(val, min, max)
                fill.Size = UDim2.new(ratio, 0, 1, 0)
                lbl.Text = text .. ": " .. formatVal(val)
                if callback then callback(val) end
            end
        end))
    end

    function Library:Dropdown(parent, text, options, default, callback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 28)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        f.ClipsDescendants = true
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local btn = Instance.new("TextButton", f)
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.BackgroundTransparency = 1
        btn.Text = "  " .. text .. ": " .. tostring(default)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.FontFace = JosefinSans
        btn.TextSize = 13
        btn.TextXAlignment = Enum.TextXAlignment.Left

        local dropFrame = Instance.new("Frame", f)
        dropFrame.Size = UDim2.new(1, 0, 0, #options * 24)
        dropFrame.Position = UDim2.new(0, 0, 0, 28)
        dropFrame.BackgroundTransparency = 1

        local dl = Instance.new("UIListLayout", dropFrame)
        dl.SortOrder = Enum.SortOrder.LayoutOrder

        local isOpen = false
        btn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            f.Size = isOpen and UDim2.new(1, 0, 0, 28 + #options * 24) or UDim2.new(1, 0, 0, 28)
        end)

        for _, opt in ipairs(options) do
            local ob = Instance.new("TextButton", dropFrame)
            ob.Size = UDim2.new(1, 0, 0, 24)
            ob.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            ob.BorderSizePixel = 0
            ob.Text = "   " .. opt
            ob.TextColor3 = Color3.fromRGB(200, 200, 200)
            ob.FontFace = JosefinSans
            ob.TextSize = 12
            ob.TextXAlignment = Enum.TextXAlignment.Left
            ob.MouseButton1Click:Connect(function()
                btn.Text = "  " .. text .. ": " .. opt
                isOpen = false
                f.Size = UDim2.new(1, 0, 0, 28)
                if callback then callback(opt) end
            end)
        end

        return {frame = f, setText = function(v) btn.Text = "  " .. text .. ": " .. v end}
    end

    function Library:Keybind(parent, text, default, defaultMode, callback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 28)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(0.5, 0, 1, 0)
        lbl.Position = UDim2.new(0, 8, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.FontFace = JosefinSans
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local modes = {"Always On", "Hold", "Toggle", "Release"}
        local currentMode = defaultMode or "Hold"
        local modeIdx = table.find(modes, currentMode) or 2

        local modeBtn = Instance.new("TextButton", f)
        modeBtn.Size = UDim2.new(0, 65, 0, 20)
        modeBtn.Position = UDim2.new(1, -145, 0.5, -10)
        modeBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        modeBtn.Text = currentMode
        modeBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
        modeBtn.FontFace = JosefinSans
        modeBtn.TextSize = 10
        modeBtn.BorderSizePixel = 0
        Instance.new("UICorner", modeBtn).CornerRadius = UDim.new(0, 4)

        local keyBtn = Instance.new("TextButton", f)
        keyBtn.Size = UDim2.new(0, 70, 0, 20)
        keyBtn.Position = UDim2.new(1, -75, 0.5, -10)
        keyBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        keyBtn.Text = "[" .. (typeof(default) == "EnumItem" and default.Name or tostring(default)) .. "]"
        keyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        keyBtn.FontFace = JosefinSans
        keyBtn.TextSize = 11
        keyBtn.BorderSizePixel = 0
        Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 4)

        local listening = false
        local currentKey = default

        keyBtn.MouseButton1Click:Connect(function()
            listening = true
            keyBtn.Text = "..."
        end)

        AddConnection(UserInputService.InputBegan:Connect(function(input)
            if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                listening = false
                currentKey = input.KeyCode
                keyBtn.Text = "[" .. currentKey.Name .. "]"
                if callback then callback(currentKey, currentMode) end
            end
        end))

        modeBtn.MouseButton1Click:Connect(function()
            modeIdx = (modeIdx % #modes) + 1
            currentMode = modes[modeIdx]
            modeBtn.Text = currentMode
            if callback then callback(currentKey, currentMode) end
        end)

        keyBtn.MouseButton2Click:Connect(function()
            modeIdx = (modeIdx % #modes) + 1
            currentMode = modes[modeIdx]
            modeBtn.Text = currentMode
            if callback then callback(currentKey, currentMode) end
        end)

        return {getKey = function() return currentKey end, getMode = function() return currentMode end}
    end

    function Library:Button(parent, text, callback)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        btn.BorderSizePixel = 0
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.FontFace = JosefinSans
        btn.TextSize = 13
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
        btn.MouseButton1Click:Connect(function() if callback then callback() end end)
        return btn
    end

    function Library:TextInput(parent, text, placeholder, callback)
        local f = Instance.new("Frame", parent)
        f.Size = UDim2.new(1, 0, 0, 28)
        f.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        f.BorderSizePixel = 0
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 4)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(0.35, 0, 1, 0)
        lbl.Position = UDim2.new(0, 8, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.FontFace = JosefinSans
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local box = Instance.new("TextBox", f)
        box.Size = UDim2.new(0.6, -8, 0, 20)
        box.Position = UDim2.new(0.38, 0, 0.5, -10)
        box.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        box.BorderSizePixel = 0
        box.Text = ""
        box.PlaceholderText = placeholder or ""
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
        box.FontFace = JosefinSans
        box.TextSize = 12
        box.ClearTextOnFocus = false
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)

        box.FocusLost:Connect(function() if callback then callback(box.Text) end end)
        return {box = box}
    end

    -- ========================
    -- COLOR PICKER (GLOBAL COMPONENT)
    -- ========================
    function Library:OpenColorPicker(swatchBtn, startColor, startAlpha, applyCallback)
        if activeColorPicker then activeColorPicker:Destroy() activeColorPicker = nil end

        local h, s, v = startColor:ToHSV()
        local alpha = startAlpha or 1

        local picker = Instance.new("Frame", ScreenGui)
        picker.Size = UDim2.new(0, 200, 0, 240)
        picker.Position = UDim2.new(0.5, -100, 0.5, -120)
        picker.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        picker.BorderSizePixel = 0
        picker.ZIndex = 100
        Instance.new("UICorner", picker).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", picker).Thickness = 2
        activeColorPicker = picker

        -- Make picker draggable
        do
            local pd, pds, psp
            picker.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    pd = true; pds = input.Position; psp = picker.Position
                    input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then pd = false end end)
                end
            end)
            picker.InputChanged:Connect(function(input)
                if pd and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local d = input.Position - pds
                    picker.Position = UDim2.new(psp.X.Scale, psp.X.Offset + d.X, psp.Y.Scale, psp.Y.Offset + d.Y)
                end
            end)
        end

        -- HSV Wheel (simplified as gradient square)
        local wheelBg = Instance.new("Frame", picker)
        wheelBg.Size = UDim2.new(0, 150, 0, 130)
        wheelBg.Position = UDim2.new(0, 10, 0, 10)
        wheelBg.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
        wheelBg.BorderSizePixel = 0
        wheelBg.ZIndex = 101

        -- Saturation gradient (white to transparent left to right)
        local satGrad = Instance.new("UIGradient", wheelBg)
        satGrad.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
        satGrad.Transparency = NumberSequence.new(0, 1)
        satGrad.Rotation = 0

        -- Value overlay (black from bottom)
        local valOverlay = Instance.new("Frame", wheelBg)
        valOverlay.Size = UDim2.new(1, 0, 1, 0)
        valOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        valOverlay.BorderSizePixel = 0
        valOverlay.ZIndex = 102
        local valGrad = Instance.new("UIGradient", valOverlay)
        valGrad.Color = ColorSequence.new(Color3.fromRGB(0,0,0), Color3.fromRGB(0,0,0))
        valGrad.Transparency = NumberSequence.new(1, 0)
        valGrad.Rotation = 90

        local wheelBtn = Instance.new("TextButton", wheelBg)
        wheelBtn.Size = UDim2.new(1, 0, 1, 0)
        wheelBtn.BackgroundTransparency = 1
        wheelBtn.Text = ""
        wheelBtn.ZIndex = 103

        -- Brightness slider (vertical, right side)
        local brBar = Instance.new("Frame", picker)
        brBar.Size = UDim2.new(0, 16, 0, 130)
        brBar.Position = UDim2.new(0, 174, 0, 10)
        brBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        brBar.BorderSizePixel = 0
        brBar.ZIndex = 101

        -- Hue gradient on brightness bar
        local hueGrad = Instance.new("UIGradient", brBar)
        hueGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHSV(0,1,1)),
            ColorSequenceKeypoint.new(0.167, Color3.fromHSV(0.167,1,1)),
            ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333,1,1)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5,1,1)),
            ColorSequenceKeypoint.new(0.667, Color3.fromHSV(0.667,1,1)),
            ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833,1,1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(1,1,1))
        })
        hueGrad.Rotation = 90

        local brBtn = Instance.new("TextButton", brBar)
        brBtn.Size = UDim2.new(1, 0, 1, 0)
        brBtn.BackgroundTransparency = 1
        brBtn.Text = ""
        brBtn.ZIndex = 103

        -- Alpha slider (horizontal, bottom)
        local alphaBar = Instance.new("Frame", picker)
        alphaBar.Size = UDim2.new(0, 150, 0, 12)
        alphaBar.Position = UDim2.new(0, 10, 0, 148)
        alphaBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        alphaBar.BorderSizePixel = 0
        alphaBar.ZIndex = 101
        local alphaG = Instance.new("UIGradient", alphaBar)
        alphaG.Transparency = NumberSequence.new(0, 1)

        local alphaBtn = Instance.new("TextButton", alphaBar)
        alphaBtn.Size = UDim2.new(1, 0, 1, 0)
        alphaBtn.BackgroundTransparency = 1
        alphaBtn.Text = ""
        alphaBtn.ZIndex = 103

        -- Preview swatch
        local preview = Instance.new("Frame", picker)
        preview.Size = UDim2.new(0, 40, 0, 20)
        preview.Position = UDim2.new(0, 10, 0, 168)
        preview.BackgroundColor3 = Color3.fromHSV(h, s, v)
        preview.BackgroundTransparency = 1 - alpha
        preview.BorderSizePixel = 0
        preview.ZIndex = 101
        Instance.new("UICorner", preview).CornerRadius = UDim.new(0, 4)

        -- RGB display
        local rgbLbl = Instance.new("TextLabel", picker)
        rgbLbl.Size = UDim2.new(0, 130, 0, 20)
        rgbLbl.Position = UDim2.new(0, 58, 0, 168)
        rgbLbl.BackgroundTransparency = 1
        rgbLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
        rgbLbl.FontFace = JosefinSans
        rgbLbl.TextSize = 11
        rgbLbl.ZIndex = 101
        rgbLbl.TextXAlignment = Enum.TextXAlignment.Left
        local c = Color3.fromHSV(h, s, v)
        rgbLbl.Text = string.format("RGB(%d,%d,%d)", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255))

        -- Apply button
        local applyBtn = Instance.new("TextButton", picker)
        applyBtn.Size = UDim2.new(0, 120, 0, 28)
        applyBtn.Position = UDim2.new(0, 10, 0, 198)
        applyBtn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        applyBtn.Text = "Apply"
        applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        applyBtn.FontFace = JosefinSans
        applyBtn.TextSize = 13
        applyBtn.BorderSizePixel = 0
        applyBtn.ZIndex = 101
        Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0, 4)

        -- Cancel button
        local cancelBtn = Instance.new("TextButton", picker)
        cancelBtn.Size = UDim2.new(0, 50, 0, 28)
        cancelBtn.Position = UDim2.new(0, 138, 0, 198)
        cancelBtn.BackgroundColor3 = Color3.fromRGB(70, 50, 50)
        cancelBtn.Text = "✕"
        cancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        cancelBtn.FontFace = JosefinSans
        cancelBtn.TextSize = 16
        cancelBtn.BorderSizePixel = 0
        cancelBtn.ZIndex = 101
        Instance.new("UICorner", cancelBtn).CornerRadius = UDim.new(0, 4)

        local function updatePreview()
            local color = Color3.fromHSV(h, s, v)
            preview.BackgroundColor3 = color
            preview.BackgroundTransparency = 1 - alpha
            wheelBg.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
            rgbLbl.Text = string.format("RGB(%d,%d,%d)", math.floor(color.R*255), math.floor(color.G*255), math.floor(color.B*255))
        end

        -- Wheel interaction (saturation x, value y)
        local wheelDrag = false
        wheelBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then wheelDrag = true end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then wheelDrag = false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if wheelDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
                local rx = math.clamp((input.Position.X - wheelBg.AbsolutePosition.X) / wheelBg.AbsoluteSize.X, 0, 1)
                local ry = math.clamp((input.Position.Y - wheelBg.AbsolutePosition.Y) / wheelBg.AbsoluteSize.Y, 0, 1)
                s = rx
                v = 1 - ry
                updatePreview()
            end
        end)

        -- Hue bar interaction
        local hueDrag = false
        brBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then hueDrag = true end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then hueDrag = false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if hueDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
                local ry = math.clamp((input.Position.Y - brBar.AbsolutePosition.Y) / brBar.AbsoluteSize.Y, 0, 1)
                h = ry
                updatePreview()
            end
        end)

        -- Alpha interaction
        local alphaDrag = false
        alphaBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then alphaDrag = true end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then alphaDrag = false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if alphaDrag and input.UserInputType == Enum.UserInputType.MouseMovement then
                alpha = 1 - math.clamp((input.Position.X - alphaBar.AbsolutePosition.X) / alphaBar.AbsoluteSize.X, 0, 1)
                updatePreview()
            end
        end)

        applyBtn.MouseButton1Click:Connect(function()
            local finalColor = Color3.fromHSV(h, s, v)
            if applyCallback then applyCallback(finalColor, alpha) end
            picker:Destroy()
            activeColorPicker = nil
        end)

        cancelBtn.MouseButton1Click:Connect(function()
            picker:Destroy()
            activeColorPicker = nil
        end)
    end

    -- ========================
    -- LEGIT TAB
    -- ========================
    Library:Section(Tabs.legit, "Lock")
    Library:Checkbox(Tabs.legit, "Lock", C.Legit.Lock, function(v) C.Legit.Lock = v end)
    Library:Keybind(Tabs.legit, "Lock Key", C.Legit.LockKey, C.Legit.LockMode, function(k, m) C.Legit.LockKey = k; C.Legit.LockMode = m end)
    Library:Dropdown(Tabs.legit, "Lock Hitbox", {"Head","Torso","UpperTorso","LowerTorso","Left Arm","Right Arm","Left Leg","Right Leg","Body","Random"}, C.Legit.Hitbox, function(v) C.Legit.Hitbox = v end)
    Library:Slider(Tabs.legit, "Smoothness", 0, 10, C.Legit.Smoothness, 1, function(v) C.Legit.Smoothness = v end)
    Library:Checkbox(Tabs.legit, "Silent Lock", C.Legit.Silent, function(v) C.Legit.Silent = v end)
    Library:Section(Tabs.legit, "Resolver")
    Library:Checkbox(Tabs.legit, "Resolver", C.Legit.Resolver, function(v) C.Legit.Resolver = v end)
    Library:Checkbox(Tabs.legit, "  Mouse Mode", C.Legit.ResolverMouse, function(v) C.Legit.ResolverMouse = v end)
    Library:Section(Tabs.legit, "Targeting")
    Library:Slider(Tabs.legit, "FOV", 0, 180, C.Legit.FOV, 1, function(v) C.Legit.FOV = v end)
    Library:CheckboxColor(Tabs.legit, "Draw FOV", C.Legit.DrawFOV, C.Legit.FOVColor, function(v) C.Legit.DrawFOV = v end, function(c) C.Legit.FOVColor = c end)
    Library:Slider(Tabs.legit, "Prediction", 0, 1, C.Legit.Prediction, 0.01, function(v) C.Legit.Prediction = v end)
    Library:Checkbox(Tabs.legit, "Auto-Unlock", C.Legit.AutoUnlock, function(v) C.Legit.AutoUnlock = v end)
    Library:Checkbox(Tabs.legit, "Team Check", C.Legit.TeamCheck, function(v) C.Legit.TeamCheck = v end)
    Library:Checkbox(Tabs.legit, "Wall Check", C.Legit.WallCheck, function(v) C.Legit.WallCheck = v end)
    Library:Checkbox(Tabs.legit, "Closest Target", C.Legit.ClosestTarget, function(v) C.Legit.ClosestTarget = v end)
    Library:Slider(Tabs.legit, "Max Dist", 10, 2000, C.Legit.MaxDist, 10, function(v) C.Legit.MaxDist = v end)

    -- ========================
    -- VISUAL TAB
    -- ========================
    Library:Section(Tabs.visual, "Player ESP")
    Library:CheckboxColor(Tabs.visual, "Player Box", C.Visual.Box, C.Visual.BoxColor, function(v) C.Visual.Box = v end, function(c) C.Visual.BoxColor = c end)
    Library:CheckboxColor(Tabs.visual, "Player Chams", C.Visual.Chams, C.Visual.ChamsColor, function(v) C.Visual.Chams = v end, function(c) C.Visual.ChamsColor = c end)
    Library:CheckboxColor(Tabs.visual, "Player Skeleton", C.Visual.Skeleton, C.Visual.SkeletonColor, function(v) C.Visual.Skeleton = v end, function(c) C.Visual.SkeletonColor = c end)
    Library:Checkbox(Tabs.visual, "Player Health Bar", C.Visual.HealthBar, function(v) C.Visual.HealthBar = v end)
    Library:Checkbox(Tabs.visual, "Player Health Text", C.Visual.HealthText, function(v) C.Visual.HealthText = v end)
    Library:CheckboxColor(Tabs.visual, "Player Distance", C.Visual.Distance, C.Visual.DistColor, function(v) C.Visual.Distance = v end, function(c) C.Visual.DistColor = c end)
    Library:CheckboxColor(Tabs.visual, "Player Name", C.Visual.Name, C.Visual.NameColor, function(v) C.Visual.Name = v end, function(c) C.Visual.NameColor = c end)
    Library:CheckboxColor(Tabs.visual, "Player Tracers", C.Visual.Tracers, C.Visual.TracerColor, function(v) C.Visual.Tracers = v end, function(c) C.Visual.TracerColor = c end)
    Library:CheckboxColor(Tabs.visual, "Head Dot", C.Visual.HeadDot, C.Visual.HeadDotColor, function(v) C.Visual.HeadDot = v end, function(c) C.Visual.HeadDotColor = c end)
    Library:CheckboxColor(Tabs.visual, "Weapon Label", C.Visual.WeaponLabel, C.Visual.WeaponColor, function(v) C.Visual.WeaponLabel = v end, function(c) C.Visual.WeaponColor = c end)
    Library:Checkbox(Tabs.visual, "Team Color Boxes", C.Visual.TeamColorBoxes, function(v) C.Visual.TeamColorBoxes = v end)
    Library:CheckboxColor(Tabs.visual, "Visible Check Highlight", C.Visual.VisibleCheck, C.Visual.VisibleColor, function(v) C.Visual.VisibleCheck = v end, function(c) C.Visual.VisibleColor = c end)
    Library:Dropdown(Tabs.visual, "Box Style", {"Corner Box","Full Box","3D Box"}, C.Visual.BoxStyle, function(v) C.Visual.BoxStyle = v end)
    Library:Slider(Tabs.visual, "ESP Refresh Rate", 1, 60, C.Visual.ESPRefresh, 1, function(v) C.Visual.ESPRefresh = v end)

    Library:Section(Tabs.visual, "World Visuals")
    Library:Checkbox(Tabs.visual, "Fullbright", C.Visual.Fullbright, function(v) C.Visual.Fullbright = v; if not v then Lighting.Ambient = Originals.Ambient; Lighting.OutdoorAmbient = Originals.OutdoorAmbient; Lighting.Brightness = Originals.Brightness end end)
    Library:Checkbox(Tabs.visual, "No Fog", C.Visual.NoFog, function(v) C.Visual.NoFog = v; if not v then Lighting.FogEnd = Originals.FogEnd end end)
    Library:CheckboxColor(Tabs.visual, "Custom Sky Color", C.Visual.CustomSky, C.Visual.SkyColor, function(v) C.Visual.CustomSky = v end, function(c) C.Visual.SkyColor = c end)
    Library:Checkbox(Tabs.visual, "Weather Off", C.Visual.WeatherOff, function(v) C.Visual.WeatherOff = v end)
    Library:CheckboxColor(Tabs.visual, "Highlight All Players", C.Visual.HighlightAll, C.Visual.HighlightColor, function(v) C.Visual.HighlightAll = v end, function(c) C.Visual.HighlightColor = c end)
    Library:Checkbox(Tabs.visual, "Remove Textures", C.Visual.RemoveTextures, function(v) C.Visual.RemoveTextures = v end)
    Library:CheckboxColor(Tabs.visual, "Neon World", C.Visual.NeonWorld, C.Visual.NeonColor, function(v) C.Visual.NeonWorld = v end, function(c) C.Visual.NeonColor = c end)
    Library:Slider(Tabs.visual, "Time of Day", 0, 24, C.Visual.TimeOfDay, 1, function(v) C.Visual.TimeOfDay = v; Lighting.ClockTime = v end)
    Library:CheckboxColor(Tabs.visual, "Ambient Color", C.Visual.AmbientColor, C.Visual.AmbientVal, function(v) C.Visual.AmbientColor = v; if not v then Lighting.Ambient = Originals.Ambient end end, function(c) C.Visual.AmbientVal = c end)
    Library:CheckboxColor(Tabs.visual, "Fog Color", C.Visual.FogColor, C.Visual.FogVal, function(v) C.Visual.FogColor = v; if not v then Lighting.FogColor = Originals.FogColor end end, function(c) C.Visual.FogVal = c end)

    Library:Section(Tabs.visual, "Crosshair")
    Library:Checkbox(Tabs.visual, "Custom Crosshair", C.Visual.Crosshair, function(v) C.Visual.Crosshair = v end)
    Library:Dropdown(Tabs.visual, "Style", {"Cross","Dot","Circle","Spinning Circle","T-Shape","Sniper Dot","Diamond"}, C.Visual.CrossStyle, function(v) C.Visual.CrossStyle = v end)
    do
        local csf = Instance.new("Frame", Tabs.visual)
        csf.Size = UDim2.new(1, 0, 0, 28)
        csf.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        csf.BorderSizePixel = 0
        Instance.new("UICorner", csf).CornerRadius = UDim.new(0, 4)
        local csl = Instance.new("TextLabel", csf)
        csl.Size = UDim2.new(1, -50, 1, 0)
        csl.Position = UDim2.new(0, 8, 0, 0)
        csl.BackgroundTransparency = 1
        csl.Text = "Crosshair Color"
        csl.TextColor3 = Color3.fromRGB(255, 255, 255)
        csl.FontFace = JosefinSans
        csl.TextSize = 13
        csl.TextXAlignment = Enum.TextXAlignment.Left
        local csw = Instance.new("TextButton", csf)
        csw.Size = UDim2.new(0, 22, 0, 22)
        csw.Position = UDim2.new(1, -30, 0.5, -11)
        csw.BackgroundColor3 = C.Visual.CrossColor
        csw.Text = ""
        csw.BorderSizePixel = 0
        Instance.new("UICorner", csw).CornerRadius = UDim.new(0, 4)
        Instance.new("UIStroke", csw).Thickness = 1
        csw.MouseButton1Click:Connect(function()
            Library:OpenColorPicker(csw, csw.BackgroundColor3, 1, function(c) csw.BackgroundColor3 = c; C.Visual.CrossColor = c end)
        end)
    end
    Library:Slider(Tabs.visual, "Size", 1, 60, C.Visual.CrossSize, 1, function(v) C.Visual.CrossSize = v end)
    Library:Slider(Tabs.visual, "Thickness", 1, 10, C.Visual.CrossThick, 1, function(v) C.Visual.CrossThick = v end)
    Library:Slider(Tabs.visual, "Gap", 0, 20, C.Visual.CrossGap, 1, function(v) C.Visual.CrossGap = v end)
    Library:Checkbox(Tabs.visual, "Spin", C.Visual.CrossSpin, function(v) C.Visual.CrossSpin = v end)
    Library:Slider(Tabs.visual, "Spin Speed", 1, 30, C.Visual.CrossSpinSpeed, 1, function(v) C.Visual.CrossSpinSpeed = v end)
    Library:Checkbox(Tabs.visual, "Outline", C.Visual.CrossOutline, function(v) C.Visual.CrossOutline = v end)

    -- ========================
    -- MISC TAB
    -- ========================
    Library:Section(Tabs.misc, "Movement")
    Library:Checkbox(Tabs.misc, "Infinite Jump", C.Misc.InfJump, function(v) C.Misc.InfJump = v end)
    Library:Checkbox(Tabs.misc, "Fly", C.Misc.Fly, function(v) C.Misc.Fly = v end)
    Library:Keybind(Tabs.misc, "Fly Key", C.Misc.FlyKey, C.Misc.FlyMode, function(k, m) C.Misc.FlyKey = k; C.Misc.FlyMode = m end)
    Library:Slider(Tabs.misc, "Fly Speed", 1, 300, C.Misc.FlySpeed, 1, function(v) C.Misc.FlySpeed = v end)
    Library:Checkbox(Tabs.misc, "No Clip", C.Misc.NoClip, function(v) C.Misc.NoClip = v end)
    Library:Slider(Tabs.misc, "Speed Boost", 16, 300, C.Misc.SpeedBoost, 1, function(v) C.Misc.SpeedBoost = v; if v == 16 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = Originals.WalkSpeed end end)
    Library:Slider(Tabs.misc, "High Jump", 50, 800, C.Misc.HighJump, 1, function(v) C.Misc.HighJump = v; if v == 50 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = Originals.JumpPower end end)
    Library:Checkbox(Tabs.misc, "Bunny Hop", C.Misc.BunnyHop, function(v) C.Misc.BunnyHop = v end)
    Library:Checkbox(Tabs.misc, "Low Gravity", C.Misc.LowGrav, function(v) C.Misc.LowGrav = v; if not v then Workspace.Gravity = Originals.Gravity end end)
    Library:Slider(Tabs.misc, "Gravity", 5, 196, C.Misc.GravVal, 1, function(v) C.Misc.GravVal = v end)

    Library:Section(Tabs.misc, "Camera")
    Library:Checkbox(Tabs.misc, "3rd Person", C.Misc.ThirdPerson, function(v) C.Misc.ThirdPerson = v end)
    Library:Keybind(Tabs.misc, "3rd Person Key", C.Misc.TPKey, C.Misc.TPMode, function(k, m) C.Misc.TPKey = k; C.Misc.TPMode = m end)
    Library:Slider(Tabs.misc, "Camera Distance", 5, 60, C.Misc.TPDist, 1, function(v) C.Misc.TPDist = v end)
    Library:Slider(Tabs.misc, "Camera FOV Override", 30, 120, C.Misc.CamFOV, 1, function(v) C.Misc.CamFOV = v; Camera.FieldOfView = v end)
    Library:Checkbox(Tabs.misc, "Freecam", C.Misc.Freecam, function(v) C.Misc.Freecam = v end)
    Library:Keybind(Tabs.misc, "Freecam Key", C.Misc.FreecamKey, "Toggle", function(k) C.Misc.FreecamKey = k end)
    Library:Slider(Tabs.misc, "Freecam Speed", 1, 100, C.Misc.FreecamSpeed, 1, function(v) C.Misc.FreecamSpeed = v end)

    Library:Section(Tabs.misc, "Logs HUD")
    Library:Checkbox(Tabs.misc, "Hit Log", C.Misc.HitLog, function(v) C.Misc.HitLog = v end)
    Library:Checkbox(Tabs.misc, "Miss Log", C.Misc.MissLog, function(v) C.Misc.MissLog = v end)
    Library:Dropdown(Tabs.misc, "Log Position", {"Top Left","Top Right"}, C.Misc.LogPos, function(v) C.Misc.LogPos = v end)
    Library:Slider(Tabs.misc, "Max Log Entries", 1, 20, C.Misc.MaxLogs, 1, function(v) C.Misc.MaxLogs = v end)

    Library:Section(Tabs.misc, "Utility")
    Library:Checkbox(Tabs.misc, "Anti-AFK", C.Misc.AntiAFK, function(v) C.Misc.AntiAFK = v end)
    Library:Button(Tabs.misc, "Auto-Rejoin", function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
    Library:Button(Tabs.misc, "Server Hop", function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
    Library:Checkbox(Tabs.misc, "Chat Bypass", C.Misc.ChatBypass, function(v) C.Misc.ChatBypass = v end)
    Library:Checkbox(Tabs.misc, "Lag Switch", C.Misc.LagSwitch, function(v) C.Misc.LagSwitch = v end)
    Library:Keybind(Tabs.misc, "Lag Switch Key", C.Misc.LagKey, "Hold", function(k) C.Misc.LagKey = k end)
    Library:Checkbox(Tabs.misc, "Unlock FPS", C.Misc.UnlockFPS, function(v) C.Misc.UnlockFPS = v; if v and setfpscap then pcall(setfpscap, 0) end end)
    Library:Checkbox(Tabs.misc, "Disable Animations", C.Misc.DisableAnims, function(v) C.Misc.DisableAnims = v end)
    Library:Checkbox(Tabs.misc, "Aimlock Indicator", C.Misc.AimlockIndicator, function(v) C.Misc.AimlockIndicator = v end)
    Library:Checkbox(Tabs.misc, "Clock HUD", C.Misc.ClockHUD, function(v) C.Misc.ClockHUD = v end)
    Library:Checkbox(Tabs.misc, "FPS Counter", C.Misc.FPSCounter, function(v) C.Misc.FPSCounter = v end)

    -- ========================
    -- TROLL TAB
    -- ========================
    Library:Section(Tabs.troll, "Modules")
    Library:Checkbox(Tabs.troll, "Spin Bot", C.Troll.Spin, function(v) C.Troll.Spin = v end)
    Library:Slider(Tabs.troll, "Spin Speed", 1, 100, C.Troll.SpinSpeed, 1, function(v) C.Troll.SpinSpeed = v end)
    Library:Checkbox(Tabs.troll, "Fake Lag", C.Troll.FakeLag, function(v) C.Troll.FakeLag = v end)
    Library:Checkbox(Tabs.troll, "Dance Spam", C.Troll.DanceSpam, function(v) C.Troll.DanceSpam = v end)
    Library:Dropdown(Tabs.troll, "Emote", {"e1","e2","e3","point","wave","cheer","laugh"}, C.Troll.DanceEmote, function(v) C.Troll.DanceEmote = v end)
    Library:Checkbox(Tabs.troll, "Chat Spam", C.Troll.ChatSpam, function(v) C.Troll.ChatSpam = v end)
    Library:TextInput(Tabs.troll, "Message", "karma.lol v2", function(v) C.Troll.ChatMsg = v end)
    Library:Slider(Tabs.troll, "Chat Interval", 0.5, 10, C.Troll.ChatInterval, 0.5, function(v) C.Troll.ChatInterval = v end)
    Library:Checkbox(Tabs.troll, "Invisible (Visual)", C.Troll.Invisible, function(v) C.Troll.Invisible = v; if not v and LocalPlayer.Character then for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 0 end end end end)
    Library:Checkbox(Tabs.troll, "God Mode (Visual)", C.Troll.GodMode, function(v) C.Troll.GodMode = v end)

    Library:Section(Tabs.troll, "Teleport")

    local function getPlayerNames()
        local t = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(t, p.Name) end
        end
        if #t == 0 then table.insert(t, "None") end
        return t
    end

    Library:Dropdown(Tabs.troll, "Teleport Target", getPlayerNames(), "", function(v) C.Troll.TeleportTarget = v end)
    Library:Button(Tabs.troll, "Teleport", function()
        local t = Players:FindFirstChild(C.Troll.TeleportTarget)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
        end
    end)

    Library:Checkbox(Tabs.troll, "Follow Player", C.Troll.FollowPlayer, function(v) C.Troll.FollowPlayer = v end)
    Library:Dropdown(Tabs.troll, "Follow Target", getPlayerNames(), "", function(v) C.Troll.FollowTarget = v end)

    Library:Button(Tabs.troll, "Fling Self", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(-500, 500), 500, math.random(-500, 500))
        end
    end)

    Library:Checkbox(Tabs.troll, "Big Head", C.Troll.BigHead, function(v) C.Troll.BigHead = v; if not v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then LocalPlayer.Character.Head.Size = Vector3.new(2, 1, 1) end end)
    Library:Slider(Tabs.troll, "Head Size", 1, 20, C.Troll.BigHeadSize, 1, function(v) C.Troll.BigHeadSize = v end)
    Library:Checkbox(Tabs.troll, "Giant Mode", C.Troll.Giant, function(v) C.Troll.Giant = v end)
    Library:Slider(Tabs.troll, "Giant Scale", 1, 10, C.Troll.GiantSize, 1, function(v) C.Troll.GiantSize = v end)
    Library:Checkbox(Tabs.troll, "Rainbow Character", C.Troll.Rainbow, function(v) C.Troll.Rainbow = v end)
    Library:Checkbox(Tabs.troll, "Force Field", C.Troll.ForceField, function(v) C.Troll.ForceField = v; if v then if LocalPlayer.Character and not LocalPlayer.Character:FindFirstChildOfClass("ForceField") then Instance.new("ForceField", LocalPlayer.Character) end elseif LocalPlayer.Character then local ff = LocalPlayer.Character:FindFirstChildOfClass("ForceField"); if ff then ff:Destroy() end end end)

    -- Crash Server (Locked)
    do
        local crashBtn = Instance.new("TextButton", Tabs.troll)
        crashBtn.Size = UDim2.new(1, 0, 0, 28)
        crashBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        crashBtn.BorderSizePixel = 0
        crashBtn.Text = "Crash Server [LOCKED]"
        crashBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
        crashBtn.FontFace = JosefinSans
        crashBtn.TextSize = 13
        crashBtn.Active = false
        Instance.new("UICorner", crashBtn).CornerRadius = UDim.new(0, 4)
    end

    -- ========================
    -- LUA TAB
    -- ========================
    do
        Tabs.lua.AutomaticCanvasSize = Enum.AutomaticSize.None
        Tabs.lua.CanvasSize = UDim2.new(0, 0, 0, 0)

        local editorBg = Instance.new("Frame", Tabs.lua)
        editorBg.Size = UDim2.new(1, 0, 0, 340)
        editorBg.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        editorBg.BorderSizePixel = 0
        Instance.new("UICorner", editorBg).CornerRadius = UDim.new(0, 4)

        local editorScroll = Instance.new("ScrollingFrame", editorBg)
        editorScroll.Size = UDim2.new(1, -10, 1, -10)
        editorScroll.Position = UDim2.new(0, 5, 0, 5)
        editorScroll.BackgroundTransparency = 1
        editorScroll.ScrollBarThickness = 4
        editorScroll.CanvasSize = UDim2.new(0, 0, 0, 800)
        editorScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

        local editor = Instance.new("TextBox", editorScroll)
        editor.Size = UDim2.new(1, 0, 1, 0)
        editor.BackgroundTransparency = 1
        editor.Text = ""
        editor.PlaceholderText = "-- write your script here..."
        editor.TextColor3 = Color3.fromRGB(255, 255, 255)
        editor.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
        editor.FontFace = MonoFont
        editor.TextSize = 13
        editor.TextXAlignment = Enum.TextXAlignment.Left
        editor.TextYAlignment = Enum.TextYAlignment.Top
        editor.ClearTextOnFocus = false
        editor.MultiLine = true
        editor.TextWrapped = true

        -- Buttons row
        local btnRow = Instance.new("Frame", Tabs.lua)
        btnRow.Size = UDim2.new(1, 0, 0, 32)
        btnRow.BackgroundTransparency = 1

        local executeBtn = Instance.new("TextButton", btnRow)
        executeBtn.Size = UDim2.new(0.33, -4, 1, 0)
        executeBtn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        executeBtn.BorderSizePixel = 0
        executeBtn.Text = "Execute"
        executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        executeBtn.FontFace = JosefinSans
        executeBtn.TextSize = 13
        Instance.new("UICorner", executeBtn).CornerRadius = UDim.new(0, 4)

        local clearBtn = Instance.new("TextButton", btnRow)
        clearBtn.Size = UDim2.new(0.33, -4, 1, 0)
        clearBtn.Position = UDim2.new(0.33, 2, 0, 0)
        clearBtn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        clearBtn.BorderSizePixel = 0
        clearBtn.Text = "Clear"
        clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        clearBtn.FontFace = JosefinSans
        clearBtn.TextSize = 13
        Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 4)

        local copyBtn = Instance.new("TextButton", btnRow)
        copyBtn.Size = UDim2.new(0.34, -4, 1, 0)
        copyBtn.Position = UDim2.new(0.66, 2, 0, 0)
        copyBtn.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
        copyBtn.BorderSizePixel = 0
        copyBtn.Text = "Copy"
        copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        copyBtn.FontFace = JosefinSans
        copyBtn.TextSize = 13
        Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 4)

        -- Output console
        local outputBg = Instance.new("ScrollingFrame", Tabs.lua)
        outputBg.Size = UDim2.new(1, 0, 0, 60)
        outputBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        outputBg.BorderSizePixel = 0
        outputBg.ScrollBarThickness = 3
        outputBg.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Instance.new("UICorner", outputBg).CornerRadius = UDim.new(0, 4)

        local outputLabel = Instance.new("TextLabel", outputBg)
        outputLabel.Size = UDim2.new(1, -10, 0, 0)
        outputLabel.Position = UDim2.new(0, 5, 0, 2)
        outputLabel.BackgroundTransparency = 1
        outputLabel.Text = ""
        outputLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        outputLabel.FontFace = MonoFont
        outputLabel.TextSize = 12
        outputLabel.TextXAlignment = Enum.TextXAlignment.Left
        outputLabel.TextYAlignment = Enum.TextYAlignment.Top
        outputLabel.TextWrapped = true
        outputLabel.AutomaticSize = Enum.AutomaticSize.Y

        executeBtn.MouseButton1Click:Connect(function()
            local src = editor.Text
            if src == "" then return end
            local ok, err = pcall(function()
                local fn = loadstring(src)
                if fn then fn() end
            end)
            if ok then
                outputLabel.Text = "[OK] Script executed."
                outputLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            else
                outputLabel.Text = "[ERR] " .. tostring(err)
                outputLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
        end)

        clearBtn.MouseButton1Click:Connect(function()
            editor.Text = ""
            outputLabel.Text = ""
        end)

        copyBtn.MouseButton1Click:Connect(function()
            if setclipboard then
                pcall(setclipboard, editor.Text)
                outputLabel.Text = "[OK] Copied to clipboard."
                outputLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            end
        end)

        -- Script Hub
        Library:Section(Tabs.lua, "Script Hub")

        local hubScripts = {
            ["Infinite Yield"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
            ["Dex Explorer"] = "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua",
            ["Simple Spy"] = "https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua",
            ["Admin Commands (Cmdr)"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
            ["hydroxide"] = "https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/init.lua",
            ["Custom (use executor above)"] = ""
        }
        local hubNames = {"Infinite Yield","Dex Explorer","Simple Spy","Admin Commands (Cmdr)","hydroxide","Custom (use executor above)"}
        local selectedHub = hubNames[1]

        Library:Dropdown(Tabs.lua, "Script", hubNames, selectedHub, function(v) selectedHub = v end)
        Library:Button(Tabs.lua, "Load Hub Script", function()
            local url = hubScripts[selectedHub]
            if url and url ~= "" then
                local ok, err = pcall(function()
                    loadstring(game:HttpGet(url))()
                end)
                if ok then
                    outputLabel.Text = "[OK] Loaded: " .. selectedHub
                    outputLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                else
                    outputLabel.Text = "[ERR] " .. tostring(err)
                    outputLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                end
            end
        end)
    end

    -- ========================
    -- FEATURE IMPLEMENTATION
    -- ========================

    -- FOV Circle
    local fovCircle = nil
    if Drawing then
        fovCircle = AddDrawing(Drawing.new("Circle"))
        fovCircle.Visible = false
        fovCircle.Thickness = 1
        fovCircle.Filled = false
        fovCircle.Transparency = 1
    end

    -- ESP Cache
    local ESP_Cache = {}
    local function CreateESP(player)
        if not Drawing then return end
        local esp = {
            BoxOutline = AddDrawing(Drawing.new("Square")),
            Box = AddDrawing(Drawing.new("Square")),
            CornerTL = AddDrawing(Drawing.new("Line")), CornerTR = AddDrawing(Drawing.new("Line")),
            CornerBL = AddDrawing(Drawing.new("Line")), CornerBR = AddDrawing(Drawing.new("Line")),
            CornerTLv = AddDrawing(Drawing.new("Line")), CornerTRv = AddDrawing(Drawing.new("Line")),
            CornerBLv = AddDrawing(Drawing.new("Line")), CornerBRv = AddDrawing(Drawing.new("Line")),
            Name = AddDrawing(Drawing.new("Text")),
            Distance = AddDrawing(Drawing.new("Text")),
            HealthText = AddDrawing(Drawing.new("Text")),
            WeaponText = AddDrawing(Drawing.new("Text")),
            HealthOutline = AddDrawing(Drawing.new("Line")),
            Health = AddDrawing(Drawing.new("Line")),
            Tracer = AddDrawing(Drawing.new("Line")),
            HeadDot = AddDrawing(Drawing.new("Circle")),
            SkeletonLines = {}
        }
        local skNames = {"Neck","LeftArm","RightArm","Spine","LeftLeg","RightLeg","LeftForearm","RightForearm","LeftShin","RightShin"}
        for _, n in ipairs(skNames) do
            esp.SkeletonLines[n] = AddDrawing(Drawing.new("Line"))
            esp.SkeletonLines[n].Thickness = 1
            esp.SkeletonLines[n].Transparency = 1
            esp.SkeletonLines[n].Visible = false
        end
        -- Init drawing properties
        esp.Box.Filled = false; esp.Box.Thickness = 1
        esp.BoxOutline.Filled = false; esp.BoxOutline.Thickness = 3; esp.BoxOutline.Color = Color3.fromRGB(0,0,0)
        for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do
            esp[k].Thickness = 1; esp[k].Visible = false
        end
        esp.HealthOutline.Thickness = 4; esp.HealthOutline.Color = Color3.fromRGB(0,0,0)
        esp.Health.Thickness = 2
        esp.Tracer.Thickness = 1
        esp.HeadDot.Filled = true; esp.HeadDot.Thickness = 0; esp.HeadDot.NumSides = 16
        for _, t in ipairs({"Name","Distance","HealthText","WeaponText"}) do
            esp[t].Center = true; esp[t].Outline = true; esp[t].Size = 14; esp[t].Color = Color3.fromRGB(255,255,255)
        end
        -- Hide all by default
        local function hideAll()
            for k, v in pairs(esp) do
                if type(v) == "table" then for _, l in pairs(v) do l.Visible = false end
                elseif typeof(v) == "Instance" or (type(v) == "userdata" and v.Visible ~= nil) then v.Visible = false end
            end
        end
        hideAll()
        ESP_Cache[player] = esp
    end

    local function RemoveESP(player)
        if ESP_Cache[player] then
            for k, v in pairs(ESP_Cache[player]) do
                if type(v) == "table" then for _, l in pairs(v) do pcall(function() l:Remove() end) end
                else pcall(function() v:Remove() end) end
            end
            ESP_Cache[player] = nil
        end
    end

    for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then CreateESP(p) end end
    AddConnection(Players.PlayerAdded:Connect(function(p) if p ~= LocalPlayer then CreateESP(p) end end))
    AddConnection(Players.PlayerRemoving:Connect(function(p) RemoveESP(p) end))

    -- Aimbot get closest player
    local currentTarget = nil
    local _lockToggleState = false

    local function getClosestPlayer()
        local maxDist = C.Legit.FOV
        local target = nil
        local mousePos = UserInputService:GetMouseLocation()
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                if C.Legit.TeamCheck and v.Team == LocalPlayer.Team then continue end
                local root = v.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                local dist3D = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude or 0
                if dist3D > C.Legit.MaxDist then continue end
                local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local dist2D = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist2D < maxDist then
                        if C.Legit.WallCheck then
                            local rp = RaycastParams.new()
                            rp.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
                            rp.FilterType = Enum.RaycastFilterType.Exclude
                            local ray = Workspace:Raycast(Camera.CFrame.Position, (root.Position - Camera.CFrame.Position).Unit * 1000, rp)
                            if ray and not ray.Instance:IsDescendantOf(v.Character) then continue end
                        end
                        maxDist = dist2D
                        target = v
                    end
                end
            end
        end
        return target
    end

    -- Fly state
    local Flying = false
    local flyBV = nil

    -- Freecam state
    local FreecamActive = false
    local freecamCF = CFrame.new()

    -- Toggle states for keybinds
    local toggleStates = {fly = false, thirdPerson = false, freecam = false}

    AddConnection(UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end

        -- Right Shift toggle UI
        if input.KeyCode == Enum.KeyCode.RightShift then
            ScreenGui.Enabled = not ScreenGui.Enabled
            return
        end

        -- Lock toggle
        if input.KeyCode == C.Legit.LockKey and C.Legit.Lock then
            if C.Legit.LockMode == "Toggle" then
                _lockToggleState = not _lockToggleState
            end
        end

        -- Fly toggle
        if input.KeyCode == C.Misc.FlyKey and C.Misc.Fly then
            if C.Misc.FlyMode == "Toggle" then
                toggleStates.fly = not toggleStates.fly
            end
        end

        -- 3rd Person toggle
        if input.KeyCode == C.Misc.TPKey and C.Misc.ThirdPerson then
            if C.Misc.TPMode == "Toggle" then
                toggleStates.thirdPerson = not toggleStates.thirdPerson
            end
        end

        -- Freecam toggle
        if input.KeyCode == C.Misc.FreecamKey and C.Misc.Freecam then
            FreecamActive = not FreecamActive
            if FreecamActive then
                freecamCF = Camera.CFrame
            else
                Camera.CameraType = Enum.CameraType.Custom
            end
        end
    end))

    AddConnection(UserInputService.InputEnded:Connect(function(input, processed)
        if input.KeyCode == C.Legit.LockKey and C.Legit.LockMode == "Release" then
            -- handled in render
        end
    end))

    -- Infinite Jump
    AddConnection(UserInputService.JumpRequest:Connect(function()
        if C.Misc.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end))

    -- Anti-AFK
    AddConnection(LocalPlayer.Idled:Connect(function()
        if C.Misc.AntiAFK then
            local VU = game:GetService("VirtualUser")
            VU:Button2Down(Vector2.new(0,0), Camera.CFrame)
            task.wait(1)
            VU:Button2Up(Vector2.new(0,0), Camera.CFrame)
        end
    end))

    -- HUD Labels
    local aimlockLabel = Instance.new("TextLabel", ScreenGui)
    aimlockLabel.Size = UDim2.new(0, 200, 0, 25)
    aimlockLabel.Position = UDim2.new(0.5, -100, 0, 50)
    aimlockLabel.BackgroundTransparency = 1
    aimlockLabel.Text = ""
    aimlockLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    aimlockLabel.FontFace = JosefinBold
    aimlockLabel.TextSize = 15
    aimlockLabel.Visible = false

    local clockLabel = Instance.new("TextLabel", ScreenGui)
    clockLabel.Size = UDim2.new(0, 120, 0, 20)
    clockLabel.Position = UDim2.new(0, 10, 1, -25)
    clockLabel.BackgroundTransparency = 1
    clockLabel.Text = ""
    clockLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    clockLabel.FontFace = JosefinSans
    clockLabel.TextSize = 13
    clockLabel.TextXAlignment = Enum.TextXAlignment.Left
    clockLabel.Visible = false

    local fpsLabel = Instance.new("TextLabel", ScreenGui)
    fpsLabel.Size = UDim2.new(0, 80, 0, 20)
    fpsLabel.Position = UDim2.new(0, 10, 1, -45)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = ""
    fpsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    fpsLabel.FontFace = JosefinSans
    fpsLabel.TextSize = 13
    fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
    fpsLabel.Visible = false

    -- Crosshair Drawing Objects
    local CrossLines = {}
    local CrossOutlines = {}
    if Drawing then
        for i = 1, 8 do
            CrossLines[i] = AddDrawing(Drawing.new("Line"))
            CrossLines[i].Visible = false
            CrossLines[i].Thickness = 2
            CrossOutlines[i] = AddDrawing(Drawing.new("Line"))
            CrossOutlines[i].Visible = false
            CrossOutlines[i].Thickness = 4
            CrossOutlines[i].Color = Color3.fromRGB(0, 0, 0)
        end
    end
    local crossDot, crossCircle
    if Drawing then
        crossDot = AddDrawing(Drawing.new("Circle"))
        crossDot.Visible = false; crossDot.Filled = true
        crossCircle = AddDrawing(Drawing.new("Circle"))
        crossCircle.Visible = false; crossCircle.Filled = false
    end

    local rotAngle = 0
    local espTimer = 0

    -- ========================
    -- MAIN RENDER LOOP
    -- ========================
    AddConnection(RunService.RenderStepped:Connect(function(dt)
        -- Mouse unlock when UI open
        if ScreenGui.Enabled then
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            UserInputService.MouseIconEnabled = true
        end

        -- Camera reference refresh
        Camera = Workspace.CurrentCamera

        local midX = Camera.ViewportSize.X / 2
        local midY = Camera.ViewportSize.Y / 2

        -- ===== AIMBOT =====
        local isLocking = false
        if C.Legit.Lock then
            if C.Legit.LockMode == "Always On" then isLocking = true
            elseif C.Legit.LockMode == "Hold" then isLocking = UserInputService:IsKeyDown(C.Legit.LockKey)
            elseif C.Legit.LockMode == "Toggle" then isLocking = _lockToggleState
            elseif C.Legit.LockMode == "Release" then isLocking = not UserInputService:IsKeyDown(C.Legit.LockKey)
            end
        end

        if isLocking then
            if not currentTarget or (C.Legit.AutoUnlock and (not currentTarget.Character or not currentTarget.Character:FindFirstChild("Humanoid") or currentTarget.Character.Humanoid.Health <= 0)) then
                currentTarget = getClosestPlayer()
            end
            if currentTarget and currentTarget.Character then
                local partName = C.Legit.Hitbox
                if partName == "Body" then partName = "HumanoidRootPart"
                elseif partName == "Random" then
                    local pts = {"Head","HumanoidRootPart","UpperTorso","LowerTorso"}
                    partName = pts[math.random(1,#pts)]
                end
                local targetPart = currentTarget.Character:FindFirstChild(partName) or currentTarget.Character:FindFirstChild("HumanoidRootPart")
                if targetPart then
                    local basePos = targetPart.Position
                    if targetPart.Name == "Head" then basePos = basePos + Vector3.new(0, targetPart.Size.Y / 4, 0) end
                    local predicted = basePos + (targetPart.Velocity * C.Legit.Prediction)
                    if C.Legit.Resolver then predicted = predicted + Vector3.new(0, 0.5, 0) end

                    if C.Legit.ResolverMouse and mousemoverel then
                        local sp, onS = Camera:WorldToViewportPoint(predicted)
                        if onS then
                            mousemoverel((sp.X - Mouse.X) / (C.Legit.Smoothness + 1), (sp.Y - Mouse.Y) / (C.Legit.Smoothness + 1))
                        end
                    elseif not C.Legit.Silent then
                        local camPos = Camera.CFrame.Position
                        local targetCF = CFrame.new(camPos, predicted)
                        if C.Legit.Smoothness > 0 then
                            Camera.CFrame = Camera.CFrame:Lerp(targetCF, 1 / (C.Legit.Smoothness + 1))
                        else
                            Camera.CFrame = targetCF
                        end
                    end
                end
            end
        else
            currentTarget = nil
        end

        -- Aimlock indicator
        if C.Misc.AimlockIndicator and currentTarget then
            aimlockLabel.Text = "LOCKED: " .. currentTarget.Name
            aimlockLabel.Visible = true
        else
            aimlockLabel.Visible = false
        end

        -- FOV Circle
        if Drawing and fovCircle then
            if C.Legit.DrawFOV then
                fovCircle.Position = UserInputService:GetMouseLocation()
                fovCircle.Radius = C.Legit.FOV
                fovCircle.Color = C.Legit.FOVColor
                fovCircle.Visible = true
            else
                fovCircle.Visible = false
            end
        end

        -- ===== ESP (throttled) =====
        espTimer = espTimer + dt
        local espInterval = 1 / math.max(C.Visual.ESPRefresh, 1)
        if Drawing and espTimer >= espInterval then
            espTimer = 0
            for player, esp in pairs(ESP_Cache) do
                local char = player.Character
                local hasChar = char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char:FindFirstChild("Head") and char.Humanoid.Health > 0
                if hasChar and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local root = char.HumanoidRootPart
                    local head = char.Head
                    local rootSP, onScreen = Camera:WorldToViewportPoint(root.Position)
                    local headSP = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local legSP = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
                    local dist3D = (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude

                    if onScreen and dist3D <= C.Legit.MaxDist then
                        local height = math.abs(headSP.Y - legSP.Y)
                        local width = height * 0.6

                        -- Determine color based on visibility check
                        local espColor = C.Visual.BoxColor
                        if C.Visual.VisibleCheck then
                            local rp = RaycastParams.new()
                            rp.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
                            rp.FilterType = Enum.RaycastFilterType.Exclude
                            local ray = Workspace:Raycast(Camera.CFrame.Position, (root.Position - Camera.CFrame.Position).Unit * 1000, rp)
                            if ray and ray.Instance:IsDescendantOf(char) then
                                espColor = C.Visual.VisibleColor
                            else
                                espColor = C.Visual.HiddenColor
                            end
                        end

                        -- Team color override
                        if C.Visual.TeamColorBoxes and player.Team then
                            espColor = player.TeamColor.Color
                        end

                        -- Box ESP
                        if C.Visual.Box then
                            if C.Visual.BoxStyle == "Full Box" then
                                esp.Box.Size = Vector2.new(width, height)
                                esp.Box.Position = Vector2.new(rootSP.X - width/2, headSP.Y)
                                esp.Box.Color = espColor
                                esp.Box.Visible = true
                                esp.BoxOutline.Size = Vector2.new(width, height)
                                esp.BoxOutline.Position = Vector2.new(rootSP.X - width/2, headSP.Y)
                                esp.BoxOutline.Visible = true
                                for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do esp[k].Visible = false end
                            elseif C.Visual.BoxStyle == "Corner Box" then
                                esp.Box.Visible = false; esp.BoxOutline.Visible = false
                                local cLen = width * 0.25
                                local x1, y1 = rootSP.X - width/2, headSP.Y
                                local x2, y2 = x1 + width, y1 + height
                                -- Corners
                                esp.CornerTL.From = Vector2.new(x1, y1); esp.CornerTL.To = Vector2.new(x1 + cLen, y1); esp.CornerTL.Color = espColor; esp.CornerTL.Visible = true
                                esp.CornerTLv.From = Vector2.new(x1, y1); esp.CornerTLv.To = Vector2.new(x1, y1 + cLen); esp.CornerTLv.Color = espColor; esp.CornerTLv.Visible = true
                                esp.CornerTR.From = Vector2.new(x2, y1); esp.CornerTR.To = Vector2.new(x2 - cLen, y1); esp.CornerTR.Color = espColor; esp.CornerTR.Visible = true
                                esp.CornerTRv.From = Vector2.new(x2, y1); esp.CornerTRv.To = Vector2.new(x2, y1 + cLen); esp.CornerTRv.Color = espColor; esp.CornerTRv.Visible = true
                                esp.CornerBL.From = Vector2.new(x1, y2); esp.CornerBL.To = Vector2.new(x1 + cLen, y2); esp.CornerBL.Color = espColor; esp.CornerBL.Visible = true
                                esp.CornerBLv.From = Vector2.new(x1, y2); esp.CornerBLv.To = Vector2.new(x1, y2 - cLen); esp.CornerBLv.Color = espColor; esp.CornerBLv.Visible = true
                                esp.CornerBR.From = Vector2.new(x2, y2); esp.CornerBR.To = Vector2.new(x2 - cLen, y2); esp.CornerBR.Color = espColor; esp.CornerBR.Visible = true
                                esp.CornerBRv.From = Vector2.new(x2, y2); esp.CornerBRv.To = Vector2.new(x2, y2 - cLen); esp.CornerBRv.Color = espColor; esp.CornerBRv.Visible = true
                            else -- 3D Box
                                esp.Box.Size = Vector2.new(width, height)
                                esp.Box.Position = Vector2.new(rootSP.X - width/2, headSP.Y)
                                esp.Box.Color = espColor
                                esp.Box.Visible = true
                                esp.BoxOutline.Visible = false
                                for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do esp[k].Visible = false end
                            end
                        else
                            esp.Box.Visible = false; esp.BoxOutline.Visible = false
                            for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do esp[k].Visible = false end
                        end

                        -- Health Bar
                        if C.Visual.HealthBar then
                            local hp = char.Humanoid.Health / char.Humanoid.MaxHealth
                            esp.HealthOutline.From = Vector2.new(rootSP.X - width/2 - 5, headSP.Y + height)
                            esp.HealthOutline.To = Vector2.new(rootSP.X - width/2 - 5, headSP.Y)
                            esp.HealthOutline.Visible = true
                            esp.Health.From = Vector2.new(rootSP.X - width/2 - 5, headSP.Y + height)
                            esp.Health.To = Vector2.new(rootSP.X - width/2 - 5, headSP.Y + height - (height * hp))
                            esp.Health.Color = Color3.fromRGB(255 - hp*255, hp*255, 0)
                            esp.Health.Visible = true
                        else
                            esp.Health.Visible = false; esp.HealthOutline.Visible = false
                        end

                        -- Health Text
                        if C.Visual.HealthText then
                            esp.HealthText.Text = tostring(math.floor(char.Humanoid.Health))
                            esp.HealthText.Position = Vector2.new(rootSP.X - width/2 - 15, headSP.Y + height/2)
                            esp.HealthText.Visible = true
                        else
                            esp.HealthText.Visible = false
                        end

                        -- Name
                        if C.Visual.Name then
                            esp.Name.Text = player.Name
                            esp.Name.Color = C.Visual.NameColor
                            esp.Name.Position = Vector2.new(rootSP.X, headSP.Y - 18)
                            esp.Name.Visible = true
                        else esp.Name.Visible = false end

                        -- Distance
                        if C.Visual.Distance then
                            esp.Distance.Text = "[" .. math.floor(dist3D) .. "]"
                            esp.Distance.Color = C.Visual.DistColor
                            esp.Distance.Position = Vector2.new(rootSP.X, headSP.Y + height + 2)
                            esp.Distance.Visible = true
                        else esp.Distance.Visible = false end

                        -- Tracers
                        if C.Visual.Tracers then
                            esp.Tracer.From = Vector2.new(midX, Camera.ViewportSize.Y)
                            esp.Tracer.To = Vector2.new(rootSP.X, legSP.Y)
                            esp.Tracer.Color = C.Visual.TracerColor
                            esp.Tracer.Visible = true
                        else esp.Tracer.Visible = false end

                        -- Head Dot
                        if C.Visual.HeadDot then
                            esp.HeadDot.Position = Vector2.new(headSP.X, headSP.Y)
                            esp.HeadDot.Color = C.Visual.HeadDotColor
                            esp.HeadDot.Radius = 3
                            esp.HeadDot.Visible = true
                        else esp.HeadDot.Visible = false end

                        -- Weapon Label
                        if C.Visual.WeaponLabel then
                            local tool = char:FindFirstChildOfClass("Tool")
                            if tool then
                                esp.WeaponText.Text = tool.Name
                                esp.WeaponText.Color = C.Visual.WeaponColor
                                esp.WeaponText.Position = Vector2.new(rootSP.X, headSP.Y - 32)
                                esp.WeaponText.Visible = true
                            else esp.WeaponText.Visible = false end
                        else esp.WeaponText.Visible = false end

                        -- Skeleton
                        if C.Visual.Skeleton then
                            local function wtp(part) if part then local p = Camera:WorldToViewportPoint(part.Position); return Vector2.new(p.X, p.Y) end return nil end
                            local sk = esp.SkeletonLines
                            local skColor = C.Visual.TeamColorBoxes and player.Team and player.TeamColor.Color or C.Visual.SkeletonColor
                            -- Try R15 first, fallback R6
                            local headP = wtp(char:FindFirstChild("Head"))
                            local upperT = wtp(char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
                            local lowerT = wtp(char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso"))
                            local lHand = wtp(char:FindFirstChild("LeftHand") or char:FindFirstChild("Left Arm"))
                            local rHand = wtp(char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm"))
                            local lFoot = wtp(char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg"))
                            local rFoot = wtp(char:FindFirstChild("RightFoot") or char:FindFirstChild("Right Leg"))
                            local lUArm = wtp(char:FindFirstChild("LeftUpperArm"))
                            local rUArm = wtp(char:FindFirstChild("RightUpperArm"))
                            local lULeg = wtp(char:FindFirstChild("LeftUpperLeg"))
                            local rULeg = wtp(char:FindFirstChild("RightUpperLeg"))

                            if headP and upperT then
                                sk.Neck.From = headP; sk.Neck.To = upperT; sk.Neck.Color = skColor; sk.Neck.Visible = true
                            else sk.Neck.Visible = false end
                            if upperT and lowerT then
                                sk.Spine.From = upperT; sk.Spine.To = lowerT; sk.Spine.Color = skColor; sk.Spine.Visible = true
                            else sk.Spine.Visible = false end
                            if upperT and (lUArm or lHand) then
                                sk.LeftArm.From = upperT; sk.LeftArm.To = lUArm or lHand; sk.LeftArm.Color = skColor; sk.LeftArm.Visible = true
                            else sk.LeftArm.Visible = false end
                            if upperT and (rUArm or rHand) then
                                sk.RightArm.From = upperT; sk.RightArm.To = rUArm or rHand; sk.RightArm.Color = skColor; sk.RightArm.Visible = true
                            else sk.RightArm.Visible = false end
                            if lUArm and lHand then
                                sk.LeftForearm.From = lUArm; sk.LeftForearm.To = lHand; sk.LeftForearm.Color = skColor; sk.LeftForearm.Visible = true
                            else sk.LeftForearm.Visible = false end
                            if rUArm and rHand then
                                sk.RightForearm.From = rUArm; sk.RightForearm.To = rHand; sk.RightForearm.Color = skColor; sk.RightForearm.Visible = true
                            else sk.RightForearm.Visible = false end
                            if lowerT and (lULeg or lFoot) then
                                sk.LeftLeg.From = lowerT; sk.LeftLeg.To = lULeg or lFoot; sk.LeftLeg.Color = skColor; sk.LeftLeg.Visible = true
                            else sk.LeftLeg.Visible = false end
                            if lowerT and (rULeg or rFoot) then
                                sk.RightLeg.From = lowerT; sk.RightLeg.To = rULeg or rFoot; sk.RightLeg.Color = skColor; sk.RightLeg.Visible = true
                            else sk.RightLeg.Visible = false end
                            if lULeg and lFoot then
                                sk.LeftShin.From = lULeg; sk.LeftShin.To = lFoot; sk.LeftShin.Color = skColor; sk.LeftShin.Visible = true
                            else sk.LeftShin.Visible = false end
                            if rULeg and rFoot then
                                sk.RightShin.From = rULeg; sk.RightShin.To = rFoot; sk.RightShin.Color = skColor; sk.RightShin.Visible = true
                            else sk.RightShin.Visible = false end
                        else
                            for _, l in pairs(esp.SkeletonLines) do l.Visible = false end
                        end
                    else
                        -- Off screen or too far
                        esp.Box.Visible = false; esp.BoxOutline.Visible = false
                        esp.Name.Visible = false; esp.Distance.Visible = false
                        esp.Health.Visible = false; esp.HealthOutline.Visible = false
                        esp.HealthText.Visible = false; esp.Tracer.Visible = false
                        esp.HeadDot.Visible = false; esp.WeaponText.Visible = false
                        for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do esp[k].Visible = false end
                        for _, l in pairs(esp.SkeletonLines) do l.Visible = false end
                    end
                else
                    esp.Box.Visible = false; esp.BoxOutline.Visible = false
                    esp.Name.Visible = false; esp.Distance.Visible = false
                    esp.Health.Visible = false; esp.HealthOutline.Visible = false
                    esp.HealthText.Visible = false; esp.Tracer.Visible = false
                    esp.HeadDot.Visible = false; esp.WeaponText.Visible = false
                    for _, k in ipairs({"CornerTL","CornerTR","CornerBL","CornerBR","CornerTLv","CornerTRv","CornerBLv","CornerBRv"}) do esp[k].Visible = false end
                    for _, l in pairs(esp.SkeletonLines) do l.Visible = false end
                end
            end
        end

        -- ===== CROSSHAIR =====
        if Drawing then
            if C.Visual.Crosshair then
                local sz = C.Visual.CrossSize
                local th = C.Visual.CrossThick
                local gap = C.Visual.CrossGap
                local col = C.Visual.CrossColor

                if C.Visual.CrossSpin then
                    rotAngle = rotAngle + C.Visual.CrossSpinSpeed * dt * 60
                else
                    rotAngle = 0
                end
                local rad = math.rad(rotAngle)
                local sin, cos = math.sin(rad), math.cos(rad)

                -- Hide all first
                for i = 1, 8 do CrossLines[i].Visible = false; CrossOutlines[i].Visible = false end
                if crossDot then crossDot.Visible = false end
                if crossCircle then crossCircle.Visible = false end

                local style = C.Visual.CrossStyle
                if style == "Cross" then
                    local offsets = {
                        {Vector2.new(0, -(gap + sz)), Vector2.new(0, -gap)},
                        {Vector2.new(0, gap + sz), Vector2.new(0, gap)},
                        {Vector2.new(-(gap + sz), 0), Vector2.new(-gap, 0)},
                        {Vector2.new(gap + sz, 0), Vector2.new(gap, 0)}
                    }
                    for i, off in ipairs(offsets) do
                        local x1 = midX + (off[1].X * cos - off[1].Y * sin)
                        local y1 = midY + (off[1].X * sin + off[1].Y * cos)
                        local x2 = midX + (off[2].X * cos - off[2].Y * sin)
                        local y2 = midY + (off[2].X * sin + off[2].Y * cos)
                        CrossLines[i].From = Vector2.new(x1, y1)
                        CrossLines[i].To = Vector2.new(x2, y2)
                        CrossLines[i].Color = col
                        CrossLines[i].Thickness = th
                        CrossLines[i].Visible = true
                        if C.Visual.CrossOutline then
                            CrossOutlines[i].From = Vector2.new(x1, y1)
                            CrossOutlines[i].To = Vector2.new(x2, y2)
                            CrossOutlines[i].Thickness = th + 2
                            CrossOutlines[i].Visible = true
                        end
                    end
                elseif style == "Dot" then
                    crossDot.Position = Vector2.new(midX, midY)
                    crossDot.Radius = sz / 4
                    crossDot.Color = col
                    crossDot.Visible = true
                elseif style == "Circle" then
                    crossCircle.Position = Vector2.new(midX, midY)
                    crossCircle.Radius = sz
                    crossCircle.Color = col
                    crossCircle.Thickness = th
                    crossCircle.Visible = true
                elseif style == "Spinning Circle" then
                    crossCircle.Position = Vector2.new(midX, midY)
                    crossCircle.Radius = sz
                    crossCircle.Color = col
                    crossCircle.Thickness = th
                    crossCircle.Visible = true
                    -- Add a mark on the circle
                    local markX = midX + sz * math.cos(rad)
                    local markY = midY + sz * math.sin(rad)
                    CrossLines[1].From = Vector2.new(markX, markY)
                    CrossLines[1].To = Vector2.new(markX + 4*math.cos(rad), markY + 4*math.sin(rad))
                    CrossLines[1].Color = col; CrossLines[1].Thickness = th + 1; CrossLines[1].Visible = true
                elseif style == "T-Shape" then
                    -- Top, Left, Right (no bottom)
                    local offsets = {
                        {Vector2.new(0, -(gap + sz)), Vector2.new(0, -gap)},
                        {Vector2.new(-(gap + sz), 0), Vector2.new(-gap, 0)},
                        {Vector2.new(gap + sz, 0), Vector2.new(gap, 0)}
                    }
                    for i, off in ipairs(offsets) do
                        local x1 = midX + (off[1].X * cos - off[1].Y * sin)
                        local y1 = midY + (off[1].X * sin + off[1].Y * cos)
                        local x2 = midX + (off[2].X * cos - off[2].Y * sin)
                        local y2 = midY + (off[2].X * sin + off[2].Y * cos)
                        CrossLines[i].From = Vector2.new(x1, y1); CrossLines[i].To = Vector2.new(x2, y2)
                        CrossLines[i].Color = col; CrossLines[i].Thickness = th; CrossLines[i].Visible = true
                        if C.Visual.CrossOutline then
                            CrossOutlines[i].From = Vector2.new(x1, y1); CrossOutlines[i].To = Vector2.new(x2, y2)
                            CrossOutlines[i].Thickness = th + 2; CrossOutlines[i].Visible = true
                        end
                    end
                elseif style == "Sniper Dot" then
                    crossDot.Position = Vector2.new(midX, midY)
                    crossDot.Radius = 2; crossDot.Color = col; crossDot.Visible = true
                    crossCircle.Position = Vector2.new(midX, midY)
                    crossCircle.Radius = sz; crossCircle.Color = col; crossCircle.Thickness = 1; crossCircle.Visible = true
                elseif style == "Diamond" then
                    local d = sz
                    local pts = {
                        {Vector2.new(0, -d), Vector2.new(d, 0)},
                        {Vector2.new(d, 0), Vector2.new(0, d)},
                        {Vector2.new(0, d), Vector2.new(-d, 0)},
                        {Vector2.new(-d, 0), Vector2.new(0, -d)}
                    }
                    for i, p in ipairs(pts) do
                        local x1 = midX + (p[1].X * cos - p[1].Y * sin)
                        local y1 = midY + (p[1].X * sin + p[1].Y * cos)
                        local x2 = midX + (p[2].X * cos - p[2].Y * sin)
                        local y2 = midY + (p[2].X * sin + p[2].Y * cos)
                        CrossLines[i].From = Vector2.new(x1, y1); CrossLines[i].To = Vector2.new(x2, y2)
                        CrossLines[i].Color = col; CrossLines[i].Thickness = th; CrossLines[i].Visible = true
                        if C.Visual.CrossOutline then
                            CrossOutlines[i].From = Vector2.new(x1, y1); CrossOutlines[i].To = Vector2.new(x2, y2)
                            CrossOutlines[i].Thickness = th + 2; CrossOutlines[i].Visible = true
                        end
                    end
                end
            else
                for i = 1, 8 do CrossLines[i].Visible = false; CrossOutlines[i].Visible = false end
                if crossDot then crossDot.Visible = false end
                if crossCircle then crossCircle.Visible = false end
            end
        end

        -- ===== MOVEMENT =====
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local hum = LocalPlayer.Character.Humanoid
            if C.Misc.SpeedBoost > 16 then hum.WalkSpeed = C.Misc.SpeedBoost end
            if C.Misc.HighJump > 50 then hum.JumpPower = C.Misc.HighJump end

            -- Fly
            local shouldFly = false
            if C.Misc.Fly then
                if C.Misc.FlyMode == "Always On" then shouldFly = true
                elseif C.Misc.FlyMode == "Hold" then shouldFly = UserInputService:IsKeyDown(C.Misc.FlyKey)
                elseif C.Misc.FlyMode == "Toggle" then shouldFly = toggleStates.fly
                elseif C.Misc.FlyMode == "Release" then shouldFly = not UserInputService:IsKeyDown(C.Misc.FlyKey)
                end
            end

            if shouldFly and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if not flyBV then
                    flyBV = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
                    flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                end
                local dir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
                if dir.Magnitude > 0 then dir = dir.Unit end
                flyBV.Velocity = dir * C.Misc.FlySpeed
            else
                if flyBV then flyBV:Destroy(); flyBV = nil end
            end

            -- Bunny Hop
            if C.Misc.BunnyHop then
                if hum:GetState() == Enum.HumanoidStateType.Landed or hum:GetState() == Enum.HumanoidStateType.Running then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end

            -- Low Gravity
            if C.Misc.LowGrav then Workspace.Gravity = C.Misc.GravVal end

            -- Troll: Spin
            if C.Troll.Spin and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(C.Troll.SpinSpeed), 0)
            end

            -- God Mode
            if C.Troll.GodMode then hum.Health = hum.MaxHealth end

            -- Big Head
            if C.Troll.BigHead and LocalPlayer.Character:FindFirstChild("Head") then
                local s = C.Troll.BigHeadSize
                LocalPlayer.Character.Head.Size = Vector3.new(s, s * 0.5, s * 0.5)
            end

            -- Invisible
            if C.Troll.Invisible then
                for _, p in pairs(LocalPlayer.Character:GetChildren()) do
                    if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 1 end
                end
            end

            -- Disable animations
            if C.Misc.DisableAnims then
                local animator = hum:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        track:Stop(0)
                    end
                end
            end
        end

        -- Freecam
        if FreecamActive and C.Misc.Freecam then
            Camera.CameraType = Enum.CameraType.Scriptable
            local dir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + freecamCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - freecamCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - freecamCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + freecamCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
            if dir.Magnitude > 0 then dir = dir.Unit end
            freecamCF = freecamCF + dir * C.Misc.FreecamSpeed * dt
            Camera.CFrame = freecamCF
        end

        -- 3rd Person
        if C.Misc.ThirdPerson and not FreecamActive then
            local shouldTP = false
            if C.Misc.TPMode == "Always On" then shouldTP = true
            elseif C.Misc.TPMode == "Hold" then shouldTP = UserInputService:IsKeyDown(C.Misc.TPKey)
            elseif C.Misc.TPMode == "Toggle" then shouldTP = toggleStates.thirdPerson
            end
            if shouldTP and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, -C.Misc.TPDist)
            else
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
                end
            end
        end

        -- World Visuals
        if C.Visual.Fullbright then
            Lighting.Ambient = Color3.fromRGB(255,255,255)
            Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
            Lighting.Brightness = 2
        end
        if C.Visual.NoFog then Lighting.FogEnd = 9e9 end
        if C.Visual.AmbientColor then Lighting.Ambient = C.Visual.AmbientVal end
        if C.Visual.FogColor then Lighting.FogColor = C.Visual.FogVal end

        -- HUD
        clockLabel.Visible = C.Misc.ClockHUD
        if C.Misc.ClockHUD then clockLabel.Text = os.date("%H:%M:%S") end

        fpsLabel.Visible = C.Misc.FPSCounter
        if C.Misc.FPSCounter then fpsLabel.Text = "FPS: " .. math.floor(1 / dt) end
    end))

    -- ===== STEPPED LOOPS =====
    -- NoClip
    AddConnection(RunService.Stepped:Connect(function()
        if C.Misc.NoClip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
            end
        end
    end))

    -- Highlight & Chams
    AddConnection(RunService.Heartbeat:Connect(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                -- Highlights
                local hl = p.Character:FindFirstChild("KarmaHL")
                if C.Visual.HighlightAll then
                    if not hl then hl = Instance.new("Highlight", p.Character); hl.Name = "KarmaHL" end
                    hl.FillColor = C.Visual.HighlightColor
                    hl.OutlineColor = Color3.fromRGB(255,255,255)
                elseif hl then hl:Destroy() end

                -- Chams
                if C.Visual.Chams then
                    for _, part in pairs(p.Character:GetChildren()) do
                        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                            local n = part.Name
                            local isLimb = n == "Head" or string.find(n, "Torso") or string.find(n, "Arm") or string.find(n, "Leg") or string.find(n, "Hand") or string.find(n, "Foot")
                            if isLimb and part.Transparency < 1 then
                                local ch = part:FindFirstChild("KarmaCham")
                                if not ch then
                                    ch = Instance.new("BoxHandleAdornment", part)
                                    ch.Name = "KarmaCham"; ch.ZIndex = 10
                                    ch.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
                                    ch.Adornee = part; ch.Transparency = 0.5
                                end
                                ch.Color3 = C.Visual.ChamsColor
                                ch.AlwaysOnTop = true
                            end
                        end
                    end
                else
                    for _, part in pairs(p.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local ch = part:FindFirstChild("KarmaCham")
                            if ch then ch:Destroy() end
                        end
                    end
                end
            end
        end

        -- Custom Sky
        if C.Visual.CustomSky then
            local sky = Lighting:FindFirstChildOfClass("Sky")
            if not sky then sky = Instance.new("Sky", Lighting) end
            sky.SkyboxBk = ""; sky.SkyboxDn = ""; sky.SkyboxFt = ""; sky.SkyboxLf = ""; sky.SkyboxRt = ""; sky.SkyboxUp = ""
            Lighting.Ambient = C.Visual.SkyColor
            Lighting.OutdoorAmbient = C.Visual.SkyColor
        end

        -- Weather Off
        if C.Visual.WeatherOff then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    local ln = string.lower(v.Name)
                    if string.find(ln, "rain") or string.find(ln, "snow") or string.find(ln, "weather") then
                        v.Enabled = false
                    end
                end
            end
        end

        -- Remove Textures
        if C.Visual.RemoveTextures then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Material ~= Enum.Material.SmoothPlastic then
                    v.Material = Enum.Material.SmoothPlastic
                end
            end
        end

        -- Neon World
        if C.Visual.NeonWorld then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Neon
                    v.Color = C.Visual.NeonColor
                end
            end
        end

        -- Follow Player
        if C.Troll.FollowPlayer and C.Troll.FollowTarget ~= "" then
            local t = Players:FindFirstChild(C.Troll.FollowTarget)
            if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
            end
        end

        -- Giant Mode
        if C.Troll.Giant and LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                local desc = hum:FindFirstChildOfClass("HumanoidDescription")
                if not desc then
                    desc = Instance.new("HumanoidDescription", hum)
                end
                -- Use BodyHeightScale as a simple approach
                pcall(function()
                    hum.HeadScale.Value = C.Troll.GiantSize
                    hum.BodyDepthScale.Value = C.Troll.GiantSize
                    hum.BodyHeightScale.Value = C.Troll.GiantSize
                    hum.BodyWidthScale.Value = C.Troll.GiantSize
                end)
            end
        end

        -- Rainbow
        if C.Troll.Rainbow and LocalPlayer.Character then
            local hue = (tick() * 0.5) % 1
            local col = Color3.fromHSV(hue, 1, 1)
            for _, p in pairs(LocalPlayer.Character:GetChildren()) do
                if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                    p.Color = col
                end
            end
        end
    end))

    -- Fake Lag
    local fakeLagTick = tick()
    local faking = false
    AddConnection(RunService.Heartbeat:Connect(function()
        if C.Troll.FakeLag and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if not faking and tick() - fakeLagTick > 0.3 then
                faking = true
                task.spawn(function()
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    task.wait(0.1)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    end
                    fakeLagTick = tick()
                    faking = false
                end)
            end
        end
    end))

    -- Dance Spam
    local danceAnim = Instance.new("Animation")
    local danceTrack = nil
    AddConnection(RunService.Heartbeat:Connect(function()
        if C.Troll.DanceSpam and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local emotes = {e1="rbxassetid://3333331810",e2="rbxassetid://3333331810",e3="rbxassetid://3333331810",point="rbxassetid://507770453",wave="rbxassetid://507770239",cheer="rbxassetid://507770677",laugh="rbxassetid://507770818"}
            local id = emotes[C.Troll.DanceEmote] or emotes.e1
            if not danceTrack or danceAnim.AnimationId ~= id then
                if danceTrack then danceTrack:Stop() end
                danceAnim.AnimationId = id
                danceTrack = LocalPlayer.Character.Humanoid:LoadAnimation(danceAnim)
                danceTrack.Looped = true
                danceTrack:Play()
            end
        else
            if danceTrack then danceTrack:Stop(); danceTrack = nil end
        end
    end))

    -- Chat Spam
    local lastChat = tick()
    AddConnection(RunService.Heartbeat:Connect(function()
        if C.Troll.ChatSpam and tick() - lastChat > C.Troll.ChatInterval then
            pcall(function()
                local msg = C.Troll.ChatMsg
                if C.Misc.ChatBypass then
                    -- Unicode substitution
                    local sub = {a="а",e="е",o="о",i="і",c="с",p="р"}
                    msg = msg:gsub(".", function(ch) return sub[ch] or ch end)
                end
                if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                    local ch = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
                    if ch then ch:SendAsync(msg) end
                else
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
                end
            end)
            lastChat = tick()
        end
    end))

    -- Lag Switch
    AddConnection(RunService.Heartbeat:Connect(function()
        if C.Misc.LagSwitch and UserInputService:IsKeyDown(C.Misc.LagKey) then
            -- Throttle network by flooding
            pcall(function()
                settings().Network.IncomingReplicationLag = 1
            end)
        else
            pcall(function()
                settings().Network.IncomingReplicationLag = 0
            end)
        end
    end))

    -- ========================
    -- LOADER CONNECTION
    -- ========================
    loadBtn.MouseButton1Click:Connect(function()
        loadBtn.Text = "Loading..."
        loadBtn.Active = false
        progressBg.Visible = true

        -- Animate progress bar over 2 seconds
        local tw = TweenService:Create(progressFill, TweenInfo.new(2, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
        tw:Play()
        tw.Completed:Connect(function()
            LoaderGui:Destroy()
            ScreenGui.Enabled = true
            switchTab("legit")
        end)
    end)

end)

if not pcallSuccess then
    warn("Karma.lol V2 error: " .. tostring(pcallError))
end
