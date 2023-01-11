object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Registro de Ponto'
  ClientHeight = 470
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object pnBarra: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnBarra'
    Color = 13598976
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 880
    object pnDadosSessao: TPanel
      Left = 699
      Top = 0
      Width = 185
      Height = 57
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnDadosSessao'
      Color = 13792044
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      ExplicitLeft = 695
      object lblSessaoUsuario: TLabel
        Left = 0
        Top = 40
        Width = 185
        Height = 17
        Align = alBottom
        Alignment = taCenter
        Caption = 'lblSessaoUsuario'
        WordWrap = True
        ExplicitWidth = 100
      end
    end
  end
  object pnMenu: TPanel
    Left = 0
    Top = 57
    Width = 145
    Height = 413
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pnMenu'
    Color = 13598976
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 1
    ExplicitHeight = 412
    object btnBatatida: TSpeedButton
      Left = 0
      Top = 0
      Width = 145
      Height = 33
      Align = alTop
      Caption = 'Registrar Ponto'
      Flat = True
      OnClick = btnBatatidaClick
    end
  end
  object pnPrincipal: TPanel
    Left = 145
    Top = 57
    Width = 739
    Height = 413
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnPrincipal'
    TabOrder = 2
    ExplicitWidth = 735
    ExplicitHeight = 412
    object pcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 739
      Height = 413
      ActivePage = tsExtrato
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 735
      ExplicitHeight = 412
      object tsExtrato: TTabSheet
        Caption = 'tsExtrato'
        object mmoExtratoBatidas: TMemo
          Left = 0
          Top = 57
          Width = 731
          Height = 324
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            'mmoExtratoBatidas')
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 49
          ExplicitWidth = 727
          ExplicitHeight = 331
        end
        object pnlExtratoFiltros: TPanel
          Left = 0
          Top = 0
          Width = 731
          Height = 57
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlExtratoFiltros'
          ShowCaption = False
          TabOrder = 1
          object btGerarExtrato: TSpeedButton
            Left = 626
            Top = 0
            Width = 105
            Height = 57
            Align = alRight
            Caption = 'Gerar Extrato'
            OnClick = btGerarExtratoClick
            ExplicitLeft = 0
            ExplicitHeight = 41
          end
          object Label1: TLabel
            Left = 5
            Top = 6
            Width = 67
            Height = 17
            Caption = 'Funcionario'
          end
          object cbxFuncionario: TComboBox
            Left = 5
            Top = 26
            Width = 173
            Height = 25
            Style = csDropDownList
            TabOrder = 0
          end
        end
      end
    end
  end
end
