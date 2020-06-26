unit UN_LOGIN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UN_PRINCIPAL,
  uLoginController, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFRM_LOGIN = class(TForm)
    StaticText2: TStaticText;
    edtUsuario: TEdit;
    StaticText1: TStaticText;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnSair: TButton;
    Panel1: TPanel;
    Image3: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    tentativas: Smallint;

  public
    { Public declarations }
    procedure AbrirPrincipal;
  end;

var
  FRM_LOGIN: TFRM_LOGIN;

implementation

{$R *.dfm}

procedure TFRM_LOGIN.AbrirPrincipal;
begin
  FRM_PRINCIPAL := TFRM_PRINCIPAL.Create(Self);
  try
    FRM_PRINCIPAL.ShowModal;
  finally
    FRM_PRINCIPAL.Release;
  end;
end;

procedure TFRM_LOGIN.btnEntrarClick(Sender: TObject);
var
  oLoginController: TLoginController;
  Usuario: String;
  Senha: String;
begin
  oLoginController := TLoginController.Create;

  try

    if (edtUsuario.Text = '') then
    // Verifica se o campo "Usu�rio" foi preenchido
    begin
      Messagedlg('O campo "Usu�rio" deve ser preenchido!', mtInformation,
        [mbOk], 0);

      if edtUsuario.CanFocus then
        edtUsuario.SetFocus;

      Exit;
    end;

    if (edtSenha.Text = EmptyStr) then
    // Verifica se o campo "Senha" foi preenchido
    begin
      Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation,
        [mbOk], 0);

      if edtSenha.CanFocus then
        edtSenha.SetFocus;

      Exit;
    end;

    Usuario := AnsiUpperCase(Trim(edtUsuario.Text));
    Senha := AnsiUpperCase(Trim(edtSenha.Text));
    { Removendo os espa�os e deixando com letra maiuscula. }

    if oLoginController.loginValido(Usuario, Senha) then
    // Verifica se o login � v�lido
    begin
      edtSenha.Clear;
      edtUsuario.Clear;
      AbrirPrincipal;
      if edtUsuario.CanFocus
        then edtUsuario.SetFocus;

    end
    else // Caso o login n�o seja v�lido ent�o
    begin
      inc(tentativas); // Incrementa em 1 o valor da vari�vel tentativas
      if tentativas < 3 then
      begin
        Messagedlg(Format('Tentativa %d de 3', [tentativas]), mtError,
          [mbOk], 0);

        if edtSenha.CanFocus then
          edtSenha.SetFocus;
      end
      else
      begin
        Messagedlg(Format('%d� tentativa de acesso ao sistema.', [tentativas]) +
          #13 + 'A aplica��o ser� fechada!', mtError, [mbOk], 0);
        close;
      end;
    end;
  finally
    FreeAndNil(oLoginController);
  end;
end;

procedure TFRM_LOGIN.btnSairClick(Sender: TObject);
begin
  close;
end;

end.