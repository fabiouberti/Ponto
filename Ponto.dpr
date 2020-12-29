program Ponto;

uses
  Vcl.Forms,
  Ponto.View.Principal in 'source\Ponto.View.Principal.pas' {FPrincipal},
  Ponto.Model.Dao in 'source\Ponto.Model.Dao.pas' {DAO: TDataModule},
  Ponto.Model.Entidades.Interfaces in 'source\Ponto.Model.Entidades.Interfaces.pas',
  Ponto.Model.Entidade.Batida in 'source\Ponto.Model.Entidade.Batida.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDAO, DAO);
  Application.Run;
end.
