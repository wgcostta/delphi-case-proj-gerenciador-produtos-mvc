object DM_PRODUTO: TDM_PRODUTO
  OldCreateOrder = False
  Height = 238
  Width = 144
  object sqlPesquisar: TSQLDataSet
    CommandText = 
      'SELECT '#13#10'CODIGO,'#13#10'DESCRICAO,'#13#10'CODIGO_CATEGORIA,'#13#10'PRECO,'#13#10'ULTIMO_' +
      'PRECO'#13#10'DATA_CADASTRO,'#13#10'DATA_ATUALIZACAO,'#13#10'SITUACAO'#13#10'FROM'#13#10'PRODUT' +
      'O'#13#10'WHERE'#13#10'(DESCRICAO LIKE :DESCRICAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 56
    Top = 32
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 112
  end
  object CDSPESQUISAR: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 56
    Top = 184
    object CDSPESQUISARCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CDSPESQUISARDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object CDSPESQUISARCODIGO_CATEGORIA: TIntegerField
      FieldName = 'CODIGO_CATEGORIA'
      Required = True
    end
    object CDSPESQUISARPRECO: TSingleField
      FieldName = 'PRECO'
      Required = True
    end
    object CDSPESQUISARDATA_CADASTRO: TSingleField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object CDSPESQUISARDATA_ATUALIZACAO: TDateField
      FieldName = 'DATA_ATUALIZACAO'
      Required = True
    end
    object CDSPESQUISARSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      Size = 10
    end
  end
end
