
BuildEnv(...)

local RefreshButton = Addon:NewClass('RefreshButton', 'Button.UIMenuButtonStretchTemplate') do
    GUI:Embed(RefreshButton, 'Tooltip')
    RefreshButton:SetTooltipAnchor('ANCHOR_RIGHT')
end

function RefreshButton:Constructor()
    local Icon = self:CreateTexture(nil, 'ARTWORK') do
        Icon:SetSize(0, 0)
        --Icon:SetTexture([[Interface\BUTTONS\UI-RefreshButton]])
        Icon:SetPoint('LEFT', 1, 0)
    end

    local Label = self:GetFontString() do
        Label:ClearAllPoints()
        Label:SetPoint('CENTER', 0, 0)

        self:SetNormalFontObject('GameFontNormal')
        self:SetHighlightFontObject('GameFontHighlight')
        self:SetDisabledFontObject('GameFontDisable')
    end

    self:SetSize(83, 31)
    self:SetText(REFRESH)
    self.Icon = Icon

    self:SetBackdrop{
        bgFile = [[Interface\ChatFrame\ChatFrameBackground]],
        edgeFile = [[Interface\ChatFrame\ChatFrameBackground]],
        edgeSize = 1, tileSize = 1, tile = true,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    }
    self:SetBackdropColor(0.1, 0.1, 0.1, 1)
    self:SetBackdropBorderColor(1, 0.9, 0, 1)

    self:HookScript('OnEnable', self.OnEnable)
    self:HookScript('OnDisable', self.OnDisable)
end

function RefreshButton:OnEnable()
    self.Icon:SetDesaturated(false)
    self.Icon:SetAlpha(1)
end

function RefreshButton:OnDisable()
    self.Icon:SetDesaturated(true)
    self.Icon:SetAlpha(0.5)
end
