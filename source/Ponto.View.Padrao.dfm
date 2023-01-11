object FViewPadrao: TFViewPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FViewPadrao'
  ClientHeight = 194
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object pnBotoes: TPanel
    Left = 0
    Top = 153
    Width = 624
    Height = 41
    Align = alBottom
    Caption = 'pnBotoes'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 200
    ExplicitTop = 120
    ExplicitWidth = 185
    object btnCancelar: TSpeedButton
      Left = 91
      Top = 1
      Width = 90
      Height = 39
      Align = alLeft
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
    end
    object btnSalvar: TSpeedButton
      Left = 1
      Top = 1
      Width = 90
      Height = 39
      Align = alLeft
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
  end
end
