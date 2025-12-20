repeat wait() until game:IsLoaded()

local cloneref = cloneref or function(o) return o end
Workspace = cloneref(game:GetService("Workspace"))
Players = cloneref(game:GetService("Players"))
PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
HttpService = cloneref(game:GetService("HttpService"))
TweenService = cloneref(game:GetService("TweenService"))
UserInputService = cloneref(game:GetService("UserInputService"))
Market = cloneref(game:GetService("MarketplaceService"))
RBXAnalyt = cloneref(game:GetService("RbxAnalyticsService"))
CoreGui = cloneref(game:GetService("CoreGui"))
RunService = cloneref(game:GetService("RunService"))
Replicated = cloneref(game:GetService("ReplicatedStorage"))

-- ===================== GAME LIST =====================
local ListGame = {
	["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2", keyless = true },
	["994732206"]  = { id = "e2718ddebf562c5c4080dfce26b09398", keyless = true },
	["1650291138"] = { id = "9b64d07193c7c2aef970d57aeb286e70", keyless = true },
	["5750914919"] = { id = "8bbc8a7c4e023bc0c80799fec3233162", keyless = true },
	["66654135"]   = { id = "9c916252a9f79bbf5a108f97c531e807", keyless = true },
	["3317771874"] = { id = "e95ef6f27596e636a7d706375c040de4", keyless = true },
	["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c", keyless = true },
	["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2", keyless = true },
	["245662005"]  = { id = "21ad7f491e4658e9dc9529a60c887c6e", keyless = true },
	["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb", keyless = true },
	["7074860883"] = { id = "0c8fdf9bb25a6a7071731b72a90e3c69", keyless = true },
	["7436755782"] = { id = "e4ea33e9eaf0ae943d59ea98f2444ebe", keyless = true },
	["210851291"]  = { id = "b3400f5a4e28cad1e1110b45004c3837", keyless = true },
	["6931042565"] = { id = "036786acbfa6e6e030dce074faa1173f", keyless = true },
	["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9", keyless = true },
	["7822444776"] = { id = "ba4595cfb82d2434a478b9003f3674b4", keyless = true },
	["4871329703"] = { id = "646e60921195f2b2d59015703b0b100a", keyless = true },
	["1000233041"] = { id = "c08f7269fc31f6a60ec57ecfacfdb34e", keyless = true },
	["7750955984"] = { id = "b8432035965d96be10e70bfb63a6964b", keyless = true },
	["6701277882"] = { id = "05cd4dda96ee6767cd1903587da139fc", keyless = true },
	["6884266247"] = { id = "f8c8b872fe2939eb1e39457f2766862e", keyless = true },
	["8316902627"] = { id = "641e8d02ffba666d731614a32c08eacf", keyless = true },
	["6216468795"] = { id = "97722a63586043c0780da54598487218", keyless = true },
	["8066283370"] = { id = "c0e023292c5ede5fd683fc0cdc1b5eb0", keyless = true },
	["8321616508"] = { id = "2cd0668c5caf66913e7314cdb6d1eb9b", keyless = true },
	["3457700596"] = { id = "639c0b275001182cca67ac85f5bd529f", keyless = true },
	["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f", keyless = true },
}

-- ===================== GAME RESOLUTION =====================
local executor_name = getexecutorname():match("^%s*(.-)%s*$") or "unknown"
local game_id = tostring(game.GameId)
local game_cfg = ListGame[game_id]

if not game_cfg then
	Players.LocalPlayer:Kick("هذه اللعبة غير مدعومة.")
end

local script_id = game_cfg.id

if CoreGui:FindFirstChild("System") then
	CoreGui.System:Destroy()
end

for _, exec in ipairs({"Xeno", "Solara"}) do
	if string.find(executor_name, exec) then
		workspace:SetAttribute("low", true)
		break
	end
end

-- ===================== LOAD SCRIPT DIRECTLY =====================
local function LoadScript()
	local status, err = pcall(function()
		-- تحميل API من السيرفر
		local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
		
		-- ضبط معرف السكربت
		api.script_id = script_id
		
		-- تحميل السكربت الرئيسي مباشرة
		api.load_script()
	end)
	
	if not status then
		-- إنشاء إشعار بسيط في حال الخطأ
		local NotificationGUI = PlayerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
		NotificationGUI.Name = "Notifications"
		NotificationGUI.Parent = PlayerGui
		
		local Container = NotificationGUI:FindFirstChild("Container") or Instance.new("Frame")
		Container.Name = "Container"
		Container.AnchorPoint = Vector2.new(1, 0)
		Container.Position = UDim2.new(1, -25, 0, 25)
		Container.BackgroundTransparency = 1
		Container.Size = UDim2.fromOffset(350, 600)
		Container.Parent = NotificationGUI
		
		local Notification = Instance.new("Frame")
		Notification.Name = "Notification"
		Notification.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
		Notification.BorderSizePixel = 0
		Notification.Size = UDim2.fromOffset(320, 70)
		Notification.Position = UDim2.new(0, 0, 0, 50)
		Notification.Parent = Container
		
		local TitleText = Instance.new("TextLabel")
		TitleText.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
		TitleText.Text = "Error"
		TitleText.TextColor3 = Color3.fromRGB(255, 100, 100)
		TitleText.TextSize = 16
		TitleText.BackgroundTransparency = 1
		TitleText.Size = UDim2.new(1, 0, 0, 20)
		TitleText.Position = UDim2.fromOffset(10, 6)
		TitleText.Parent = Notification
		
		local ContentText = Instance.new("TextLabel")
		ContentText.FontFace = Font.new("rbxassetid://12187365364")
		ContentText.Text = "Failed to load script: " .. tostring(err)
		ContentText.TextColor3 = Color3.fromRGB(180, 180, 185)
		ContentText.TextSize = 14
		ContentText.BackgroundTransparency = 1
		ContentText.TextWrapped = true
		ContentText.Size = UDim2.new(1, -20, 1, -30)
		ContentText.Position = UDim2.fromOffset(10, 28)
		ContentText.Parent = Notification
		
		-- إخفاء الإشعار بعد 5 ثواني
		task.delay(5, function()
			Notification:Destroy()
		end)
	end
end

-- ===================== NOTIFICATION =====================
local function ShowStartNotification()
	local NotificationGUI = PlayerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
	NotificationGUI.Name = "Notifications"
	NotificationGUI.Parent = PlayerGui
	
	local Container = NotificationGUI:FindFirstChild("Container") or Instance.new("Frame")
	Container.Name = "Container"
	Container.AnchorPoint = Vector2.new(1, 0)
	Container.Position = UDim2.new(1, -25, 0, 25)
	Container.BackgroundTransparency = 1
	Container.Size = UDim2.fromOffset(350, 600)
	Container.Parent = NotificationGUI
	
	local Notification = Instance.new("Frame")
	Notification.Name = "Notification"
	Notification.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	Notification.BorderSizePixel = 0
	Notification.Size = UDim2.fromOffset(320, 70)
	Notification.Parent = Container
	
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = Notification
	
	local TitleText = Instance.new("TextLabel")
	TitleText.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
	TitleText.Text = "SolixHub Loaded"
	TitleText.TextColor3 = Color3.fromRGB(100, 255, 100)
	TitleText.TextSize = 16
	TitleText.BackgroundTransparency = 1
	TitleText.Size = UDim2.new(1, 0, 0, 20)
	TitleText.Position = UDim2.fromOffset(10, 6)
	TitleText.Parent = Notification
	
	local ContentText = Instance.new("TextLabel")
	ContentText.FontFace = Font.new("rbxassetid://12187365364")
	ContentText.Text = "Loading script for game ID: " .. game_id
	ContentText.TextColor3 = Color3.fromRGB(180, 180, 185)
	ContentText.TextSize = 14
	ContentText.BackgroundTransparency = 1
	ContentText.TextWrapped = true
	ContentText.Size = UDim2.new(1, -20, 1, -30)
	ContentText.Position = UDim2.fromOffset(10, 28)
	ContentText.Parent = Notification
	
	-- بار تقدم
	local ProgressBar = Instance.new("Frame")
	ProgressBar.BackgroundColor3 = Color3.fromRGB(44, 38, 44)
	ProgressBar.BorderSizePixel = 0
	ProgressBar.Size = UDim2.new(1, -20, 0, 6)
	ProgressBar.Position = UDim2.new(0, 10, 1, -12)
	ProgressBar.Parent = Notification
	
	local ProgressFill = Instance.new("Frame")
	ProgressFill.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
	ProgressFill.BorderSizePixel = 0
	ProgressFill.Size = UDim2.fromScale(1, 1)
	ProgressFill.Parent = ProgressBar
	
	local ProgressFillCorner = Instance.new("UICorner")
	ProgressFillCorner.Parent = ProgressFill
	
	TweenService:Create(ProgressFill, TweenInfo.new(2, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
	
	task.delay(2, function()
		TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
		task.wait(0.3)
		Notification:Destroy()
	end)
end

-- ===================== START SCRIPT =====================
-- إظهار إشعار البدء
ShowStartNotification()

-- تحميل السكربت بعد 1 ثانية
task.wait(1)
LoadScript()