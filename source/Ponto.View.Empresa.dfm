inherited FViewEmpresa: TFViewEmpresa
  Caption = 'FViewEmpresa'
  TextHeight = 15
  inherited pnBotoes: TPanel
    ExplicitLeft = 0
    ExplicitTop = 153
    ExplicitWidth = 624
  end
  object edtID: TLabeledEdit
    Left = 24
    Top = 32
    Width = 73
    Height = 23
    EditLabel.Width = 11
    EditLabel.Height = 15
    EditLabel.Caption = 'ID'
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 1
    Text = ''
  end
  object edtNome: TLabeledEdit
    Left = 24
    Top = 80
    Width = 369
    Height = 23
    EditLabel.Width = 33
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome'
    TabOrder = 2
    Text = ''
  end
end
