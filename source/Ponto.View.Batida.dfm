object FViewBatida: TFViewBatida
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Batida'
  ClientHeight = 141
  ClientWidth = 489
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 141
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 485
    ExplicitHeight = 140
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 93
      Height = 15
      Caption = 'Cliente / Empresa'
    end
    object Label2: TLabel
      Left = 159
      Top = 8
      Width = 38
      Height = 15
      Caption = 'Projeto'
    end
    object pnlDataHora: TPanel
      Left = 0
      Top = 59
      Width = 489
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlDataHora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13598976
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitTop = 58
      ExplicitWidth = 485
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 100
      Width = 489
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlBotoes'
      ShowCaption = False
      TabOrder = 4
      ExplicitTop = 99
      ExplicitWidth = 485
      object btnRegistrar: TSpeedButton
        Left = 0
        Top = 0
        Width = 113
        Height = 41
        Align = alLeft
        Caption = 'Registrar'
        Flat = True
        OnClick = btnRegistrarClick
      end
      object btnCancelar: TSpeedButton
        Left = 113
        Top = 0
        Width = 176
        Height = 41
        Align = alLeft
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelarClick
      end
    end
    object cboCliente: TComboBox
      Left = 8
      Top = 24
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnChange = cboClienteChange
    end
    object cboProjeto: TComboBox
      Left = 159
      Top = 24
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 1
    end
    object edtUsuario: TLabeledEdit
      Left = 310
      Top = 24
      Width = 163
      Height = 23
      EditLabel.Width = 107
      EditLabel.Height = 15
      EditLabel.Caption = 'Usu'#225'rio Selecionado'
      ReadOnly = True
      TabOrder = 2
      Text = ''
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 240
    Top = 80
  end
end
