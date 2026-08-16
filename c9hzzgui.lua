from pathlib import Path

code = r'''-- Zenith V2 — compact terminal UI
-- LocalScript / UI only

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("ZenithV2")
if old then old:Destroy() end

local C = {
	bg = Color3.fromRGB(10, 10, 11),
	header = Color3.fromRGB(15, 15, 17),
	side = Color3.fromRGB(12, 12, 14),
	editor = Color3.fromRGB(9, 9, 10),
	panel = Color3.fromRGB(14, 14, 16),
	hover = Color3.fromRGB(27, 27, 30),
	border = Color3.fromRGB(32, 32, 35),
	text = Color3.fromRGB(220, 220, 224),
	muted = Color3.fromRGB(116, 116, 122),
	accent = Color3.fromRGB(118, 92, 190),
	blue = Color3.fromRGB(73, 125, 220),
}

local function corner(o, r)
	local x = Instance.new("UICorner")
	x.CornerRadius = UDim.new(0, r)
	x.Parent = o
end

local function line(o, color)
	local x = Instance.new("UIStroke")
	x.Color = color or C.border
	x.Thickness = 1
	x.Parent = o
end

local function text(parent, value, size, color, font)
	local x = Instance.new("TextLabel")
	x.BackgroundTransparency = 1
	x.Text = value
	x.TextColor3 = color or C.text
	x.TextSize = size or 14
	x.Font = font or Enum.Font.Code
	x.TextXAlignment = Enum.TextXAlignment.Left
	x.TextYAlignment = Enum.TextYAlignment.Center
	x.Parent = parent
	return x
end

local gui = Instance.new("ScreenGui")
gui.Name = "ZenithV2"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = playerGui

-- Launcher
local launcher = Instance.new("TextButton")
launcher.Name = "Launcher"
launcher.AnchorPoint = Vector2.new(1, 0)
launcher.Position = UDim2.new(1, -16, 0, 16)
launcher.Size = UDim2.fromOffset(42, 42)
launcher.BackgroundColor3 = C.panel
launcher.Text = "□"
launcher.TextColor3 = C.text
launcher.TextSize = 20
launcher.Font = Enum.Font.GothamMedium
launcher.AutoButtonColor = false
launcher.ZIndex = 100
launcher.Parent = gui
corner(launcher, 6)
line(launcher)

local window = Instance.new("Frame")
window.Name = "Window"
window.AnchorPoint = Vector2.new(.5, .5)
window.Position = UDim2.fromScale(.5, .5)
window.Size = UDim2.fromOffset(1030, 590)
window.BackgroundColor3 = C.bg
window.BorderSizePixel = 0
window.Visible = false
window.Parent = gui
corner(window, 7)
line(window)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = C.header
header.BorderSizePixel = 0
header.Parent = window

local title = text(header, "ZENITH", 14, C.text, Enum.Font.GothamMedium)
title.Position = UDim2.fromOffset(18, 0)
title.Size = UDim2.fromOffset(80, 48)

local version = text(header, "V2", 12, C.accent, Enum.Font.GothamBold)
version.Position = UDim2.fromOffset(72, 0)
version.Size = UDim2.fromOffset(25, 48)

local state = text(header, "●  INACTIVE", 11, C.muted, Enum.Font.Code)
state.AnchorPoint = Vector2.new(1, 0)
state.Position = UDim2.new(1, -18, 0, 0)
state.Size = UDim2.fromOffset(100, 48)
state.TextXAlignment = Enum.TextXAlignment.Right

local headerLine = Instance.new("Frame")
headerLine.Position = UDim2.new(0, 0, 1, -1)
headerLine.Size = UDim2.new(1, 0, 0, 1)
headerLine.BackgroundColor3 = C.border
headerLine.BorderSizePixel = 0
headerLine.Parent = header

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Position = UDim2.fromOffset(0, 48)
sidebar.Size = UDim2.fromOffset(58, 542)
sidebar.BackgroundColor3 = C.side
sidebar.BorderSizePixel = 0
sidebar.Parent = window

local sidebarLine = Instance.new("Frame")
sidebarLine.Position = UDim2.new(1, -1, 0, 0)
sidebarLine.Size = UDim2.new(0, 1, 1, 0)
sidebarLine.BackgroundColor3 = C.border
sidebarLine.BorderSizePixel = 0
sidebarLine.Parent = sidebar

local function sideButton(symbol, y, active)
	local b = Instance.new("TextButton")
	b.Position = UDim2.fromOffset(0, y)
	b.Size = UDim2.fromOffset(58, 54)
	b.BackgroundColor3 = active and C.hover or C.side
	b.BorderSizePixel = 0
	b.Text = symbol
	b.TextColor3 = active and C.text or C.muted
	b.TextSize = 17
	b.Font = Enum.Font.GothamMedium
	b.AutoButtonColor = false
	b.Parent = sidebar

	if active then
		local bar = Instance.new("Frame")
		bar.Position = UDim2.fromOffset(0, 9)
		bar.Size = UDim2.fromOffset(3, 36)
		bar.BackgroundColor3 = C.blue
		bar.BorderSizePixel = 0
		bar.Parent = b
		corner(bar, 3)
	end

	b.MouseEnter:Connect(function()
		if not active then b.BackgroundColor3 = C.hover end
	end)
	b.MouseLeave:Connect(function()
		if not active then b.BackgroundColor3 = C.side end
	end)

	return b
end

sideButton("⌂", 10, false)
sideButton(">", 64, true)
sideButton("▤", 118, false)
sideButton("□", 172, false)

local settings = sideButton("⚙", 478, false)

-- Main area
local main = Instance.new("Frame")
main.Position = UDim2.fromOffset(58, 48)
main.Size = UDim2.new(1, -58, 1, -48)
main.BackgroundColor3 = C.bg
main.BorderSizePixel = 0
main.Parent = window

-- Tab row
local tabs = Instance.new("Frame")
tabs.Size = UDim2.new(1, 0, 0, 42)
tabs.BackgroundColor3 = C.header
tabs.BorderSizePixel = 0
tabs.Parent = main

local tab = Instance.new("TextButton")
tab.Position = UDim2.fromOffset(12, 7)
tab.Size = UDim2.fromOffset(128, 35)
tab.BackgroundColor3 = C.panel
tab.BorderSizePixel = 0
tab.Text = "  tab_1.lua  ×"
tab.TextColor3 = C.text
tab.TextSize = 12
tab.Font = Enum.Font.Code
tab.TextXAlignment = Enum.TextXAlignment.Left
tab.AutoButtonColor = false
tab.Parent = tabs
corner(tab, 4)

local tabBar = Instance.new("Frame")
tabBar.Position = UDim2.fromOffset(0, 0)
tabBar.Size = UDim2.fromOffset(2, 35)
tabBar.BackgroundColor3 = C.blue
tabBar.BorderSizePixel = 0
tabBar.Parent = tab
corner(tabBar, 2)

-- Editor
local editor = Instance.new("Frame")
editor.Position = UDim2.fromOffset(12, 54)
editor.Size = UDim2.new(1, -310, 1, -66)
editor.BackgroundColor3 = C.editor
editor.BorderSizePixel = 0
editor.Parent = main
corner(editor, 5)
line(editor)

local numbers = text(editor, "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16", 13, Color3.fromRGB(72, 72, 78), Enum.Font.Code)
numbers.Position = UDim2.fromOffset(12, 9)
numbers.Size = UDim2.fromOffset(30, 300)
numbers.TextYAlignment = Enum.TextYAlignment.Top
numbers.TextXAlignment = Enum.TextXAlignment.Right

local input = Instance.new("TextBox")
input.Name = "Terminal"
input.Position = UDim2.fromOffset(54, 8)
input.Size = UDim2.new(1, -66, 1, -16)
input.BackgroundTransparency = 1
input.ClearTextOnFocus = false
input.MultiLine = true
input.Text = ""
input.PlaceholderText = "> "
input.PlaceholderColor3 = C.muted
input.TextColor3 = C.text
input.TextSize = 13
input.Font = Enum.Font.Code
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.TextWrapped = false
input.Parent = editor

-- Right file panel
local files = Instance.new("Frame")
files.Position = UDim2.new(1, -286, 0, 54)
files.Size = UDim2.fromOffset(274, 280)
files.BackgroundColor3 = C.panel
files.BorderSizePixel = 0
files.Parent = main
corner(files, 5)
line(files)

local fileHeader = text(files, "FILES", 11, C.muted, Enum.Font.GothamMedium)
fileHeader.Position = UDim2.fromOffset(14, 0)
fileHeader.Size = UDim2.new(1, -28, 0, 38)

local function file(name, y, selected)
	local b = Instance.new("TextButton")
	b.Position = UDim2.fromOffset(8, y)
	b.Size = UDim2.new(1, -16, 0, 34)
	b.BackgroundColor3 = selected and C.hover or C.panel
	b.BorderSizePixel = 0
	b.Text = "  " .. name
	b.TextColor3 = selected and C.text or C.muted
	b.TextSize = 12
	b.Font = Enum.Font.Code
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.AutoButtonColor = false
	b.Parent = files
	corner(b, 3)
	return b
end

file("Scripts", 40, true)
file("AutoExec", 76, false)
file("README", 112, false)

-- Compact bottom controls
local controls = Instance.new("Frame")
controls.Position = UDim2.new(0, 12, 1, -52)
controls.Size = UDim2.new(1, -24, 0, 40)
controls.BackgroundTransparency = 1
controls.Parent = main

local function control(name, x, width)
	local b = Instance.new("TextButton")
	b.Position = UDim2.fromOffset(x, 0)
	b.Size = UDim2.fromOffset(width, 40)
	b.BackgroundColor3 = C.panel
	b.BorderSizePixel = 0
	b.Text = name
	b.TextColor3 = C.text
	b.TextSize = 11
	b.Font = Enum.Font.GothamMedium
	b.AutoButtonColor = false
	b.Parent = controls
	corner(b, 4)
	line(b, C.border)
	b.MouseEnter:Connect(function() b.BackgroundColor3 = C.hover end)
	b.MouseLeave:Connect(function() b.BackgroundColor3 = C.panel end)
	return b
end

local attach = control("ATTACH", 0, 90)
local execute = control("EXECUTE", 98, 100)
local clear = control("CLEAR", 206, 82)

-- Launcher behavior
local opened = false

launcher.MouseButton1Click:Connect(function()
	opened = not opened
	window.Visible = opened
	launcher.Text = opened and "×" or "□"
end)

-- Drag window
local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPosition = window.Position
	end
end)

header.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(i)
	if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
		local d = i.Position - dragStart
		window.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + d.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + d.Y
		)
	end
end)

clear.MouseButton1Click:Connect(function()
	input.Text = ""
end)

attach.MouseButton1Click:Connect(function()
	state.Text = "●  ATTACHED"
	state.TextColor3 = Color3.fromRGB(90, 180, 115)
end)

execute.MouseButton1Click:Connect(function()
	state.Text = "●  READY"
end)
'''

p = Path("/mnt/data/ZenithV2_REBUILT.lua")
p.write_text(code, encoding="utf-8")
print(p)
print("lines:", len(code.splitlines()))
