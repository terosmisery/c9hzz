-- Generated from SpunchBob Private Backdoor.rbxm
-- GUI hierarchy only; executable scripts/remotes were omitted.

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function make(className, name, parent)
	local obj = Instance.new(className)
	obj.Name = name
	obj.Parent = parent
	return obj
end

--// ScreenGui

local g1 = make("ScreenGui", "ScreenGui", playerGui)
g1.DisplayOrder = 999999999
g1.Enabled = true
g1.ResetOnSpawn = false
g1.ZIndexBehavior = Enum.ZIndexBehavior.Global

--// Main

local g2 = make("Frame", "Main", g1)
g2.Active = false
g2.AnchorPoint = Vector2.new(0.5, 0.5)
g2.Position = UDim2.new(0.5, 0, 0.5, 0)
g2.Size = UDim2.new(0, 471, 0, 310)
g2.BackgroundColor3 = Color3.fromRGB(26, 27, 32)
g2.BackgroundTransparency = 0
g2.BorderSizePixel = 1
g2.ClipsDescendants = false
g2.Visible = true
g2.ZIndex = 10

local g3 = make("UIStroke", "UIStroke", g2)
g3.Color = Color3.fromRGB(97, 97, 97)
g3.Thickness = 1
g3.Transparency = 0.5

local g67 = make("UICorner", "UICorner", g2)
g67.CornerRadius = UDim.new(0, 6)

--// Executor container

local g4 = make("Frame", "Executor", g2)
g4.Active = false
g4.Position = UDim2.new(0, 0, 0, 25)
g4.Size = UDim2.new(1, 0, 1, -25)
g4.BackgroundTransparency = 1
g4.BorderSizePixel = 0
g4.ZIndex = 11

--// Editor

local g5 = make("Frame", "Editor", g4)
g5.Active = false
g5.Position = UDim2.new(0, 7, 0, 8)
g5.Size = UDim2.new(1, -14, 0, 223)
g5.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g5.BackgroundTransparency = 0
g5.BorderSizePixel = 1
g5.ClipsDescendants = false
g5.ZIndex = 12

local g6 = make("UIStroke", "UIStroke", g5)
g6.Color = Color3.fromRGB(97, 97, 97)
g6.Thickness = 1
g6.Transparency = 0.5

local g7 = make("UICorner", "UICorner", g5)
g7.CornerRadius = UDim.new(0, 6)

--// Scrolling editor

local g8 = make("ScrollingFrame", "EditorFrame", g5)
g8.Active = true
g8.Position = UDim2.new(0, 5, 0, 5)
g8.Size = UDim2.new(1, -10, 1, -10)
g8.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g8.BackgroundTransparency = 0
g8.BorderSizePixel = 0
g8.ClipsDescendants = true
g8.Visible = true
g8.ZIndex = 13
g8.CanvasPosition = Vector2.new(0, 0)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.new(1, 1, 1)
g8.ScrollBarImageTransparency = 0
g8.ScrollingDirection = Enum.ScrollingDirection.XY
g8.ScrollingEnabled = true
g8.AutomaticCanvasSize = Enum.AutomaticSize.XY

--// Line numbers

local g9 = make("TextLabel", "Lines", g8)
g9.Active = false
g9.Position = UDim2.new(0, 0, 0, 0)
g9.Size = UDim2.new(0, 30, 1, 0)
g9.BackgroundTransparency = 1
g9.BorderSizePixel = 0
g9.ZIndex = 14
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
g9.RichText = false

--// Source textbox

local g10 = make("TextBox", "Source", g8)
g10.Active = true
g10.Position = UDim2.new(0, 30, 0, 0)
g10.Size = UDim2.new(1, -30, 1, 0)
g10.BackgroundTransparency = 1
g10.BorderSizePixel = 0
g10.ClipsDescendants = false
g10.ZIndex = 15
g10.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
g10.Text = ""
g10.TextColor3 = Color3.fromRGB(204, 204, 204)
g10.TextSize = 15
g10.TextXAlignment = Enum.TextXAlignment.Left
g10.TextYAlignment = Enum.TextYAlignment.Top
g10.RichText = false
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.PlaceholderText = "-- boi what the helly 67"
g10.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
g10.TextEditable = true

--// Syntax highlighting layers

local g11 = make("TextLabel", "Comments_", g10)
g11.Active = false
g11.Position = UDim2.new(0, 0, 0, 0)
g11.Size = UDim2.new(1, 0, 1, 0)
g11.BackgroundTransparency = 1
g11.BorderSizePixel = 0
g11.ZIndex = 16
g11.FontFace = g10.FontFace
g11.Text = ""
g11.TextColor3 = Color3.fromRGB(59, 200, 59)
g11.TextSize = 15
g11.TextXAlignment = Enum.TextXAlignment.Left
g11.TextYAlignment = Enum.TextYAlignment.Top

local g12 = make("TextLabel", "Globals_", g10)
g12.Active = false
g12.Position = UDim2.new(0, 0, 0, 0)
g12.Size = UDim2.new(1, 0, 1, 0)
g12.BackgroundTransparency = 1
g12.BorderSizePixel = 0
g12.ZIndex = 16
g12.FontFace = g10.FontFace
g12.Text = ""
g12.TextColor3 = Color3.fromRGB(132, 214, 247)
g12.TextSize = 15
g12.TextXAlignment = Enum.TextXAlignment.Left
g12.TextYAlignment = Enum.TextYAlignment.Top

local g13 = make("TextLabel", "Keywords_", g10)
g13.Active = false
g13.Position = UDim2.new(0, 0, 0, 0)
g13.Size = UDim2.new(1, 0, 1, 0)
g13.BackgroundTransparency = 1
g13.BorderSizePixel = 0
g13.ZIndex = 16
g13.FontFace = g10.FontFace
g13.Text = ""
g13.TextColor3 = Color3.fromRGB(248, 109, 124)
g13.TextSize = 15
g13.TextXAlignment = Enum.TextXAlignment.Left
g13.TextYAlignment = Enum.TextYAlignment.Top

local g14 = make("TextLabel", "RemoteHighlight_", g10)
g14.Active = false
g14.Position = UDim2.new(0, 0, 0, 0)
g14.Size = UDim2.new(1, 0, 1, 0)
g14.BackgroundTransparency = 1
g14.BorderSizePixel = 0
g14.ZIndex = 16
g14.FontFace = g10.FontFace
g14.Text = ""
g14.TextColor3 = Color3.fromRGB(0, 145, 255)
g14.TextSize = 15
g14.TextXAlignment = Enum.TextXAlignment.Left
g14.TextYAlignment = Enum.TextYAlignment.Top

local g15 = make("TextLabel", "Strings_", g10)
g15.Active = false
g15.Position = UDim2.new(0, 0, 0, 0)
g15.Size = UDim2.new(1, 0, 1, 0)
g15.BackgroundTransparency = 1
g15.BorderSizePixel = 0
g15.ZIndex = 16
g15.FontFace = g10.FontFace
g15.Text = ""
g15.TextColor3 = Color3.fromRGB(173, 241, 149)
g15.TextSize = 15
g15.TextXAlignment = Enum.TextXAlignment.Left
g15.TextYAlignment = Enum.TextYAlignment.Top

local g16 = make("TextLabel", "Tokens_", g10)
g16.Active = false
g16.Position = UDim2.new(0, 0, 0, 0)
g16.Size = UDim2.new(1, 0, 1, 0)
g16.BackgroundTransparency = 1
g16.BorderSizePixel = 0
g16.ZIndex = 16
g16.FontFace = g10.FontFace
g16.Text = ""
g16.TextColor3 = Color3.new(1, 1, 1)
g16.TextSize = 15
g16.TextXAlignment = Enum.TextXAlignment.Left
g16.TextYAlignment = Enum.TextYAlignment.Top

local g17 = make("TextLabel", "Numbers_", g10)
g17.Active = false
g17.Position = UDim2.new(0, 0, 0, 0)
g17.Size = UDim2.new(1, 0, 1, 0)
g17.BackgroundTransparency = 1
g17.BorderSizePixel = 0
g17.ZIndex = 16
g17.FontFace = g10.FontFace
g17.Text = ""
g17.TextColor3 = Color3.fromRGB(255, 198, 0)
g17.TextSize = 15
g17.TextXAlignment = Enum.TextXAlignment.Left
g17.TextYAlignment = Enum.TextYAlignment.Top

--// Clear

local g18 = make("TextButton", "ClearButton", g4)
g18.Active = true
g18.Position = UDim2.new(0.25, 0, 0, 240)
g18.Size = UDim2.new(0, 100, 0, 34)
g18.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g18.BackgroundTransparency = 0
g18.BorderSizePixel = 1
g18.ZIndex = 20
g18.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g18.Text = "Clear"
g18.TextColor3 = Color3.new(1, 1, 1)
g18.TextSize = 16
g18.TextXAlignment = Enum.TextXAlignment.Center
g18.TextYAlignment = Enum.TextYAlignment.Center

local g19 = make("UICorner", "UICorner", g18)
g19.CornerRadius = UDim.new(0, 6)

local g20 = make("UIStroke", "UIStroke", g18)
g20.Color = Color3.fromRGB(97, 97, 97)
g20.Thickness = 1
g20.Transparency = 0.5

--// Execute

local g22 = make("TextButton", "ExecuteButton", g4)
g22.Active = true
g22.Position = UDim2.new(0.03, 0, 0, 240)
g22.Size = UDim2.new(0, 130, 0, 33)
g22.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g22.BackgroundTransparency = 0
g22.BorderSizePixel = 1
g22.ZIndex = 20
g22.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g22.Text = "Execute"
g22.TextColor3 = Color3.new(1, 1, 1)
g22.TextSize = 16
g22.TextXAlignment = Enum.TextXAlignment.Center
g22.TextYAlignment = Enum.TextYAlignment.Center

local g23 = make("UICorner", "UICorner", g22)
g23.CornerRadius = UDim.new(0, 6)

local g24 = make("UIStroke", "UIStroke", g22)
g24.Color = Color3.fromRGB(97, 97, 97)
g24.Thickness = 1
g24.Transparency = 0.5

--// Hide

local g31 = make("TextButton", "HideButton", g4)
g31.Active = true
g31.Position = UDim2.new(0.617, 0, 0, 240)
g31.Size = UDim2.new(0, 34, 0, 34)
g31.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g31.BorderSizePixel = 1
g31.ZIndex = 20
g31.Text = ""
g31.AutoButtonColor = true

local g32 = make("UICorner", "UICorner", g31)
g32.CornerRadius = UDim.new(0, 6)

local g33 = make("UIStroke", "UIStroke", g31)
g33.Color = Color3.fromRGB(97, 97, 97)
g33.Thickness = 1
g33.Transparency = 0.5

local g34 = make("ImageLabel", "ImageLabel", g31)
g34.Active = false
g34.AnchorPoint = Vector2.new(0.5, 0.5)
g34.Position = UDim2.new(0.5, 0, 0.5, 0)
g34.Size = UDim2.new(0, 25, 0, 25)
g34.BackgroundTransparency = 1
g34.ZIndex = 21
g34.Image = "rbxassetid://3926307971"
g34.ImageColor3 = Color3.new(1, 1, 1)
g34.ImageRectOffset = Vector2.new(84, 44)
g34.ImageRectSize = Vector2.new(36, 36)

--// R6

local g36 = make("TextButton", "R6Button", g4)
g36.Active = true
g36.Position = UDim2.new(0.896, 0, 0, 240)
g36.Size = UDim2.new(0, 34, 0, 34)
g36.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g36.BorderSizePixel = 1
g36.ZIndex = 20
g36.Text = ""

local g37 = make("UICorner", "UICorner", g36)
g37.CornerRadius = UDim.new(0, 6)

local g38 = make("UIStroke", "UIStroke", g36)
g38.Color = Color3.fromRGB(97, 97, 97)
g38.Thickness = 1
g38.Transparency = 0.5

local g39 = make("ImageLabel", "ImageLabel", g36)
g39.Active = false
g39.AnchorPoint = Vector2.new(0.5, 0.5)
g39.Position = UDim2.new(0.5, 0, 0.5, 0)
g39.Size = UDim2.new(0, 27, 0, 27)
g39.BackgroundTransparency = 1
g39.ZIndex = 21
g39.Image = "rbxassetid://4941166750"

--// RE button

local g41 = make("TextButton", "REButton", g4)
g41.Active = true
g41.Position = UDim2.new(0.805, 0, 0, 240)
g41.Size = UDim2.new(0, 34, 0, 34)
g41.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g41.BorderSizePixel = 1
g41.ZIndex = 20
g41.Text = ""

local g42 = make("UICorner", "UICorner", g41)
g42.CornerRadius = UDim.new(0, 6)

local g43 = make("UIStroke", "UIStroke", g41)
g43.Color = Color3.fromRGB(97, 97, 97)
g43.Thickness = 1
g43.Transparency = 0.5

local g44 = make("ImageLabel", "ImageLabel", g41)
g44.Active = false
g44.AnchorPoint = Vector2.new(0.5, 0.5)
g44.Position = UDim2.new(0.5, 0, 0.5, 0)
g44.Size = UDim2.new(0, 22, 0, 22)
g44.BackgroundTransparency = 1
g44.ZIndex = 21
g44.Image = "rbxassetid://7072721335"

--// Show

local g48 = make("TextButton", "ShowButton", g4)
g48.Active = true
g48.Position = UDim2.new(0.619, 0, 0, 240)
g48.Size = UDim2.new(0, 33, 0, 32)
g48.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g48.BorderSizePixel = 1
g48.ZIndex = 20
g48.Visible = false
g48.Text = ""

local g49 = make("UICorner", "UICorner", g48)
g49.CornerRadius = UDim.new(0, 6)

local g50 = make("UIStroke", "UIStroke", g48)
g50.Color = Color3.fromRGB(97, 97, 97)
g50.Thickness = 1
g50.Transparency = 0.5

local g52 = make("ImageLabel", "ImageLabel", g48)
g52.Active = false
g52.AnchorPoint = Vector2.new(0.5, 0.5)
g52.Position = UDim2.new(0.5, 0, 0.5, 0)
g52.Size = UDim2.new(0, 25, 0, 25)
g52.BackgroundTransparency = 1
g52.ZIndex = 21
g52.Image = "rbxassetid://3926307971"
g52.ImageRectOffset = Vector2.new(564, 44)
g52.ImageRectSize = Vector2.new(36, 36)

--// Close

local g53 = make("ImageButton", "close", g4)
g53.Active = true
g53.AnchorPoint = Vector2.new(1, 0)
g53.Position = UDim2.new(1, -5, 0, -20)
g53.Size = UDim2.new(0, 24, 0, 24)
g53.BackgroundTransparency = 1
g53.BorderSizePixel = 0
g53.ZIndex = 30
g53.Image = "rbxassetid://3926305904"
g53.ImageColor3 = Color3.new(1, 1, 1)
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)

--// Title

local g55 = make("Frame", "Title", g4)
g55.Active = false
g55.Position = UDim2.new(0, 7, 0, -25)
g55.Size = UDim2.new(1, -14, 0, 25)
g55.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
g55.BackgroundTransparency = 0
g55.BorderSizePixel = 1
g55.ZIndex = 20

local g56 = make("UICorner", "UICorner", g55)
g56.CornerRadius = UDim.new(0, 6)

local g57 = make("UIStroke", "UIStroke", g55)
g57.Color = Color3.fromRGB(97, 97, 97)
g57.Thickness = 1
g57.Transparency = 0.5

local g58 = make("TextLabel", "Label", g55)
g58.Active = false
g58.Position = UDim2.new(0, 12, 0, 0)
g58.Size = UDim2.new(1, -50, 1, 0)
g58.BackgroundTransparency = 1
g58.BorderSizePixel = 0
g58.ZIndex = 21
g58.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Italic
)
g58.Text = '<font color="#f7f30a">Spunchbub</font> - Private Backdoor'
g58.TextColor3 = Color3.new(1, 1, 1)
g58.TextSize = 18
g58.TextXAlignment = Enum.TextXAlignment.Left
g58.TextYAlignment = Enum.TextYAlignment.Center
g58.RichText = true

--// Additional RE button

local g59 = make("TextButton", "REButton2", g4)
g59.Active = true
g59.Position = UDim2.new(0.709, 0, 0, 240)
g59.Size = UDim2.new(0, 34, 0, 34)
g59.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g59.BorderSizePixel = 1
g59.ZIndex = 20
g59.Text = ""

local g60 = make("UICorner", "UICorner", g59)
g60.CornerRadius = UDim.new(0, 6)

local g61 = make("UIStroke", "UIStroke", g59)
g61.Color = Color3.fromRGB(97, 97, 97)
g61.Thickness = 1
g61.Transparency = 0.5

local g62 = make("ImageLabel", "ImageLabel", g59)
g62.Active = false
g62.AnchorPoint = Vector2.new(0.5, 0.5)
g62.Position = UDim2.new(0.5, 0, 0.5, 0)
g62.Size = UDim2.new(0, 22, 0, 22)
g62.BackgroundTransparency = 1
g62.ZIndex = 21
g62.Image = "rbxassetid://10734933966"

--// Functional GUI-only controls

g18.MouseButton1Click:Connect(function()
	g10.Text = ""
	g9.Text = "1"
end)

g31.MouseButton1Click:Connect(function()
	g2.Visible = false
	g48.Visible = true
end)

g48.MouseButton1Click:Connect(function()
	g2.Visible = true
	g48.Visible = false
end)

g53.MouseButton1Click:Connect(function()
	g1:Destroy()
end)

return true
