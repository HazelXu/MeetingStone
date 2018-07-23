
local WIDGET, VERSION = 'CheckBox', 2

local GUI = LibStub('NetEaseGUI-2.0')
local CheckBox = GUI:NewClass(WIDGET, 'CheckButton', VERSION)
if not CheckBox then
    return
end

function CheckBox:Constructor()
    self:SetSize(16, 16)

    --customized
    self:SetBackdrop{
        bgFile = [[Interface\BUTTONS\WHITE8X8.blp]],
        edgeFile = [[Interface\BUTTONS\WHITE8X8.blp]],
        edgeSize = 1, tileSize = 1, tile = true,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    }
    self:SetBackdropColor(0.1, 0.1, 0.1, 1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
    self:SetHighlightTexture(nil)
    --end

    --self:SetNormalTexture([[Interface\Buttons\UI-CheckBox-Up]])
    self:SetCheckedTexture([[Interface\Buttons\UI-CheckBox-Check]])
    --self:SetPushedTexture([[Interface\Buttons\UI-CheckBox-Down]])
    self:SetDisabledCheckedTexture([[INTERFACE\BUTTONS\UI-CheckBox-Check-Disabled]])

    local Text = self:CreateFontString(nil, 'OVERLAY')
    Text:SetPoint('LEFT', self, 'RIGHT', 2, 0)
    self:SetFontString(Text)

    self:SetNormalFontObject('GameFontNormalSmall')
    self:SetHighlightFontObject('GameFontHighlightSmall')
    self:SetDisabledFontObject('GameFontDisableSmall')

    self.Text = Text
end

function CheckBox:SetText(text)
    self.Text:SetText(text)
    self:SetHitRectInsets(0, - self.Text:GetWidth(), 0, 0)
end
