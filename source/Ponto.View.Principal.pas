unit Ponto.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFPrincipal = class(TForm)
    pnBarra: TPanel;
    cbxFuncionario: TComboBox;
    Label1: TLabel;
    mmoExtratoBatidas: TMemo;
    pnMenu: TPanel;
    btnBatatida: TSpeedButton;
    btGerarExtrato: TSpeedButton;
    pnPrincipal: TPanel;
    pcPrincipal: TPageControl;
    tsExtrato: TTabSheet;
    pnlExtratoFiltros: TPanel;
    pnDadosSessao: TPanel;
    lblSessaoUsuario: TLabel;
    procedure btnBatatidaClick(Sender: TObject);
    procedure btGerarExtratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GerarExtratoBatidas;
    procedure AbrirBatida;
  public

  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  System.SysUtils,
  Ponto.Model.Dao,
  Ponto.View.Batida,
  Ponto.View.Login,
  Ponto.Constantes;

{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.btGerarExtratoClick(Sender: TObject);
begin
  GerarExtratoBatidas;
end;

procedure TFPrincipal.btnBatatidaClick(Sender: TObject);
begin
  AbrirBatida;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TFViewLogin, FViewLogin);
  FViewLogin.DAO := DAO;
  FViewLogin.ShowModal;
  if not FViewLogin.Autenticado then
    Application.Terminate;
  FViewLogin.Free;
  lblSessaoUsuario.Caption := DAO.Sessao.IDUsuario + ' - ' + DAO.Sessao.NomeUsuario;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  pnBarra.Caption := Self.Caption;
  mmoExtratoBatidas.Lines.Clear;
  DAO.PreencherLista(cbxFuncionario.Items, SQL_USUARIO_COMBO_EXTRATO);
end;

procedure TFPrincipal.GerarExtratoBatidas;
begin
  var lDados := DAO.GetExtrato(Format(SQL_BASE_EXTRATO, ['']));
  try
    mmoExtratoBatidas.Lines := lDados;
  finally
    lDados.Free;
  end;
end;

procedure TFPrincipal.AbrirBatida;
begin
  Application.CreateForm(TFViewBatida, FViewBatida);
//  FViewBatida.Caption := TSpeedButton(Sender).Caption;
  FViewBatida.DAO := DAO;
  FViewBatida.ShowModal;
  FViewBatida.Free;
end;

end.
