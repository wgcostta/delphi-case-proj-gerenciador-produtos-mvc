unit uProdutosController;

// Classe Controle    servir� apenas para intermediar.
interface

uses uProdutoModel, Dialogs,
  System.SysUtils, DM_PRODUTOS, Data.DB, DM_GERAL_SQLS;

type
  TProdutoController = class
  public
    constructor Create;
    destructor Destroy; override; // sobrescrevendo o metodo
    procedure CarregarProduto(oProduto: TProduto; iCodigo: Integer);
    procedure Pesquisar(sNome: String);
    function Inserir(oProduto: TProduto): Boolean;
    function Alterar(oProduto: TProduto): Boolean;
    function Excluir(oProduto: TProduto): Boolean;
  end;

implementation

{ TProdutoController }
var
  sSQLGeral: String;

function TProdutoController.Alterar(oProduto: TProduto): Boolean;
begin
  sSQLGeral := ' UPDATE PRODUTO SET DESCRICAO = ' +
    QuotedStr(oProduto.Descricao) +
    ', CODIGO_CATEGORIA = ' + IntToStr(oProduto.CodigoCategoria) +
    ', DATA_ATUALIZACAO=CURDATE() , ULTIMO_PRECO = PRECO, PRECO = ' +
    QuotedStr((oProduto.Preco)) + ', SITUACAO=' + QuotedStr(oProduto.Situacao) +
    ' WHERE CODIGO = ' + IntToStr(oProduto.Codigo);

  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TProdutoController.CarregarProduto(oProduto: TProduto;
  iCodigo: Integer);
begin
  DM_PRODUTO.CarregarProduto(oProduto, iCodigo);
end;

constructor TProdutoController.Create;
begin

end;

destructor TProdutoController.Destroy;
begin
  inherited;
end;

function TProdutoController.Excluir(oProduto: TProduto): Boolean;
begin
  sSQLGeral := ' DELETE FROM PRODUTO WHERE CODIGO = ' +
    IntToStr(oProduto.Codigo);
  Result := DM_GERAL.Executar(sSQLGeral);
end;

function TProdutoController.Inserir(oProduto: TProduto): Boolean;
begin
  sSQLGeral := ' INSERT IGNORE INTO PRODUTO (DESCRICAO,' +
    'CODIGO_CATEGORIA, PRECO , DATA_CADASTRO, ' +
    'DATA_ATUALIZACAO,SITUACAO ) VALUES ("' + oProduto.Descricao + '","' +
    oProduto.CodigoCategoria.ToString + '",' + QuotedStr(oProduto.Preco) +
    ', CURDATE(), CURDATE(),' + QuotedStr(oProduto.Situacao) + ')';
  Result := DM_GERAL.Executar(sSQLGeral);
end;

procedure TProdutoController.Pesquisar(sNome: String);
begin
  DM_PRODUTO.Pesquisar(sNome);
end;

end.
