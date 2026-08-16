--// Main
local g2 = make("Frame", "Main", g1)
g2.Active = false
g2.AnchorPoint = Vector2.new(0.5, 0.5)
g2.Position = UDim2.new(0.5, 0, 0.5, 0)
g2.Size = UDim2.new(0, 600, 0, 310)
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

--// Sidebar
local Sidebar = make("Frame", "Sidebar", g2)
Sidebar.Active = true
Sidebar.Position = UDim2.new(0, 0, 0, 25)
Sidebar.Size = UDim2.new(0, 105, 1, -25)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 21, 25)
Sidebar.BackgroundTransparency = 0
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 25

local SidebarStroke = make("UIStroke", "UIStroke", Sidebar)
SidebarStroke.Color = Color3.fromRGB(97, 97, 97)
SidebarStroke.Thickness = 1
SidebarStroke.Transparency = 0.5

--// Sidebar title
local SidebarTitle = make("TextLabel", "SidebarTitle", Sidebar)
SidebarTitle.Active = false
SidebarTitle.Position = UDim2.new(0, 10, 0, 12)
SidebarTitle.Size = UDim2.new(1, -20, 0, 24)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.BorderSizePixel = 0
SidebarTitle.ZIndex = 26
SidebarTitle.FontFace = Font.new(
	"rbxasset://fonts/families/GothamSSm.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Normal
)
SidebarTitle.Text = "C9HZZ"
SidebarTitle.TextColor3 = Color3.fromRGB(173, 216, 230)
SidebarTitle.TextSize = 16
SidebarTitle.TextXAlignment = Enum.TextXAlignment.Left
SidebarTitle.TextYAlignment = Enum.TextYAlignment.Center

--// Sidebar separator
local SidebarLine = make("Frame", "SidebarLine", Sidebar)
SidebarLine.Active = false
SidebarLine.Position = UDim2.new(0, 10, 0, 43)
SidebarLine.Size = UDim2.new(1, -20, 0, 1)
SidebarLine.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
SidebarLine.BackgroundTransparency = 0.5
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 26

--// Sidebar buttons
local function sidebarButton(name, text, y)
	local button = make("TextButton", name, Sidebar)

	button.Active = true
	button.Position = UDim2.new(0, 7, 0, y)
	button.Size = UDim2.new(1, -14, 0, 34)
	button.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
	button.BackgroundTransparency = 0
	button.BorderSizePixel = 0
	button.ZIndex = 27
	button.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(204, 204, 204)
	button.TextSize = 14
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.TextYAlignment = Enum.TextYAlignment.Center
	button.AutoButtonColor = true

	local padding = make("UIPadding", "UIPadding", button)
	padding.PaddingLeft = UDim.new(0, 10)

	local corner = make("UICorner", "UICorner", button)
	corner.CornerRadius = UDim.new(0, 5)

	return button
end

local SidebarHome = sidebarButton("HomeButton", "Home", 55)
local SidebarScripts = sidebarButton("ScriptsButton", "Scripts", 94)
local SidebarSettings = sidebarButton("SettingsButton", "Settings", 133)

--// Executor container
local g4 = make("Frame", "Executor", g2)
g4.Active = false
g4.Position = UDim2.new(0, 105, 0, 25)
g4.Size = UDim2.new(1, -105, 1, -25)
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
g8.CanvasSize = Vector2.new(0, 0, 0, 0)
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

--// Sidebar selection
local function selectSidebar(button)
	for _, child in ipairs(Sidebar:GetChildren()) do
		if child:IsA("TextButton") then
			child.BackgroundColor3 = Color3.fromRGB(17, 19, 22)
			child.TextColor3 = Color3.fromRGB(204, 204, 204)
		end
	end

	button.BackgroundColor3 = Color3.fromRGB(35, 37, 43)
	button.TextColor3 = Color3.fromRGB(173, 216, 230)
end

SidebarHome.MouseButton1Click:Connect(function()
	selectSidebar(SidebarHome)
end)

SidebarScripts.MouseButton1Click:Connect(function()
	selectSidebar(SidebarScripts)
end)

SidebarSettings.MouseButton1Click:Connect(function()
	selectSidebar(SidebarSettings)
end)

selectSidebar(SidebarHome)
