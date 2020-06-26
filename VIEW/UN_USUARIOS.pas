unit UN_USUARIOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, DM_USUARIOS, uUsuarioModel,
  uUsuariosController, uLoginController;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TFRM_USUARIOS = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    DS_USUARIOS: TDataSource;
    pgPrincipal: TPageControl;
    tbProdutos: TTabSheet;
    Panel3: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    Panel2: TPanel;
    btnPesquisar: TButton;
    edtPesquisar: TLabeledEdit;
    tb_Dados: TTabSheet;
    Label1: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    btnFechar: TButton;
    edtUsuario: TEdit;
    edtSenhaAtual: TEdit;
    edtSenhaConfirmar: TEdit;
    edtSenhaNova: TEdit;
    StaticText7: TStaticText;
    Senha: TStaticText;
    StaticText8: TStaticText;
    StaticText6: TStaticText;
    btnNovaSenha: TButton;
    Panel1: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovaSenhaClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarProduto;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
  public
    { Public declarations }
  end;

var
  FRM_USUARIOS: TFRM_USUARIOS;

implementation

{$R *.dfm}

procedure TFRM_USUARIOS.Alterar;
var
  oUsuario: TUsuario;
  oUsuarioController: TUsuarioController;
begin
  oUsuarioController := TUsuarioController.Create;
  oUsuario := TUsuario.Create;
  try
    with oUsuario do
    begin
      Codigo := StrToIntDef(edtCodigo.Text, 0);
      Usuario := edtDescricao.Text;
      // Senha :=    edtSenhaConfirmar.Text;

    end;
    if oUsuarioController.Alterar(oUsuario) then
    begin
      ShowMessage('Opera��o realizada com sucesso');
    end
    else
    begin
      ShowMessage
        ('N�o foi poss�vel realizar a opera��o, entre em contato com o suporte');
    end;
  finally
    FreeAndNil(oUsuarioController);
    FreeAndNil(oUsuario);
  end;

end;

procedure TFRM_USUARIOS.btnAlterarClick(Sender: TObject);
begin
  HabilitarControles(opAlterar);
  FOperacao := opAlterar;
end;

procedure TFRM_USUARIOS.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFRM_USUARIOS.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFRM_USUARIOS.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFRM_USUARIOS.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFRM_USUARIOS.btnGravarClick(Sender: TObject);
begin
  Gravar;
  if FOperacao = opAlterar then
    Listar;

end;

procedure TFRM_USUARIOS.btnListarClick(Sender: TObject);
begin
  Listar;
end;

{ Valida��o do bot�o Gravar Senha }

procedure TFRM_USUARIOS.btnNovaSenhaClick(Sender: TObject);
var
  oLogin: TLoginController;
  oSenha: String;
begin
  try
    oLogin := TLoginController.Create;
    if (edtUsuario.Text = '') then
    begin
      ShowMessage('O campo "Usuario" deve ser preenchido!');

      if edtUsuario.CanFocus then
        edtUsuario.SetFocus;

      Exit;
    end;
    if (edtSenhaAtual.Text = '') then
    begin
      ShowMessage('O campo "Senha Atual" deve ser preenchido!');

      if edtSenhaAtual.CanFocus then
        edtSenhaAtual.SetFocus;

      Exit;
    end;
    if (edtSenhaNova.Text = '') then
    // Verifica se o campo "Senha" foi preenchido
    begin
      ShowMessage('O campo "Nova Senha" deve ser preenchido!');

      if edtSenhaNova.CanFocus then
        edtSenhaNova.SetFocus;

      Exit;
    end;

    if (edtSenhaConfirmar.Text = '') then
    begin
      ShowMessage('O campo "Confirmar Senha" deve ser preenchido!');

      if edtSenhaConfirmar.CanFocus then
        edtSenhaConfirmar.SetFocus;

      Exit;
    end;
    // Verifica se o login � v�lido
    if oLogin.loginValido(edtUsuario.Text, edtSenhaAtual.Text) = True then
    begin

      if edtSenhaNova.Text = edtSenhaConfirmar.Text then
      begin
        oSenha := edtSenhaNova.Text;
        oLogin.GravarSenha(oSenha);
        ShowMessage('Senha do usu�rio: ' + edtUsuario.Text + ' alteradara!');
        pgPrincipal.ActivePage := tbProdutos;
        edtSenhaNova.Clear;
        edtSenhaAtual.Clear;
        edtUsuario.Clear;
        edtSenhaConfirmar.Clear;
      end
      else
      begin

        ShowMessage('Nova senha informada n�o confere');
      end;
    end
    else
    begin
      ShowMessage('Usu�rio ou senha Inv�lido(s)');
      edtSenhaNova.Clear;
      edtSenhaAtual.Clear;
      edtSenhaConfirmar.Clear;
      if edtSenhaAtual.CanFocus then
        edtSenhaAtual.SetFocus;

    end;

  finally
    FreeAndNil(oLogin);
  end;
end;

procedure TFRM_USUARIOS.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TFRM_USUARIOS.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFRM_USUARIOS.CarregarProduto;
{ Criando os Objetos em todas as Fun��es para destruir em Seguida. }
var
  oUsuario: TUsuario;
  oUsuarioController: TUsuarioController;
begin
  oUsuarioController := TUsuarioController.Create;
  oUsuario := TUsuario.Create;

  try
    oUsuarioController.CarregarUsuario(oUsuario,
      DS_USUARIOS.DataSet.FieldByName('CODIGO').AsInteger);
    with oUsuario do
    begin
      edtCodigo.Text := IntToStr(Codigo);
      edtDescricao.Text := Usuario;
      edtUsuario.Text := Usuario;
      edtUsuario.Enabled := False;
    end;
  finally
    FreeAndNil(oUsuarioController);
    FreeAndNil(oUsuario);
  end;
end;

procedure TFRM_USUARIOS.Configuracoes;
begin
  tbProdutos.TabVisible := False;
  tb_Dados.TabVisible := False;
  pgPrincipal.ActivePage := tbProdutos;
end;

procedure TFRM_USUARIOS.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFRM_USUARIOS.Detalhar;
begin
  CarregarProduto;
  HabilitarControles(opNavegar);

  FOperacao := opNavegar;
  { Apenas navegar nos dados, sem edi��o
    (Captura o ID do produto que esta na tela de pesquisa para trazer na aba de dados }
  pgPrincipal.ActivePage := tb_Dados;
end;

procedure TFRM_USUARIOS.Excluir;
var
  oUsuario: TUsuario;
  oUsuarioController: TUsuarioController;

begin
  oUsuarioController := TUsuarioController.Create;
  oUsuario := TUsuario.Create;
  try
    with oUsuario do
    begin
      Codigo := StrToIntDef(edtCodigo.Text, 0);
    end;
    if oUsuarioController.Excluir(oUsuario) then
    begin
      ShowMessage('Opera��o realizada com sucesso');
    end
    else
    begin
      ShowMessage
        ('N�o foi poss�vel realizar a opera��o, entre em contato com o suporte');
    end;
  finally
    FreeAndNil(oUsuarioController);
  end;
end;

procedure TFRM_USUARIOS.FormCreate(Sender: TObject);
begin
  DS_USUARIOS.DataSet := DM_USUARIO.CDSPESQUISAR;
end;

procedure TFRM_USUARIOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFRM_USUARIOS.FormShow(Sender: TObject);
begin
  DM_USUARIO.CDSPESQUISAR.Close;
  DM_USUARIO.CDSPESQUISAR.Open;
  Configuracoes;
end;

procedure TFRM_USUARIOS.Gravar;
var
  oUsuarioController: TUsuarioController;
  // vVariavel : String;
begin
  oUsuarioController := TUsuarioController.Create;
  try
    // ShowMessage(vVariavel);
    case FOperacao of
      // verifica qual valor esta dentro de FOperacao e seleciono Insert ou Update
      opNovo:
        Inserir;
      opAlterar:
        Alterar;

    end;
    // oUsuarioController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oUsuarioController);
  end;

end;

procedure TFRM_USUARIOS.HabilitarControles(aOperacao: TOperacao);
begin
  // Desabilitando e habilitando op��es
  case aOperacao of
    opNovo:
      begin
        edtCodigo.Clear;
        edtDescricao.Clear;
        edtSenhaAtual.Clear;
        edtUsuario.Clear;
        edtSenhaConfirmar.Clear;
        edtSenhaNova.Clear;

        edtDescricao.Enabled := True;
        btnExcluir.Enabled := False;
        btnListar.Enabled := True;
        btnFechar.Enabled := False;
        btnAlterar.Enabled := False;
        btnGravar.Enabled := True;
        btnCancelar.Enabled := True;
      end;

    opAlterar:
      begin
        edtDescricao.Enabled := True;
        btnExcluir.Enabled := False;
        btnListar.Enabled := False;
        btnFechar.Enabled := False;
        btnAlterar.Enabled := False;
        btnGravar.Enabled := True;
        btnCancelar.Enabled := True;
      end;
    opNavegar:
      begin
        btnExcluir.Enabled := False;
        { Por seguran�a n�o � interessante excluir os usuarios. }
        edtDescricao.Enabled := False;
        btnListar.Enabled := True;
        btnFechar.Enabled := True;
        btnAlterar.Enabled := True;
        btnGravar.Enabled := False;
        btnCancelar.Enabled := False;
      end;
  end;
end;

procedure TFRM_USUARIOS.Inserir;
var
  oUsuario: TUsuario;
  oUsuarioController: TUsuarioController;

begin
  oUsuarioController := TUsuarioController.Create;
  oUsuario := TUsuario.Create;
  try
    with oUsuario do
    begin

      Usuario := AnsiUpperCase(edtDescricao.Text);
      Senha := '0';
    end;
    if oUsuarioController.Inserir(oUsuario) then
    begin
      ShowMessage('Senha gerada: 0 - Altere a mesma no painel abaixo');
    end
    else
    begin
      ShowMessage
        ('N�o foi poss�vel realizar a opera��o, entre em contato com o suporte');
    end;

    edtUsuario.Text := edtDescricao.Text;
    edtUsuario.Enabled := False;
    edtSenhaAtual.Text := '0';
    edtSenhaAtual.Enabled := False;

    edtCodigo.Clear;
    edtDescricao.Clear;

  finally
    FreeAndNil(oUsuarioController);
    FreeAndNil(oUsuario);
  end;

end;

procedure TFRM_USUARIOS.Listar;
begin
  DM_USUARIO.CDSPESQUISAR.Close;
  DM_USUARIO.CDSPESQUISAR.Open;
  pgPrincipal.ActivePage := tbProdutos;
end;

procedure TFRM_USUARIOS.Novo;
begin
  FOperacao := opNovo;
  pgPrincipal.ActivePage := tb_Dados;
end;

procedure TFRM_USUARIOS.Pesquisar;
var
  oUsuarioController: TUsuarioController;
begin
  oUsuarioController := TUsuarioController.Create;
  try
    oUsuarioController.Pesquisar(edtPesquisar.Text);
    // Passa o valor do edt para o metodo Pesquisa
  finally
    FreeAndNil(oUsuarioController);
    // Limpando da mem�ria
  end;

end;

procedure TFRM_USUARIOS.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text :=
    FormatDateTime('dddd , dd " de " mmmm "de" yyyy', Now);
  StatusBar1.Panels[4].Text := 'Hora: ' + FormatDateTime('hh:mm:ss', Now);
end;

end.
