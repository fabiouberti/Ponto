object FViewLogin: TFViewLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 155
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  TextHeight = 15
  object edtUsuario: TLabeledEdit
    Left = 8
    Top = 25
    Width = 218
    Height = 29
    EditLabel.Width = 40
    EditLabel.Height = 15
    EditLabel.Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = ''
  end
  object edtSenha: TLabeledEdit
    Left = 8
    Top = 73
    Width = 218
    Height = 29
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = ''
    OnKeyPress = edtSenhaKeyPress
  end
  object pnlBotao: TPanel
    Left = 0
    Top = 114
    Width = 234
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBotao'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 113
    ExplicitWidth = 230
    object btnOK: TSpeedButton
      Left = 0
      Top = 0
      Width = 115
      Height = 41
      Align = alLeft
      Caption = 'OK'
      OnClick = btnOKClick
      ExplicitLeft = -6
      ExplicitTop = -6
    end
    object btnCancelar: TSpeedButton
      Left = 115
      Top = 0
      Width = 115
      Height = 41
      Align = alLeft
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
      ExplicitLeft = 111
      ExplicitTop = -6
    end
  end
end
