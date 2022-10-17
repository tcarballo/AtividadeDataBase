delimiter $$

create trigger delete_user before delete
on usuarios for each row
begin
	delete from user_cracha_pair where old.id_user = id_user;
	delete from user_nvl_acesso_pair where old.id_user = id_user;
end$$

delimiter ;

delimiter $$
create trigger delete_porta before delete 
on portas for each row
begin
	delete from nvl_porta_pair where id_porta = old.id_porta;
end$$
delimiter ;

delimiter $$
create trigger delete_nvl before delete 
on nivel_de_acesso for each row
begin
	delete from nvl_porta_pair where id_nvl_acesso = old.id_nvl_acesso;
    delete from user_nvl_acesso_pair where id_nvl_acesso = old.id_nvl_acesso;
end$$
delimiter ;

