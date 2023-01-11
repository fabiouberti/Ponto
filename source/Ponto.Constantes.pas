unit Ponto.Constantes;

interface

const
  SQL_USUARIO_COMBO_EXTRATO = 'select  u.nomecompleto ' +
    'from usuario u ' +
    'where ' +
    '    u.id in (SELECT DISTINCT ID_USUARIO FROM BATIDA) ' +
    'order by u.nomecompleto asc ';

  SQL_BASE_EXTRATO = 'select ' +
    '    b.datahora, ' +
    '    b.id_usuario, u.nomecompleto as usuario, ' +
    '    p.Nome as projeto, ' +
    '    e.NomeCompleto as empresa ' +
    'from ' +
    '    batida b ' +
    '    left join usuario u on u.id = b.id_usuario ' +
    '    left join projeto p on p.id = b.id_projeto ' +
    '    left join empresa e on e.id = b.id_cliente ' +
    'where 1=1 %s ' +
    'order by b.datahora, e.nomecompleto, p.Nome asc ';


implementation

end.
