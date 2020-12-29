object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Registro de Ponto'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBarra: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnBarra'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 55
      Height = 13
      Caption = 'Funcionario'
    end
    object cbxFuncionario: TComboBox
      Left = 77
      Top = 19
      Width = 173
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object mmoExtratoBatidas: TMemo
    Left = 145
    Top = 57
    Width = 490
    Height = 242
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'mmoExtratoBatidas')
    ParentFont = False
    TabOrder = 1
  end
  object pnMenu: TPanel
    Left = 0
    Top = 57
    Width = 145
    Height = 242
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pnMenu'
    ShowCaption = False
    TabOrder = 2
    object btnBatatida: TSpeedButton
      Left = 0
      Top = 0
      Width = 145
      Height = 33
      Align = alTop
      Caption = 'Registrar Ponto'
      OnClick = btnBatatidaClick
    end
    object btGerarExtrato: TSpeedButton
      Left = 0
      Top = 33
      Width = 145
      Height = 33
      Align = alTop
      Caption = 'Gerar Extrato'
      OnClick = btGerarExtratoClick
    end
  end
end
