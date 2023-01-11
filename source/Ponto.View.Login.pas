unit Ponto.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Ponto.Model.Dao,
  System.Generics.Collections;

type
  TFViewLogin = class(TForm)
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    pnlBotao: TPanel;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    FAutenticado: Boolean;
    FDAO: TDAO;
    function Validar(const pUsuario: string; const pSenha: string): Boolean;
    procedure Login;
  public
    property Autenticado: Boolean read FAutenticado write FAutenticado;
    property DAO: TDAO read FDAO write FDAO;
  end;

var
  FViewLogin: TFViewLogin;

implementation

{$R *.dfm}

procedure TFViewLogin.btnCancelarClick(Sender: TObject);
begin
  Autenticado := False;
  Close;
end;

procedure TFViewLogin.btnOKClick(Sender: TObject);
begin
  Login;
end;

procedure TFViewLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Login;
end;

function TFViewLogin.Validar(const pUsuario, pSenha: string): Boolean;
var
  lResultado: TDictionary<string, string>;
begin
  if pUsuario.IsEmpty or pSenha.IsEmpty then
    raise Exception.Create('Informe o usuário e senha.');
  lResultado := DAO.GetRegistro('SELECT ID, NOMECOMPLETO FROM USUARIO WHERE USUARIO = ' + QuotedStr(edtUsuario.Text) + ' and SENHA = ' + QuotedStr(edtSenha.Text) + '');
  try
    Result := lResultado.Count > 0;
    if Result then
    begin
      var lID: string;
      var lNome: string;
      lResultado.TryGetValue('ID', lID);
      lResultado.TryGetValue('NOMECOMPLETO', lNome);
      Dao.Sessao.IDUsuario := lID;
      Dao.Sessao.NomeUsuario := lNome;
    end;
  finally
    lResultado.Free;
  end;
end;

procedure TFViewLogin.Login;
begin
  FAutenticado := Validar(edtUsuario.Text, edtSenha.Text);
  if FAutenticado then
  begin
    Close;
  end
  else
  begin
    edtUsuario.SetFocus;
    raise Exception.Create('Não atenticado');
  end;
end;

end.
