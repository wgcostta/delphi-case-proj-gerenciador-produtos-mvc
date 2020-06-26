unit uProdutoModel;

interface

uses System.SysUtils;

type
  TProduto = class
  private
    getDescricao: String;

    FCodigo: Integer;

    FPreco: String;
    FCodigoCategoria: Integer;
    FDataAtualizacao: String;
    FDataCadastro: String;
    FSituacao: String;
    FUltimoPreco: Currency;

    procedure SetDescricao(const Value: String);

  protected
    { protected declarations }
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read getDescricao write SetDescricao;
    property Preco: String read FPreco write FPreco;

    property CodigoCategoria: Integer read FCodigoCategoria
      write FCodigoCategoria;
    property UltimoPreco: Currency read FUltimoPreco write FUltimoPreco;
    property DataCadastro: String read FDataCadastro write FDataCadastro;
    property DataAtualizacao: String read FDataAtualizacao
      write FDataAtualizacao;
    property Situacao: String read FSituacao write FSituacao;

  published
    { published declarations }
  end;

implementation

procedure TProduto.SetDescricao(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('''Descri��o''precisa ser preenchido!');
  getDescricao := Value;
end;

end.
