unit Ponto.View.Projeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ponto.View.Padrao, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TFViewProjeto = class(TFViewPadrao)
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    cboEmpresa: TComboBox;
    lblEmoresa: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  strict protected
    function GetCaption: string; override;
    procedure Salvar; override;
    procedure Validar; override;
  public

  end;

var
  FViewProjeto: TFViewProjeto;

implementation

{$R *.dfm}

procedure TFViewProjeto.FormCreate(Sender: TObject);
begin
  inherited;
  var lSQL := 'SELECT ID || '' - '' || NOME as EMPRESA from EMPRESA order by NOME ASC';
  DAO.PreencherLista(cboEmpresa.Items, lSQL);
end;

function TFViewProjeto.GetCaption: string;
begin
  Result := 'Projeto';
end;

procedure TFViewProjeto.Salvar;
begin
  inherited;
  var lMsg := string.Empty;
  var lIDEmpresa := Trim(Copy(cboEmpresa.Text, 1, Pos(' - ', cboEmpresa.Text)));
  var lSQL := 'INSERT INTO PROJETO (NOME, ID_EMPRESA) VALUES (' + QuotedStr(edtNome.Text) + ', ' + lIDEmpresa + ');';
  DAO.ExecutarComandosSQL(lSQL, lMsg);
  if not lMsg.IsEmpty then
  begin
    ShowMessage(lMsg);
  end;
end;

procedure TFViewProjeto.Validar;
begin
  inherited;
  if edtNome.Text = string.Empty then
    raise Exception.Create('Nome do projeto obrigatorio');

  if cboEmpresa.ItemIndex < 0 then
    raise Exception.Create('Empresa obrigatorio.');

end;

end.
