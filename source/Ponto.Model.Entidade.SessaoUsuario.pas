unit Ponto.Model.Entidade.SessaoUsuario;

interface

type
  TModeloSessaoUsuario = class
  private
    FIDUsuario: string;
    FNomeUsuario: string;
    FInicioSessao: TDateTime;
  public
    property IDUsuario: string read FIDUsuario write FIDUsuario;
    property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
    property InicioSessao: TDateTime read FInicioSessao write FInicioSessao;
  end;

implementation

end.
