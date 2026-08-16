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
g2.AnchorPoint = Vector2.new(0.5, 0.5)
g2.Position = UDim2.new(0.72080481, 0, 0.48252186, 0)
g2.Size = UDim2.new(0, 471, 0, 310)
g2.BackgroundColor3 = Color3.new(0.10196079, 0.10588235, 0.1254902)
g2.BorderColor3 = Color3.new(0.10588236, 0.16470589, 0.20784315)
g2.BorderSizePixel = 1
g2.ZIndex = 1

local g3 = make("UIStroke", "UIStroke", g2)
g3.Color = Color3.new(0.38039216, 0.38039216, 0.38039216)
g3.Thickness = 1
g3.Transparency = 0.5

local g4 = make("Frame", "Executor", g2)
g4.Position = UDim2.new(0.073684208, 0, 0.11290322, 0)
g4.Size = UDim2.new(0, 440, 0, 275)
g4.BackgroundTransparency = 1
g4.ClipsDescendants = false

local g5 = make("Frame", "Editor", g4)
g5.Position = UDim2.new(-0.065259762, 0, 0.029847411, 0)
g5.Size = UDim2.new(0, 458, 0, 223)
g5.BackgroundColor3 = Color3.new(0.06666667, 0.074509807, 0.086274512)
g5.BorderSizePixel = 1

local g6 = make("UIStroke", "UIStroke", g5)
g6.Color = Color3.new(0.38039219, 0.38039219, 0.38039219)
g6.Thickness = 1
g6.Transparency = 0.5

local g7 = make("UICorner", "UICorner", g5)
g7.CornerRadius = UDim.new(0, 6)

local g8 = make("ScrollingFrame", "EditorFrame", g5)
g8.Position = UDim2.new(0.014563148, 0, 0.022722732, 0)
g8.Size = UDim2.new(0, 448, 0, 217)
g8.BackgroundColor3 = Color3.new(0.06666667, 0.074509807, 0.086274512)
g8.BorderSizePixel = 0
g8.ZIndex = 5
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.new(1, 1, 1)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)

local function textStyle(obj)
    obj.FontFace = Font.new(
        "rbxasset://fonts/families/Inconsolata.json",
        Enum.FontWeight.Regular,
        Enum.FontStyle.Normal
    )
    obj.TextSize = 15
    obj.TextXAlignment = Enum.TextXAlignment.Left
    obj.TextYAlignment = Enum.TextYAlignment.Top
    obj.LineHeight = 1
    obj.BackgroundTransparency = 1
end

local g9 = make("TextLabel", "Lines", g8)
g9.Size = UDim2.new(0, 30, 1, 0)
g9.ZIndex = 6
g9.Text = "1"
g9.TextColor3 = Color3.new(1, 1, 1)
g9.TextXAlignment = Enum.TextXAlignment.Right
g9.TextYAlignment = Enum.TextYAlignment.Top
textStyle(g9)

local g10 = make("TextBox", "Source", g8)
g10.Position = UDim2.new(0, 30, 0, 0)
g10.Size = UDim2.new(0.91404009, 0, 1, 0)
g10.ZIndex = 5
g10.Text = ""
g10.TextColor3 = Color3.new(0.80000007, 0.80000007, 0.80000007)
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.PlaceholderText = "-- c9hzz backdoor"
g10.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
g10.TextEditable = true
textStyle(g10)

local function highlight(name, color, z)
    local x = make("TextLabel", name, g10)
    x.Size = UDim2.new(1, 0, 1, 0)
    x.ZIndex = z
    x.Text = ""
    x.TextColor3 = color
    textStyle(x)
    return x
end

local g11 = highlight("Comments_", Color3.new(0.23137257, 0.7843138, 0.23137257), 5)
local g12 = highlight("Globals_", Color3.new(0.51764709, 0.83921576, 0.96862751), 5)
local g13 = highlight("Keywords_", Color3.new(0.97254908, 0.42745101, 0.48627454), 5)
local g14 = highlight("RemoteHighlight_", Color3.new(0, 0.568627, 1), 5)
local g15 = highlight("Strings_", Color3.new(0.67843139, 0.9450981, 0.58431375), 5)
local g16 = highlight("Tokens_", Color3.new(1, 1, 1), 5)
local g17 = highlight("Numbers_", Color3.new(1, 0.77647066, 0), 4)

local function button(name, position, size, text)
    local b = make("TextButton", name, g4)
    b.Position = position
    b.Size = size
    b.BackgroundColor3 = Color3.new(0.06666667, 0.074509807, 0.086274512)
    b.BorderSizePixel = 1
    b.Text = text
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 16
    b.FontFace = Font.new(
        "rbxasset://fonts/families/GothamSSm.json",
        Enum.FontWeight.Medium,
        Enum.FontStyle.Normal
    )

    local c = make("UICorner", "UICorner", b)
    c.CornerRadius = UDim.new(0, 6)

    local s = make("UIStroke", "UIStroke", b)
    s.Color = Color3.new(0.38039219, 0.38039219, 0.38039219)
    s.Thickness = 1
    s.Transparency = 0.5

    return b
end

local g18 = button(
    "ClearButton",
    UDim2.new(0.25392413, 0, 0.86377418, 0),
    UDim2.new(0, 100, 0, 34),
    "Clear"
)

local g22 = button(
    "ExecuteButton",
    UDim2.new(-0.060714304, 0, 0.86377418, 0),
    UDim2.new(0, 130, 0, 33),
    "Execute"
)

local g31 = button(
    "HideButton",
    UDim2.new(0.61697251, 0, 0.86013782, 0),
    UDim2.new(0, 34, 0, 34),
    ""
)

local g34 = make("ImageLabel", "ImageLabel", g31)
g34.AnchorPoint = Vector2.new(0.5, 0.5)
g34.Position = UDim2.new(0.5, 0, 0.47058824, 0)
g34.Size = UDim2.new(0, 25, 0, 25)
g34.BackgroundTransparency = 1
g34.ZIndex = 10
g34.Image = "rbxassetid://3926307971"
g34.ImageColor3 = Color3.new(1, 1, 1)
g34.ImageRectOffset = Vector2.new(84, 44)
g34.ImageRectSize = Vector2.new(36, 36)

local g36 = button(
    "R6Button",
    UDim2.new(0.89572698, 0, 0.86013782, 0),
    UDim2.new(0, 34, 0, 34),
    ""
)

local g39 = make("ImageLabel", "ImageLabel", g36)
g39.AnchorPoint = Vector2.new(0.5, 0.5)
g39.Position = UDim2.new(0.5, 0, 0.5, 0)
g39.Size = UDim2.new(0, 27, 0, 27)
g39.BackgroundTransparency = 1
g39.ZIndex = 10
g39.Image = "rbxassetid://4941166750"

local g41 = button(
    "REButton",
    UDim2.new(0.80460149, 0, 0.86013782, 0),
    UDim2.new(0, 34, 0, 34),
    ""
)

local g44 = make("ImageLabel", "ImageLabel", g41)
g44.AnchorPoint = Vector2.new(0.5, 0.5)
g44.Position = UDim2.new(0.5, 0, 0.5, 0)
g44.Size = UDim2.new(0, 22, 0, 22)
g44.BackgroundTransparency = 1
g44.ZIndex = 10
g44.Image = "rbxassetid://7072721335"

local g48 = button(
    "ShowButton",
    UDim2.new(0.61924505, 0, 0.86377418, 0),
    UDim2.new(0, 33, 0, 32),
    ""
)
g48.Visible = false

local g52 = make("ImageLabel", "ImageLabel", g48)
g52.AnchorPoint = Vector2.new(0.5, 0.5)
g52.Position = UDim2.new(0.5, 0, 0.5, 0)
g52.Size = UDim2.new(0, 25, 0, 25)
g52.BackgroundTransparency = 1
g52.ZIndex = 10
g52.Image = "rbxassetid://3926307971"
g52.ImageRectOffset = Vector2.new(564, 44)
g52.ImageRectSize = Vector2.new(36, 36)

local g53 = make("ImageButton", "close", g4)
g53.Position = UDim2.new(0.91163582, 0, -0.10722523, 0)
g53.Size = UDim2.new(0, 24, 0, 24)
g53.BackgroundTransparency = 1
g53.ZIndex = 10
g53.Image = "rbxassetid://3926305904"
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)

local g55 = make("Frame", "Title", g4)
g55.Position = UDim2.new(-0.063737348, 0, -0.10545454, 0)
g55.Size = UDim2.new(0, 457, 0, 25)
g55.BackgroundColor3 = Color3.new(0.098039225, 0.10196079, 0.12156864)
g55.BorderSizePixel = 1

local g56 = make("UICorner", "UICorner", g55)
g56.CornerRadius = UDim.new(0, 6)

local g57 = make("UIStroke", "UIStroke", g55)
g57.Color = Color3.new(0.38039216, 0.38039216, 0.38039216)
g57.Thickness = 1
g57.Transparency = 0.5

local g58 = make("TextLabel", "Label", g55)
g58.Position = UDim2.new(0.13203573, 0, 0.22052246, 0)
g58.Size = UDim2.new(0, 138, 0, 11)
g58.BackgroundTransparency = 1
g58.ZIndex = 2
g58.FontFace = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontWeight.Medium,
    Enum.FontStyle.Italic
)
g58.Text = ' <font color="add8e6">C9HZZ</font> - BACKDOOR & MORE'
g58.TextColor3 = Color3.new(1, 1, 1)
g58.TextSize = 18
g58.RichText = true

local g59 = button(
    "REButton2",
    UDim2.new(0.70923853, 0, 0.85849577, 0),
    UDim2.new(0, 34, 0, 34),
    ""
)

g59.BorderColor3 = Color3.new(0.20784315, 0, 0)

-- g62 is intentionally kept.
local g62 = make("ImageLabel", "ImageLabel", g59)
g62.Active = false
g62.AnchorPoint = Vector2.new(0.5, 0.5)
g62.Position = UDim2.new(0.5, 0, 0.5, 0)
g62.Size = UDim2.new(0, 22, 0, 22)
g62.Rotation = 0
g62.BackgroundColor3 = Color3.new(1, 1, 1)
g62.BackgroundTransparency = 1
g62.BorderColor3 = Color3.new(0.10588236, 0.16470589, 0.20784315)
g62.BorderSizePixel = 1
g62.ClipsDescendants = false
g62.LayoutOrder = 0
g62.Visible = true
g62.ZIndex = 10
g62.Image = "rbxassetid://10734933966"
g62.ImageColor3 = Color3.new(1, 1, 1)
g62.ImageTransparency = 0
g62.ImageRectOffset = Vector2.new(0, 0)
g62.ImageRectSize = Vector2.new(0, 0)
g62.ScaleType = Enum.ScaleType.Stretch
g62.SliceCenter = Rect.new(0, 0, 0, 0)
g62.SliceScale = 1
g62.TileSize = UDim2.new(1, 0, 1, 0)

-- g66 has deliberately been removed.
-- There is no large ImageLabel overlay here.

local g67 = make("UICorner", "UICorner", g2)
g67.CornerRadius = UDim.new(0, 6)

g18.MouseButton1Click:Connect(function()
    g10.Text = ""
end)

g53.MouseButton1Click:Connect(function()
    g1.Enabled = false
end)

g31.MouseButton1Click:Connect(function()
    g4.Visible = false
    g48.Visible = true
end)

g48.MouseButton1Click:Connect(function()
    g4.Visible = true
    g48.Visible = false
end)

return g1
