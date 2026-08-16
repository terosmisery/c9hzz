local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function make(className, name, parent)
    local obj = Instance.new(className)
    obj.Name = name
    obj.Parent = parent
    return obj
end

local g1 = make("ScreenGui", "ScreenGui", playerGui)
g1.DisplayOrder = 999999999
g1.Enabled = true
g1.ResetOnSpawn = false
g1.ZIndexBehavior = Enum.ZIndexBehavior.Global

local g2 = make("Frame", "Main", g1)
g2.Active = false
g2.AnchorPoint = Vector2.new(0.5, 0.5)
g2.Position = UDim2.new(0.72080481, 0, 0.48252186, 0)
g2.Size = UDim2.new(0, 471, 0, 310)
g2.BackgroundColor3 = Color3.new(0.10196079, 0.10588235, 0.1254902)
g2.BackgroundTransparency = 0
g2.BorderColor3 = Color3.new(0.10588236, 0.16470589, 0.20784315)
g2.BorderSizePixel = 1
g2.ClipsDescendants = false
g2.Visible = true
g2.ZIndex = 1

local g3 = make("UIStroke", "UIStroke", g2)
g3.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
g3.BorderOffset = UDim.new(0, 0)
g3.BorderStrokePosition = Enum.BorderStrokePosition.Outer
g3.Color = Color3.new(0.38039216, 0.38039216, 0.38039216)
g3.Enabled = true
g3.LineJoinMode = Enum.LineJoinMode.None
g3.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
g3.Thickness = 1
g3.Transparency = 0.5

local g4 = make("Frame", "Executor", g2)
g4.Active = false
g4.Position = UDim2.new(0.073684208, 0, 0.11290322, 0)
g4.Size = UDim2.new(0, 440, 0, 275)
g4.BackgroundTransparency = 1
g4.BorderSizePixel = 0
g4.ClipsDescendants = false
g4.Visible = true
g4.ZIndex = 1

local g5 = make("Frame", "Editor", g4)
g5.Active = false
g5.Position = UDim2.new(-0.065259762, 0, 0.029847411, 0)
g5.Size = UDim2.new(0, 458, 0, 223)
g5.BackgroundColor3 = Color3.new(0.06666667, 0.074509807, 0.086274512)
g5.BackgroundTransparency = 0
g5.BorderSizePixel = 1
g5.ClipsDescendants = false
g5.Visible = true
g5.ZIndex = 1

local g6 = make("UIStroke", "UIStroke", g5)
g6.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
g6.BorderStrokePosition = Enum.BorderStrokePosition.Outer
g6.Color = Color3.new(0.38039219, 0.38039219, 0.38039219)
g6.Thickness = 1
g6.Transparency = 0.5

local g7 = make("UICorner", "UICorner", g5)
g7.CornerRadius = UDim.new(0, 6)

local g8 = make("ScrollingFrame", "EditorFrame", g5)
g8.Active = false
g8.Position = UDim2.new(0.014563148, 0, 0.022722732, 0)
g8.Size = UDim2.new(0, 448, 0, 217)
g8.BackgroundColor3 = Color3.new(0.06666667, 0.074509807, 0.086274512)
g8.BackgroundTransparency = 0
g8.BorderSizePixel = 0
g8.ClipsDescendants = true
g8.Visible = true
g8.ZIndex = 5
g8.CanvasPosition = Vector2.new(0, 0)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.new(1, 1, 1)
g8.ScrollBarImageTransparency = 0
g8.ScrollingDirection = Enum.ScrollingDirection.XY
g8.ScrollingEnabled = true

local g9 = make("TextLabel", "Lines", g8)
g9.BackgroundTransparency = 1
g9.Size = UDim2.new(0, 30, 1, 0)
g9.Visible = true
g9.ZIndex = 6
g9.FontFace = Font.new(
    "rbxasset://fonts/families/Inconsolata.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
)
g9.Text = "1"
g9.TextColor3 = Color3.new(1, 1, 1)
g9.TextSize = 15
g9.TextXAlignment = Enum.TextXAlignment.Right
g9.TextYAlignment = Enum.TextYAlignment.Top
g9.LineHeight = 1

local g10 = make("TextBox", "Source", g8)
g10.Active = true
g10.Position = UDim2.new(0, 30, 0, 0)
g10.Size = UDim2.new(0.91404009, 0, 1, 0)
g10.BackgroundTransparency = 1
g10.BorderSizePixel = 0
g10.Visible = true
g10.ZIndex = 5
g10.FontFace = Font.new(
    "rbxasset://fonts/families/Inconsolata.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
)
g10.Text = ""
g10.TextColor3 = Color3.new(0.80000007, 0.80000007, 0.80000007)
g10.TextSize = 15
g10.TextXAlignment = Enum.TextXAlignment.Left
g10.TextYAlignment = Enum.TextYAlignment.Top
g10.LineHeight = 1
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.PlaceholderText = "-- c9hzz backdoor"
g10.PlaceholderColor3 = Color3.new(0.80000001, 0.80000001, 0.80000001)
g10.TextEditable = true

local function makeHighlight(name, color, zindex)
    local label = make("TextLabel", name, g10)
    label.Active = false
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Visible = true
    label.ZIndex = zindex
    label.FontFace = Font.new(
        "rbxasset://fonts/families/Inconsolata.json",
        Enum.FontWeight.Regular,
        Enum.FontStyle.Normal
    )
    label.Text = ""
    label.TextColor3 = color
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.LineHeight = 1
    return label
end

local g11 = makeHighlight(
    "Comments_",
    Color3.new(0.23137257, 0.7843138, 0.23137257),
    5
)

local g12 = makeHighlight(
    "Globals_",
    Color3.new(0.51764709, 0.83921576, 0.96862751),
    5
)

local g13 = makeHighlight(
    "Keywords_",
    Color3.new(0.97254908, 0.42745101, 0.48627454),
    5
)

local g14 = makeHighlight(
    "RemoteHighlight_",
    Color3.new(0, 0.568627, 1),
    5
)

local g15 = makeHighlight(
    "Strings_",
    Color3.new(0.67843139, 0.9450981, 0.58431375),
    5
)

local g16 = makeHighlight(
    "Tokens_",
    Color3.new(1, 1, 1),
    5
)

local g17 = makeHighlight(
    "Numbers_",
    Color3.new(1, 0.77647066, 0),
    4
)

local function styleButton(button)
    button.Active = true
    button.BackgroundColor3 = Color3.new(
        0.06666667,
        0.074509807,
        0.086274512
    )
    button.BackgroundTransparency = 0
    button.BorderSizePixel = 1
    button.Visible = true
    button.ZIndex = 1
    button.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.Medium,
        Enum.FontStyle.Normal
    )
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 16
    button.TextTransparency = 0

    local corner = make("UICorner", "UICorner", button)
    corner.CornerRadius = UDim.new(0, 6)

    local stroke = make("UIStroke", "UIStroke", button)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    stroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
    stroke.Color = Color3.new(0.38039219, 0.38039219, 0.38039219)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
end

local g18 = make("TextButton", "ClearButton", g4)
g18.Position = UDim2.new(0.25392413, 0, 0.86377418, 0)
g18.Size = UDim2.new(0, 100, 0, 34)
g18.Text = "Clear"
g18.TextXAlignment = Enum.TextXAlignment.Right
g18.TextYAlignment = Enum.TextYAlignment.Center
styleButton(g18)

local g22 = make("TextButton", "ExecuteButton", g4)
g22.Position = UDim2.new(-0.060714304, 0, 0.86377418, 0)
g22.Size = UDim2.new(0, 130, 0, 33)
g22.Text = "Execute"
g22.TextXAlignment = Enum.TextXAlignment.Right
g22.TextYAlignment = Enum.TextYAlignment.Center
styleButton(g22)

local g31 = make("TextButton", "HideButton", g4)
g31.Position = UDim2.new(0.61697251, 0, 0.86013782, 0)
g31.Size = UDim2.new(0, 34, 0, 34)
g31.Text = ""
styleButton(g31)

local g34 = make("ImageLabel", "ImageLabel", g31)
g34.Active = false
g34.AnchorPoint = Vector2.new(0.5, 0.5)
g34.Position = UDim2.new(0.5, 0, 0.47058824, 0)
g34.Size = UDim2.new(0, 25, 0, 25)
g34.BackgroundTransparency = 1
g34.BorderSizePixel = 0
g34.Visible = true
g34.ZIndex = 10
g34.Image = "rbxassetid://3926307971"
g34.ImageColor3 = Color3.new(1, 1, 1)
g34.ImageTransparency = 0
g34.ImageRectOffset = Vector2.new(84, 44)
g34.ImageRectSize = Vector2.new(36, 36)
g34.ScaleType = Enum.ScaleType.Stretch

local g36 = make("TextButton", "R6Button", g4)
g36.Position = UDim2.new(0.89572698, 0, 0.86013782, 0)
g36.Size = UDim2.new(0, 34, 0, 34)
g36.Text = ""
styleButton(g36)

local g39 = make("ImageLabel", "ImageLabel", g36)
g39.Active = false
g39.AnchorPoint = Vector2.new(0.5, 0.5)
g39.Position = UDim2.new(0.5, 0, 0.5, 0)
g39.Size = UDim2.new(0, 27, 0, 27)
g39.BackgroundTransparency = 1
g39.BorderSizePixel = 0
g39.Visible = true
g39.ZIndex = 10
g39.Image = "rbxassetid://4941166750"
g39.ImageColor3 = Color3.new(1, 1, 1)
g39.ImageTransparency = 0
g39.ScaleType = Enum.ScaleType.Stretch

local g41 = make("TextButton", "REButton", g4)
g41.Position = UDim2.new(0.80460149, 0, 0.86013782, 0)
g41.Size = UDim2.new(0, 34, 0, 34)
g41.Text = ""
styleButton(g41)

local g44 = make("ImageLabel", "ImageLabel", g41)
g44.Active = false
g44.AnchorPoint = Vector2.new(0.5, 0.5)
g44.Position = UDim2.new(0.5, 0, 0.5, 0)
g44.Size = UDim2.new(0, 22, 0, 22)
g44.BackgroundTransparency = 1
g44.BorderSizePixel = 0
g44.Visible = true
g44.ZIndex = 10
g44.Image = "rbxassetid://7072721335"
g44.ImageColor3 = Color3.new(1, 1, 1)
g44.ImageTransparency = 0
g44.ScaleType = Enum.ScaleType.Stretch

local g48 = make("TextButton", "ShowButton", g4)
g48.Position = UDim2.new(0.61924505, 0, 0.86377418, 0)
g48.Size = UDim2.new(0, 33, 0, 32)
g48.Text = ""
g48.Visible = false
styleButton(g48)

local g52 = make("ImageLabel", "ImageLabel", g48)
g52.Active = false
g52.AnchorPoint = Vector2.new(0.5, 0.5)
g52.Position = UDim2.new(0.5, 0, 0.5, 0)
g52.Size = UDim2.new(0, 25, 0, 25)
g52.BackgroundTransparency = 1
g52.BorderSizePixel = 0
g52.Visible = true
g52.ZIndex = 10
g52.Image = "rbxassetid://3926307971"
g52.ImageColor3 = Color3.new(1, 1, 1)
g52.ImageTransparency = 0
g52.ImageRectOffset = Vector2.new(564, 44)
g52.ImageRectSize = Vector2.new(36, 36)
g52.ScaleType = Enum.ScaleType.Stretch

local g53 = make("ImageButton", "close", g4)
g53.Active = true
g53.Position = UDim2.new(0.91163582, 0, -0.10722523, 0)
g53.Size = UDim2.new(0, 24, 0, 24)
g53.BackgroundTransparency = 1
g53.BorderSizePixel = 0
g53.Visible = true
g53.ZIndex = 10
g53.Image = "rbxassetid://3926305904"
g53.ImageColor3 = Color3.new(1, 1, 1)
g53.ImageTransparency = 0
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)
g53.ScaleType = Enum.ScaleType.Stretch

local g55 = make("Frame", "Title", g4)
g55.Position = UDim2.new(-0.063737348, 0, -0.10545454, 0)
g55.Size = UDim2.new(0, 457, 0, 25)
g55.BackgroundColor3 = Color3.new(
    0.098039225,
    0.10196079,
    0.12156864
)
g55.BackgroundTransparency = 0
g55.BorderSizePixel = 1
g55.Visible = true
g55.ZIndex = 1

local g56 = make("UICorner", "UICorner", g55)
g56.CornerRadius = UDim.new(0, 6)

local g57 = make("UIStroke", "UIStroke", g55)
g57.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
g57.BorderStrokePosition = Enum.BorderStrokePosition.Outer
g57.Color = Color3.new(0.38039216, 0.38039216, 0.38039216)
g57.Thickness = 1
g57.Transparency = 0.5

local g58 = make("TextLabel", "Label", g55)
g58.Position = UDim2.new(0.13203573, 0, 0.22052246, 0)
g58.Size = UDim2.new(0, 138, 0, 11)
g58.BackgroundTransparency = 1
g58.BorderSizePixel = 0
g58.Visible = true
g58.ZIndex = 2
g58.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontWeight.Medium,
    Enum.FontStyle.Italic
)
g58.Text = " <font color=\"add8e6\">C9HZZ</font> - BACKDOOR & MORE"
g58.TextColor3 = Color3.new(1, 1, 1)
g58.TextSize = 18
g58.TextXAlignment = Enum.TextXAlignment.Right
g58.TextYAlignment = Enum.TextYAlignment.Center
g58.RichText = true

local g59 = make("TextButton", "REButton2", g4)
g59.Position = UDim2.new(0.70923853, 0, 0.85849577, 0)
g59.Size = UDim2.new(0, 34, 0, 34)
g59.Text = ""
g59.BorderColor3 = Color3.new(0.20784315, 0, 0)
styleButton(g59)

local g62 = make("ImageLabel", "RepeatIcon", g59)
g62.Active = false
g62.AnchorPoint = Vector2.new(0.5, 0.5)
g62.Position = UDim2.new(0.5, 0, 0.5, 0)
g62.Size = UDim2.new(0, 22, 0, 22)
g62.BackgroundTransparency = 1
g62.BorderSizePixel = 0
g62.Visible = true
g62.ZIndex = 10
g62.Image = "rbxassetid://10734933966"
g62.ImageColor3 = Color3.fromRGB(255, 255, 255)
g62.ImageTransparency = 0
g62.ImageRectOffset = Vector2.new(0, 0)
g62.ImageRectSize = Vector2.new(0, 0)
g62.ScaleType = Enum.ScaleType.Fit

-- Clear button
g18.MouseButton1Click:Connect(function()
    g10.Text = ""
end)

-- Close button
g53.MouseButton1Click:Connect(function()
    g1.Enabled = false
end)

-- Hide / show
g31.MouseButton1Click:Connect(function()
    g4.Visible = false
    g48.Visible = true
end)

g48.MouseButton1Click:Connect(function()
    g4.Visible = true
    g48.Visible = false
end)

return g1
