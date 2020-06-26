unit uManutencaoProdutosController;

interface

uses uProdutoModel, System.SysUtils, DM_GERAL_SQLS;

type
  TManutencaoProdutos = class
  private

  public


    function AlteraMargem(sCategoria:String;sMargem : String): Boolean;

  end;

implementation

{ TManutencaoProdutos }



function TManutencaoProdutos.AlteraMargem(sCategoria:String;sMargem : String): Boolean;
var sSQLGeral : String;
  begin
  if sCategoria='0' then
  begin
    sSQLGeral :=
    ' update produto set '+

    ' ULTIMO_PRECO = PRECO, '+
    ' DATA_ATUALIZACAO = CURDATE(), '+
      '  PRECO = ROUND((%s*PRECO),2) ' ;


   Result := DM_GERAL.Executar(Format(sSQLGeral, [sMargem]));
  end
  else
  begin
    sSQLGeral :=
      ' update produto set '+

      ' ULTIMO_PRECO = PRECO, '+
      ' DATA_ATUALIZACAO = CURDATE(), '+
      '  PRECO = ROUND((%s*PRECO),2) ' +
    ' where ' +
    ' (CODIGO_CATEGORIA = %s );';
     Result := DM_GERAL.Executar(Format(sSQLGeral, [sMargem,sCategoria]));
  end;

end;

end.
