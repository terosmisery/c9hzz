from pathlib import Path

src = Path("/mnt/data/ZenithV2_Terminal_UI_FIXED2.lua")
s = src.read_text(encoding="utf-8")

# Replace launcher block with an unambiguous, visible square.
start = s.index('-- Small square launcher.')
end = s.index('-- Main window', start) if '-- Main window' in s[start:] else s.index('local window =', start)

new_block = '''-- Always-visible launcher square.
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

'''

# Find exact window declaration and insert launcher immediately before it.
window_idx = s.index('local window =', start)
s = s[:start] + new_block + s[window_idx:]

# Replace old launcher click block if present.
old = '''launcher.MouseButton1Click:Connect(function()
	open = not open
	window.Visible = open
	launcherMark.Text = open and "×" or "Z"
end)
'''
new = '''launcher.MouseButton1Click:Connect(function()
	open = not open
	window.Visible = open
	launcher.Text = open and "×" or "□"
end)
'''
if old in s:
    s = s.replace(old, new)

# Remove any old launcherMark references/creation that survived.
lines = s.splitlines()
filtered = []
skip = False
for line in lines:
    if 'local launcherMark = label(launcher' in line:
        skip = True
        continue
    if skip:
        if 'launcherMark.TextXAlignment' in line:
            skip = False
        continue
    filtered.append(line)
s = '\n'.join(filtered) + '\n'

out = Path("/mnt/data/ZenithV2_TERMINAL_COMPLETE.lua")
out.write_text(s, encoding="utf-8")

# Show the launcher section for verification.
i = s.index('-- Always-visible launcher square.')
print(out)
print(s[i:i+1200])
