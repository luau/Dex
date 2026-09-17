> [!IMPORTANT]
> Independent, unofficial project. Not affiliated with, endorsed by, or officially connected to Roblox Corporation. "Luau" is a trademark of Roblox Corporation.

## Disclaimer

This project is provided for development, debugging, and research purposes within the Roblox platform.

It is not intended for misuse, including violating platform rules.

Users are responsible for ensuring their usage complies with all applicable rules, including Roblox’s Terms of Use.

The maintainers do not support or condone misuse of this software and are not responsible for how it is used.

# Loadstring
## Custom HttpGet Proxy & Loadstring are required
## Check out [Full Package Releases](https://github.com/luau/Dex/releases/latest) if you don't have custom
## [Download Latest Release](https://github.com/luau/Dex/releases/latest/download/Package.rbxm)
## All Releases are .rbxm format (it's a model so it must be drag & dropped into studio or open there using other methods)
```lua
local RepositoryName = "Dex"
local File = "out.lua"
local link = "https://raw.githubusercontent.com/lua-u/" .. RepositoryName .. "/Executor-Free/" .. File
--game.HttpService.HttpEnabled = true -- ! RUN THIS IN STUDIO CONSOLE OR USE SETTINGS
--settings().Studio.ScriptTimeoutLength = -1 -- ! RUN THIS IN STUDIO CONSOLE IF YOU USE THIS VARIANT OF DEX (DUE TO POSSIBLE TIMEOUT BECAUSE OF LOADSTRING)
local req_load = require(script.Parent:WaitForChild("loadstring")) -- ! YOU'LL NEED A CUSTOM LOADSTRING MODULE -- we use a modified version of https://www.roblox.com/library/4689019964/
local loadstring = function(String)
	return req_load(String) -- Because this module is bad at handling chunkname param
end

loadstring(script.Parent:WaitForChild("HttpGet"):InvokeServer(link), "Dex") -- ! YOU'LL NEED A HTTPGET PROXY (CLIENT CANT DO HTTP REQUESTS NORMALLY), DONT FORGET TO ENABLE HTTPREQUESTS ON THE SERVER (game.HttpService.HttpEnabled = true) - we use our own because its easy to make
```

# Support Us:
<a href='https://ko-fi.com/M4M1JNH5G' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/M4M1JNH5G)
<br />
![qrcode](https://user-images.githubusercontent.com/95628489/231759262-25661006-b7ca-4967-a79d-2b465cd9575a.png)
