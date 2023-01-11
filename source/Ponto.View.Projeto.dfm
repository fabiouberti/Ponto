inherited FViewProjeto: TFViewProjeto
  Caption = 'Projeto'
  ClientWidth = 453
  OnCreate = FormCreate
  ExplicitWidth = 469
  TextHeight = 15
  object lblEmoresa: TLabel [0]
    Left = 24
    Top = 91
    Width = 45
    Height = 15
    Caption = 'Empresa'
  end
  inherited pnBotoes: TPanel
    Width = 453
    ExplicitLeft = 0
    ExplicitTop = 153
    ExplicitWidth = 624
  end
  object edtID: TLabeledEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 23
    EditLabel.Width = 11
    EditLabel.Height = 15
    EditLabel.Caption = 'ID'
    TabOrder = 1
    Text = ''
  end
  object edtNome: TLabeledEdit
    Left = 24
    Top = 66
    Width = 393
    Height = 23
    EditLabel.Width = 33
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome'
    TabOrder = 2
    Text = ''
  end
  object cboEmpresa: TComboBox
    Left = 24
    Top = 109
    Width = 257
    Height = 23
    TabOrder = 3
    Text = 'cboEmpresa'
  end
end
