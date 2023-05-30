local Font = Enum.Font.Oswald
local screenGui = Instance.new("ScreenGui",game.CoreGui) --А мне па хую
screenGui.DisplayOrder = 25000 --Я бронированый >:D
local mainFrame = Instance.new("Frame",screenGui)
mainFrame.Size = UDim2.fromScale(0,0.4)
game.TweenService:Create(mainFrame,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Size = UDim2.fromScale(0.3,0.4)}):Play()
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
mainFrame.Position = UDim2.fromScale(0.5,0.5)
local invisTopFrame = Instance.new("TextButton",screenGui)
local topFrame = Instance.new("Frame",mainFrame)
topFrame.BorderSizePixel = 0
topFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
topFrame.Size = UDim2.fromScale(1,0.1)
invisTopFrame.Text = ""
invisTopFrame.BackgroundTransparency = 1
invisTopFrame.AnchorPoint = Vector2.new(0.5,0.5)
invisTopFrame.Draggable = true
invisTopFrame.Changed:Connect(function(state)
	if state ~= "Position" then return end
	mainFrame.Position = invisTopFrame.Position
	mainFrame.Position = UDim2.new(mainFrame.Position.X.Scale,mainFrame.Position.X.Offset,0.5,mainFrame.Position.Y.Offset)
end)
invisTopFrame.Position = UDim2.fromScale(0.5,0.32)
invisTopFrame.Size = UDim2.fromScale(0.3,0.04)
local title = Instance.new("TextLabel",topFrame)
title.BackgroundTransparency = 1
title.Text = _G.fullName
title.TextColor3 = Color3.fromRGB(0,0,0)
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Font
local stroke = Instance.new("UIStroke",title)
stroke.Thickness = 3
title.Size = UDim2.fromScale(0.3,1)
title.Position = UDim2.fromScale(0.075,0)
stroke.Color = Color3.fromRGB(255,255,255)
local grad = Instance.new("UIGradient",stroke)
grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,0))}
local logo = Instance.new("ImageLabel",topFrame)
logo.BackgroundTransparency = 1
logo.Size = UDim2.fromScale(0.1,0.8)
logo.Position = UDim2.fromScale(0.01,0.1)
logo.Image = _G.logoImage
local as = Instance.new("UIAspectRatioConstraint",logo)
as.AspectRatio = 1
local corner = Instance.new("UICorner",logo)
corner.CornerRadius = UDim.new(1,0)
local mainStroke = stroke
local stroke = stroke:Clone()
stroke.Parent = logo
stroke.Color = Color3.fromRGB(0,0,0)
local stroke = stroke:Clone()
stroke.Parent = mainFrame
local close = Instance.new("TextButton",topFrame)
close.Size = UDim2.fromScale(0.1,0.8)
close.Position = UDim2.fromScale(0.89,0.1)
close.Text = "X"
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(100,0,0)
close.TextColor3 = Color3.fromRGB(255,255,255)
close.Font = Font
close.BorderSizePixel = 0
close.ZIndex = 2
close.MouseButton1Click:Connect(function()
	if closed then return end
	closed = true
	_G.loaded123FireDoors = nil
	game.TweenService:Create(mainFrame,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Size = UDim2.fromScale(0,0)}):Play()
	task.wait(2)
	wait(0)
	screenGui:Destroy()
end)
local minimize = close:Clone()
minimize.Parent = close.Parent
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(150,150,150)
minimize.Position = UDim2.fromScale(0.78,0.1)
local minimized = false
local oldpos = invisTopFrame.Position
local maximize = Instance.new("TextButton",screenGui)
maximize.BorderSizePixel = 3
maximize.BorderColor3 = Color3.fromRGB(0,0,0)
maximize.Text = "+"
maximize.AnchorPoint = Vector2.new(0.5,0.5)
maximize.TextColor3 = Color3.fromRGB(0,0,0)
maximize.Position = UDim2.fromScale(1.2,0.5)
maximize.Size = UDim2.fromScale(0.05,0.2)
maximize.BackgroundColor3 = minimize.BackgroundColor3
maximize.TextScaled = true
maximize.MouseButton1Click:Connect(function()
	if not minimized or closed then return end
	minimized = false
	mainFrame.Visible = true
	game.TweenService:Create(maximize,TweenInfo.new(1,Enum.EasingStyle.Exponential),{Position = UDim2.fromScale(1.2,0.5)}):Play()
	game.TweenService:Create(mainFrame,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Size = UDim2.fromScale(0.3,0.4)}):Play()
	wait(1)
	mainFrame.Visible = true
	wait(1)
	mainFrame.Visible = true
end)
minimize.MouseButton1Click:Connect(function()
	if minimized or closed then return end
	minimized = true
	game.TweenService:Create(mainFrame,TweenInfo.new(2,Enum.EasingStyle.Exponential),{Size = UDim2.fromScale(0,0)}):Play()
	game.TweenService:Create(maximize,TweenInfo.new(1,Enum.EasingStyle.Exponential),{Position = UDim2.fromScale(1,0.5)}):Play()
	task.wait(1.8)
	mainFrame.Visible = false
end)
local pagelist = Instance.new("ScrollingFrame",mainFrame)
pagelist.Size = UDim2.fromScale(0.2,0.9)
pagelist.Position = UDim2.fromScale(0,0.1)
pagelist.BackgroundColor3 = topFrame.BackgroundColor3
pagelist.BorderSizePixel = 0
pagelist.CanvasSize = UDim2.fromScale(0,0)
pagelist.ChildAdded:Connect(function()
	pagelist.CanvasSize = UDim2.fromOffset(0,(#pagelist:GetChildren()-1)*55)
end)
pagelist.ChildRemoved:Connect(function()
	pagelist.CanvasSize = UDim2.fromOffset(0,(#pagelist:GetChildren()-1)*55)
end)
local grid = Instance.new("UIGridLayout",pagelist)
grid.CellPadding = UDim2.fromOffset(0,5)
grid.CellSize = UDim2.new(1,0,0,50)
grid.SortOrder = Enum.SortOrder.LayoutOrder
local pagesFolder = Instance.new("Folder",mainFrame)
local pageList = {}
function pageList.AddPage(pageName)
	local btn = Instance.new("TextButton",pagelist)
	btn.Text = pageName
	btn.TextScaled = true
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Font = Font 
	btn.BackgroundColor3 = pagelist.BackgroundColor3
	btn.BorderSizePixel = 0
	local frame = Instance.new("ScrollingFrame",pagesFolder)
	frame.Size = UDim2.fromScale(0.8,0.9)
	frame.BackgroundColor3 = mainFrame.BackgroundColor3
	frame.Position = UDim2.fromScale(0.2,0.1)
	frame.BorderSizePixel = 0
	frame.CanvasSize = UDim2.fromScale(0,0)
	frame.ChildAdded:Connect(function()
		frame.CanvasSize = UDim2.fromOffset(0,(#frame:GetChildren()-1)*55)
	end)
	frame.ChildRemoved:Connect(function()
		frame.CanvasSize = UDim2.fromOffset(0,(#frame:GetChildren()-1)*55)
	end)
	frame.Visible = false
	btn.MouseButton1Click:Connect(function()
		for i,v in pairs(pagesFolder:GetChildren()) do
			v.Visible = false
		end
		frame.Visible = true
	end)
	local grid = Instance.new("UIGridLayout",frame)
	grid.CellPadding = UDim2.fromOffset(0,5)
	grid.CellSize = UDim2.new(1,0,0,50)
	grid.SortOrder = Enum.SortOrder.LayoutOrder
	local funcs = {}
	function funcs:CreateLabel(text)
		local label = Instance.new("TextLabel",frame)
		label.Text = text
		label.Font = Font
		label.BackgroundColor3 = Color3.fromRGB(50,50,50)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.TextColor3 = Color3.fromRGB(255,255,255)
		return label
	end
	function funcs:CreateButton(text,func)
		local label = Instance.new("TextButton",frame)
		label.Text = text
		label.Font = Font
		label.BackgroundColor3 = Color3.fromRGB(150,150,150)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.TextColor3 = Color3.fromRGB(255,255,255)
		label.MouseButton1Click:Connect(func)
		label.TextXAlignment = Enum.TextXAlignment.Left
		return label
	end
	function funcs:CreateTextBox(text,func)
		local label = Instance.new("TextBox",frame)
		label.PlaceholderText = text
		label.Font = Font
		label.BackgroundColor3 = Color3.fromRGB(75,75,75)
		label.PlaceholderColor3 = Color3.fromRGB(200,150,150)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.TextColor3 = Color3.fromRGB(255,255,255)
		label.ClearTextOnFocus = false
		label.Text = ""
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.FocusLost:Connect(function(enter)
			if enter then
				func(label.Text)
			end
		end)
		return label
	end
	function funcs:CreateSwitch(text,func)
		local toggle = false
		local label = Instance.new("TextButton",frame)
		label.Text = text
		label.Font = Font
		label.BackgroundColor3 = Color3.fromRGB(150,150,150)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.TextColor3 = Color3.fromRGB(255,255,255)
		label.TextXAlignment = Enum.TextXAlignment.Left
		local status = Instance.new("TextLabel",label)
		status.Size = UDim2.fromScale(0.2,0.9)
		status.Position = UDim2.fromScale(0.775,0.05)
		status.BackgroundColor3 = Color3.fromRGB(255,0,0)
		status.Font = Font
		status.TextScaled = true
		status.TextColor3 = Color3.fromRGB(0,0,0)
		status.Text = "OFF"
		local corner = Instance.new("UICorner",status)
		corner.CornerRadius = UDim.new(1,0)
		label.MouseButton1Click:Connect(function()
			toggle = not toggle
			if not toggle then
				status.Text = "OFF"
				game.TweenService:Create(status,TweenInfo.new(0.1),{BackgroundColor3 = Color3.fromRGB(255,0,0)}):Play()
			else
				status.Text = "ON"
				game.TweenService:Create(status,TweenInfo.new(0.1),{BackgroundColor3 = Color3.fromRGB(255,255,0)}):Play()
			end
			func(toggle)
		end)
		return label
	end
	function funcs:CreateSlider(text,minVal,maxVal,step,func)
		local minVal = minVal
		if minVal <= 0 then
			minVal = 0
		end
		local step = step
		if step <= 0 then
			step = 0.1
		end
		local val = minVal
		local label = Instance.new("TextLabel",frame)
		label.Text = text
		label.Font = Font
		label.BackgroundColor3 = Color3.fromRGB(75,60,60)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.TextColor3 = Color3.fromRGB(255,255,255)
		local slideBG = Instance.new("Frame",label)
		slideBG.Size = UDim2.fromScale(0.5,0.9)
		slideBG.Position = UDim2.fromScale(0.44,0.05)
		slideBG.BorderSizePixel = 0
		slideBG.BackgroundColor3 = Color3.fromRGB(50,0,0)
		local valText = Instance.new("TextLabel",slideBG)
		valText.Size = UDim2.fromScale(0.3,1)
		valText.BackgroundTransparency = 1
		valText.Font = Font
		valText.Text = val
		valText.TextScaled = true
		valText.TextColor3 = Color3.fromRGB(255,0,0)
		valText.Position = UDim2.fromScale(-0.4,0)
		valText.TextXAlignment = Enum.TextXAlignment.Right
		local fill = Instance.new("Frame",slideBG)
		fill.Size = UDim2.fromScale(0,1)
		fill.BorderSizePixel = 0
		fill.BackgroundColor3 = Color3.fromRGB(255,0,0)
		local gradient = Instance.new("UIGradient",slideBG)
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(100,100,100))}
		gradient.Rotation = 90
		gradient:Clone().Parent = fill
		local add = Instance.new("TextButton",slideBG)
		add.Text = "+"
		add.Size = UDim2.fromScale(0.1,1)
		add.TextScaled = true
		add.Font = Font
		add.TextColor3 = Color3.fromRGB(255,255,255)
		add.Position = UDim2.fromScale(1,0)
		add.BorderSizePixel = 0
		add.BackgroundColor3 = Color3.fromRGB(0,0,0)
		local function formula()
			return (maxVal-(maxVal-val))/maxVal
		end
		add.MouseButton1Click:Connect(function()
			val = val + step
			if val == maxVal or val >= maxVal then
				val = maxVal
			end
			game.TweenService:Create(fill,TweenInfo.new(0.5),{Size = UDim2.fromScale(formula(),1)}):Play()
			valText.Text = math.round(val*10)/10
			func(val)
		end)
		local minus = add:Clone()
		minus.Parent = add.Parent
		minus.Text = "-"
		minus.Position = UDim2.fromScale(-0.1,0)
		minus.MouseButton1Click:Connect(function()
			val = val - step
			if val == minVal or val <= minVal then
				val = minVal
			end
			game.TweenService:Create(fill,TweenInfo.new(0.5),{Size = UDim2.fromScale(formula(),1)}):Play()
			valText.Text = math.round(val*10)/10
			func(val)
		end)
		return label
	end
	return funcs
end
pageList.CreatePage = pageList.AddPage
local notificationLabel = Instance.new("Frame",screenGui)
notificationLabel.BackgroundTransparency = 1
notificationLabel.Size = UDim2.fromScale(0.2,1)
notificationLabel.ZIndex = 3
notificationLabel.Position = UDim2.fromScale(0.8,0)
local list = Instance.new("UIListLayout",notificationLabel)
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0.02,0)
list.FillDirection = Enum.FillDirection.Vertical
list.VerticalAlignment = Enum.VerticalAlignment.Bottom
function pageList:Notify(text,time)
	coroutine.wrap(function()
		local time = time or 5
		local frame = Instance.new("Frame",notificationLabel)
		frame.Size = UDim2.fromScale(1,0)
		frame.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
		frame.BorderSizePixel = 0
		local timer = Instance.new("Frame",frame)
		timer.Size = UDim2.fromScale(1,0.05)
		timer.Position = UDim2.fromScale(0,0.1)
		timer.BackgroundColor3 = Color3.fromRGB(85,85,85)
		timer.BorderSizePixel = 0
		timer.ZIndex = timer.ZIndex + 1
		local fframe = timer:Clone()
		fframe.Parent = timer.Parent
		fframe.BackgroundColor3 = Color3.fromRGB(50,50,50)
		fframe.ZIndex = fframe.ZIndex - 1
		local title = Instance.new("TextLabel",frame)
		title.BackgroundTransparency = 1
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.Text = _G.actualName
		title.Font = Font
		title.BorderSizePixel = 0
		title.TextScaled = true
		title.TextColor3 = Color3.fromRGB(255,255,255)
		title.Size = UDim2.fromScale(1,0.1)
		local content = title:Clone()
		content.Parent = frame
		content.Size = UDim2.fromScale(1,0.85)
		content.Position = UDim2.fromScale(0,0.15)
		content.Text = text
		content.TextYAlignment = Enum.TextYAlignment.Top
		game.TweenService:Create(timer,TweenInfo.new(time,Enum.EasingStyle.Linear),{Size = UDim2.fromScale(0,0.05)}):Play()
		game.TweenService:Create(frame,TweenInfo.new(0.5),{Size = UDim2.fromScale(1,0.2)}):Play()
		task.wait(time)
		game.TweenService:Create(frame,TweenInfo.new(0.5,Enum.EasingStyle.Exponential),{Size = UDim2.fromScale(1,0)}):Play()
		wait(0.5)
		frame:Destroy()
	end)()
end
local pagelist = pageList
return pagelist,close,mainFrame,screenGui,logo,title
