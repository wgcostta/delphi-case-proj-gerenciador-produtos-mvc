unit DM_CATEGORIAS;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, DM_CONEXAO, uCategoriaModel;

type
  TDM_CATEGORIA = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarCODIGO: TIntegerField;
    cdsPesquisarDESCRICAO: TStringField;
    sqlPesquisarCODIGO: TIntegerField;
    sqlPesquisarDESCRICAO: TStringField;
    CDS_CATEGORIAS: TClientDataSet;
    DSP_CATEGORIAS: TDataSetProvider;
    SQL_CATEGORIAS: TSQLDataSet;
    SQL_CATEGORIASCODIGO: TIntegerField;
    SQL_CATEGORIASDESCRICAO: TStringField;
    CDS_CATEGORIASCODIGO: TIntegerField;
    CDS_CATEGORIASDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome: String);
    procedure CarregarCategoria(oCategoria: TCategoria; iCodigo: Integer);


  end;

var
  DM_CATEGORIA: TDM_CATEGORIA;

implementation

// var   sSQLGeral :  String;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM_CATEGORIA }

procedure TDM_CATEGORIA.CarregarCategoria(oCategoria: TCategoria;
  iCodigo: Integer);
var
  sqlCategoria: TSQLDataSet;
begin
  sqlCategoria := TSQLDataSet.Create(nil);
  try
    with sqlCategoria do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'select * from Categoria where (codigo=' +
        IntToStr(iCodigo) + ')';
      Open;
      with oCategoria do
      begin
        Codigo := FieldByName('CODIGO').AsInteger;
        Descricao := FieldByName('DESCRICAO').AsString;

      end;
    end;

  finally
    FreeAndNil(sqlCategoria);
  end;
end;

procedure TDM_CATEGORIA.Pesquisar(sNome: String);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  // cdsPesquisar.Params[0]     indice do parametro zero, ou por nome:
  cdsPesquisar.ParamByName('DESCRICAO_CAT').AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;

end;

end.
