unit Ponto.View.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ponto.View.Padrao, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFViewEmpresa = class(TFViewPadrao)
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
  strict protected
    function GetCaption: string; override;
    procedure Salvar; override;
    procedure Validar; override;
  public

  end;

var
  FViewEmpresa: TFViewEmpresa;

implementation

{$R *.dfm}

{ TFViewPadrao1 }

function TFViewEmpresa.GetCaption: string;
begin
  Result := 'Empresa';
end;

procedure TFViewEmpresa.Salvar;
begin
  inherited;
  var lMsg := string.Empty;
  var lSQL := 'INSERT INTO EMPRESA (NOME) VALUES (' + QuotedStr(edtNome.Text) + ');';
  DAO.ExecutarComandosSQL(lSQL, lMsg);
  if not lMsg.IsEmpty then
  begin
    ShowMessage(lMsg);
  end;
end;

procedure TFViewEmpresa.Validar;
begin
  inherited;
  if edtNome.Text = string.Empty then
    raise Exception.Create('Campo NOME EMPRESA é obrigatorio.');
end;

end.
