object DM_USUARIO: TDM_USUARIO
  OldCreateOrder = False
  Height = 246
  Width = 195
  object sqlPesquisar: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'CODIGO,'#13#10'USUARIO'#13#10'FROM '#13#10'USUARIO'#13#10'WHERE'#13#10'(USUARIO LIKE :' +
      'USUARIO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 56
    Top = 32
    object sqlPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlPesquisarUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 100
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 56
    Top = 112
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 56
    Top = 182
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesquisarUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 100
    end
  end
  object DSP_LOGIN: TDataSetProvider
    DataSet = SQL_LOGIN
    Left = 120
    Top = 112
  end
  object SQL_LOGIN: TSQLDataSet
    CommandText = 
      'SELECT * '#13#10'FROM'#13#10' USUARIO'#13#10'WHERE'#13#10'USUARIO = :USUARIO'#13#10'AND'#13#10'SENHA' +
      ' = :SENHA;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 120
    Top = 32
    object SQL_LOGINCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object SQL_LOGINUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 100
    end
    object SQL_LOGINSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 100
    end
  end
  object CDS_LOGIN: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    ProviderName = 'DSP_LOGIN'
    Left = 120
    Top = 176
    object CDS_LOGINCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CDS_LOGINUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 100
    end
    object CDS_LOGINSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 100
    end
  end
end
