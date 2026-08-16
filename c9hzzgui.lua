-- Zenith V2 style UI
-- LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Destroy previous copy
local old = playerGui:FindFirstChild("ZenithV2")
if old then
	old:Destroy()
end

--// Colors
local BG = Color3.fromRGB(10, 10, 11)
local TOP = Color3.fromRGB(17, 17, 19)
local SIDE = Color3.fromRGB(15, 15, 17)
local PANEL = Color3.fromRGB(16, 16, 18)
local PANEL2 = Color3.fromRGB(20, 20, 22)
local BUTTON = Color3.fromRGB(29, 29, 32)
local BUTTON_HOVER = Color3.fromRGB(39, 39, 43)
local BORDER = Color3.fromRGB(48, 48, 52)
local TEXT = Color3.fromRGB(225, 225, 228)
local MUTED = Color3.fromRGB(145, 145, 151)
local BLUE = Color3.fromRGB(73, 139, 255)
local PURPLE = Color3.fromRGB(196, 119, 220)

--// Helpers
local function corner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local function stroke(parent, color, thickness, transparency)
	local s = Instance.new("UIStroke")
	s.Color = color or BORDER
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0
	s.Parent = parent
	return s
end

local function label(parent, text, size, color, font)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Text = text
	l.TextColor3 = color or TEXT
	l.TextSize = size or 14
	l.Font = font or Enum.Font.Gotham
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.TextYAlignment = Enum.TextYAlignment.Center
	l.Parent = parent
	return l
end

local function button(parent, text)
	local b = Instance.new("TextButton")
	b.AutoButtonColor = false
	b.BackgroundColor3 = BUTTON
	b.Text = text
	b.TextColor3 = TEXT
	b.TextSize = 14
	b.Font = Enum.Font.Gotham
	b.Parent = parent

	corner(b, 7)

	b.MouseEnter:Connect(function()
		b.BackgroundColor3 = BUTTON_HOVER
	end)

	b.MouseLeave:Connect(function()
		b.BackgroundColor3 = BUTTON
	end)

	return b
end

--// Main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ZenithV2"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

--// Main window
local window = Instance.new("Frame")
window.Name = "Window"
window.AnchorPoint = Vector2.new(0.5, 0.5)
window.Position = UDim2.fromScale(0.5, 0.5)
window.Size = UDim2.fromOffset(1100, 720)
window.BackgroundColor3 = BG
window.BorderSizePixel = 0
window.Parent = gui

corner(window, 10)
stroke(window, Color3.fromRGB(72, 72, 77), 1)

--// Top bar
local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 64)
top.BackgroundColor3 = TOP
top.BorderSizePixel = 0
top.Parent = window

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 1)
topLine.Position = UDim2.new(0, 0, 1, -1)
topLine.BackgroundColor3 = BORDER
topLine.BorderSizePixel = 0
topLine.Parent = top

-- status dot
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.fromOffset(22, 22)
statusDot.Position = UDim2.fromOffset(19, 21)
statusDot.BackgroundColor3 = Color3.fromRGB(83, 79, 123)
statusDot.BorderSizePixel = 0
statusDot.Parent = top
corner(statusDot, 20)

local status = label(top, "Inactive", 18, MUTED)
status.Position = UDim2.fromOffset(49, 0)
status.Size = UDim2.fromOffset(120, 64)

-- title
local titleHolder = Instance.new("Frame")
titleHolder.BackgroundTransparency = 1
titleHolder.AnchorPoint = Vector2.new(0.5, 0)
titleHolder.Position = UDim2.new(0.5, 0, 0, 0)
titleHolder.Size = UDim2.fromOffset(220, 64)
titleHolder.Parent = top

local title = label(titleHolder, "Zenith ", 23, TEXT, Enum.Font.GothamMedium)
title.Size = UDim2.fromOffset(100, 64)
title.Position = UDim2.fromOffset(0, 0)
title.TextXAlignment = Enum.TextXAlignment.Right

local titleV2 = label(titleHolder, "V2", 23, PURPLE, Enum.Font.GothamMedium)
titleV2.Size = UDim2.fromOffset(45, 64)
titleV2.Position = UDim2.fromOffset(105, 0)

-- window buttons
local minimize = button(top, "—")
minimize.Size = UDim2.fromOffset(42, 40)
minimize.Position = UDim2.new(1, -125, 0, 12)
minimize.BackgroundTransparency = 1
minimize.TextColor3 = MUTED
minimize.TextSize = 22

local maximize = button(top, "□")
maximize.Size = UDim2.fromOffset(42, 40)
maximize.Position = UDim2.new(1, -84, 0, 12)
maximize.BackgroundTransparency = 1
maximize.TextColor3 = MUTED
maximize.TextSize = 20

local close = button(top, "×")
close.Size = UDim2.fromOffset(42, 40)
close.Position = UDim2.new(1, -43, 0, 12)
close.BackgroundTransparency = 1
close.TextColor3 = MUTED
close.TextSize = 28

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

--// Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Position = UDim2.fromOffset(0, 64)
sidebar.Size = UDim2.fromOffset(82, 656)
sidebar.BackgroundColor3 = SIDE
sidebar.BorderSizePixel = 0
sidebar.Parent = window

local sidebarLine = Instance.new("Frame")
sidebarLine.Position = UDim2.new(1, -1, 0, 0)
sidebarLine.Size = UDim2.new(0, 1, 1, 0)
sidebarLine.BackgroundColor3 = Color3.fromRGB(27, 27, 30)
sidebarLine.BorderSizePixel = 0
sidebarLine.Parent = sidebar

-- Sidebar buttons
local sidebarButtons = {}

local function createSideButton(icon, y)
	local holder = Instance.new("Frame")
	holder.BackgroundTransparency = 1
	holder.Size = UDim2.new(1, 0, 0, 66)
	holder.Position = UDim2.fromOffset(0, y)
	holder.Parent = sidebar

	local active = Instance.new("Frame")
	active.Name = "Active"
	active.Size = UDim2.fromOffset(4, 38)
	active.Position = UDim2.fromOffset(0, 14)
	active.BackgroundColor3 = BLUE
	active.BorderSizePixel = 0
	active.Visible = false
	active.Parent = holder

	corner(active, 4)

	local b = Instance.new("TextButton")
	b.BackgroundTransparency = 1
	b.Size = UDim2.new(1, 0, 1, 0)
	b.Text = icon
	b.TextColor3 = MUTED
	b.TextSize = 25
	b.Font = Enum.Font.GothamMedium
	b.AutoButtonColor = false
	b.Parent = holder

	b.MouseEnter:Connect(function()
		if not active.Visible then
			b.TextColor3 = TEXT
		end
	end)

	b.MouseLeave:Connect(function()
		if not active.Visible then
			b.TextColor3 = MUTED
		end
	end)

	table.insert(sidebarButtons, {
		Button = b,
		Active = active
	})

	return holder, b, active
end

-- Home
createSideButton("⌂", 12)

-- Code
local _, codeButton, codeActive = createSideButton("</>", 78)

-- Scripts
createSideButton("▤", 144)

-- Clipboard
createSideButton("▣", 210)

-- Settings at bottom
local _, settingsButton, settingsActive = createSideButton("⚙", 568)

codeActive.Visible = true
codeButton.TextColor3 = TEXT

--// Main content
local content = Instance.new("Frame")
content.Name = "Content"
content.Position = UDim2.fromOffset(82, 64)
content.Size = UDim2.new(1, -82, 1, -64)
content.BackgroundColor3 = BG
content.BorderSizePixel = 0
content.Parent = window

--// Tab bar
local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, 0, 0, 74)
tabBar.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
tabBar.BorderSizePixel = 0
tabBar.Parent = content

local tab = Instance.new("TextButton")
tab.Name = "Tab"
tab.Position = UDim2.fromOffset(24, 29)
tab.Size = UDim2.fromOffset(138, 47)
tab.BackgroundColor3 = BUTTON
tab.Text = ""
tab.AutoButtonColor = false
tab.Parent = tabBar
corner(tab, 8)

local tabAccent = Instance.new("Frame")
tabAccent.Size = UDim2.fromOffset(4, 47)
tabAccent.BackgroundColor3 = BLUE
tabAccent.BorderSizePixel = 0
tabAccent.Parent = tab
corner(tabAccent, 5)

local tabName = label(tab, "Tab 1*", 15, TEXT)
tabName.Position = UDim2.fromOffset(20, 0)
tabName.Size = UDim2.fromOffset(78, 47)

local tabClose = label(tab, "×", 21, MUTED)
tabClose.Position = UDim2.new(1, -36, 0, 0)
tabClose.Size = UDim2.fromOffset(30, 47)
tabClose.TextXAlignment = Enum.TextXAlignment.Center

-- plus button
local plus = button(tabBar, "+")
plus.Size = UDim2.fromOffset(74, 74)
plus.Position = UDim2.new(1, -92, 0, 10)
plus.BackgroundColor3 = Color3.fromRGB(40, 40, 43)
plus.TextSize = 24

--// Editor
local editor = Instance.new("Frame")
editor.Name = "Editor"
editor.Position = UDim2.fromOffset(24, 86)
editor.Size = UDim2.new(1, -404, 0, 280)
editor.BackgroundColor3 = Color3.fromRGB(11, 11, 12)
editor.BorderSizePixel = 0
editor.Parent = content
corner(editor, 8)
stroke(editor, Color3.fromRGB(20, 20, 22), 1)

-- line numbers
local lineNumbers = label(editor, "1", 15, Color3.fromRGB(190, 190, 194), Enum.Font.Code)
lineNumbers.Position = UDim2.fromOffset(24, 0)
lineNumbers.Size = UDim2.fromOffset(30, 40)
lineNumbers.TextYAlignment = Enum.TextYAlignment.Top
lineNumbers.TextXAlignment = Enum.TextXAlignment.Center

-- actual editor
local editorBox = Instance.new("TextBox")
editorBox.Name = "EditorBox"
editorBox.Position = UDim2.fromOffset(64, 10)
editorBox.Size = UDim2.new(1, -105, 1, -20)
editorBox.BackgroundTransparency = 1
editorBox.ClearTextOnFocus = false
editorBox.MultiLine = true
editorBox.Text = ""
editorBox.PlaceholderText = ""
editorBox.TextColor3 = Color3.fromRGB(220, 220, 224)
editorBox.TextSize = 15
editorBox.Font = Enum.Font.Code
editorBox.TextXAlignment = Enum.TextXAlignment.Left
editorBox.TextYAlignment = Enum.TextYAlignment.Top
editorBox.TextWrapped = false
editorBox.Parent = editor

-- execute triangle
local executeSmall = Instance.new("TextButton")
executeSmall.Size = UDim2.fromOffset(28, 28)
executeSmall.Position = UDim2.new(1, -55, 1, -48)
executeSmall.BackgroundColor3 = Color3.fromRGB(27, 48, 66)
executeSmall.Text = "▶"
executeSmall.TextColor3 = Color3.fromRGB(115, 173, 220)
executeSmall.TextSize = 12
executeSmall.AutoButtonColor = false
executeSmall.Parent = editor
corner(executeSmall, 4)

--// File list
local filePanel = Instance.new("Frame")
filePanel.Name = "FileList"
filePanel.Position = UDim2.new(1, -382, 0, 142)
filePanel.Size = UDim2.fromOffset(358, 232)
filePanel.BackgroundColor3 = PANEL
filePanel.BorderSizePixel = 0
filePanel.Parent = content
corner(filePanel, 8)

local fileTitle = label(filePanel, "File List", 17, Color3.fromRGB(200, 200, 204))
fileTitle.Position = UDim2.fromOffset(24, 14)
fileTitle.Size = UDim2.new(1, -48, 0, 40)

local function createFile(name, y)
	local f = Instance.new("TextButton")
	f.BackgroundTransparency = 1
	f.Size = UDim2.new(1, -35, 0, 40)
	f.Position = UDim2.fromOffset(20, y)
	f.Text = ""
	f.AutoButtonColor = false
	f.Parent = filePanel

	local icon = label(f, "□", 21, Color3.fromRGB(200, 200, 205))
	icon.Size = UDim2.fromOffset(30, 40)

	local nameLabel = label(f, name, 16, TEXT)
	nameLabel.Position = UDim2.fromOffset(31, 0)
	nameLabel.Size = UDim2.new(1, -31, 1, 0)

	f.MouseEnter:Connect(function()
		nameLabel.TextColor3 = Color3.new(1, 1, 1)
	end)

	f.MouseLeave:Connect(function()
		nameLabel.TextColor3 = TEXT
	end)

	return f
end

createFile("Scripts", 67)
createFile("AutoExec", 112)

--// Output
local output = Instance.new("Frame")
output.Name = "Output"
output.Position = UDim2.fromOffset(24, 386)
output.Size = UDim2.new(1, -48, 1, -464)
output.BackgroundColor3 = PANEL
output.BorderSizePixel = 0
output.Parent = content
corner(output, 8)

local outputTitle = label(output, "Script Output", 18, Color3.fromRGB(195, 195, 200))
outputTitle.Position = UDim2.fromOffset(18, 0)
outputTitle.Size = UDim2.fromOffset(200, 48)

local clearOutput = button(output, "Clear")
clearOutput.Size = UDim2.fromOffset(70, 38)
clearOutput.Position = UDim2.new(1, -90, 0, 5)
clearOutput.BackgroundTransparency = 1
clearOutput.TextColor3 = MUTED

local outputBox = Instance.new("ScrollingFrame")
outputBox.Name = "OutputBox"
outputBox.Position = UDim2.fromOffset(18, 50)
outputBox.Size = UDim2.new(1, -36, 1, -62)
outputBox.BackgroundTransparency = 1
outputBox.BorderSizePixel = 0
outputBox.ScrollBarThickness = 2
outputBox.CanvasSize = UDim2.new()
outputBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
outputBox.Parent = output

local outputText = label(
	outputBox,
	"Output from printconsole() and errors will appear here.",
	15,
	Color3.fromRGB(105, 105, 111),
	Enum.Font.Code
)
outputText.Size = UDim2.new(1, -10, 0, 60)
outputText.TextWrapped = true
outputText.TextYAlignment = Enum.TextYAlignment.Top

clearOutput.MouseButton1Click:Connect(function()
	outputText.Text = ""
end)

--// Bottom toolbar
local toolbar = Instance.new("Frame")
toolbar.Name = "Toolbar"
toolbar.Position = UDim2.new(0, 0, 1, -72)
toolbar.Size = UDim2.new(1, 0, 0, 72)
toolbar.BackgroundColor3 = Color3.fromRGB(11, 11, 12)
toolbar.BorderSizePixel = 0
toolbar.Parent = content

-- left buttons
local attach = button(toolbar, "▣   Attach")
attach.Position = UDim2.fromOffset(24, 12)
attach.Size = UDim2.fromOffset(135, 48)

local execute = button(toolbar, "▶   Execute")
execute.Position = UDim2.fromOffset(166, 12)
execute.Size = UDim2.fromOffset(145, 48)

-- right buttons
local openFile = button(toolbar, "▰   Open File")
openFile.Position = UDim2.new(1, -445, 0, 12)
openFile.Size = UDim2.fromOffset(155, 48)

local saveFile = button(toolbar, "▣   Save File")
saveFile.Position = UDim2.new(1, -280, 0, 12)
saveFile.Size = UDim2.fromOffset(145, 48)

local clear = button(toolbar, "▣   Clear")
clear.Position = UDim2.new(1, -125, 0, 12)
clear.Size = UDim2.fromOffset(110, 48)

clear.MouseButton1Click:Connect(function()
	editorBox.Text = ""
end)

--// Fake attach state for the UI
attach.MouseButton1Click:Connect(function()
	status.Text = "Attached"
	statusDot.BackgroundColor3 = Color3.fromRGB(88, 190, 116)
end)

execute.MouseButton1Click:Connect(function()
	outputText.Text = "Execute clicked.\n"
end)

--// Minimize
local minimized = false
local oldSize = window.Size

minimize.MouseButton1Click:Connect(function()
	minimized = not minimized

	if minimized then
		oldSize = window.Size
		window.Size = UDim2.fromOffset(1100, 64)

		for _, child in ipairs(window:GetChildren()) do
			if child ~= top then
				child.Visible = false
			end
		end
	else
		window.Size = oldSize

		for _, child in ipairs(window:GetChildren()) do
			child.Visible = true
		end
	end
end)

--// Maximize
local maximized = false
local previousSize
local previousPosition

maximize.MouseButton1Click:Connect(function()
	maximized = not maximized

	if maximized then
		previousSize = window.Size
		previousPosition = window.Position

		window.Position = UDim2.fromScale(0.5, 0.5)
		window.Size = UDim2.new(1, -20, 1, -20)
	else
		window.Size = previousSize
		window.Position = previousPosition
	end
end)

--// Window dragging
local dragging = false
local dragStart
local startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = window.Position
	end
end)

top.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart

		window.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--// Tab close
tabClose.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		editorBox.Text = ""
		tabName.Text = "Tab 1"
	end
end)
