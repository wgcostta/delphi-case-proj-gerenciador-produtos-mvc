unit DM_PRODUTOS;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  DM_CONEXAO,
  Datasnap.DBClient, Datasnap.Provider, uProdutoModel;

type
  TDM_PRODUTO = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    CDSPESQUISAR: TClientDataSet;
    CDSPESQUISARCODIGO: TIntegerField;
    CDSPESQUISARDESCRICAO: TStringField;
    CDSPESQUISARCODIGO_CATEGORIA: TIntegerField;
    CDSPESQUISARPRECO: TSingleField;
    CDSPESQUISARDATA_CADASTRO: TSingleField;
    CDSPESQUISARDATA_ATUALIZACAO: TDateField;
    CDSPESQUISARSITUACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome: String);
    procedure CarregarProduto(oProduto: TProduto; iCodigo: Integer);
    // usando function para vermos se foi inserido ou não
   

  end;

var
  DM_PRODUTO: TDM_PRODUTO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM_PRODUTO }



procedure TDM_PRODUTO.CarregarProduto(oProduto: TProduto; iCodigo: Integer);
var
  sqlProduto: TSQLDataSet;
begin
  sqlProduto := TSQLDataSet.Create(nil);
  try
    with sqlProduto do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'select * from produto where (codigo=' +
        IntToStr(iCodigo) + ')';
      Open;
      with oProduto do
      begin
        Codigo := FieldByName('CODIGO').AsInteger;
        Descricao := FieldByName('DESCRICAO').AsString;
        Situacao := FieldByName('SITUACAO').AsString;
        CodigoCategoria := FieldByName('CODIGO_CATEGORIA').AsInteger;
        Preco := FieldByName('PRECO').AsString;
        UltimoPreco := FieldByName('ULTIMO_PRECO').AsCurrency;
        DataCadastro := FieldByName('DATA_CADASTRO').AsString;
        DataAtualizacao := FieldByName('DATA_ATUALIZACAO').AsString;

      end;
    end;

  finally
    FreeAndNil(sqlProduto);
  end;
end;

procedure TDM_PRODUTO.Pesquisar(sNome: String);
begin
  cdsPesquisar.DisableControls;
  cdsPesquisar.Close;
  // cdsPesquisar.Params[0]     indice do parametro zero, ou por nome:
  cdsPesquisar.ParamByName('DESCRICAO').AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
  cdsPesquisar.EnableControls;
end;

end.
