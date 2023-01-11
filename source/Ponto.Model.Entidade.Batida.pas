unit Ponto.Model.Entidade.Batida;

interface

uses
  Ponto.Model.Entidades.Interfaces;

type
  TBatida = class//(TInterfacedObject, IBatida)
  private
    FDataHora: TDateTime;
    FGUID: string;
    FUsuario: string;
    FProjeto: string;
    FCliente: string;


  public
    constructor Create;
    destructor Destroy;override;
//    class function New: IBatida;
//    property GUID: string read FGUID write SetGUID;
//    property Usuario: string read FUsuario write SetUsuario;
//    property DataHora: TDateTime read FDataHora write SetDataHora;
  end;

implementation

uses
  System.SysUtils;

{ TBatida }

constructor TBatida.Create;
//var
//  lGUID: TGUID;
begin
//  TGUID.Create(lGUID);
//  FGUID :=  GUIDToString(lGuid);
  FGUID := TGUID.NewGuid.ToString;
end;

destructor TBatida.Destroy;
begin

  inherited;
end;

(*
function TBatida.GetCliente: string;
begin
  Result := FCliente;
end;

function TBatida.GetDataHora: TDateTime;
begin
  Result := FDataHora;
end;

function TBatida.GetGUID: string;
begin
  Result := FGUID;
end;

function TBatida.GetProjeto: string;
begin
  Result := FProjeto;
end;

function TBatida.GetUsuario: string;
begin
  Result := FUsuario;
end;

class function TBatida.New: IBatida;
begin
  Result := Self.Create;
end;

procedure TBatida.SetCliente(const pValor: string);
begin
  FCliente := pValor;
end;

procedure TBatida.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TBatida.SetGUID(const Value: string);
begin
  FGUID := Value;
end;

procedure TBatida.SetProjeto(const pValor: string);
begin
  FProjeto := pValor;
end;

procedure TBatida.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;
    *)
end.
