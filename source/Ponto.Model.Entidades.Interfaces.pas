unit Ponto.Model.Entidades.Interfaces;

interface

uses
  System.Generics.Collections;

type
  IBatida = interface
    ['{D4441CCE-3FE1-482D-8FE8-7BE85F09A07C}']
    procedure SetDataHora(const Value: TDateTime);
    function GetDataHora: TDateTime;
    procedure SetGUID(const Value: string);
    function GetGUID: string;
    procedure SetUsuario(const Value: string);
    function GetUsuario: string;
    property GUID: string read GetGUID write SetGUID;
    property Usuario: string read GetUsuario write SetUsuario;
    property DataHora: TDateTime read GetDataHora write SetDataHora;
  end;

  TListaBatidas = TList<IBatida>;


implementation

end.
