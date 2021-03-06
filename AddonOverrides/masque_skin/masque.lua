local addonName, addon = ...

MSQ = LibStub("Masque", true)
if not MSQ then return end

local LSM = LibStub("LibSharedMedia-3.0")

MSQ:AddSkin("Vikinghug", {
	Author = "Vikinghug",
	Version = "1.2.1",
	Shape = "Square",
	Masque_Version = 80100,
	Backdrop = {
		Width = 36,
		Height = 36,
		Color = {addon.Colors.BG:ToList(0.8)},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\PlainBackdrop]],
	},
	Icon = {
		Width = 36,
		Height = 36,
		TexCoords = {0.08,0.92,0.08,0.92},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Color = {addon.Colors.RED:ToList(0.3)},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Overlay]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Overlay]],
		Color = {addon.Colors.BG:ToList(0.8)},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Color = {addon.Colors.BG:ToList(0.5)},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Overlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Color = {addon.Colors.BG:ToList(1)},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Normal]],
	},
	Disabled = {
		-- Hide = true,
		TexCoords = {0.08,0.92,0.08,0.92},
		Width = 36,
		Height = 36,
		Color = {addon.Colors.BG:ToList(1)},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Overlay]],
	},
	Checked = {
		Width = 36,
		Height = 36,
		BlendMode = "BLEND",
		Color = {1, 0.8, 0.0, 1},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Border]],
	},
	Border = {
		Width = 36,
		Height = 36,
		Color = {addon.Colors.BG:ToList(0.8)},
		-- BlendMode = "BLEND",
		-- Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Normal]],
	},
	AutoCastable = {
		Width = 60,
		Height = 60,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.1},
		Texture = [[Interface\AddOns\VikingSharedLib\AddonOverrides\masque_skin\Textures\Highlight]],
	},
	Gloss = {
		Hide = true,
	},
	HotKey = {
		Width = 36,
		Height = 36,
		OffsetX = -2,
		OffsetY = -2,
		JustifyH = "RIGHT",
		JustifyV = "TOP"
	},
	Count = {
		Width = 36,
		Height = 36,
		OffsetX = -2,
		OffsetY = 0,
		JustifyH = "RIGHT",
		JustifyV = "BOTTOM",
	},
	Name = {
		Width = 36,
		Height = 36,
		OffsetX = 1,
		OffsetY = 3,
		JustifyH = "LEFT",
		JustifyV = "BOTTOM",
	},
	Duration = {
		Width = 36,
		Height = 36,
		OffsetX = 0,
		OffsetY = 0,
		JustifyH = "CENTER",
		JustifyV = "MIDDLE",
	},
	AutoCast = {
		Width = 36,
		Height = 36,
	},
}, true)

local function SetFont(self, size)
	self:SetFont(LSM:Fetch("font", "Montserrat SemiBold"), size)
	self:SetShadowColor(addon.Colors.BG:ToList(0.8))
	self:SetShadowOffset(1, -1)
end

local function SetColors(self, checksRange, inRange)
	local WHITE = {0.95, 0.95, 0.95, 1}
	local isUsable, notEnoughMana = IsUsableAction(self.action)
	if (isUsable == false) then
		self.HotKey:SetVertexColor(1, 1, 1, 0.25)
		return self.icon:SetVertexColor(addon.Colors.BG:ToList(0.5))
	elseif (notEnoughMana) then
		self.HotKey:SetVertexColor(1, 1, 1, 0.25)
		return self.icon:SetVertexColor(addon.Colors.BLUE:ToList(0.45))
	end

	if ( self.HotKey:GetText() == RANGE_INDICATOR ) then
		if ( checksRange ) then
			self.HotKey:Show()
			if ( inRange ) then
				self.HotKey:SetVertexColor(unpack(WHITE))
				self.icon:SetVertexColor(unpack(WHITE))
			else
				self.HotKey:SetVertexColor(addon.Colors.RED:ToList(1))
				self.icon:SetVertexColor(addon.Colors.RED:ToList(0.25))
			end
		else
			self.HotKey:Hide();
		end
	else
		if ( checksRange and not inRange ) then
			self.HotKey:SetVertexColor(addon.Colors.RED:ToList(1))
			self.icon:SetVertexColor(addon.Colors.RED:ToList(0.25))
		else
			self.HotKey:SetVertexColor(unpack(WHITE))
			self.icon:SetVertexColor(unpack(WHITE))
		end
	end
end

hooksecurefunc("ActionBarController_UpdateAll", function(self)
	for _, frame in pairs(ActionBarButtonEventsFrame.frames) do
		SetFont(frame.HotKey, 14)
		SetFont(frame.Count, 14)
		SetColors(frame)
	end
end)

function ActionButton_UpdateRangeIndicator(self, checksRange, inRange)
	SetColors(self, checksRange, inRange)
end
