unit Ponto.View.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Ponto.Model.Dao;

type
  TFViewPadrao = class(TForm)
    pnBotoes: TPanel;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FDAO: TDAO;
    procedure Cancelar;
  strict protected
    procedure Salvar; virtual;
    procedure Validar; virtual; abstract;
    function GetCaption: string; virtual;
  public
    property DAO: TDAO read FDAO write FDAO;
  end;

var
  FViewPadrao: TFViewPadrao;

implementation

{$R *.dfm}

{ TFViewPadrao }

procedure TFViewPadrao.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFViewPadrao.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFViewPadrao.Cancelar;
begin
  Self.Close;
end;

function TFViewPadrao.GetCaption: string;
begin
  Result := 'Meu form!!';
end;

procedure TFViewPadrao.Salvar;
begin
  Validar;
end;

end.
