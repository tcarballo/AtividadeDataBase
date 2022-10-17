DELIMITER $$
CREATE PROCEDURE add_nvl_acesso(in nome_nvl varchar(70))
begin
	if((select count(*) from nivel_de_acesso where nome_nvl_acesso = nome_nvl) = 0) then
		insert into nivel_de_acesso (nome_nvl_acesso) values (nome_nvl);
        select 'Nível de acesso Cadastrado';
	else
		select 'Nível de acesso já existe';
	end if;
end $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_usuario(in nomeUser varchar(70), in docUser varchar(45), in num_cracha int, in nvl_acesso varchar(45) )
begin
	declare user_id int ;
    declare cracha_id int;
    declare nvl_id int;
    
    if((select count(*) from usuarios where documento = docUser) > 0) then
		select 'Usuário já cadastrado';
	else if(docUser <> '') then
        call checkCracha (num_cracha, cracha_id);
		if (cracha_id > 0) then
			call check_nvl(nvl_acesso, nvl_id);
            if(nvl_id > 0) then
           		insert into usuarios (nome,documento) values (nomeUser,docUser);
				select max(id_user) into user_id from usuarios;
				insert into user_cracha_pair (id_cracha,id_user) values (cracha_id, user_id);
                insert into user_nvl_acesso_pair (id_nvl_acesso, id_user) values (nvl_id, user_id);
				select 'usuário cadastrado com sucesso';
			end if;
		end if;
        else 
			select 'Documento não pode ser em braco';
		end if;
	end if;       
	
end $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_porta_nvl(in porta_nome varchar(70), in nome_nvl varchar(70))
begin
	declare porta_id int;
	declare nvl_id int;
    
	if((select count(*) from nivel_de_acesso where nome_nvl_acesso = nome_nvl) = 0
    or (select count(*) from portas where nome_porta = porta_nome) = 0)  then
    
			select 'Porta ou nível de acesso não existem';		
	else

			select id_porta into porta_id from portas where nome_porta = porta_nome;
            select id_nvl_acesso into nvl_id from nivel_de_acesso where nome_nvl_acesso = nome_nvl;
            
            if(select count(*) from nvl_porta_pair where id_porta = porta_id and id_nvl_acesso = nvl_id > 0) then
				select 'Porta já existe no nível de acesso';
			else
				insert into nvl_porta_pair (id_porta,id_nvl_acesso) values (porta_id, nvl_id);            
				select 'Porta adicionada a nível de acesso com sucesso';
			end if;
	end if;
end $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addporta(in nome varchar(70))
begin
	if((select count(*) from portas where nome_porta = nome) = 0) then
		insert into portas (nome_porta) values (nome);
        select 'Porta Cadastrada';
	else
		select 'Porta já existe';
	end if;
end $$
DELIMITER ;

delimiter $$
create procedure check_nvl (in nvl_acesso varchar(50), out nvl_id int)
begin
	if((select count(*) from nivel_de_acesso where nome_nvl_acesso = nvl_acesso) > 0) then
		select id_nvl_acesso into nvl_id from nivel_de_acesso where nome_nvl_acesso = nvl_acesso;
	else
		set nvl_id = 0;
        select 'Nível de acesso não existe';
	end if;
end $$
delimiter ;

delimiter $$
create procedure checkCracha (in nvl_acesso varchar(50), out cracha_id int)
begin
    
	if((select count(*) from cracha where num_cracha = numero_cracha) = 0) then
    
		insert into cracha (numero_cracha) values (num_cracha);
        select id_cracha into cracha_id from cracha where num_cracha = numero_cracha;
        
	else    
        select id_cracha into cracha_id from cracha where num_cracha = numero_cracha;
		if ((select count(*) from user_cracha_pair where id_cracha = cracha_id) > 0 ) then
			select 'Numero de crachá está vinculado a outro usuário';
            set cracha_id = 0;
		end if;
	end if;
end $$
delimiter ;

delimiter $$
create procedure deleteUser(in docUser varchar(50))
begin
	if ((select count(*) from usuarios where documento = docUser) > 0) then
		delete from usuarios where documento = docUser;
	else
		select 'Usuário não existe';
	end if;
end $$
delimiter ;

delimiter $$
create procedure realizarAcesso (in num_cracha int, in porta_nome varchar(50))
begin
	declare cracha_id int;
    declare porta_id int;
    declare msg varchar(150);
    declare user_id int;
    declare nvl_id int;
    
	select id_cracha into cracha_id from cracha where numero_cracha = num_cracha;
    select id_porta into porta_id from portas where nome_porta = porta_nome;
    
    if((select count(*) from user_cracha_pair where id_cracha = cracha_id ) = 0) then		
        set msg = 'Acesso negado, Cartão não vinculado a nenhum cadastro';
		insert into historico_acessos (data_hora_acesso, cracha_id_cracha, usuarios_id_user, portas_id_porta,mensagem)
        values (now(), cracha_id,null,porta_id, msg);
	else
		select id_user into user_id from user_cracha_pair where id_cracha = cracha_id;
        select id_nvl_acesso into nvl_id from user_nvl_acesso_pair where user_id = id_user;
        
        if ((select count(*) from nvl_porta_pair where id_porta = porta_id and id_nvl_acesso = nvl_id )>0) then
			set msg = 'Acesso permitido';
			insert into historico_acessos (data_hora_acesso, cracha_id_cracha, usuarios_id_user, portas_id_porta,mensagem)
			values (now(), cracha_id,user_id, porta_id, msg);
		else
			set msg = 'Acesso negado, cadastro não possui acesso';
			insert into historico_acessos (data_hora_acesso, cracha_id_cracha, usuarios_id_user, portas_id_porta,mensagem)
			values (now(), cracha_id,user_id, porta_id, msg);
		end if;
	end if;
    
end	$$
delimiter ;

delimiter $$
create procedure deletePorta (in porta_nome varchar(50))
begin
	if((select count(*) from portas where nome_porta =  porta_nome)>0) then
		delete from portas where nome_porta =  porta_nome;
        select 'porta excluída';
	else
		select 'Porta Não existe';
	end if;
end$$
 delimiter ;
 
 delimiter $$
create procedure deleteNvl (in nvl_nome varchar(50))
begin
	if((select count(*) from nivel_de_acesso where nome_nvl_acesso = nvl_nome)>0) then
		delete from nivel_de_acesso where nome_nvl_acesso = nvl_nome;
        select 'Nivel de Acesso excluíd';
	else
		select 'Nivel de Acesso não existe';
	end if;
end$$
 delimiter ;

delimiter $$
create procedure alterarPorta (in porta_nome varchar(50), in novo_porta_nome varchar(50)) 
begin
	if((select count(*) from portas where nome_porta =  porta_nome)>0) then
		update portas set nome_porta = novo_porta_nome
        where nome_porta =  porta_nome;
        select 'porta Alterada';
	else
		select 'Porta Não existe';
	end if;
end$$
 delimiter ;
 
  delimiter $$
create procedure alterarNvl (in nvl_nome varchar(50), in novo_nvl_nome varchar(50))
begin
	if((select count(*) from nivel_de_acesso where nome_nvl_acesso = nvl_nome)>0) then
		update nivel_de_acesso set nome_nvl_acesso = novo_nvl_nome
        where nome_nvl_acesso = nvl_nome;
        select 'Nivel de Acesso Alterado';
	else
		select 'Nivel de Acesso não existe';
	end if;
end$$
 delimiter ;
 
 delimiter $$
create procedure alterarCracha (in cracha_num int, in novo_cracha_num int)
begin
	if((select count(*) from cracha where numero_cracha = cracha_num)> 0) then
		update cracha set numero_cracha = novo_cracha_num
        where numero_cracha = cracha_num;
        select 'Numero crachá alterado';
	else
		select 'Nivel de Acesso não existe';
	end if;
end$$
 delimiter ;
 
 





	