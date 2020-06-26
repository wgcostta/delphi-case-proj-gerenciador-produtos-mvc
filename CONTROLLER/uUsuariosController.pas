unit uUsuariosController;

interface

uses uUsuarioModel,
  System.SysUtils, DM_USUARIOS, DM_GERAL_SQLS;

type
  TUsuarioController = class
  public
    constructor Create;
    destructor Destroy; override; // sobrescrevendo o metodo
    procedure CarregarUsuario(oUsuario: TUsuario; iCodigo: Integer);
    procedure Pesquisar(sNome: String);
    function Inserir(oUsuario: TUsuario): Boolean;
    function Alterar(oUsuario: TUsuario): Boolean;
    function Excluir(oUsuario: TUsuario): Boolean;
  end;

implementation

{ TUsuarioController }
var
  sSQLGeral: String;

function TUsuarioController.Alterar(oUsuario: TUsuario): Boolean;
begin
  sSQLGeral := ' UPDATE USUARIO SET USUARIO = UPPER(' +
    QuotedStr(oUsuario.Usuario) + ') WHERE CODIGO = ' +
    IntToStr(oUsuario.Codigo);
  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TUsuarioController.CarregarUsuario(oUsuario: TUsuario;
  iCodigo: Integer);
begin
  DM_Usuario.CarregarUsuario(oUsuario, iCodigo);
end;

constructor TUsuarioController.Create;
begin

end;

destructor TUsuarioController.Destroy;
begin

  inherited;
end;

function TUsuarioController.Excluir(oUsuario: TUsuario): Boolean;
begin
  sSQLGeral := ' DELETE FROM USUARIO WHERE CODIGO = ' +
    IntToStr(oUsuario.Codigo);
  Result := DM_GERAL.Executar(sSQLGeral);
end;

function TUsuarioController.Inserir(oUsuario: TUsuario): Boolean;
begin
  sSQLGeral := ' INSERT IGNORE INTO Usuario (USUARIO, SENHA) VALUES (' +
    QuotedStr(oUsuario.Usuario) + ',' + QuotedStr(oUsuario.Senha) + ');';
  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TUsuarioController.Pesquisar(sNome: String);
begin
  DM_Usuario.Pesquisar(sNome);
end;

end.
