local KeyValid,KeyPremium, KeysystemLibrary, KeyGuardLibrary = false,false,loadstring(game:HttpGet("https://raw.githubusercontent.com/OopssSorry/LuaU-Free-Key-System-UI/main/source.lua"))(),loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "70737d49ffaa4aa28d014ba8bbc0da62"
local falseData = "1258091e97a3458c84c440f88af445cd"

KeyGuardLibrary.Set({
    publicToken = "3037d69764ca4f72a806612a5bde53b1",
    privateToken = "8fc8ccfb6350438cbad6624e23cf3b6c",
    trueData = trueData,
    falseData = falseData,
  })
local KSresponse = KeysystemLibrary:Init({
	Title="Zenus Internal | Authenticator",  -- TITLE HERE
	
	SaveKey=true, 
	Debug=false, 
	Link=KeyGuardLibrary.getLink(), 
	Verify=function(key) 
		if KeyGuardLibrary.validateDefaultKey(key) then
			KeyValid=true
		elseif KeyGuardLibrary.validatePremiumKey(key) then
			KeyValid,KeyPremium=true,true
		end;
		return KeyValid
	end,
}) 

-- return nil on closing key system
if not KSresponse or not KeyValid then return end 
loadstring(game:HttpGet("https://raw.githubusercontent.com/reTerminal-2/Zenus/refs/heads/main/ZenusInternal.lua"))()  
-- Example of checking is user have a premium:
if KeyPremium then
	print("Key is premium!")
end
