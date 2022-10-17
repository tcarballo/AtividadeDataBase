create view user_view as
select 
u.nome, 
u.documento,
c.numero_cracha,
na.nome_nvl_acesso 
from usuarios as u    
inner join user_cracha_pair as uc on u.id_user = uc.id_user
inner join cracha as c on c.id_cracha = uc.id_cracha
inner join user_nvl_acesso_pair as un on un.id_user = u.id_user
inner join nivel_de_acesso as na on na.id_nvl_acesso = un.id_nvl_acesso
order by u.nome;

create view historico_view as 
select
data_hora_acesso,
u.nome,
c.numero_cracha,
p.nome_porta,
ha.mensagem
from historico_acessos as ha
inner join usuarios as u on u.id_user = ha.usuarios_id_user
inner join cracha as c on c.id_cracha = ha.cracha_id_cracha
inner join portas as p on p.id_porta = ha.portas_id_porta
order by ha.data_hora_acesso;

create view nivel_acesso_porta as
select
p.nome_porta,
na.nome_nvl_acesso
from portas as p
inner join nvl_porta_pair as np on np.id_porta = p.id_porta
inner join nivel_de_acesso as na on na.id_nvl_acesso = np.id_nvl_acesso
order by na.nome_nvl_acesso;

create view quantidade_portas_nvl as
select
na.nome_nvl_acesso,
count(p.nome_porta) as Qtde_portas
from portas as p
inner join nvl_porta_pair as np on np.id_porta = p.id_porta
inner join nivel_de_acesso as na on na.id_nvl_acesso = np.id_nvl_acesso
group by na.id_nvl_acesso
order by na.nome_nvl_acesso;

create view quatidade_acesso_permitodos_porta as
select
p.nome_porta,
count(*) as Qtd_acessos
from historico_acessos as ha
inner join portas as p on p.id_porta = ha.portas_id_porta
where ha.mensagem = 'Acesso permitido'
group by ha.portas_id_porta
order by p.nome_porta desc;

create view quatidade_portas_por_usuário
as
select
u.nome,
count(p.nome_porta) as Qtde_portas
from usuarios as u
left join user_nvl_acesso_pair as un on u.id_user=un.id_user
left join nivel_de_acesso as na on na.id_nvl_acesso = un.id_nvl_acesso
left join nvl_porta_pair as np on np.id_nvl_acesso = na.id_nvl_acesso
left join portas as p on p.id_porta = np.id_porta
group by u.nome
order by u.nome





	








