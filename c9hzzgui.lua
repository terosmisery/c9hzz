from pathlib import Path

src = Path("/mnt/data/ZenithV2_Terminal_UI.lua")
code = src.read_text(encoding="utf-8")

# Make the launcher unambiguously visible and above other ScreenGuis.
code = code.replace(
    'gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling\n',
    'gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling\n'
    'gui.DisplayOrder = 999999\n'
)

code = code.replace(
    'launcher.BackgroundColor3 = BUTTON\n'
    'launcher.BorderSizePixel = 0\n',
    'launcher.BackgroundColor3 = Color3.fromRGB(35, 35, 40)\n'
    'launcher.BorderSizePixel = 0\n'
    'launcher.ZIndex = 1000\n'
)

code = code.replace(
    'launcherMark.Parent = launcher\n',
    'launcherMark.Parent = launcher\n'
    'launcherMark.ZIndex = 1001\n'
)

# Make sure the launcher is explicitly visible while the main window remains closed.
code = code.replace(
    'local open = false\n\nlauncher.MouseButton1Click:Connect(function()',
    'local open = false\n'
    'launcher.Visible = true\n'
    'window.Visible = false\n\n'
    'launcher.MouseButton1Click:Connect(function()'
)

# Add a visible tooltip-like label so there is no ambiguity about the square.
needle = 'launcherMark.TextXAlignment = Enum.TextXAlignment.Center\n'
addition = '''launcherMark.TextXAlignment = Enum.TextXAlignment.Center

local launcherStroke = Instance.new("UIStroke")
launcherStroke.Color = Color3.fromRGB(85, 85, 95)
launcherStroke.Thickness = 1
launcherStroke.Parent = launcher

'''
code = code.replace(needle, addition)

out = Path("/mnt/data/ZenithV2_Terminal_UI_FIXED.lua")
out.write_text(code, encoding="utf-8")
print(out)
