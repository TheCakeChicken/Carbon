local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = require(ReplicatedStorage:WaitForChild("TweenService"))
local RenderStepped = RunService.RenderStepped

local USE_ROBLOX_CIRCLE = true
local RIPPLE_IMAGE = USE_ROBLOX_CIRCLE and script.RippleTwo or script.RippleOne

local RippleService = { }

function RippleService.ButtonAnimationClassic(GuiButton)
	GuiButton.MouseButton1Down:Connect(function(X, Y)
		local Ripple = RIPPLE_IMAGE:Clone()
		Ripple.Parent = GuiButton
		Ripple.Position = UDim2.new(0, X - GuiButton.AbsolutePosition.X, 0, Y - GuiButton.AbsolutePosition.Y - 36)
		Ripple.Visible = true
		
		TweenService:TweenAsync(Ripple, 0.4, "Quint", "Out", { Size = UDim2.new(3, 0, 3, 0) })
		coroutine.wrap(function()
			wait(0.1)
			TweenService:Tween(Ripple, 1, "Quint", "Out", { ImageTransparency = 1 })
			
			Ripple.ImageTransparency = 1
			Ripple:Destroy()
		end)()
	end)
end

function RippleService.ButtonAnimation(GuiButton)
	GuiButton.MouseButton1Down:Connect(function(X, Y)
		local Ripple = RIPPLE_IMAGE:Clone()
		Ripple.ZIndex = GuiButton.ZIndex + 1
		Ripple.Parent = GuiButton:FindFirstChild("RippleFrame") and GuiButton.RippleFrame or GuiButton
		Ripple.Position = UDim2.new(0, X - GuiButton.AbsolutePosition.X, 0, Y - GuiButton.AbsolutePosition.Y - 36)
		Ripple.Visible = true
		
		TweenService:SpringAsync(Ripple, 0.4, 1.5, { Size = UDim2.new(3, 0, 3, 0) })
		spawn(function()
			wait(0.1)
			TweenService:Spring(Ripple, 0.2, 1.5, { ImageTransparency = 1 })
			Ripple.ImageTransparency = 1
			Ripple:Destroy()
		end)
	end)
end

function RippleService.TextBoxAnimation(TextBox, Color)
	TextBox.Focused:Connect(function()
	end)
end

return RippleService