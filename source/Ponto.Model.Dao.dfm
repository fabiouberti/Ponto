object DAO: TDAO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 450
  object FConexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 208
    Top = 120
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 360
    Top = 144
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 352
    Top = 96
  end
end
