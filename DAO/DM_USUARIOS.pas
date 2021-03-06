unit DM_USUARIOS;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, DM_CONEXAO, uUsuarioModel;

type
  TDM_USUARIO = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    DSP_LOGIN: TDataSetProvider;
    SQL_LOGIN: TSQLDataSet;
    CDS_LOGIN: TClientDataSet;
    SQL_LOGINCODIGO: TIntegerField;
    SQL_LOGINUSUARIO: TStringField;
    SQL_LOGINSENHA: TStringField;
    CDS_LOGINCODIGO: TIntegerField;
    CDS_LOGINUSUARIO: TStringField;
    CDS_LOGINSENHA: TStringField;
    sqlPesquisarCODIGO: TIntegerField;
    sqlPesquisarUSUARIO: TStringField;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarUSUARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome: String);
    procedure CarregarUsuario(oUsuario: TUsuario; iCodigo: Integer);

  end;

var
  DM_USUARIO: TDM_USUARIO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM_USUARIO }

procedure TDM_USUARIO.CarregarUsuario(oUsuario: TUsuario; iCodigo: Integer);
var
  sqlUsuario: TSQLDataSet;
begin
  sqlUsuario := TSQLDataSet.Create(nil);
  try
    with sqlUsuario do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'select * from USUARIO where (codigo=' +
        IntToStr(iCodigo) + ')';
      Open;
      with oUsuario do
      begin
        Codigo := FieldByName('CODIGO').AsInteger;
        Usuario := FieldByName('USUARIO').AsString;
        Senha := FieldByName('SENHA').AsString;

      end;
    end;

  finally
    FreeAndNil(sqlUsuario);
  end;
end;

procedure TDM_USUARIO.Pesquisar(sNome: String);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.ParamByName('USUARIO').AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;

end;

end.
