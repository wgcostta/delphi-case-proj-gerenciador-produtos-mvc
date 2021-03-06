unit UN_MANUTENCAO_PRODUTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, DM_CATEGORIAS, DM_PRODUTOS, Data.DB, DM_CONEXAO,
  uManutencaoProdutosController, uProdutoModel;

type
  TFRM_MANUTENCAO_PRODUTOS = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    edtMargem: TEdit;
    btnConfirmar: TButton;
    DS_CATEGORIA: TDataSource;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    cbCategoria: TDBLookupComboBox;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AlteraMargem;
  public
    { Public declarations }
  end;

var
  FRM_MANUTENCAO_PRODUTOS: TFRM_MANUTENCAO_PRODUTOS;

implementation

{$R *.dfm}

procedure TFRM_MANUTENCAO_PRODUTOS.AlteraMargem;
var
  oManutencaoProdutos: TManutencaoProdutos;
  oProduto: TProduto;
  sMargem: String;
  sCategoria: String;
begin
  oManutencaoProdutos := TManutencaoProdutos.Create;
  oProduto := TProduto.Create;
  try
    sMargem := edtMargem.Text;
    {Calculo estava realizando diretamente na SQL, por�m devido a diverg�ncia em produtos
    com valores menores que 10, mudei tudo para validar aqui}
    sCategoria := VarToStr(cbCategoria.KeyValue);
    if sCategoria = '' then
      sCategoria := '0';
    if edtMargem.Text <> '' then
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
        if StrToInt(sMargem) < 10 then
        begin
          sMargem := '1,0' + sMargem;
        end
        else
        begin
           sMargem := '1,' + sMargem;
        end;
        //sMargem := FloatToStr(1 + StrToFloat(sMargem));
        sMargem := StringReplace(sMargem, ',', '.', [rfReplaceAll]);

        if oManutencaoProdutos.AlteraMargem(sCategoria, sMargem) then
        begin
          ShowMessage('Opera��o realizada com sucesso');
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel realizar a opera��o, entre em contato com o suporte');
        end;
        end;
      if RadioGroup1.ItemIndex = 1 then
      begin
        if StrToInt(sMargem) < 10 then
        begin
          sMargem := '0,0' + sMargem;
        end
        else
        begin
           sMargem := '0,' + sMargem;
        end;
        sMargem := FloatToStr(1 - StrToFloat(sMargem));
        sMargem := StringReplace(sMargem, ',', '.', [rfReplaceAll]);

        if oManutencaoProdutos.AlteraMargem(sCategoria, sMargem) then
        begin
          ShowMessage('Opera��o realizada com sucesso');
        end
        else
        begin
          ShowMessage
            ('N�o foi poss�vel realizar a opera��o, entre em contato com o suporte');
        end;
      end;

      edtMargem.Text := '';
    end;
  finally
    FreeAndNil(oManutencaoProdutos);
  end;

end;

procedure TFRM_MANUTENCAO_PRODUTOS.btnConfirmarClick(Sender: TObject);
begin
  if (StrToInt(edtMargem.Text) > 100) OR (StrToInt(edtMargem.Text) < 0) then
  begin
    ShowMessage('Margem deve ser entre 0 e 100');
    edtMargem.SetFocus;
    Abort;
  end;

  if MessageDlg('Deseja realmente realizar a opera��o', mtConfirmation,
    [mbYes, mbNo], 0) = IDYES then

    AlteraMargem;

end;

procedure TFRM_MANUTENCAO_PRODUTOS.FormCreate(Sender: TObject);
begin
  DS_CATEGORIA.DataSet := DM_CATEGORIA.CDS_CATEGORIAS;
end;

procedure TFRM_MANUTENCAO_PRODUTOS.FormShow(Sender: TObject);
begin
  DM_CATEGORIA.CDS_CATEGORIAS.Close;
  DM_CATEGORIA.CDS_CATEGORIAS.Open;

end;

procedure TFRM_MANUTENCAO_PRODUTOS.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text :=
    FormatDateTime('dddd , dd " de " mmmm "de" yyyy', Now);
  StatusBar1.Panels[4].Text := 'Hora: ' + FormatDateTime('hh:mm:ss', Now);
end;

end.
