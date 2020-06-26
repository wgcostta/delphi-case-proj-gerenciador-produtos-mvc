unit uCategoriasController;

interface

uses uCategoriaModel, System.Classes,
  System.SysUtils, DM_CATEGORIAS, uUsuarioModel, DM_GERAL_SQLS;
{ System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  DM_CONEXAO,
  Datasnap.DBClient, Datasnap.Provider, uProdutoModel;
}

type
  TCategoriaController = class
  public
    constructor Create;
    destructor Destroy; override; // sobrescrevendo o metodo
    procedure CarregarCategoria(oCategoria: TCategoria; iCodigo: Integer);
    procedure Pesquisar(sNome: String);
    function Inserir(oCategoria: TCategoria): Boolean;
    function Alterar(oCategoria: TCategoria): Boolean;
    function Excluir(oCategoria: TCategoria): Boolean;
    function ValidaExclusao(oCategoria: TCategoria): Boolean;
  end;

implementation

var
  sSQLGeral: String;

function TCategoriaController.Alterar(oCategoria: TCategoria): Boolean;
begin
  sSQLGeral := ' UPDATE CATEGORIA SET DESCRICAO = "' + oCategoria.Descricao +
    '" WHERE CODIGO = ' + IntToStr(oCategoria.Codigo);
  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TCategoriaController.CarregarCategoria(oCategoria: TCategoria;
  iCodigo: Integer);
begin
  DM_Categoria.CarregarCategoria(oCategoria, iCodigo);
end;

constructor TCategoriaController.Create;
begin

end;

destructor TCategoriaController.Destroy;
begin

  inherited;
end;

function TCategoriaController.Excluir(oCategoria: TCategoria): Boolean;
begin

  sSQLGeral := ' DELETE FROM CATEGORIA WHERE CODIGO = ' +
    IntToStr(oCategoria.Codigo);
  Result := DM_GERAL.Executar(sSQLGeral);
end;

function TCategoriaController.Inserir(oCategoria: TCategoria): Boolean;
begin
  sSQLGeral := ' INSERT IGNORE INTO CATEGORIA (DESCRICAO) VALUES ("' +
    oCategoria.Descricao + '");';
  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TCategoriaController.Pesquisar(sNome: String);
begin
  DM_Categoria.Pesquisar(sNome);
end;

function TCategoriaController.ValidaExclusao(oCategoria: TCategoria): Boolean;
begin
  Result := False;
  DM_GERAL.CDS_CONSULTA.Close;
  DM_GERAL.SQL_CONSULTA.CommandText :=
    'SELECT COUNT(*) As QTD FROM PRODUTO WHERE CODIGO_CATEGORIA =' +
    IntToStr(oCategoria.Codigo);
  DM_GERAL.CDS_CONSULTA.Open;
  Result := DM_GERAL.CDS_CONSULTA.FieldByName('QTD').AsInteger = 0;

end;

end.
