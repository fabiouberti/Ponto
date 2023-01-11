unit Ponto.Model.Dao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.DApt,
  Ponto.Model.Entidades.Interfaces, FireDAC.Phys.SQLiteWrapper.Stat, System.Generics.Collections,
  Ponto.Model.Entidade.SessaoUsuario,
  Ponto.Modelo.Batida;

type
  TDAO = class(TDataModule)
    FConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCaminhoBanco: string;
    FCriouBanco: Boolean;
    FSessao: TModeloSessaoUsuario;
    procedure InicializaDB;
    procedure CriarBD;
    procedure Conectar;
    procedure Desconectar;
    function CriaQuery: TFDQuery;
    function GetSessao: TModeloSessaoUsuario;
  public
    function Gravar(pBatida: IBatida): IBatida;overload;
    function SelectAll: TListaBatidas;
    function SelectByGUID(const pGUID: string): IBatida;
    procedure PreencherLista(pLista: TStrings; const pSQL: string);
    procedure ExecutarComandosSQL(const pSQL: string; out pMsg: string);
    function GetRegistro(const pSQL: string): TDictionary<string, string>;
    //function GetExtrato(const pSQL: string): TObjectList<TJornada>;
    function GetExtrato(const pSQL: string): TStrings;

    property Sessao: TModeloSessaoUsuario read GetSessao write FSessao;
  end;

var
  DAO: TDAO;

const
  DB_NOME = 'ponto.db3';
  DB_TABELA_BATIDA = 'CREATE TABLE IF NOT EXISTS BATIDAS ( ' + 
                     'GUID varchar(100) not null primary key,' +
                     'USUARIO varchar(100) not null, ' +
                     'DATAHORABATIDA TIMESTAMP, ' +
                     'DATAHORAREGISTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP); ';

implementation

uses
  FireDAC.Stan.Param,
  Ponto.Model.Entidade.Batida;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDAO.Conectar;
begin
  FConexao.Connected := False;
  FConexao.Params.Clear;
  FConexao.Params.Database := FCaminhoBanco;
//  FConexao.ConnectionDefName := FCaminhoBanco;
  FConexao.DriverName := 'SQLite';
  FConexao.Connected := True;
end;

function TDAO.CriaQuery: TFDQuery;
begin
  Result := TFDQuery.Create(Self);
  Result.Connection := FConexao;
end;

procedure TDAO.CriarBD;
begin
  FCriouBanco := False;
  if FConexao.Connected then
  begin
    try
      FConexao.ExecSQL(DB_TABELA_BATIDA);                                            
    except
      on E: Exception do 
        raise Exception.Create('Erro ao executar Comando SQL. Erro: ' + E.Message);
    end;
  end;  
end;

procedure TDAO.DataModuleCreate(Sender: TObject);
begin
  FCaminhoBanco := ExtractFilePath(ParamStr(0)) + DB_NOME;
  InicializaDB;
end;

procedure TDAO.DataModuleDestroy(Sender: TObject);
begin
  Desconectar;
end;

procedure TDAO.Desconectar;
begin
  FConexao.Connected := False;
end;

procedure TDAO.ExecutarComandosSQL(const pSQL: string; out pMsg: string);
begin
  var lQuery := CriaQuery;
  try
    lQuery.SQL.Text := pSQL;
    try
      lQuery.ExecSQL;
    except
      on E: Exception do
        pMsg := 'Erro: ' + E.Message + ' SQL : ' + pSQL;
    end;
  finally
    lQuery.Free;
  end;
end;

//function TDAO.GetExtrato(const pSQL: string): TObjectList<TJornada>;
//begin
//  var lQuery := CriaQuery;
//  try
//    lQuery.SQL.Text := pSQL;
//    lQuery.Open;
//    Result := TObjectList<TJornada>.Create;
//    while not lQuery.Eof do
//    begin
//      var lJornada := TJornada.Create;
//      if lJornada.Data <> lQuery.FieldByName('datahora').AsDateTime then
//        lJornada.Data := lQuery.FieldByName('datahora').AsDateTime;
//
//      var lBatida := TBatida.Create;
//      lBatida.
//
//
//      lQuery.Next;
//    end;
//  finally
//    lQuery.Free;
//  end;
//end;

function TDAO.GetExtrato(const pSQL: string): TStrings;
begin
  var lQuery := CriaQuery;
  try
    lQuery.SQL.Text := pSQL;
    lQuery.Open;
    Result := TStringList.Create;
    var lData := string.Empty;
    while not lQuery.Eof do
    begin
//      var Linha
      var lLinha := string.empty;
      lLinha := 'Usuario: ' +  lQuery.FieldByName('id_usuario').AsString + '- ' + lQuery.FieldByName('usuario').AsString;
      Result.Add(lLinha);
      lQuery.Next;
    end;
  finally
    lQuery.Free;
  end;
end;

function TDAO.GetRegistro(const pSQL: string): TDictionary<string, string>;
var
  lQuery: TFDQuery;
begin
  Result := TDictionary<string, string>.Create;
  lQuery := CriaQuery;
  try
    lQuery.Open(pSQL);
    lQuery.First;
    for var lContador := 0 to Pred(lQuery.Fields.Count) do
    begin
      Result.Add(UpperCase(lQuery.Fields[lContador].FieldName), lQuery.Fields[lContador].AsString);
    end;
  finally
    lQuery.Free;
  end;
end;

function TDAO.GetSessao: TModeloSessaoUsuario;
begin
  if not Assigned(FSessao) then
    FSessao := TModeloSessaoUsuario.Create;
  Result := FSessao;
end;

function TDAO.Gravar(pBatida: IBatida): IBatida;
var
  lQuery: TFDQuery;
begin
  lQuery := CriaQuery;
  try
    lQuery.SQL.Text := 'INSERT INTO BATIDAS ( GUID, USUARIO, DATAHORABATIDA) ' + 
      ' VALUES (:GUID, :USUARIO, :DATAHORABATIDA);';

    lQuery.ParamByName('GUID').AsString := pBatida.GUID;
    lQuery.ParamByName('USUARIO').AsString := pBatida.Usuario;
    lQuery.ParamByName('DATAHORABATIDA').AsDateTime := pBatida.DataHora;
  
    lQuery.ExecSQL;

    Result := SelectByGUID(pBatida.GUID);
  except
    on E:Exception do 
      raise Exception.Create('Erro ao gravar IBatida. Erro: ' + E.Message); 
  end;
end;

procedure TDAO.InicializaDB;
begin
  Conectar;
  CriarBD;
end;

procedure TDAO.PreencherLista(pLista: TStrings; const pSQL: string);
begin
  var lQuery := TFDQuery.Create(Self);
  try
    pLista.Clear;
    lQuery.Connection := FConexao;
    lQuery.SQL.Text := pSQL;
    lQuery.Open;
    while not lQuery.Eof do
    begin
      pLista.Add(lQuery.Fields[0].AsString);
      lQuery.Next;
    end;
  finally
    lQuery.Free;
  end;
end;

function TDAO.SelectAll: TListaBatidas;
//var
//  lQuery: TFDQuery;
//  lBatida: IBatida;
begin
//  lQuery := CriaQuery;
//  lQuery.Open('SELECT GUID, USUARIO, DATAHORABATIDA FROM BATIDAS');
//  Result := TList<IBatida>.Create;
//
//  while not lQuery.Eof do
//  begin
//    lBatida := TBatida.New;
//    lBatida.GUID := lQuery.FieldByName('GUID').AsString;
//    lBatida.Usuario := lQuery.FieldByName('USUARIO').AsString;
//    lBatida.DataHora := lQuery.FieldByName('DATAHORABATIDA').AsDateTime;
//    Result.Add(lBatida);
//    lQuery.Next;
//  end;

  Result := nil;
end;

function TDAO.SelectByGUID(const pGUID: string): IBatida;
//var
//  lQuery: TFDQuery;
begin
//  lQuery := CriaQuery;
//  lQuery.SQL.Text := 'SELECT GUID, USUARIO, DATAHORABATIDA FROM BATIDAS WHERE GUID=:GUID';
//  lQuery.ParamByName('GUID').AsString := pGUID;
//  lQuery.Open;
//  Result := TBatida.New;
//  Result.GUID := lQuery.FieldByName('GUID').AsString;
//  Result.Usuario := lQuery.FieldByName('USUARIO').AsString;
//  Result.DataHora := lQuery.FieldByName('DATAHORABATIDA').AsDateTime;
end;

end.
