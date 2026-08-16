-- Zenith V2 style UI
-- LocalScript
-- UI only: no executor, backdoor, HTTP, or external functionality.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Use PlayerGui in normal Roblox, with executor UI containers when available.
local playerGui
if player then
	playerGui = player:WaitForChild("PlayerGui")
end

local uiParent = playerGui
if gethui then
	local ok, result = pcall(gethui)
	if ok and result then
		uiParent = result
	end
end

if not uiParent then
	uiParent = game:GetService("CoreGui")
end

local old = uiParent:FindFirstChild("ZenithV2")
if old then
	old:Destroy()
end

local BG = Color3.fromRGB(10, 10, 11)
local TOP = Color3.fromRGB(17, 17, 19)
local SIDE = Color3.fromRGB(15, 15, 17)
local PANEL = Color3.fromRGB(16, 16, 18)
local BUTTON = Color3.fromRGB(29, 29, 32)
local BUTTON_HOVER = Color3.fromRGB(39, 39, 43)
local BORDER = Color3.fromRGB(48, 48, 52)
local TEXT = Color3.fromRGB(225, 225, 228)
local MUTED = Color3.fromRGB(145, 145, 151)
local BLUE = Color3.fromRGB(73, 139, 255)
local PURPLE = Color3.fromRGB(196, 119, 220)

local function corner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local function stroke(parent, color, thickness)
	local s = Instance.new("UIStroke")
	s.Color = color or BORDER
	s.Thickness = thickness or 1
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

local gui = Instance.new("ScreenGui")
gui.Name = "ZenithV2"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999999
gui.Parent = uiParent

-- Always-visible launcher square.
local launcher = Instance.new("TextButton")
launcher.Name = "Launcher"
launcher.AnchorPoint = Vector2.new(1, 0)
launcher.Position = UDim2.new(1, -20, 0, 20)
launcher.Size = UDim2.fromOffset(56, 56)
launcher.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
launcher.BorderSizePixel = 0
launcher.Text = "□"
launcher.TextColor3 = Color3.fromRGB(220, 220, 225)
launcher.TextSize = 24
launcher.Font = Enum.Font.GothamBold
launcher.AutoButtonColor = false
launcher.Active = true
launcher.Visible = true
launcher.ZIndex = 1000
launcher.Parent = gui
launcher:SetAttribute("LauncherReady", true)

local launcherCorner = Instance.new("UICorner")
launcherCorner.CornerRadius = UDim.new(0, 8)
launcherCorner.Parent = launcher

local launcherStroke = Instance.new("UIStroke")
launcherStroke.Color = Color3.fromRGB(90, 90, 100)
launcherStroke.Thickness = 1
launcherStroke.Parent = launcher

launcher.MouseEnter:Connect(function()
	launcher.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
end)

launcher.MouseLeave:Connect(function()
	launcher.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
end)

local window = Instance.new("Frame")
window.Name = "Window"
window.AnchorPoint = Vector2.new(0.5, 0.5)
window.Position = UDim2.fromScale(0.5, 0.5)
window.Size = UDim2.fromOffset(1100, 560)
window.BackgroundColor3 = BG
window.BorderSizePixel = 0
window.Visible = false
window.Parent = gui
corner(window, 10)
stroke(window, Color3.fromRGB(72, 72, 77), 1)

local top = Instance.new("Frame")
top.Name = "TopBar"
top.Size = UDim2.new(1, 0, 0, 64)
top.BackgroundColor3 = TOP
top.BorderSizePixel = 0
top.Parent = window

local topLine = Instance.new("Frame")
topLine.Position = UDim2.new(0, 0, 1, -1)
topLine.Size = UDim2.new(1, 0, 0, 1)
topLine.BackgroundColor3 = BORDER
topLine.BorderSizePixel = 0
topLine.Parent = top

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

local titleHolder = Instance.new("Frame")
titleHolder.BackgroundTransparency = 1
titleHolder.AnchorPoint = Vector2.new(0.5, 0)
titleHolder.Position = UDim2.new(0.5, 0, 0, 0)
titleHolder.Size = UDim2.fromOffset(220, 64)
titleHolder.Parent = top

local title = label(titleHolder, "Zenith ", 23, TEXT, Enum.Font.GothamMedium)
title.Size = UDim2.fromOffset(100, 64)
title.TextXAlignment = Enum.TextXAlignment.Right

local titleV2 = label(titleHolder, "V2", 23, PURPLE, Enum.Font.GothamMedium)
titleV2.Size = UDim2.fromOffset(45, 64)
titleV2.Position = UDim2.fromOffset(105, 0)

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Position = UDim2.fromOffset(0, 64)
sidebar.Size = UDim2.fromOffset(82, 496)
sidebar.BackgroundColor3 = SIDE
sidebar.BorderSizePixel = 0
sidebar.Parent = window

local sidebarLine = Instance.new("Frame")
sidebarLine.Position = UDim2.new(1, -1, 0, 0)
sidebarLine.Size = UDim2.new(0, 1, 1, 0)
sidebarLine.BackgroundColor3 = Color3.fromRGB(27, 27, 30)
sidebarLine.BorderSizePixel = 0
sidebarLine.Parent = sidebar

local sidebarButtons = {}

local function createSideButton(icon, y)
	local holder = Instance.new("Frame")
	holder.BackgroundTransparency = 1
	holder.Size = UDim2.new(1, 0, 0, 66)
	holder.Position = UDim2.fromOffset(0, y)
	holder.Parent = sidebar

	local active = Instance.new("Frame")
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

	table.insert(sidebarButtons, {Button = b, Active = active})
	return b, active
end

createSideButton("⌂", 12)
local codeButton, codeActive = createSideButton("</>", 78)
createSideButton("▤", 144)
createSideButton("▣", 210)

local settingsButton, settingsActive = createSideButton("⚙", 410)

codeActive.Visible = true
codeButton.TextColor3 = TEXT

local content = Instance.new("Frame")
content.Name = "Content"
content.Position = UDim2.fromOffset(82, 64)
content.Size = UDim2.new(1, -82, 1, -64)
content.BackgroundColor3 = BG
content.BorderSizePixel = 0
content.Parent = window

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

local plus = button(tabBar, "+")
plus.Size = UDim2.fromOffset(74, 74)
plus.Position = UDim2.new(1, -92, 0, 10)
plus.BackgroundColor3 = Color3.fromRGB(40, 40, 43)
plus.TextSize = 24

-- Main terminal/editor. No run icon.
local editor = Instance.new("Frame")
editor.Name = "Terminal"
editor.Position = UDim2.fromOffset(24, 86)
editor.Size = UDim2.new(1, -382, 1, -110)
editor.BackgroundColor3 = Color3.fromRGB(11, 11, 12)
editor.BorderSizePixel = 0
editor.Parent = content
corner(editor, 8)
stroke(editor, Color3.fromRGB(20, 20, 22), 1)

local lineNumbers = label(editor, "1", 15, Color3.fromRGB(190, 190, 194), Enum.Font.Code)
lineNumbers.Position = UDim2.fromOffset(24, 12)
lineNumbers.Size = UDim2.fromOffset(30, 40)
lineNumbers.TextYAlignment = Enum.TextYAlignment.Top
lineNumbers.TextXAlignment = Enum.TextXAlignment.Center

local editorBox = Instance.new("TextBox")
editorBox.Name = "TerminalInput"
editorBox.Position = UDim2.fromOffset(64, 10)
editorBox.Size = UDim2.new(1, -82, 1, -20)
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

local filePanel = Instance.new("Frame")
filePanel.Name = "FileList"
filePanel.Position = UDim2.new(1, -358, 0, 86)
filePanel.Size = UDim2.fromOffset(334, 232)
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

-- Bottom toolbar directly under the terminal. No output area.
local toolbar = Instance.new("Frame")
toolbar.Name = "Toolbar"
toolbar.Position = UDim2.new(0, 0, 1, -72)
toolbar.Size = UDim2.new(1, 0, 0, 72)
toolbar.BackgroundColor3 = Color3.fromRGB(11, 11, 12)
toolbar.BorderSizePixel = 0
toolbar.Parent = content

local attach = button(toolbar, "▣   Attach")
attach.Position = UDim2.fromOffset(24, 12)
attach.Size = UDim2.fromOffset(135, 48)

local execute = button(toolbar, "▶   Execute")
execute.Position = UDim2.fromOffset(166, 12)
execute.Size = UDim2.fromOffset(145, 48)

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

attach.MouseButton1Click:Connect(function()
	status.Text = "Attached"
	statusDot.BackgroundColor3 = Color3.fromRGB(88, 190, 116)
end)

-- UI-only button behavior.
execute.MouseButton1Click:Connect(function()
	status.Text = "Executed"
end)

-- Open/close from the square at the top-right.
local open = false
launcher.Visible = true
window.Visible = false

launcher.MouseButton1Click:Connect(function()
	open = not open
	window.Visible = open
	launcher.Text = open and "×" or "□"
end)

-- Drag the window from the top bar.
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

tabClose.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		editorBox.Text = ""
		tabName.Text = "Tab 1"
	end
end)
