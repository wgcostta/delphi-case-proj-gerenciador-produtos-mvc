object FRM_MANUTENCAO_PRODUTOS: TFRM_MANUTENCAO_PRODUTOS
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o em Lote dos Produtos'
  ClientHeight = 491
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 240
    Top = 136
    Width = 363
    Height = 80
    TabOrder = 0
    object Label1: TLabel
      Left = 129
      Top = 7
      Width = 60
      Height = 17
      Caption = 'Categoria:'
    end
    object RadioGroup1: TRadioGroup
      Left = 26
      Top = 8
      Width = 97
      Height = 65
      Caption = 'Op'#231#227'o:'
      ItemIndex = 0
      Items.Strings = (
        'Aumentar'
        'Diminuir')
      TabOrder = 0
    end
    object cbCategoria: TDBLookupComboBox
      Left = 129
      Top = 30
      Width = 208
      Height = 25
      BevelWidth = 10
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = DS_CATEGORIA
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 240
    Top = 222
    Width = 363
    Height = 80
    TabOrder = 1
    object Label2: TLabel
      Left = 26
      Top = 19
      Width = 76
      Height = 17
      Caption = 'Margem (%):'
    end
    object btnConfirmar: TButton
      Left = 250
      Top = 10
      Width = 87
      Height = 60
      Hint = 'Confirmar Opera'#231#227'o'
      Caption = #62068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Font Awesome 5 Free Regular'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object edtMargem: TEdit
      Left = 26
      Top = 42
      Width = 186
      Height = 25
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 472
    Width = 844
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Sistema Gerencial de Clientes'
        Width = 180
      end
      item
        Alignment = taCenter
        Text = 'Desenvolvido por Wagner Costa'
        Width = 180
      end
      item
        Text = 'Usuario: VSM'
        Width = 90
      end
      item
        Alignment = taCenter
        Text = 'Data:'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'Hora:'
        Width = 50
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 648
    Top = 56
  end
  object DS_CATEGORIA: TDataSource
    AutoEdit = False
    DataSet = DM_CATEGORIA.CDS_CATEGORIAS
    Left = 168
    Top = 384
  end
end
