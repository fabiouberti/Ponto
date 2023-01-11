unit Ponto.Modelo.Batida;

interface

uses
  System.Generics.Collections;

type
  TBatida = class
  private
    FGUID: string;
    FIDUsuario: Integer;
    FIDProjeto: Integer;
    FIDCliente: Integer;
    FDataHora: TDateTime;
    FUsuario: string;
    FProjeto: string;
    FCliente: string;
  public
    property GUID: string read FGUID write FGUID;
    property IDUsuario: Integer read FIDUsuario write FIDUsuario;
    property Usuario: string read FUsuario write FUsuario;
    property IDProjeto: Integer read FIDProjeto write FIDProjeto;
    property Projeto: string read FProjeto write FProjeto;
    property IDCliente: Integer read FIDCliente write FIDCliente;
    property Cliente: string read FCliente write FCliente;
    property DataHora: TDateTime read FDataHora write FDataHora;
  end;

  TJornada = class
  private
    FBatidas: TObjectList<TBatida>;
    FIDUsuario: Integer;
    FData: TDate;
  public
    property IDUsuario: Integer read FIDUsuario write FIDUsuario;
    property Data: TDate read FData write FData;
    property Batidas: TObjectList<TBatida> read FBatidas write FBatidas;
  end;


implementation

end.
