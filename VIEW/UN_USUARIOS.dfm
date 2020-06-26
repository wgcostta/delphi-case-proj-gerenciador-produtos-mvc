object FRM_USUARIOS: TFRM_USUARIOS
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Usu'#225'rios'
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
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 844
    Height = 472
    ActivePage = tbProdutos
    Align = alClient
    TabOrder = 1
    object tbProdutos: TTabSheet
      Caption = 'Listagem'
      object Panel3: TPanel
        Left = 0
        Top = 380
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
        Height = 320
        Align = alClient
        DataSource = DS_USUARIOS
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
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
        ParentBackground = False
        TabOrder = 2
        object btnPesquisar: TButton
          Left = 747
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Sair'
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
          Left = 15
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 193
        Width = 836
        Height = 70
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object btnListar: TButton
          Left = 398
          Top = 3
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
          Left = 479
          Top = 3
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
          Left = 560
          Top = 3
          Width = 75
          Height = 55
          Hint = 'Gravar - A senha dever'#225' ser gravada em seguida.'
          Caption = #61639
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 722
          Top = 3
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
          TabOrder = 4
          OnClick = btnCancelarClick
        end
        object btnExcluir: TButton
          Left = 641
          Top = 3
          Width = 75
          Height = 55
          Hint = 
            'Excluir - Para uma maior seguran'#231'a n'#227'o '#233' poss'#237'vel excluir os usu' +
            #225'rios'
          Caption = #62189
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnExcluirClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 263
        Width = 836
        Height = 177
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object Label2: TLabel
          Left = 3
          Top = 6
          Width = 120
          Height = 17
          Caption = 'Altera'#231#227'o de Senha: '
        end
        object btnNovaSenha: TButton
          Left = 675
          Top = 79
          Width = 119
          Height = 55
          Hint = 'Gravar a Senha'
          Align = alCustom
          Caption = #62146
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -40
          Font.Name = 'Font Awesome 5 Free Regular'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnNovaSenhaClick
        end
        object edtSenhaAtual: TEdit
          Left = 125
          Top = 111
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 1
        end
        object edtSenhaConfirmar: TEdit
          Left = 418
          Top = 111
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object edtSenhaNova: TEdit
          Left = 418
          Top = 46
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 2
        end
        object edtUsuario: TEdit
          Left = 125
          Top = 49
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Senha: TStaticText
          Left = 42
          Top = 115
          Width = 77
          Height = 20
          Caption = 'Senha atual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText6: TStaticText
          Left = 276
          Top = 113
          Width = 136
          Height = 20
          Caption = 'Confirmar Nova Senha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object StaticText7: TStaticText
          Left = 42
          Top = 51
          Width = 52
          Height = 20
          Caption = 'Usu'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object StaticText8: TStaticText
          Left = 276
          Top = 53
          Width = 77
          Height = 20
          Caption = 'Nova Senha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Sagoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 193
        Align = alTop
        Color = clWindow
        ParentBackground = False
        TabOrder = 2
        object Label1: TLabel
          Left = 144
          Top = 49
          Width = 43
          Height = 17
          Caption = 'C'#243'digo'
        end
        object Label5: TLabel
          Left = 312
          Top = 49
          Width = 108
          Height = 17
          Caption = 'Nome do Usu'#225'rio:'
        end
        object edtCodigo: TEdit
          Left = 144
          Top = 72
          Width = 145
          Height = 25
          Enabled = False
          TabOrder = 0
        end
        object edtDescricao: TEdit
          Left = 312
          Top = 72
          Width = 145
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 1
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 584
    Top = 24
  end
  object DS_USUARIOS: TDataSource
    Left = 448
    Top = 24
  end
end
