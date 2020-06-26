object DM_GERAL: TDM_GERAL
  OldCreateOrder = False
  Height = 228
  Width = 258
  object SQL_GERAL: TSQLDataSet
    CommandText = 'SHOW TABLES;'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.sqlConexao
    Left = 37
    Top = 24
  end
  object SQL_CONSULTA: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.sqlConexao
    Left = 104
    Top = 24
  end
  object DSP_CONSULTA: TDataSetProvider
    DataSet = SQL_CONSULTA
    Left = 104
    Top = 88
  end
  object CDS_CONSULTA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CONSULTA'
    Left = 104
    Top = 160
  end
end
