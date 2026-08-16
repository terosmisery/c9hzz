local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function make(className, name, parent)
	local obj = Instance.new(className)
	obj.Name = name
	obj.Parent = parent
	return obj
end

local function addCorner(parent, radius)
	local c = make("UICorner", "UICorner", parent)
	c.CornerRadius = UDim.new(0, radius)
	return c
end

local function addStroke(parent, color, transparency, thickness)
	local s = make("UIStroke", "UIStroke", parent)
	s.Color = color or Color3.fromRGB(97, 97, 97)
	s.Transparency = transparency or 0.5
	s.Thickness = thickness or 1
	return s
end

local function makeButton(parent, name, x, y, width, height)
	local b = make("TextButton", name, parent)
	b.Active = true
	b.Position = UDim2.new(0, x, 0, y)
	b.Size = UDim2.new(0, width, 0, height)
	b.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	b.BorderSizePixel = 1
	b.ZIndex = 30
	b.Text = ""
	b.AutoButtonColor = true

	addCorner(b, 6)
	addStroke(b)

	return b
end

local function makeIcon(parent, name, image, offset, size, color)
	local icon = make("ImageLabel", name, parent)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	icon.Size = UDim2.new(0, size or 22, 0, size or 22)
	icon.BackgroundTransparency = 1
	icon.BorderSizePixel = 0
	icon.ZIndex = parent.ZIndex + 1
	icon.Image = image
	icon.ImageColor3 = color or Color3.fromRGB(215, 215, 215)
	icon.ImageTransparency = 0
	icon.ImageRectOffset = offset or Vector2.new(0, 0)
	icon.ImageRectSize = Vector2.new(36, 36)
	return icon
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
g2.BorderSizePixel = 0
g2.ClipsDescendants = true
g2.Visible = true
g2.ZIndex = 10

addCorner(g2, 8)
addStroke(g2, Color3.fromRGB(97, 97, 97), 0.45, 1)

--// Top bar

local g55 = make("Frame", "Title", g2)
g55.Position = UDim2.new(0, 0, 0, 0)
g55.Size = UDim2.new(1, 0, 0, 36)
g55.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
g55.BorderSizePixel = 0
g55.ZIndex = 50

-- keep the top corners rounded
addCorner(g55, 8)

-- flatten only the lower edge of the topbar
local topbarFill = make("Frame", "TopbarFill", g55)
topbarFill.Position = UDim2.new(0, 0, 1, -8)
topbarFill.Size = UDim2.new(1, 0, 0, 8)
topbarFill.BackgroundColor3 = g55.BackgroundColor3
topbarFill.BorderSizePixel = 0
topbarFill.ZIndex = 50

local topbarLine = make("Frame", "TopbarLine", g55)
topbarLine.Position = UDim2.new(0, 0, 1, -1)
topbarLine.Size = UDim2.new(1, 0, 0, 1)
topbarLine.BackgroundColor3 = Color3.fromRGB(55, 56, 62)
topbarLine.BorderSizePixel = 0
topbarLine.ZIndex = 51

--// Green status glow

local glowSizes = {
	{30, 0.94},
	{24, 0.88},
	{19, 0.78},
	{14, 0.55},
}

for i, data in ipairs(glowSizes) do
	local glow = make("Frame", "Glow_" .. i, g55)
	glow.AnchorPoint = Vector2.new(0.5, 0.5)
	glow.Position = UDim2.new(0, 17, 0.5, 0)
	glow.Size = UDim2.new(0, data[1], 0, data[1])
	glow.BackgroundColor3 = Color3.fromRGB(45, 255, 95)
	glow.BackgroundTransparency = data[2]
	glow.BorderSizePixel = 0
	glow.ZIndex = 52
	addCorner(glow, data[1] / 2)
end

local statusCircle = make("Frame", "StatusCircle", g55)
statusCircle.AnchorPoint = Vector2.new(0.5, 0.5)
statusCircle.Position = UDim2.new(0, 17, 0.5, 0)
statusCircle.Size = UDim2.new(0, 8, 0, 8)
statusCircle.BackgroundColor3 = Color3.fromRGB(70, 255, 110)
statusCircle.BorderSizePixel = 0
statusCircle.ZIndex = 56

addCorner(statusCircle, 8)

--// Topbar title
-- moved farther away from the glow

local g58 = make("TextLabel", "Label", g55)
g58.Position = UDim2.new(0, 39, 0, 0)
g58.Size = UDim2.new(1, -85, 1, 0)
g58.BackgroundTransparency = 1
g58.BorderSizePixel = 0
g58.ZIndex = 55
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

--// Close

local g53 = make("ImageButton", "close", g55)
g53.AnchorPoint = Vector2.new(1, 0.5)
g53.Position = UDim2.new(1, -8, 0.5, 0)
g53.Size = UDim2.new(0, 21, 0, 21)
g53.BackgroundTransparency = 1
g53.BorderSizePixel = 0
g53.ZIndex = 57
g53.Image = "rbxassetid://3926305904"
g53.ImageColor3 = Color3.new(1, 1, 1)
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)

--// Sidebar

local sidebar = make("Frame", "Sidebar", g2)
sidebar.Position = UDim2.new(0, 0, 0, 36)
sidebar.Size = UDim2.new(0, 64, 1, -36)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 21, 25)
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 20

addCorner(sidebar, 8)

local sidebarTopFill = make("Frame", "SidebarTopFill", sidebar)
sidebarTopFill.Position = UDim2.new(0, 0, 0, 0)
sidebarTopFill.Size = UDim2.new(1, 0, 0, 8)
sidebarTopFill.BackgroundColor3 = sidebar.BackgroundColor3
sidebarTopFill.BorderSizePixel = 0
sidebarTopFill.ZIndex = 20

local sidebarDivider = make("Frame", "SidebarDivider", sidebar)
sidebarDivider.AnchorPoint = Vector2.new(1, 0)
sidebarDivider.Position = UDim2.new(1, 0, 0, 0)
sidebarDivider.Size = UDim2.new(0, 1, 1, 0)
sidebarDivider.BackgroundColor3 = Color3.fromRGB(55, 56, 62)
sidebarDivider.BorderSizePixel = 0
sidebarDivider.ZIndex = 21

--// Home

local homeButton = makeButton(
	sidebar,
	"HomeButton",
	11,
	16,
	42,
	42
)

local homeIcon = makeIcon(
	homeButton,
	"HomeIcon",
	"rbxassetid://3926305904",
	Vector2.new(964, 204),
	23
)

--// Files / scripts

local scriptsButton = makeButton(
	sidebar,
	"ScriptsButton",
	11,
	66,
	42,
	42
)

local scriptsIcon = makeIcon(
	scriptsButton,
	"ScriptsIcon",
	"rbxassetid://3926307971",
	Vector2.new(252, 684),
	23
)

--// People

local peopleButton = makeButton(
	sidebar,
	"PeopleButton",
	11,
	116,
	42,
	42
)

local peopleIcon = makeIcon(
	peopleButton,
	"PeopleIcon",
	"rbxassetid://3926307971",
	Vector2.new(252, 684),
	23
)

--// Settings at bottom

local settingsButton = makeButton(
	sidebar,
	"SettingsButton",
	11,
	0,
	42,
	42
)

local settingsIcon = makeIcon(
	settingsButton,
	"SettingsIcon",
	"rbxassetid://3926307971",
	Vector2.new(324, 124),
	23
)

local function updateSettingsPosition()
	settingsButton.Position = UDim2.new(
		0,
		11,
		0,
		sidebar.AbsoluteSize.Y - 58
	)
end

sidebar:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSettingsPosition)
task.defer(updateSettingsPosition)

--// Active sidebar marker

local activeIndicator = make("Frame", "ActiveIndicator", sidebar)
activeIndicator.Position = UDim2.new(0, 0, 0, 16)
activeIndicator.Size = UDim2.new(0, 3, 0, 42)
activeIndicator.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
activeIndicator.BorderSizePixel = 0
activeIndicator.ZIndex = 29
addCorner(activeIndicator, 3)

--// Content

local content = make("Frame", "Content", g2)
content.Position = UDim2.new(0, 64, 0, 36)
content.Size = UDim2.new(1, -64, 1, -36)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ZIndex = 15

--// Terminal

local terminal = make("Frame", "Terminal", content)
terminal.Position = UDim2.new(0, 10, 0, 10)
terminal.Size = UDim2.new(1, -20, 0, 245)
terminal.BackgroundColor3 = Color3.fromRGB(10, 12, 14)
terminal.BorderSizePixel = 0
terminal.ClipsDescendants = true
terminal.ZIndex = 16

addCorner(terminal, 6)
addStroke(terminal, Color3.fromRGB(55, 59, 65), 0, 1)

local terminalHeader = make("Frame", "TerminalHeader", terminal)
terminalHeader.Position = UDim2.new(0, 0, 0, 0)
terminalHeader.Size = UDim2.new(1, 0, 0, 27)
terminalHeader.BackgroundColor3 = Color3.fromRGB(18, 20, 23)
terminalHeader.BorderSizePixel = 0
terminalHeader.ZIndex = 17

local terminalTitle = make("TextLabel", "TerminalTitle", terminalHeader)
terminalTitle.Position = UDim2.new(0, 10, 0, 0)
terminalTitle.Size = UDim2.new(1, -20, 1, 0)
terminalTitle.BackgroundTransparency = 1
terminalTitle.ZIndex = 18
terminalTitle.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
terminalTitle.Text = "c9hzz-terminal"
terminalTitle.TextColor3 = Color3.fromRGB(115, 120, 130)
terminalTitle.TextSize = 13
terminalTitle.TextXAlignment = Enum.TextXAlignment.Left
terminalTitle.TextYAlignment = Enum.TextYAlignment.Center

--// Editor

local g8 = make("ScrollingFrame", "EditorFrame", terminal)
g8.Position = UDim2.new(0, 0, 0, 27)
g8.Size = UDim2.new(1, 0, 1, -27)
g8.BackgroundColor3 = Color3.fromRGB(10, 12, 14)
g8.BackgroundTransparency = 0
g8.BorderSizePixel = 0
g8.ClipsDescendants = true
g8.ZIndex = 18
g8.CanvasPosition = Vector2.new(0, 0)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.fromRGB(85, 90, 100)
g8.ScrollBarImageTransparency = 0.15
g8.ScrollingDirection = Enum.ScrollingDirection.XY
g8.ScrollingEnabled = true
g8.AutomaticCanvasSize = Enum.AutomaticSize.XY

--// Line-number background

local linePanel = make("Frame", "LinePanel", g8)
linePanel.Position = UDim2.new(0, 0, 0, 0)
linePanel.Size = UDim2.new(0, 47, 1, 0)
linePanel.BackgroundColor3 = Color3.fromRGB(13, 15, 18)
linePanel.BorderSizePixel = 0
linePanel.ZIndex = 19

local lineDivider = make("Frame", "LineDivider", g8)
lineDivider.Position = UDim2.new(0, 47, 0, 0)
lineDivider.Size = UDim2.new(0, 1, 1, 0)
lineDivider.BackgroundColor3 = Color3.fromRGB(34, 37, 42)
lineDivider.BorderSizePixel = 0
lineDivider.ZIndex = 20

--// Line numbers

local g9 = make("TextLabel", "Lines", g8)
g9.Position = UDim2.new(0, 5, 0, 5)
g9.Size = UDim2.new(0, 37, 1, -5)
g9.BackgroundTransparency = 1
g9.BorderSizePixel = 0
g9.ZIndex = 21
g9.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
g9.Text = "1"
g9.TextColor3 = Color3.fromRGB(75, 81, 91)
g9.TextSize = 14
g9.TextXAlignment = Enum.TextXAlignment.Right
g9.TextYAlignment = Enum.TextYAlignment.Top
g9.RichText = false

--// Source

local g10 = make("TextBox", "Source", g8)
g10.Position = UDim2.new(0, 55, 0, 5)
g10.Size = UDim2.new(1, -61, 1, -5)
g10.BackgroundTransparency = 1
g10.BorderSizePixel = 0
g10.ZIndex = 24
g10.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
g10.Text = ""
g10.TextColor3 = Color3.fromRGB(210, 214, 220)
g10.TextSize = 14
g10.TextXAlignment = Enum.TextXAlignment.Left
g10.TextYAlignment = Enum.TextYAlignment.Top
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.TextWrapped = false
g10.PlaceholderText = "$ enter command..."
g10.PlaceholderColor3 = Color3.fromRGB(70, 75, 84)
g10.TextEditable = true

--// Syntax layers

local function makeSyntaxLayer(name, color)
	local label = make("TextLabel", name, g8)
	label.Position = UDim2.new(0, 55, 0, 5)
	label.Size = UDim2.new(1, -61, 1, -5)
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.ZIndex = 23
	label.FontFace = g10.FontFace
	label.Text = ""
	label.TextColor3 = color
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.TextWrapped = false
	label.RichText = true
	return label
end

local comments = makeSyntaxLayer(
	"Comments_",
	Color3.fromRGB(75, 180, 95)
)

local globals = makeSyntaxLayer(
	"Globals_",
	Color3.fromRGB(115, 190, 235)
)

local keywords = makeSyntaxLayer(
	"Keywords_",
	Color3.fromRGB(240, 105, 125)
)

local strings = makeSyntaxLayer(
	"Strings_",
	Color3.fromRGB(170, 220, 140)
)

local numbers = makeSyntaxLayer(
	"Numbers_",
	Color3.fromRGB(240, 190, 70)
)

--// Bottom controls

local controls = make("Frame", "Controls", content)
controls.Position = UDim2.new(0, 10, 0, 264)
controls.Size = UDim2.new(1, -20, 0, 42)
controls.BackgroundTransparency = 1
controls.BorderSizePixel = 0
controls.ZIndex = 30

-- Execute

local g22 = makeButton(
	controls,
	"ExecuteButton",
	0,
	2,
	106,
	36
)

g22.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g22.Text = "Execute"
g22.TextColor3 = Color3.new(1, 1, 1)
g22.TextSize = 14

-- Clear

local g18 = makeButton(
	controls,
	"ClearButton",
	114,
	2,
	88,
	36
)

g18.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
g18.Text = "Clear"
g18.TextColor3 = Color3.new(1, 1, 1)
g18.TextSize = 14

--// Right-side buttons
-- 8px gap between every button.

local rightX = 0

local function makeRightButton(name, offsetFromRight, asset, rectOffset, rectSize)
	local b = makeButton(
		controls,
		name,
		0,
		2,
		34,
		36
	)

	b.AnchorPoint = Vector2.new(1, 0)
	b.Position = UDim2.new(1, -offsetFromRight, 0, 2)

	local icon = make("ImageLabel", "Icon", b)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	icon.Size = UDim2.new(0, 22, 0, 22)
	icon.BackgroundTransparency = 1
	icon.BorderSizePixel = 0
	icon.ZIndex = 32
	icon.Image = asset
	icon.ImageColor3 = Color3.new(1, 1, 1)

	if rectOffset then
		icon.ImageRectOffset = rectOffset
	end

	if rectSize then
		icon.ImageRectSize = rectSize
	end

	return b
end

local g36 = makeRightButton(
	"R6Button",
	0,
	"rbxassetid://4941166750",
	nil,
	nil
)

local g41 = makeRightButton(
	"REButton",
	42,
	"rbxassetid://7072721335",
	nil,
	nil
)

local g59 = makeRightButton(
	"REButton2",
	84,
	"rbxassetid://10734933966",
	nil,
	nil
)

local g31 = makeRightButton(
	"HideButton",
	126,
	"rbxassetid://3926307971",
	Vector2.new(84, 44),
	Vector2.new(36, 36)
)

--// Restore button

local g48 = makeButton(g1, "ShowButton", 0, 0, 42, 42)
g48.AnchorPoint = Vector2.new(0, 1)
g48.Position = UDim2.new(0, 15, 1, -15)
g48.ZIndex = 100
g48.Visible = false

local showIcon = make("ImageLabel", "ImageLabel", g48)
showIcon.AnchorPoint = Vector2.new(0.5, 0.5)
showIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
showIcon.Size = UDim2.new(0, 24, 0, 24)
showIcon.BackgroundTransparency = 1
showIcon.ZIndex = 101
showIcon.Image = "rbxassetid://3926307971"
showIcon.ImageRectOffset = Vector2.new(564, 44)
showIcon.ImageRectSize = Vector2.new(36, 36)

--// Line numbers

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

--// Visual syntax layers

local function updateSyntax()
	local text = g10.Text

	comments.Text = ""
	globals.Text = ""
	keywords.Text = ""
	strings.Text = ""
	numbers.Text = ""

	if text == "" then
		return
	end

	comments.Text = text:gsub(
		"(%-%-[^\n]*)",
		'<font color="#4BB45F">%1</font>'
	)

	strings.Text = text:gsub(
		'("[^"]*")',
		'<font color="#AADC8C">%1</font>'
	)

	strings.Text = strings.Text:gsub(
		"('[^']*')",
		'<font color="#AADC8C">%1</font>'
	)

	keywords.Text = text:gsub(
		"(%f[%a](local|function|end|if|then|else|elseif|for|while|do|return|and|or|not|true|false|nil|in)%f[%A])",
		'<font color="#F0697D">%1</font>'
	)

	globals.Text = text:gsub(
		"(%f[%a](game|workspace|script|Instance|Vector3|CFrame|Color3|UDim2|Enum|Players)%f[%A])",
		'<font color="#73BEEB">%1</font>'
	)

	numbers.Text = text:gsub(
		"(%f[%d]%d+%.?%d*%f[%D])",
		'<font color="#F0BE46">%1</font>'
	)
end

g10:GetPropertyChangedSignal("Text"):Connect(updateSyntax)

--// Sidebar selection

local sidebarButtons = {
	homeButton,
	scriptsButton,
	peopleButton,
	settingsButton
}

local function selectSidebar(selected, indicatorY)
	for _, b in ipairs(sidebarButtons) do
		b.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	end

	selected.BackgroundColor3 = Color3.fromRGB(31, 34, 40)

	activeIndicator.Position = UDim2.new(
		0,
		0,
		0,
		indicatorY
	)
end

homeButton.Activated:Connect(function()
	selectSidebar(homeButton, 16)
end)

scriptsButton.Activated:Connect(function()
	selectSidebar(scriptsButton, 66)
end)

peopleButton.Activated:Connect(function()
	selectSidebar(peopleButton, 116)
end)

settingsButton.Activated:Connect(function()
	selectSidebar(
		settingsButton,
		sidebar.AbsoluteSize.Y - 58
	)
end)

--// GUI controls

g18.Activated:Connect(function()
	g10.Text = ""
	updateLineNumbers()
	updateSyntax()
end)

g31.Activated:Connect(function()
	g2.Visible = false
	g48.Visible = true
end)

g48.Activated:Connect(function()
	g2.Visible = true
	g48.Visible = false
end)

g53.Activated:Connect(function()
	g1:Destroy()
end)

--// Initial state

selectSidebar(homeButton, 16)
updateSettingsPosition()
updateLineNumbers()
updateSyntax()
