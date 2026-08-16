local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function make(className, name, parent)
	local obj = Instance.new(className)
	obj.Name = name
	obj.Parent = parent
	return obj
end

local function corner(parent, radius)
	local c = make("UICorner", "UICorner", parent)
	c.CornerRadius = UDim.new(0, radius)
	return c
end

local function stroke(parent)
	local s = make("UIStroke", "UIStroke", parent)
	s.Color = Color3.fromRGB(97, 97, 97)
	s.Thickness = 1
	s.Transparency = 0.5
	return s
end

local function button(parent, name, position, size)
	local b = make("TextButton", name, parent)
	b.Active = true
	b.Position = position
	b.Size = size
	b.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	b.BackgroundTransparency = 0
	b.BorderSizePixel = 1
	b.ZIndex = 30
	b.Text = ""
	b.AutoButtonColor = true
	corner(b, 6)
	stroke(b)
	return b
end

--// ScreenGui

local g1 = make("ScreenGui", "ScreenGui", playerGui)
g1.DisplayOrder = 999999999
g1.Enabled = true
g1.ResetOnSpawn = false
g1.ZIndexBehavior = Enum.ZIndexBehavior.Global

--// Main

local g2 = make("Frame", "Main", g1)
g2.AnchorPoint = Vector2.new(0.5, 0.5)
g2.Position = UDim2.new(0.5, 0, 0.5, 0)
g2.Size = UDim2.new(0, 620, 0, 350)
g2.BackgroundColor3 = Color3.fromRGB(26, 27, 32)
g2.BorderSizePixel = 1
g2.ClipsDescendants = true
g2.Visible = true
g2.ZIndex = 10

corner(g2, 8)
stroke(g2)

--// Top bar
-- Stretches across the entire window, including sidebar.

local g55 = make("Frame", "Title", g2)
g55.Position = UDim2.new(0, 0, 0, 0)
g55.Size = UDim2.new(1, 0, 0, 34)
g55.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
g55.BorderSizePixel = 0
g55.ZIndex = 50

local topBottom = make("Frame", "BottomLine", g55)
topBottom.Position = UDim2.new(0, 0, 1, -1)
topBottom.Size = UDim2.new(1, 0, 0, 1)
topBottom.BackgroundColor3 = Color3.fromRGB(55, 56, 62)
topBottom.BorderSizePixel = 0
topBottom.ZIndex = 51

local g58 = make("TextLabel", "Label", g55)
g58.Position = UDim2.new(0, 14, 0, 0)
g58.Size = UDim2.new(1, -70, 1, 0)
g58.BackgroundTransparency = 1
g58.ZIndex = 52
g58.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Italic
)
g58.Text = '<font color="#add8e6">C9HZZ</font> - BACKDOOR & MORE'
g58.TextColor3 = Color3.new(1, 1, 1)
g58.TextSize = 17
g58.TextXAlignment = Enum.TextXAlignment.Left
g58.TextYAlignment = Enum.TextYAlignment.Center
g58.RichText = true

--// Green status indicator

local statusGlow = make("Frame", "StatusGlow", g55)
statusGlow.AnchorPoint = Vector2.new(1, 0.5)
statusGlow.Position = UDim2.new(1, -38, 0.5, 0)
statusGlow.Size = UDim2.new(0, 20, 0, 20)
statusGlow.BackgroundColor3 = Color3.fromRGB(40, 255, 100)
statusGlow.BackgroundTransparency = 0.82
statusGlow.BorderSizePixel = 0
statusGlow.ZIndex = 52
corner(statusGlow, 20)

local status = make("Frame", "Status", g55)
status.AnchorPoint = Vector2.new(1, 0.5)
status.Position = UDim2.new(1, -40, 0.5, 0)
status.Size = UDim2.new(0, 10, 0, 10)
status.BackgroundColor3 = Color3.fromRGB(55, 255, 100)
status.BorderSizePixel = 0
status.ZIndex = 53
corner(status, 20)

--// Close

local g53 = make("ImageButton", "close", g55)
g53.AnchorPoint = Vector2.new(1, 0.5)
g53.Position = UDim2.new(1, -8, 0.5, 0)
g53.Size = UDim2.new(0, 20, 0, 20)
g53.BackgroundTransparency = 1
g53.BorderSizePixel = 0
g53.ZIndex = 55
g53.Image = "rbxassetid://3926305904"
g53.ImageColor3 = Color3.new(1, 1, 1)
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)

--// Sidebar

local sidebar = make("Frame", "Sidebar", g2)
sidebar.Position = UDim2.new(0, 0, 0, 34)
sidebar.Size = UDim2.new(0, 62, 1, -34)
sidebar.BackgroundColor3 = Color3.fromRGB(21, 22, 27)
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 25

-- Sidebar right divider

local sidebarLine = make("Frame", "Divider", sidebar)
sidebarLine.AnchorPoint = Vector2.new(1, 0)
sidebarLine.Position = UDim2.new(1, 0, 0, 0)
sidebarLine.Size = UDim2.new(0, 1, 1, 0)
sidebarLine.BackgroundColor3 = Color3.fromRGB(55, 56, 62)
sidebarLine.BorderSizePixel = 0
sidebarLine.ZIndex = 26

--// Sidebar icons

local homeButton = button(
	sidebar,
	"HomeButton",
	UDim2.new(0.5, -21, 0, 18),
	UDim2.new(0, 42, 0, 42)
)

local homeIcon = make("ImageLabel", "Icon", homeButton)
homeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
homeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
homeIcon.Size = UDim2.new(0, 23, 0, 23)
homeIcon.BackgroundTransparency = 1
homeIcon.ZIndex = 31
homeIcon.Image = "rbxassetid://3926307971"
homeIcon.ImageColor3 = Color3.fromRGB(210, 210, 210)
homeIcon.ImageRectOffset = Vector2.new(44, 124)
homeIcon.ImageRectSize = Vector2.new(36, 36)

local scriptButton = button(
	sidebar,
	"ScriptButton",
	UDim2.new(0.5, -21, 0, 68),
	UDim2.new(0, 42, 0, 42)
)

local scriptIcon = make("ImageLabel", "Icon", scriptButton)
scriptIcon.AnchorPoint = Vector2.new(0.5, 0.5)
scriptIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
scriptIcon.Size = UDim2.new(0, 23, 0, 23)
scriptIcon.BackgroundTransparency = 1
scriptIcon.ZIndex = 31
scriptIcon.Image = "rbxassetid://3926307971"
scriptIcon.ImageColor3 = Color3.fromRGB(210, 210, 210)
scriptIcon.ImageRectOffset = Vector2.new(564, 124)
scriptIcon.ImageRectSize = Vector2.new(36, 36)

-- Settings at bottom

local settingsButton = button(
	sidebar,
	"SettingsButton",
	UDim2.new(0.5, -21, 1, -60),
	UDim2.new(0, 42, 0, 42)
)

local settingsIcon = make("ImageLabel", "Icon", settingsButton)
settingsIcon.AnchorPoint = Vector2.new(0.5, 0.5)
settingsIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
settingsIcon.Size = UDim2.new(0, 23, 0, 23)
settingsIcon.BackgroundTransparency = 1
settingsIcon.ZIndex = 31
settingsIcon.Image = "rbxassetid://3926307971"
settingsIcon.ImageColor3 = Color3.fromRGB(210, 210, 210)
settingsIcon.ImageRectOffset = Vector2.new(764, 124)
settingsIcon.ImageRectSize = Vector2.new(36, 36)

-- Active sidebar indicator

local activeIndicator = make("Frame", "ActiveIndicator", sidebar)
activeIndicator.Position = UDim2.new(0, 0, 0, 18)
activeIndicator.Size = UDim2.new(0, 3, 0, 42)
activeIndicator.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
activeIndicator.BorderSizePixel = 0
activeIndicator.ZIndex = 32

corner(activeIndicator, 3)

--// Main content

local content = make("Frame", "Content", g2)
content.Position = UDim2.new(0, 62, 0, 34)
content.Size = UDim2.new(1, -62, 1, -34)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ZIndex = 20

--// Editor

local g5 = make("Frame", "Editor", content)
g5.Position = UDim2.new(0, 10, 0, 10)
g5.Size = UDim2.new(1, -20, 0, 245)
g5.BackgroundColor3 = Color3.fromRGB(12, 14, 17)
g5.BorderSizePixel = 1
g5.ClipsDescendants = true
g5.ZIndex = 21

corner(g5, 6)
stroke(g5)

-- Terminal header

local terminalHeader = make("Frame", "TerminalHeader", g5)
terminalHeader.Position = UDim2.new(0, 0, 0, 0)
terminalHeader.Size = UDim2.new(1, 0, 0, 26)
terminalHeader.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
terminalHeader.BorderSizePixel = 0
terminalHeader.ZIndex = 22

local terminalTitle = make("TextLabel", "TerminalTitle", terminalHeader)
terminalTitle.Position = UDim2.new(0, 10, 0, 0)
terminalTitle.Size = UDim2.new(1, -20, 1, 0)
terminalTitle.BackgroundTransparency = 1
terminalTitle.ZIndex = 23
terminalTitle.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
terminalTitle.Text = "terminal"
terminalTitle.TextColor3 = Color3.fromRGB(150, 155, 165)
terminalTitle.TextSize = 13
terminalTitle.TextXAlignment = Enum.TextXAlignment.Left
terminalTitle.TextYAlignment = Enum.TextYAlignment.Center

--// Scrolling editor

local g8 = make("ScrollingFrame", "EditorFrame", g5)
g8.Position = UDim2.new(0, 0, 0, 26)
g8.Size = UDim2.new(1, 0, 1, -26)
g8.BackgroundColor3 = Color3.fromRGB(12, 14, 17)
g8.BackgroundTransparency = 0
g8.BorderSizePixel = 0
g8.ClipsDescendants = true
g8.Visible = true
g8.ZIndex = 23
g8.CanvasPosition = Vector2.new(0, 0)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.fromRGB(90, 95, 105)
g8.ScrollBarImageTransparency = 0.2
g8.ScrollingDirection = Enum.ScrollingDirection.XY
g8.ScrollingEnabled = true
g8.AutomaticCanvasSize = Enum.AutomaticSize.XY

--// Line numbers

local g9 = make("TextLabel", "Lines", g8)
g9.Position = UDim2.new(0, 0, 0, 5)
g9.Size = UDim2.new(0, 42, 1, -5)
g9.BackgroundTransparency = 1
g9.BorderSizePixel = 0
g9.ZIndex = 24
g9.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
g9.Text = "1"
g9.TextColor3 = Color3.fromRGB(82, 88, 98)
g9.TextSize = 15
g9.TextXAlignment = Enum.TextXAlignment.Right
g9.TextYAlignment = Enum.TextYAlignment.Top
g9.RichText = false

-- Line divider

local lineDivider = make("Frame", "LineDivider", g8)
lineDivider.Position = UDim2.new(0, 47, 0, 0)
lineDivider.Size = UDim2.new(0, 1, 1, 0)
lineDivider.BackgroundColor3 = Color3.fromRGB(35, 38, 44)
lineDivider.BorderSizePixel = 0
lineDivider.ZIndex = 24

--// Source textbox

local g10 = make("TextBox", "Source", g8)
g10.Position = UDim2.new(0, 54, 0, 5)
g10.Size = UDim2.new(1, -59, 1, -5)
g10.BackgroundTransparency = 1
g10.BorderSizePixel = 0
g10.ClipsDescendants = false
g10.ZIndex = 25
g10.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
g10.Text = ""
g10.TextColor3 = Color3.fromRGB(205, 210, 220)
g10.TextSize = 15
g10.TextXAlignment = Enum.TextXAlignment.Left
g10.TextYAlignment = Enum.TextYAlignment.Top
g10.RichText = false
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.PlaceholderText = "$ enter command..."
g10.PlaceholderColor3 = Color3.fromRGB(75, 80, 90)
g10.TextEditable = true

--// Terminal-looking syntax layers

local function syntaxLayer(name, color, z)
	local x = make("TextLabel", name, g8)
	x.Position = UDim2.new(0, 54, 0, 5)
	x.Size = UDim2.new(1, -59, 1, -5)
	x.BackgroundTransparency = 1
	x.BorderSizePixel = 0
	x.ZIndex = z
	x.FontFace = g10.FontFace
	x.Text = ""
	x.TextColor3 = color
	x.TextSize = 15
	x.TextXAlignment = Enum.TextXAlignment.Left
	x.TextYAlignment = Enum.TextYAlignment.Top
	x.RichText = true
	x.TextWrapped = false
	return x
end

local comments = syntaxLayer(
	"Comments_",
	Color3.fromRGB(82, 180, 100),
	26
)

local globals = syntaxLayer(
	"Globals_",
	Color3.fromRGB(115, 190, 235),
	26
)

local keywords = syntaxLayer(
	"Keywords_",
	Color3.fromRGB(240, 105, 125),
	26
)

local strings = syntaxLayer(
	"Strings_",
	Color3.fromRGB(170, 220, 140),
	26
)

local numbers = syntaxLayer(
	"Numbers_",
	Color3.fromRGB(240, 190, 70),
	26
)

--// Bottom controls

local controls = make("Frame", "Controls", content)
controls.Position = UDim2.new(0, 10, 0, 264)
controls.Size = UDim2.new(1, -20, 0, 46)
controls.BackgroundTransparency = 1
controls.BorderSizePixel = 0
controls.ZIndex = 30

-- Execute

local g22 = button(
	controls,
	"ExecuteButton",
	UDim2.new(0, 0, 0, 4),
	UDim2.new(0, 105, 0, 36)
)

g22.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g22.Text = "Execute"
g22.TextColor3 = Color3.new(1, 1, 1)
g22.TextSize = 15
g22.TextXAlignment = Enum.TextXAlignment.Center
g22.TextYAlignment = Enum.TextYAlignment.Center

-- Clear

local g18 = button(
	controls,
	"ClearButton",
	UDim2.new(0, 115, 0, 4),
	UDim2.new(0, 90, 0, 36)
)

g18.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g18.Text = "Clear"
g18.TextColor3 = Color3.new(1, 1, 1)
g18.TextSize = 15
g18.TextXAlignment = Enum.TextXAlignment.Center
g18.TextYAlignment = Enum.TextYAlignment.Center

-- Small icon buttons

local g31 = button(
	controls,
	"HideButton",
	UDim2.new(1, -142, 0, 4),
	UDim2.new(0, 34, 0, 36)
)

local hideIcon = make("ImageLabel", "ImageLabel", g31)
hideIcon.AnchorPoint = Vector2.new(0.5, 0.5)
hideIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
hideIcon.Size = UDim2.new(0, 23, 0, 23)
hideIcon.BackgroundTransparency = 1
hideIcon.ZIndex = 31
hideIcon.Image = "rbxassetid://3926307971"
hideIcon.ImageColor3 = Color3.new(1, 1, 1)
hideIcon.ImageRectOffset = Vector2.new(84, 44)
hideIcon.ImageRectSize = Vector2.new(36, 36)

local g59 = button(
	controls,
	"REButton2",
	UDim2.new(1, -101, 0, 4),
	UDim2.new(0, 34, 0, 36)
)

local g62 = make("ImageLabel", "ImageLabel", g59)
g62.AnchorPoint = Vector2.new(0.5, 0.5)
g62.Position = UDim2.new(0.5, 0, 0.5, 0)
g62.Size = UDim2.new(0, 22, 0, 22)
g62.BackgroundTransparency = 1
g62.ZIndex = 31
g62.Image = "rbxassetid://10734933966"

local g41 = button(
	controls,
	"REButton",
	UDim2.new(1, -60, 0, 4),
	UDim2.new(0, 34, 0, 36)
)

local g44 = make("ImageLabel", "ImageLabel", g41)
g44.AnchorPoint = Vector2.new(0.5, 0.5)
g44.Position = UDim2.new(0.5, 0, 0.5, 0)
g44.Size = UDim2.new(0, 22, 0, 22)
g44.BackgroundTransparency = 1
g44.ZIndex = 31
g44.Image = "rbxassetid://7072721335"

local g36 = button(
	controls,
	"R6Button",
	UDim2.new(1, -19, 0, 4),
	UDim2.new(0, 34, 0, 36)
)

local g39 = make("ImageLabel", "ImageLabel", g36)
g39.AnchorPoint = Vector2.new(0.5, 0.5)
g39.Position = UDim2.new(0.5, 0, 0.5, 0)
g39.Size = UDim2.new(0, 27, 0, 27)
g39.BackgroundTransparency = 1
g39.ZIndex = 31
g39.Image = "rbxassetid://4941166750"

--// Hidden restore button

local g48 = make("TextButton", "ShowButton", g1)
g48.AnchorPoint = Vector2.new(0, 1)
g48.Position = UDim2.new(0, 15, 1, -15)
g48.Size = UDim2.new(0, 42, 0, 42)
g48.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g48.BorderSizePixel = 1
g48.ZIndex = 100
g48.Visible = false
g48.Text = ""

corner(g48, 8)
stroke(g48)

local g52 = make("ImageLabel", "ImageLabel", g48)
g52.AnchorPoint = Vector2.new(0.5, 0.5)
g52.Position = UDim2.new(0.5, 0, 0.5, 0)
g52.Size = UDim2.new(0, 25, 0, 25)
g52.BackgroundTransparency = 1
g52.ZIndex = 101
g52.Image = "rbxassetid://3926307971"
g52.ImageRectOffset = Vector2.new(564, 44)
g52.ImageRectSize = Vector2.new(36, 36)

--// Line number updater

local function updateLineNumbers()
	local text = g10.Text

	if text == "" then
		g9.Text = "1"
		return
	end

	local count = 1

	for _ in string.gmatch(text, "\n") do
		count += 1
	end

	local lines = table.create(count)

	for i = 1, count do
		lines[i] = tostring(i)
	end

	g9.Text = table.concat(lines, "\n")
end

g10:GetPropertyChangedSignal("Text"):Connect(updateLineNumbers)

--// Basic terminal-style display formatting

local function updateSyntax()
	local text = g10.Text

	if text == "" then
		comments.Text = ""
		globals.Text = ""
		keywords.Text = ""
		strings.Text = ""
		numbers.Text = ""
		return
	end

	-- These are visual overlays only.
	-- The editable textbox remains the actual input field.

	comments.Text = ""
	globals.Text = ""
	keywords.Text = ""
	strings.Text = ""
	numbers.Text = ""
end

g10:GetPropertyChangedSignal("Text"):Connect(updateSyntax)

--// Functional GUI controls

g18.MouseButton1Click:Connect(function()
	g10.Text = ""
	updateLineNumbers()
	updateSyntax()
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

-- Sidebar selection

local function selectSidebar(buttonObject, indicatorY)
	activeIndicator.Position = UDim2.new(0, 0, 0, indicatorY)

	homeButton.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	scriptButton.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	settingsButton.BackgroundColor3 = Color3.fromRGB(17, 19, 22)

	buttonObject.BackgroundColor3 = Color3.fromRGB(30, 32, 38)
end

homeButton.MouseButton1Click:Connect(function()
	selectSidebar(homeButton, 18)
end)

scriptButton.MouseButton1Click:Connect(function()
	selectSidebar(scriptButton, 68)
end)

settingsButton.MouseButton1Click:Connect(function()
	selectSidebar(settingsButton, sidebar.AbsoluteSize.Y - 60)
end)

-- Default page

selectSidebar(homeButton, 18)

updateLineNumbers()
updateSyntax()
