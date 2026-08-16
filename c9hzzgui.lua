-- C9HZZ GUI
-- GUI-only terminal/editor interface.
-- No remote/backdoor execution functionality is included.

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function make(className, name, parent)
	local obj = Instance.new(className)
	obj.Name = name
	obj.Parent = parent
	return obj
end

local function styleButton(button)
	local corner = make("UICorner", "UICorner", button)
	corner.CornerRadius = UDim.new(0, 6)

	local stroke = make("UIStroke", "UIStroke", button)
	stroke.Color = Color3.fromRGB(97, 97, 97)
	stroke.Thickness = 1
	stroke.Transparency = 0.5

	return corner, stroke
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
g2.Size = UDim2.new(0, 650, 0, 360)
g2.BackgroundColor3 = Color3.fromRGB(24, 25, 29)
g2.BorderSizePixel = 0
g2.ClipsDescendants = false
g2.ZIndex = 10

local mainCorner = make("UICorner", "UICorner", g2)
mainCorner.CornerRadius = UDim.new(0, 7)

local mainStroke = make("UIStroke", "UIStroke", g2)
mainStroke.Color = Color3.fromRGB(97, 97, 97)
mainStroke.Thickness = 1
mainStroke.Transparency = 0.45

--// Top bar
-- Full width. Sidebar starts underneath it.

local g55 = make("Frame", "Title", g2)
g55.Position = UDim2.new(0, 0, 0, 0)
g55.Size = UDim2.new(1, 0, 0, 38)
g55.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
g55.BorderSizePixel = 0
g55.ZIndex = 20

local titleTopCorner = make("UICorner", "UICorner", g55)
titleTopCorner.CornerRadius = UDim.new(0, 7)

local titleBottomCover = make("Frame", "BottomCover", g55)
titleBottomCover.Position = UDim2.new(0, 0, 1, -7)
titleBottomCover.Size = UDim2.new(1, 0, 0, 7)
titleBottomCover.BackgroundColor3 = g55.BackgroundColor3
titleBottomCover.BorderSizePixel = 0
titleBottomCover.ZIndex = 20

local g57 = make("UIStroke", "UIStroke", g55)
g57.Color = Color3.fromRGB(97, 97, 97)
g57.Thickness = 1
g57.Transparency = 0.5

--// Green status glow

local glowOuter = make("Frame", "StatusGlowOuter", g55)
glowOuter.Position = UDim2.new(0, 12, 0.5, -10)
glowOuter.Size = UDim2.new(0, 20, 0, 20)
glowOuter.BackgroundColor3 = Color3.fromRGB(40, 255, 100)
glowOuter.BackgroundTransparency = 0.88
glowOuter.BorderSizePixel = 0
glowOuter.ZIndex = 22

local glowOuterCorner = make("UICorner", "UICorner", glowOuter)
glowOuterCorner.CornerRadius = UDim.new(1, 0)

local glowMiddle = make("Frame", "StatusGlowMiddle", glowOuter)
glowMiddle.AnchorPoint = Vector2.new(0.5, 0.5)
glowMiddle.Position = UDim2.new(0.5, 0, 0.5, 0)
glowMiddle.Size = UDim2.new(0, 15, 0, 15)
glowMiddle.BackgroundColor3 = Color3.fromRGB(45, 255, 100)
glowMiddle.BackgroundTransparency = 0.7
glowMiddle.BorderSizePixel = 0
glowMiddle.ZIndex = 23

local glowMiddleCorner = make("UICorner", "UICorner", glowMiddle)
glowMiddleCorner.CornerRadius = UDim.new(1, 0)

local statusCircle = make("Frame", "Status", glowMiddle)
statusCircle.AnchorPoint = Vector2.new(0.5, 0.5)
statusCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
statusCircle.Size = UDim2.new(0, 8, 0, 8)
statusCircle.BackgroundColor3 = Color3.fromRGB(65, 255, 105)
statusCircle.BorderSizePixel = 0
statusCircle.ZIndex = 24

local statusCorner = make("UICorner", "UICorner", statusCircle)
statusCorner.CornerRadius = UDim.new(1, 0)

--// Title text

local g58 = make("TextLabel", "Label", g55)
g58.Position = UDim2.new(0, 42, 0, 0)
g58.Size = UDim2.new(1, -90, 1, 0)
g58.BackgroundTransparency = 1
g58.BorderSizePixel = 0
g58.ZIndex = 23
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
g53.Position = UDim2.new(1, -9, 0.5, 0)
g53.Size = UDim2.new(0, 23, 0, 23)
g53.BackgroundTransparency = 1
g53.BorderSizePixel = 0
g53.ZIndex = 25
g53.Image = "rbxassetid://3926305904"
g53.ImageColor3 = Color3.new(1, 1, 1)
g53.ImageRectOffset = Vector2.new(284, 4)
g53.ImageRectSize = Vector2.new(24, 24)

--// Sidebar

local sidebar = make("Frame", "Sidebar", g2)
sidebar.Position = UDim2.new(0, 7, 0, 45)
sidebar.Size = UDim2.new(0, 115, 1, -52)
sidebar.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
sidebar.BorderSizePixel = 0
sidebar.ClipsDescendants = true
sidebar.ZIndex = 12

local sidebarCorner = make("UICorner", "UICorner", sidebar)
sidebarCorner.CornerRadius = UDim.new(0, 6)

local sidebarStroke = make("UIStroke", "UIStroke", sidebar)
sidebarStroke.Color = Color3.fromRGB(97, 97, 97)
sidebarStroke.Thickness = 1
sidebarStroke.Transparency = 0.5

local sidebarTitle = make("TextLabel", "SidebarTitle", sidebar)
sidebarTitle.Position = UDim2.new(0, 11, 0, 9)
sidebarTitle.Size = UDim2.new(1, -22, 0, 22)
sidebarTitle.BackgroundTransparency = 1
sidebarTitle.ZIndex = 13
sidebarTitle.Font = Enum.Font.GothamBold
sidebarTitle.Text = "NAVIGATION"
sidebarTitle.TextColor3 = Color3.fromRGB(125, 130, 140)
sidebarTitle.TextSize = 11
sidebarTitle.TextXAlignment = Enum.TextXAlignment.Left

local function createSideButton(name, text, y, selected)
	local button = make("TextButton", name, sidebar)
	button.Position = UDim2.new(0, 7, 0, y)
	button.Size = UDim2.new(1, -14, 0, 36)
	button.BackgroundColor3 =
		selected and Color3.fromRGB(35, 38, 45)
		or Color3.fromRGB(17, 19, 22)
	button.BorderSizePixel = 0
	button.ZIndex = 13
	button.Font = Enum.Font.GothamMedium
	button.Text = text
	button.TextColor3 =
		selected and Color3.fromRGB(255, 255, 255)
		or Color3.fromRGB(180, 184, 190)
	button.TextSize = 14
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.AutoButtonColor = true

	local padding = make("UIPadding", "UIPadding", button)
	padding.PaddingLeft = UDim.new(0, 11)

	local corner = make("UICorner", "UICorner", button)
	corner.CornerRadius = UDim.new(0, 5)

	return button
end

local executorTab = createSideButton(
	"ExecutorTab",
	"Executor",
	40,
	true
)

local consoleTab = createSideButton(
	"ConsoleTab",
	"Console",
	82,
	false
)

local settingsTab = createSideButton(
	"SettingsTab",
	"Settings",
	124,
	false
)

local infoTab = createSideButton(
	"InfoTab",
	"Information",
	166,
	false
)

--// Main content

local content = make("Frame", "Content", g2)
content.Position = UDim2.new(0, 129, 0, 45)
content.Size = UDim2.new(1, -136, 1, -52)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ZIndex = 11

--// Terminal

local terminal = make("Frame", "Terminal", content)
terminal.Position = UDim2.new(0, 0, 0, 0)
terminal.Size = UDim2.new(1, 0, 1, -49)
terminal.BackgroundColor3 = Color3.fromRGB(10, 12, 14)
terminal.BorderSizePixel = 0
terminal.ClipsDescendants = true
terminal.ZIndex = 12

local terminalCorner = make("UICorner", "UICorner", terminal)
terminalCorner.CornerRadius = UDim.new(0, 6)

local terminalStroke = make("UIStroke", "UIStroke", terminal)
terminalStroke.Color = Color3.fromRGB(55, 59, 65)
terminalStroke.Thickness = 1

-- Terminal header

local terminalHeader = make("Frame", "TerminalHeader", terminal)
terminalHeader.Position = UDim2.new(0, 0, 0, 0)
terminalHeader.Size = UDim2.new(1, 0, 0, 28)
terminalHeader.BackgroundColor3 = Color3.fromRGB(18, 20, 23)
terminalHeader.BorderSizePixel = 0
terminalHeader.ZIndex = 13

local terminalHeaderText = make("TextLabel", "HeaderText", terminalHeader)
terminalHeaderText.Position = UDim2.new(0, 10, 0, 0)
terminalHeaderText.Size = UDim2.new(1, -20, 1, 0)
terminalHeaderText.BackgroundTransparency = 1
terminalHeaderText.ZIndex = 14
terminalHeaderText.Font = Enum.Font.Code
terminalHeaderText.Text = "C9HZZ TERMINAL  •  READY"
terminalHeaderText.TextColor3 = Color3.fromRGB(105, 255, 135)
terminalHeaderText.TextSize = 12
terminalHeaderText.TextXAlignment = Enum.TextXAlignment.Left
terminalHeaderText.TextYAlignment = Enum.TextYAlignment.Center

--// Scrolling terminal editor

local g8 = make("ScrollingFrame", "EditorFrame", terminal)
g8.Position = UDim2.new(0, 0, 0, 28)
g8.Size = UDim2.new(1, 0, 1, -28)
g8.BackgroundTransparency = 1
g8.BorderSizePixel = 0
g8.ClipsDescendants = true
g8.ZIndex = 14
g8.CanvasPosition = Vector2.new(0, 0)
g8.CanvasSize = UDim2.new(0, 0, 0, 0)
g8.ScrollBarThickness = 5
g8.ScrollBarImageColor3 = Color3.fromRGB(85, 90, 98)
g8.ScrollingDirection = Enum.ScrollingDirection.XY
g8.ScrollingEnabled = true
g8.AutomaticCanvasSize = Enum.AutomaticSize.XY

--// Terminal prompt decoration

local prompt = make("TextLabel", "Prompt", g8)
prompt.Position = UDim2.new(0, 9, 0, 7)
prompt.Size = UDim2.new(0, 78, 0, 20)
prompt.BackgroundTransparency = 1
prompt.ZIndex = 15
prompt.Font = Enum.Font.Code
prompt.Text = "C9HZZ >"
prompt.TextColor3 = Color3.fromRGB(70, 255, 110)
prompt.TextSize = 14
prompt.TextXAlignment = Enum.TextXAlignment.Left
prompt.TextYAlignment = Enum.TextYAlignment.Top

--// Line numbers

local g9 = make("TextLabel", "Lines", g8)
g9.Position = UDim2.new(0, 9, 0, 29)
g9.Size = UDim2.new(0, 34, 1, -29)
g9.BackgroundTransparency = 1
g9.BorderSizePixel = 0
g9.ZIndex = 15
g9.Font = Enum.Font.Code
g9.Text = "1"
g9.TextColor3 = Color3.fromRGB(75, 80, 87)
g9.TextSize = 14
g9.TextXAlignment = Enum.TextXAlignment.Right
g9.TextYAlignment = Enum.TextYAlignment.Top

--// Source

local g10 = make("TextBox", "Source", g8)
g10.Position = UDim2.new(0, 52, 0, 29)
g10.Size = UDim2.new(1, -60, 1, -29)
g10.BackgroundTransparency = 1
g10.BorderSizePixel = 0
g10.ZIndex = 18
g10.Font = Enum.Font.Code
g10.Text = ""
g10.TextColor3 = Color3.fromRGB(210, 214, 220)
g10.TextSize = 14
g10.TextXAlignment = Enum.TextXAlignment.Left
g10.TextYAlignment = Enum.TextYAlignment.Top
g10.ClearTextOnFocus = false
g10.MultiLine = true
g10.PlaceholderText = "print(\"C9HZZ terminal ready\")"
g10.PlaceholderColor3 = Color3.fromRGB(65, 70, 77)
g10.TextEditable = true
g10.TextWrapped = false

--// Syntax overlay

local function syntaxLayer(name, color, z)
	local label = make("TextLabel", name, g10)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.ZIndex = z
	label.Font = g10.Font
	label.Text = ""
	label.TextColor3 = color
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.TextWrapped = false
	label.RichText = true
	label.Visible = false
	return label
end

local comments = syntaxLayer(
	"Comments_",
	Color3.fromRGB(80, 190, 100),
	17
)

local keywords = syntaxLayer(
	"Keywords_",
	Color3.fromRGB(248, 109, 124),
	17
)

local strings = syntaxLayer(
	"Strings_",
	Color3.fromRGB(173, 241, 149),
	17
)

local numbers = syntaxLayer(
	"Numbers_",
	Color3.fromRGB(255, 198, 0),
	17
)

local globals = syntaxLayer(
	"Globals_",
	Color3.fromRGB(132, 214, 247),
	17
)

--// Terminal-like line numbering

local function updateLines()
	local text = g10.Text

	local count = 1

	if text ~= "" then
		count = 1

		for _ in text:gmatch("\n") do
			count += 1
		end
	end

	local lines = {}

	for i = 1, count do
		lines[i] = tostring(i)
	end

	g9.Text = table.concat(lines, "\n")
end

g10:GetPropertyChangedSignal("Text"):Connect(updateLines)

--// Simple Lua syntax display
-- Keeps the editable TextBox intact while making the surrounding UI terminal-like.

local function updateSyntax()
	local text = g10.Text

	if text == "" then
		comments.Text = ""
		keywords.Text = ""
		strings.Text = ""
		numbers.Text = ""
		globals.Text = ""
		return
	end

	comments.Text = text:gsub("(%-%-[^\n]*)", "<font color=\"#50BE64\">%1</font>")
	strings.Text = text:gsub("(\"[^\"]*\")", "<font color=\"#ADF195\">%1</font>")
	strings.Text = strings.Text:gsub("('[^']*')", "<font color=\"#ADF195\">%1</font>")

	keywords.Text = text:gsub(
		"(%f[%a](local|function|end|if|then|else|elseif|for|while|do|return|and|or|not|true|false|nil|in)%f[%A])",
		"<font color=\"#F86D7C\">%1</font>"
	)

	globals.Text = text:gsub(
		"(%f[%a](game|workspace|script|Players|Instance|Vector3|CFrame|Color3|UDim2|Enum)%f[%A])",
		"<font color=\"#84D6F7\">%1</font>"
	)

	numbers.Text = text:gsub(
		"(%f[%d]%d+%.?%d*%f[%D])",
		"<font color=\"#FFC600\">%1</font>"
	)
end

g10:GetPropertyChangedSignal("Text"):Connect(updateSyntax)

--// Bottom buttons

local controls = make("Frame", "Controls", content)
controls.Position = UDim2.new(0, 0, 1, -41)
controls.Size = UDim2.new(1, 0, 0, 34)
controls.BackgroundTransparency = 1
controls.ZIndex = 20

local g22 = make("TextButton", "ExecuteButton", controls)
g22.Position = UDim2.new(0, 0, 0, 0)
g22.Size = UDim2.new(0, 105, 1, 0)
g22.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g22.BorderSizePixel = 1
g22.ZIndex = 21
g22.Font = Enum.Font.GothamMedium
g22.Text = "Execute"
g22.TextColor3 = Color3.new(1, 1, 1)
g22.TextSize = 14
g22.AutoButtonColor = true
styleButton(g22)

local g18 = make("TextButton", "ClearButton", controls)
g18.Position = UDim2.new(0, 113, 0, 0)
g18.Size = UDim2.new(0, 85, 1, 0)
g18.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g18.BorderSizePixel = 1
g18.ZIndex = 21
g18.Font = Enum.Font.GothamMedium
g18.Text = "Clear"
g18.TextColor3 = Color3.new(1, 1, 1)
g18.TextSize = 14
g18.AutoButtonColor = true
styleButton(g18)

local g31 = make("TextButton", "HideButton", controls)
g31.AnchorPoint = Vector2.new(1, 0)
g31.Position = UDim2.new(1, -128, 0, 0)
g31.Size = UDim2.new(0, 34, 1, 0)
g31.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g31.BorderSizePixel = 1
g31.ZIndex = 21
g31.Text = ""
styleButton(g31)

local g34 = make("ImageLabel", "ImageLabel", g31)
g34.AnchorPoint = Vector2.new(0.5, 0.5)
g34.Position = UDim2.new(0.5, 0, 0.5, 0)
g34.Size = UDim2.new(0, 23, 0, 23)
g34.BackgroundTransparency = 1
g34.ZIndex = 22
g34.Image = "rbxassetid://3926307971"
g34.ImageColor3 = Color3.new(1, 1, 1)
g34.ImageRectOffset = Vector2.new(84, 44)
g34.ImageRectSize = Vector2.new(36, 36)

local g59 = make("TextButton", "REButton2", controls)
g59.AnchorPoint = Vector2.new(1, 0)
g59.Position = UDim2.new(1, -86, 0, 0)
g59.Size = UDim2.new(0, 34, 1, 0)
g59.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g59.BorderSizePixel = 1
g59.ZIndex = 21
g59.Text = ""
styleButton(g59)

local g62 = make("ImageLabel", "ImageLabel", g59)
g62.AnchorPoint = Vector2.new(0.5, 0.5)
g62.Position = UDim2.new(0.5, 0, 0.5, 0)
g62.Size = UDim2.new(0, 22, 0, 22)
g62.BackgroundTransparency = 1
g62.ZIndex = 22
g62.Image = "rbxassetid://10734933966"

local g41 = make("TextButton", "REButton", controls)
g41.AnchorPoint = Vector2.new(1, 0)
g41.Position = UDim2.new(1, -44, 0, 0)
g41.Size = UDim2.new(0, 34, 1, 0)
g41.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g41.BorderSizePixel = 1
g41.ZIndex = 21
g41.Text = ""
styleButton(g41)

local g44 = make("ImageLabel", "ImageLabel", g41)
g44.AnchorPoint = Vector2.new(0.5, 0.5)
g44.Position = UDim2.new(0.5, 0, 0.5, 0)
g44.Size = UDim2.new(0, 22, 0, 22)
g44.BackgroundTransparency = 1
g44.ZIndex = 22
g44.Image = "rbxassetid://7072721335"

local g36 = make("TextButton", "R6Button", controls)
g36.AnchorPoint = Vector2.new(1, 0)
g36.Position = UDim2.new(1, 0, 0, 0)
g36.Size = UDim2.new(0, 34, 1, 0)
g36.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g36.BorderSizePixel = 1
g36.ZIndex = 21
g36.Text = ""
styleButton(g36)

local g39 = make("ImageLabel", "ImageLabel", g36)
g39.AnchorPoint = Vector2.new(0.5, 0.5)
g39.Position = UDim2.new(0.5, 0, 0.5, 0)
g39.Size = UDim2.new(0, 25, 0, 25)
g39.BackgroundTransparency = 1
g39.ZIndex = 22
g39.Image = "rbxassetid://4941166750"

--// Hidden restore button

local g48 = make("TextButton", "ShowButton", g1)
g48.AnchorPoint = Vector2.new(0.5, 0.5)
g48.Position = UDim2.new(0.5, 0, 0.5, 0)
g48.Size = UDim2.new(0, 40, 0, 40)
g48.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
g48.BorderSizePixel = 1
g48.ZIndex = 50
g48.Visible = false
g48.Text = ""
styleButton(g48)

local g52 = make("ImageLabel", "ImageLabel", g48)
g52.AnchorPoint = Vector2.new(0.5, 0.5)
g52.Position = UDim2.new(0.5, 0, 0.5, 0)
g52.Size = UDim2.new(0, 25, 0, 25)
g52.BackgroundTransparency = 1
g52.ZIndex = 51
g52.Image = "rbxassetid://3926307971"
g52.ImageRectOffset = Vector2.new(564, 44)
g52.ImageRectSize = Vector2.new(36, 36)

--// Clear

g18.MouseButton1Click:Connect(function()
	g10.Text = ""
	updateLines()
	updateSyntax()
	g10:CaptureFocus()
end)

--// Hide / Show

g31.MouseButton1Click:Connect(function()
	g2.Visible = false
	g48.Visible = true
end)

g48.MouseButton1Click:Connect(function()
	g2.Visible = true
	g48.Visible = false
end)

--// Close

g53.MouseButton1Click:Connect(function()
	g1:Destroy()
end)

--// Sidebar selection

local tabs = {
	executorTab,
	consoleTab,
	settingsTab,
	infoTab
}

local function selectTab(selected)
	for _, tab in ipairs(tabs) do
		if tab == selected then
			tab.BackgroundColor3 = Color3.fromRGB(35, 38, 45)
			tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			tab.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
			tab.TextColor3 = Color3.fromRGB(180, 184, 190)
		end
	end
end

executorTab.MouseButton1Click:Connect(function()
	selectTab(executorTab)
	terminal.Visible = true
end)

consoleTab.MouseButton1Click:Connect(function()
	selectTab(consoleTab)
	terminal.Visible = true
end)

settingsTab.MouseButton1Click:Connect(function()
	selectTab(settingsTab)
	terminal.Visible = true
end)

infoTab.MouseButton1Click:Connect(function()
	selectTab(infoTab)
	terminal.Visible = true
end)

--// Initial state

selectTab(executorTab)
updateLines()
updateSyntax()

return true
