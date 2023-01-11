program Ponto;

uses
  Vcl.Forms,
  Ponto.View.Principal in 'source\Ponto.View.Principal.pas' {FPrincipal},
  Ponto.Model.Dao in 'source\Ponto.Model.Dao.pas' {DAO: TDataModule},
  Ponto.Model.Entidades.Interfaces in 'source\Ponto.Model.Entidades.Interfaces.pas',
  Ponto.Model.Entidade.Batida in 'source\Ponto.Model.Entidade.Batida.pas',
  Ponto.View.Batida in 'source\Ponto.View.Batida.pas' {FViewBatida},
  Ponto.View.Padrao in 'source\Ponto.View.Padrao.pas' {FViewPadrao},
  Ponto.View.Empresa in 'source\Ponto.View.Empresa.pas' {FViewEmpresa},
  Ponto.View.Projeto in 'source\Ponto.View.Projeto.pas' {FViewProjeto},
  Ponto.View.Login in 'source\Ponto.View.Login.pas' {FViewLogin},
  Ponto.Model.Entidade.SessaoUsuario in 'source\Ponto.Model.Entidade.SessaoUsuario.pas',
  Ponto.Modelo.Batida in 'source\Ponto.Modelo.Batida.pas',
  Ponto.Constantes in 'source\Ponto.Constantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDAO, DAO);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
