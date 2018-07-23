
BuildEnv(...)

local RefreshButton = Addon:NewClass('RefreshButton', 'Button.UIMenuButtonStretchTemplate') do
    GUI:Embed(RefreshButton, 'Tooltip')
    RefreshButton:SetTooltipAnchor('ANCHOR_RIGHT')
end

function RefreshButton:Constructor()
    local Icon = self:CreateTexture(nil, 'ARTWORK') do
        Icon:SetSize(16, 16)
        Icon:SetTexture([[Interface\BUTTONS\UI-RefreshButton]])
        Icon:SetPoint('LEFT', 10, 0)
    end

    local Label = self:GetFontString() do
        Label:ClearAllPoints()
        Label:SetPoint('CENTER', 8, 0)

        self:SetNormalFontObject('GameFontNormal')
        self:SetHighlightFontObject('GameFontHighlight')
        self:SetDisabledFontObject('GameFontDisable')
    end

    self:SetSize(83, 31)
    self:SetText(REFRESH)
    self.Icon = Icon

    --customized
    self:DisableDrawLayer("BACKGROUND")
    self:SetBackdrop{
        bgFile = [[Interface\BUTTONS\WHITE8X8.blp]],
        edgeFile = [[Interface\BUTTONS\WHITE8X8.blp]],
        edgeSize = 1, tileSize = 0, tile = true,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    }
    self:SetBackdropColor(0.1, 0.1, 0.1, 1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
    self:SetHighlightTexture(nil)
    ----end
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
