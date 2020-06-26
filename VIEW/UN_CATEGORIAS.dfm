object FRM_CATEGORIAS: TFRM_CATEGORIAS
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Categorias'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 844
    Height = 472
    ActivePage = tbProdutos
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tbProdutos: TTabSheet
      Caption = 'Listagem'
      object Panel3: TPanel
        Left = 0
        Top = 384
        Width = 836
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btnNovo: TButton
          Left = 585
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Novo Registro'
          Caption = #61694
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 666
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Detalhar'
          Caption = #62248
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnFechar: TButton
          Left = 747
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Sair'
          Caption = #62763
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Solid'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnFecharClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 60
        Width = 836
        Height = 324
        Align = alClient
        DataSource = DS_CATEGORIA
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object btnPesquisar: TButton
          Left = 747
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Pesquisar'
          Caption = #61454
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Solid'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnPesquisarClick
        end
        object edtPesquisar: TLabeledEdit
          Left = 7
          Top = 22
          Width = 365
          Height = 25
          EditLabel.Width = 59
          EditLabel.Height = 17
          EditLabel.Caption = 'Pesquisar:'
          TabOrder = 1
        end
      end
    end
    object tb_Dados: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object Label1: TLabel
        Left = 264
        Top = 173
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 408
        Top = 173
        Width = 53
        Height = 13
        Caption = 'Categoria:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 384
        Width = 836
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btnListar: TButton
          Left = 374
          Top = 1
          Width = 75
          Height = 55
          Hint = 'Voltar'
          Caption = #62297
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 455
          Top = 1
          Width = 75
          Height = 55
          Hint = 'Editar'
          Caption = #61508
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 536
          Top = 1
          Width = 75
          Height = 55
          Hint = 'Gravar'
          Caption = #61639
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 698
          Top = 1
          Width = 75
          Height = 55
          Hint = 'Cancelar'
          Caption = #61902
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Solid'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnCancelarClick
        end
        object btnExcluir: TButton
          Left = 617
          Top = 1
          Width = 75
          Height = 55
          Hint = 'Excluir'
          Caption = #62189
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnExcluirClick
        end
      end
      object edtCodigo: TEdit
        Left = 264
        Top = 192
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 408
        Top = 192
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
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
        Text = 'Sistema Gerencial de Produtos'
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
  object DS_CATEGORIA: TDataSource
    DataSet = DM_CATEGORIA.cdsPesquisar
    Left = 432
    Top = 33
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 532
    Top = 40
  end
end
