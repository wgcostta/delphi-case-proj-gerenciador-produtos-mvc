program CaseVSMGerenciador;

uses
  Vcl.Forms,
  UN_LOGIN in 'VIEW\UN_LOGIN.pas' {FRM_LOGIN},
  UN_PRINCIPAL in 'VIEW\UN_PRINCIPAL.pas' {FRM_PRINCIPAL},
  UN_PRODUTOS in 'VIEW\UN_PRODUTOS.pas' {FRM_PRODUTOS},
  uProdutoModel in 'MODEL\uProdutoModel.pas',
  uProdutosController in 'CONTROLLER\uProdutosController.pas',
  DM_PRODUTOS in 'DAO\DM_PRODUTOS.pas' {DM_PRODUTO: TDataModule},
  UN_CATEGORIAS in 'VIEW\UN_CATEGORIAS.pas' {FRM_CATEGORIAS},
  Vcl.Themes,
  Vcl.Styles,
  UN_USUARIOS in 'VIEW\UN_USUARIOS.pas' {FRM_USUARIOS},
  UN_MANUTENCAO_PRODUTOS in 'VIEW\UN_MANUTENCAO_PRODUTOS.pas' {FRM_MANUTENCAO_USUARIOS},
  uLoginController in 'CONTROLLER\uLoginController.pas',
  uUsuariosController in 'CONTROLLER\uUsuariosController.pas',
  uManutencaoProdutosController in 'CONTROLLER\uManutencaoProdutosController.pas',
  uCategoriasController in 'CONTROLLER\uCategoriasController.pas',
  DM_CATEGORIAS in 'DAO\DM_CATEGORIAS.pas' {DM_CATEGORIA: TDataModule},
  DM_USUARIOS in 'DAO\DM_USUARIOS.pas' {DM_USUARIO: TDataModule},
  uCategoriaModel in 'MODEL\uCategoriaModel.pas',
  uUsuarioModel in 'MODEL\uUsuarioModel.pas',
  DM_CONEXAO in 'DAO\DM_CONEXAO.pas' {dmConexao: TDataModule},
  UN_REL_PRODUTOS in 'VIEW\UN_REL_PRODUTOS.pas' {FRM_REL_PRODUTOS},
  DM_GERAL_SQLS in 'DAO\DM_GERAL_SQLS.pas' {DM_GERAL: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TFRM_LOGIN, FRM_LOGIN);

  Application.CreateForm(TDM_USUARIO, DM_USUARIO);
  Application.CreateForm(TDM_PRODUTO, DM_PRODUTO);
  Application.CreateForm(TDM_CATEGORIA, DM_CATEGORIA);
  Application.CreateForm(TDM_CATEGORIA, DM_CATEGORIA);
  Application.CreateForm(TDM_GERAL, DM_GERAL);
  Application.Run;

end.
