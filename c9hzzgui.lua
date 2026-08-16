

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove an existing copy
local old = playerGui:FindFirstChild("ScreenGui")
if old then
	old:Destroy()
end

local function create(className, name, parent)
	local object = Instance.new(className)
	object.Name = name
	object.Parent = parent
	return object
end

local function round(object, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = object
	return corner
end

local function stroke(object, transparency)
	local s = Instance.new("UIStroke")
	s.Color = Color3.fromRGB(97, 97, 97)
	s.Thickness = 1
	s.Transparency = transparency or 0.5
	s.Parent = object
	return s
end

local function buttonStyle(button)
	button.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	round(button, 6)
	stroke(button, 0.5)

	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(27, 29, 33)
	end)

	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	end)

	button.MouseButton1Down:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(35, 37, 42)
	end)

	button.MouseButton1Up:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(27, 29, 33)
	end)
end

----------------------------------------------------------------
-- SCREEN GUI
----------------------------------------------------------------

local gui = create("ScreenGui", "ScreenGui", playerGui)
gui.DisplayOrder = 999999999
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

----------------------------------------------------------------
-- MAIN
----------------------------------------------------------------

local main = create("Frame", "Main", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.fromScale(0.72, 0.48)
main.Size = UDim2.fromOffset(471, 310)
main.BackgroundColor3 = Color3.fromRGB(26, 27, 32)
main.BorderSizePixel = 0
main.ZIndex = 1

round(main, 6)
stroke(main, 0.5)

----------------------------------------------------------------
-- EXECUTOR CONTAINER
----------------------------------------------------------------

local executor = create("Frame", "Executor", main)
executor.Position = UDim2.fromOffset(16, 35)
executor.Size = UDim2.fromOffset(440, 260)
executor.BackgroundTransparency = 1
executor.BorderSizePixel = 0
executor.ZIndex = 2

----------------------------------------------------------------
-- TITLE BAR
----------------------------------------------------------------

local title = create("Frame", "Title", executor)
title.Position = UDim2.fromOffset(0, -32)
title.Size = UDim2.fromOffset(457, 25)
title.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
title.BorderSizePixel = 0
title.ZIndex = 10

round(title, 6)
stroke(title, 0.5)

local titleLabel = create("TextLabel", "Label", title)
titleLabel.Position = UDim2.fromOffset(15, 2)
titleLabel.Size = UDim2.fromOffset(330, 21)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Gotham
titleLabel.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Italic
)
titleLabel.Text = ' <font color="#f7f30a">Spunchbub</font> - Private Backdoor'
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 16
titleLabel.RichText = true
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.ZIndex = 11

----------------------------------------------------------------
-- CLOSE
----------------------------------------------------------------

local close = create("ImageButton", "close", executor)
close.Position = UDim2.fromOffset(417, -34)
close.Size = UDim2.fromOffset(24, 24)
close.BackgroundTransparency = 1
close.BorderSizePixel = 0
close.Image = "rbxassetid://3926305904"
close.ImageColor3 = Color3.new(1, 1, 1)
close.ImageRectOffset = Vector2.new(284, 4)
close.ImageRectSize = Vector2.new(24, 24)
close.ZIndex = 20

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

----------------------------------------------------------------
-- EDITOR OUTER
----------------------------------------------------------------

local editor = create("Frame", "Editor", executor)
editor.Position = UDim2.fromOffset(-1, 0)
editor.Size = UDim2.fromOffset(440, 223)
editor.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
editor.BorderSizePixel = 0
editor.ClipsDescendants = true
editor.ZIndex = 3

round(editor, 6)
stroke(editor, 0.5)

----------------------------------------------------------------
-- EDITOR SCROLLING AREA
----------------------------------------------------------------

local editorFrame = create("ScrollingFrame", "EditorFrame", editor)
editorFrame.Position = UDim2.fromOffset(1, 1)
editorFrame.Size = UDim2.new(1, -2, 1, -2)
editorFrame.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
editorFrame.BackgroundTransparency = 0
editorFrame.BorderSizePixel = 0
editorFrame.ScrollBarThickness = 5
editorFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
editorFrame.ScrollingDirection = Enum.ScrollingDirection.XY
editorFrame.CanvasSize = UDim2.fromOffset(0, 0)
editorFrame.ZIndex = 4

----------------------------------------------------------------
-- LINE NUMBERS
----------------------------------------------------------------

local lines = create("TextLabel", "Lines", editorFrame)
lines.Position = UDim2.fromOffset(0, 0)
lines.Size = UDim2.fromOffset(32, 1000)
lines.BackgroundTransparency = 1
lines.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
lines.Text = "1"
lines.TextColor3 = Color3.fromRGB(150, 150, 150)
lines.TextSize = 15
lines.TextXAlignment = Enum.TextXAlignment.Right
lines.TextYAlignment = Enum.TextYAlignment.Top
lines.TextWrapped = false
lines.ZIndex = 6

----------------------------------------------------------------
-- SOURCE
----------------------------------------------------------------

local source = create("TextBox", "Source", editorFrame)
source.Position = UDim2.fromOffset(38, 0)
source.Size = UDim2.new(1, -43, 1000, 0)
source.BackgroundTransparency = 1
source.BorderSizePixel = 0
source.ClearTextOnFocus = false
source.MultiLine = true
source.TextEditable = true
source.FontFace = Font.new(
	"rbxasset://fonts/families/Inconsolata.json",
	Enum.FontWeight.Regular,
	Enum.FontStyle.Normal
)
source.Text = ""
source.PlaceholderText = "-- boi what the helly 67"
source.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
source.TextColor3 = Color3.fromRGB(204, 204, 204)
source.TextSize = 15
source.TextXAlignment = Enum.TextXAlignment.Left
source.TextYAlignment = Enum.TextYAlignment.Top
source.TextWrapped = false
source.ZIndex = 5

----------------------------------------------------------------
-- LINE NUMBER UPDATER
----------------------------------------------------------------

local function updateLines()
	local text = source.Text

	local count = 1

	if text ~= "" then
		for _ in text:gmatch("\n") do
			count += 1
		end
	end

	local result = table.create(count)

	for i = 1, count do
		result[i] = tostring(i)
	end

	lines.Text = table.concat(result, "\n")

	-- Keep the line-number column tall enough
	local height = math.max(217, count * 18)

	lines.Size = UDim2.fromOffset(32, height)
	source.Size = UDim2.new(1, -43, 0, height)

	editorFrame.CanvasSize = UDim2.fromOffset(
		math.max(source.TextBounds.X + 60, editorFrame.AbsoluteSize.X),
		height
	)
end

source:GetPropertyChangedSignal("Text"):Connect(updateLines)

source.Focused:Connect(function()
	source.TextColor3 = Color3.fromRGB(220, 220, 220)
end)

source.FocusLost:Connect(function()
	source.TextColor3 = Color3.fromRGB(204, 204, 204)
end)

----------------------------------------------------------------
-- BOTTOM BUTTONS
----------------------------------------------------------------

local executeButton = create("TextButton", "ExecuteButton", executor)
executeButton.Position = UDim2.fromOffset(0, 228)
executeButton.Size = UDim2.fromOffset(130, 33)
executeButton.Text = "Execute"
executeButton.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
executeButton.TextColor3 = Color3.new(1, 1, 1)
executeButton.TextSize = 16
executeButton.BorderSizePixel = 0
executeButton.ZIndex = 10
buttonStyle(executeButton)

local clearButton = create("TextButton", "ClearButton", executor)
clearButton.Position = UDim2.fromOffset(116, 228)
clearButton.Size = UDim2.fromOffset(100, 34)
clearButton.Text = "Clear"
clearButton.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Medium,
	Enum.FontStyle.Normal
)
clearButton.TextColor3 = Color3.new(1, 1, 1)
clearButton.TextSize = 16
clearButton.BorderSizePixel = 0
clearButton.ZIndex = 10
buttonStyle(clearButton)

clearButton.MouseButton1Click:Connect(function()
	source.Text = ""
	updateLines()
end)

----------------------------------------------------------------
-- ICON BUTTON CREATOR
----------------------------------------------------------------

local function createIconButton(name, x, image, imageSize)
	local button = create("TextButton", name, executor)

	button.Position = UDim2.fromOffset(x, 228)
	button.Size = UDim2.fromOffset(34, 34)
	button.Text = ""
	button.BorderSizePixel = 0
	button.ZIndex = 10

	buttonStyle(button)

	local icon = create("ImageLabel", "ImageLabel", button)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.Position = UDim2.fromScale(0.5, 0.5)
	icon.Size = UDim2.fromOffset(imageSize, imageSize)
	icon.BackgroundTransparency = 1
	icon.Image = image
	icon.ImageColor3 = Color3.new(1, 1, 1)
	icon.ZIndex = 11

	return button
end

----------------------------------------------------------------
-- HIDE / SHOW
----------------------------------------------------------------

local hideButton = createIconButton(
	"HideButton",
	272,
	"rbxassetid://3926307971",
	25
)

local showButton = createIconButton(
	"ShowButton",
	272,
	"rbxassetid://3926307971",
	25
)

showButton.Visible = false

hideButton.MouseButton1Click:Connect(function()
	editor.Visible = false
	executeButton.Visible = false
	clearButton.Visible = false
	hideButton.Visible = false
	showButton.Visible = true
end)

showButton.MouseButton1Click:Connect(function()
	editor.Visible = true
	executeButton.Visible = true
	clearButton.Visible = true
	hideButton.Visible = true
	showButton.Visible = false
end)

----------------------------------------------------------------
-- RE BUTTON
----------------------------------------------------------------

local reButton = createIconButton(
	"REButton",
	310,
	"rbxassetid://7072721335",
	22
)

----------------------------------------------------------------
-- R6 BUTTON
----------------------------------------------------------------

local r6Button = createIconButton(
	"R6Button",
	348,
	"rbxassetid://4941166750",
	27
)

----------------------------------------------------------------
-- EXTRA BUTTON FROM ORIGINAL
----------------------------------------------------------------

local extraButton = createIconButton(
	"REButton2",
	386,
	"rbxassetid://10734933966",
	22
)

----------------------------------------------------------------
-- DRAGGING
----------------------------------------------------------------

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPosition = main.Position
	end
end)

title.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)

----------------------------------------------------------------
-- INITIALIZE
----------------------------------------------------------------

updateLines()
