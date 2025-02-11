local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "f63a63d9fbf544f7b529be193de5cb67"
local falseData = "ebf8f9d5d4524711b05ee908aaf3272d"

KeyGuardLibrary.Set({
  publicToken = "3037d69764ca4f72a806612a5bde53b1",
  privateToken = "8fc8ccfb6350438cbad6624e23cf3b6c",
  trueData = trueData,
  falseData = falseData,
})

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = ""

local Window = Fluent:CreateWindow({
    Title = "Zenus Internal | Authenticator",
    SubTitle = "Zenus Internal V1",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
    Title = "Enter Key",
    Description = "Enter Key Here",
    Default = "",
    Placeholder = "Enter key…",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        key = Value
    end
})

local Checkkey = Tabs.KeySys:AddButton({
    Title = "Check Key",
    Description = "Enter Key before pressing this button",
    Callback = function()
        local response = KeyGuardLibrary.validateDefaultKey(key)
        if response == trueData then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/reTerminal-2/Zenus/refs/heads/main/ZenusInternal.lua"))()
        else
           print("Key is invalid")
        end
    end
})

local Getkey = Tabs.KeySys:AddButton({
    Title = "Get Key",
    Description = "Get Key here",
    Callback = function()
       setclipboard(KeyGuardLibrary.getLink())
    end
})

Window:SelectTab(1)
