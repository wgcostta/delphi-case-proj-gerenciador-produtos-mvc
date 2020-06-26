unit DM_GERAL_SQLS;

interface

uses
  System.SysUtils, System.Classes, DM_CONEXAO, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient;

type
  TDM_GERAL = class(TDataModule)
    SQL_GERAL: TSQLDataSet;
    SQL_CONSULTA: TSQLDataSet;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function Executar(sSQLGeral: String): Boolean;
  end;

var
  DM_GERAL: TDM_GERAL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM_GERAL }

function TDM_GERAL.Executar(sSQLGeral: String): Boolean;
begin
  DM_GERAL.SQL_GERAL.CommandText := sSQLGeral;
  try
    DM_GERAL.SQL_GERAL.ExecSQL();
    Result := True;

  except
    on E: Exception do
    begin
        Result := False;
    end;

  end;
end;

end.
