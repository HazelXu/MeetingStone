
local WIDGET, VERSION = 'BottomTabButton', 2

local GUI = LibStub('NetEaseGUI-2.0')
local BottomTabButton = GUI:NewClass(WIDGET, GUI:GetClass('TabItemButton'), VERSION)
if not BottomTabButton then
    return
end

function BottomTabButton:Constructor()
    self:SetSize(10, 32)

    self.tLeft = self:CreateTexture(nil, 'BACKGROUND')
    --self.tLeft:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tLeft:SetTexCoord(0.05, 0.15625, 0, 1.0)
    self.tLeft:SetSize(0.5, 32)
    self.tLeft:SetPoint('TOPLEFT', 0, 1)
    self.tLeft:SetColorTexture(0, 0, 0 ,1)

    self.tRight = self:CreateTexture(nil, 'BACKGROUND')
    --self.tRight:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tRight:SetTexCoord(0.84375, 0.95, 0, 1.0)
    self.tRight:SetSize(0.5, 32)
    self.tRight:SetPoint('TOPRIGHT', 0, 1)
    self.tRight:SetColorTexture(0, 0, 0 ,1)


    self.tMid = self:CreateTexture(nil, 'BACKGROUND')
    --self.tMid:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tMid:SetTexCoord(0.15625, 0.84375, 0, 1.0)
    self.tMid:SetPoint('TOPLEFT', self.tLeft, 'TOPRIGHT')
    self.tMid:SetPoint('BOTTOMRIGHT', self.tRight, 'BOTTOMLEFT')
    self.tMid:SetColorTexture(0.1, 0.1, 0.1 ,1)


    self.tBot = self:CreateTexture(nil, 'BACKGROUND')
    --self.tBot:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tBot:SetTexCoord(0.84375, 0.95, 0, 1.0)
    self.tBot:SetPoint('BOTTOMLEFT', self.tLeft, 'BOTTOMLEFT')
    self.tBot:SetPoint('BOTTOMRIGHT', self.tRight, 'BOTTOMRIGHT')
    self.tBot:SetColorTexture(0, 0, 0 ,1)
    self.tBot:SetHeight(1)

    self.tActiveLeft = self:CreateTexture(nil, 'BACKGROUND')
    --self.tActiveLeft:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tActiveLeft:SetTexCoord(0.05, 0.15625, 0, 0.546875)
    self.tActiveLeft:SetSize(0.5, 32)
    self.tActiveLeft:SetPoint('TOPLEFT', 0, 1)
    self.tActiveLeft:SetColorTexture(0, 0, 0 ,1)

    self.tActiveRight = self:CreateTexture(nil, 'BACKGROUND')
    --self.tActiveRight:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tActiveRight:SetTexCoord(0.84375, 0.95, 0, 0.546875)
    self.tActiveRight:SetSize(0.5, 32)
    self.tActiveRight:SetPoint('TOPRIGHT', 0, 1)
    self.tActiveRight:SetColorTexture(0, 0, 0 ,1)

    self.tActiveMid = self:CreateTexture(nil, 'BACKGROUND')
    --self.tActiveMid:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tActiveMid:SetTexCoord(0.15625, 0.84375, 0, 0.546875)
    self.tActiveMid:SetPoint('TOPLEFT', self.tActiveLeft, 'TOPRIGHT')
    self.tActiveMid:SetPoint('BOTTOMRIGHT', self.tActiveRight, 'BOTTOMLEFT')
    self.tActiveMid:SetColorTexture(0.2,0.2,0.2,1)

    self.tActiveBot = self:CreateTexture(nil, 'BACKGROUND')
    --self.tActiveBot:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    --self.tActiveBot:SetTexCoord(0.84375, 0.95, 0, 1.0)
    self.tActiveBot:SetPoint('BOTTOMLEFT', self.tActiveLeft, 'BOTTOMLEFT')
    self.tActiveBot:SetPoint('BOTTOMRIGHT', self.tActiveRight, 'BOTTOMRIGHT')
    self.tActiveBot:SetColorTexture(0, 0, 0 ,1)
    self.tActiveBot:SetHeight(1)

    self:SetFontString(self:CreateFontString(nil, 'OVERLAY'))
    self:SetNormalFontObject('GameFontNormalSmall')
    self:SetDisabledFontObject('GameFontHighlightSmall')
    self:SetHighlightFontObject('GameFontHighlightSmall')

    -- self:SetHighlightTexture([[Interface\PaperDollInfoFrame\UI-Character-Tab-RealHighlight]], 'ADD')
    -- self:GetHighlightTexture():ClearAllPoints()
    -- self:GetHighlightTexture():SetPoint('TOPLEFT', 3, 5)
    -- self:GetHighlightTexture():SetPoint('BOTTOMRIGHT', -3, 0)
    -- self:GetHighlightTexture():SetTexCoord(0.1, 0.9, 0, 1)
end

function BottomTabButton:SetStatus(status)
    if status == 'SELECTED' then
        self.tActiveLeft:Show()
        self.tActiveRight:Show()
        self.tActiveMid:Show()
        self.tActiveBot:Show()
        self.tLeft:Hide()
        self.tRight:Hide()
        self.tMid:Hide()
        self.tBot:Hide()
        self:Disable()
        self:SetDisabledFontObject('GameFontHighlightSmall')
        self:GetFontString():SetPoint('CENTER', 0, -3)
    elseif status == 'NORMAL' then
        self.tActiveLeft:Hide()
        self.tActiveRight:Hide()
        self.tActiveMid:Hide()
        self.tActiveBot:Hide()
        self.tLeft:Show()
        self.tRight:Show()
        self.tMid:Show()
        self.tBot:Show()
        self:Enable()
        self:GetFontString():SetPoint('CENTER', 0, 2)
    elseif status == 'DISABLED' then
        self.tActiveLeft:Hide()
        self.tActiveRight:Hide()
        self.tActiveMid:Hide()
        self.tActiveBot:Hide()
        self.tLeft:Show()
        self.tRight:Show()
        self.tMid:Show()
        self.tBot:Show()
        self:Disable()
        self:SetDisabledFontObject('GameFontDisableSmall')
        self:GetFontString():SetPoint('CENTER', 0, 2)
    end

    self:SetWidth(self:GetTextWidth() + 30)
end
