--[[
	Script Viewer App Module
	
	A script viewer that is basically a notepad
]]

-- Common Locals
local Main, Lib, Apps, Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API, RMD, env, service, plr, create, createSimple -- Main Locals
local pcall = pcall
local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local ScriptViewer = {}

	local window, codeFrame

	ScriptViewer.ViewScript = function(scr)
		local s, source = pcall(env.decompile or function() end, scr)
		if not s or not source then
			source = "--[[Failed to decompile\nReason:\n" .. tostring(source) .. "\n]]"
		end

		codeFrame:SetText(source)
		window:Show()
	end

	ScriptViewer.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Script Viewer")
		window:Resize(500, 400)
		ScriptViewer.Window = window

		codeFrame = Lib.CodeFrame.new()
		codeFrame.Frame.Position = UDim2.new(0, 0, 0, 20)
		codeFrame.Frame.Size = UDim2.new(1, 0, 1, -20)
		codeFrame.Frame.Parent = window.GuiElems.Content

		-- TODO: REMOVE AND MAKE BETTER
		local copy = Instance.new("TextButton", window.GuiElems.Content)
		copy.BackgroundTransparency = 1
		copy.Size = UDim2.new(0.5, 0, 0, 20)
		copy.Text = "Copy to Clipboard"
		copy.TextColor3 = Color3.new(1, 1, 1)

		copy.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			env.setclipboard(source)
		end)

		local save = Instance.new("TextButton", window.GuiElems.Content)
		save.BackgroundTransparency = 1
		save.Position = UDim2.new(0.5, 0, 0, 0)
		save.Size = UDim2.new(0.5, 0, 0, 20)
		save.Text = "Save to File"
		save.TextColor3 = Color3.new(1, 1, 1)

		save.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			local filename = "Place_" .. game.PlaceId .. "_Script_" .. os.time() .. ".txt"

			writefile(filename, source)
			if movefileas or globalcontainer.movefileas then -- TODO: USE ENV
				(movefileas or globalcontainer.movefileas)(filename, ".txt")
			end
		end)
	end

	return ScriptViewer
end

return { InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main }
