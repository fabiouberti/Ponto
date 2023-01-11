unit Ponto.View.Batida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Ponto.Model.Dao;

type
  TFViewBatida = class(TForm)
    cboCliente: TComboBox;
    cboProjeto: TComboBox;
    edtUsuario: TLabeledEdit;
    pnlBotoes: TPanel;
    btnRegistrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlDataHora: TPanel;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    pnlMain: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure cboClienteChange(Sender: TObject);
  private
    FDAO: TDAO;
    procedure CarregarProjetosCliente;
    procedure ValidarCampos;
    procedure RegistrarPonto;
  public
    property DAO: TDAO read FDAO write FDAO;
  end;

var
  FViewBatida: TFViewBatida;

implementation

{$R *.dfm}

procedure TFViewBatida.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFViewBatida.btnRegistrarClick(Sender: TObject);
begin
  RegistrarPonto;
end;

procedure TFViewBatida.CarregarProjetosCliente;
begin
  if cboCliente.ItemIndex >= 0 then
  begin
    var lIDCliente := Trim(Copy(cboCliente.Text, 1, Pos('-', cboCliente.Text) -1));
    DAO.PreencherLista(cboProjeto.Items, 'SELECT ID || ''-'' || NOME FROM PROJETO WHERE ID_EMPRESA = ' + lIDCliente + ' ORDER BY NOME ASC');
  end else
  begin
    raise Exception.Create('Cliente não selecionado.');
  end;
end;

procedure TFViewBatida.cboClienteChange(Sender: TObject);
begin
  CarregarProjetosCliente;
end;

procedure TFViewBatida.FormShow(Sender: TObject);
begin
  var lTamanhoBotao := Round(pnlBotoes.Width / 2);
  btnRegistrar.Width := lTamanhoBotao;
  btnCancelar.Width := lTamanhoBotao;
  pnlDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);

  DAO.PreencherLista(cboCliente.Items, 'SELECT ID || ''-'' || NOMECOMPLETO FROM EMPRESA ORDER BY NOMECOMPLETO ASC');
  edtUsuario.Text := DAO.Sessao.IDUsuario + ' - ' + DAO.Sessao.NomeUsuario;
end;

procedure TFViewBatida.RegistrarPonto;
begin
  ValidarCampos;
  var lIDCliente := Trim(Copy(cboCliente.Text, 1, Pos('-', cboCliente.Text)-1));
  var lIDProjeto := Trim(Copy(cboProjeto.Text, 1, Pos('-', cboProjeto.Text)-1));
  var lIDUsuario := Trim(Copy(edtUsuario.Text, 1, Pos('-', edtUsuario.Text)-1));

  var lSQL := 'INSERT INTO BATIDA (GUID, ID_USUARIO, ID_PROJETO, ID_CLIENTE, DATAHORA) VALUES (' + QuotedStr(TGUID.NewGuid.ToString) + ', ' +
    lIDUsuario + ', ' + lIDProjeto + ', ' + lIDCliente + ', ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)) + ')';
  var lMsg := '';
  DAO.ExecutarComandosSQL(lSQL, lMsg);
end;

procedure TFViewBatida.Timer1Timer(Sender: TObject);
begin
  pnlDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

procedure TFViewBatida.ValidarCampos;
begin
  if cboCliente.ItemIndex < 0 then
    raise Exception.Create('Cliente obrigatorio selecionar.');

  if cboProjeto.ItemIndex < 0 then
    raise Exception.Create('Projeto obrigatório selecionar.');

  if edtUsuario.Text = string.Empty then
    raise Exception.Create('Usuário obrigatório informar.');
end;

end.
