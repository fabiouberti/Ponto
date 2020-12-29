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
    procedure btnBatatidaClick(Sender: TObject);
    procedure btGerarExtratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GerarExtratoBatidas;
  public

    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  Ponto.Model.Entidades.Interfaces, Ponto.Model.Dao,
  Ponto.Model.Entidade.Batida, System.SysUtils;

{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.btGerarExtratoClick(Sender: TObject);
begin
  GerarExtratoBatidas;
end;

procedure TFPrincipal.btnBatatidaClick(Sender: TObject);
var
  lBatida: IBatida;
  lMsg: TStringBuilder;
begin
  lBatida := TBatida.New;
  lBatida.Usuario := InputBox('Insira seu nome','Seu Nome:', string.Empty).ToUpper;
  lBatida.DataHora := Now;
  lBatida := DAO.Gravar(lBatida);

  lMsg := TStringBuilder.Create;
  try
    lMsg
      .AppendLine('Ponto registra com sucesso!')
      .AppendLine('ID: ' + lBatida.GUID)
      .AppendLine('Usuário: ' + lBatida.Usuario)
      .AppendLine('Hora Registrada: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',lBatida.DataHora));
    ShowMessage(lMsg.ToString);
    GerarExtratoBatidas;
  finally
    lMsg.Free;
  end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  mmoExtratoBatidas.Lines.Clear;
end;

procedure TFPrincipal.GerarExtratoBatidas;
var
  lLista: TListaBatidas;
  lBatida: IBatida;
begin
  lLista := DAO.SelectAll;
  mmoExtratoBatidas.Lines.Clear;
  for lBatida in lLista do
  begin
    mmoExtratoBatidas.Lines.Add('ID Batida: ' + lBatida.GUID);
    mmoExtratoBatidas.Lines.Add('Usuario: ' + lBatida.Usuario);
    mmoExtratoBatidas.Lines.Add(FormatDateTime('dd/mm/yyy hh:nn:ss', lBatida.DataHora));
    mmoExtratoBatidas.Lines.Add('------------------------------------------');
  end;
end;

end.
