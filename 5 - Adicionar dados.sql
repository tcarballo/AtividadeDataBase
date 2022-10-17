call addporta ('Entrada Principal');
call addporta ('Saída Principal');
call addporta ('Entrada VIP');
call addporta ('Saída VIP');
call addporta ('Entrada Sala Técnica');
call addporta ('Entrada Refeitório');
call addporta ('Saída Refeitório');
call addporta ('Entrada Central Segurança');
call addporta ('Saída Central Segurança');
call addporta ('Entrada Sala Manunteção');
call addporta ('Saída Sala Manutenção');
call addporta ('Entrada Sala Gerentes');
call addporta ('Saida Sala Gerentes');

call add_nvl_acesso ('Acesso Comum');
call add_nvl_acesso ('Acesso VIP');
call add_nvl_acesso ('Areas técnica');
call add_nvl_acesso ('Acesso Total');
call add_nvl_acesso ('Acesso Sala Segurança');
call add_nvl_acesso ('Acesso Refeitório');
call add_nvl_acesso ('Acesso Sala manutenção');
call add_nvl_acesso ('Acesso Gerentes');
call add_nvl_acesso ('Acesso Funcionarios');
call add_nvl_acesso ('Acesso segurança');


call add_porta_nvl ('Entrada Principal','Acesso Comum');
call add_porta_nvl ('Saída Principal','Acesso Comum');
call add_porta_nvl ('Entrada VIP','Acesso VIP');
call add_porta_nvl ('Saída VIP','Acesso VIP');
call add_porta_nvl ('Entrada Sala Técnica','Areas técnica');
call add_porta_nvl ('Entrada Sala Manunteção','Areas técnica');
call add_porta_nvl ('Saída Sala Manutenção','Areas técnica');
call add_porta_nvl ('Entrada Principal','Acesso Total');
call add_porta_nvl ('Saída Principal','Acesso Total');
call add_porta_nvl ('Entrada VIP','Acesso Total');
call add_porta_nvl ('Saída VIP','Acesso Total');
call add_porta_nvl ('Entrada Sala Técnica','Acesso Total');
call add_porta_nvl ('Entrada Refeitório','Acesso Total');
call add_porta_nvl ('Entrada Central Segurança','Acesso Total');
call add_porta_nvl ('Saída Central Segurança','Acesso Total');
call add_porta_nvl ('Entrada Sala Manunteção','Acesso Total');
call add_porta_nvl ('Saída Sala Manutenção','Acesso Total');
call add_porta_nvl ('Entrada Central Segurança','Acesso Sala Segurança');
call add_porta_nvl ('Saída Central Segurança','Acesso Sala Segurança');
call add_porta_nvl ('Entrada Refeitório','Acesso Refeitório');
call add_porta_nvl ('Saída Refeitório','Acesso Refeitório');
call add_porta_nvl ('Entrada Sala Manunteção','Acesso Sala manutenção');
call add_porta_nvl ('Saída Sala Manutenção','Acesso Sala manutenção');
call add_porta_nvl ('Entrada Sala Gerentes','Acesso Gerentes');
call add_porta_nvl ('Saída Sala Gerentes','Acesso Gerentes');
call add_porta_nvl ('Entrada Principal','Acesso Funcionarios');
call add_porta_nvl ('Entrada Sala Técnica','Acesso Funcionarios');
call add_porta_nvl ('Saída Principal','Acesso Funcionarios');
call add_porta_nvl ('Entrada Refeitório','Acesso Funcionarios');
call add_porta_nvl ('Saída Refeitório','Acesso Funcionarios');
call add_porta_nvl ('Saída Refeitório','Acesso segurança');
call add_porta_nvl ('Entrada Refeitório','Acesso segurança');
call add_porta_nvl ('Entrada Principal','Acesso segurança');
call add_porta_nvl ('Saída Principal','Acesso segurança');



call add_usuario('joão', '00000', 78961, 'Acesso Comum');
call add_usuario('Maria','11111', 25013, 'Acesso Total');
call add_usuario('Ana','77777', 23485, 'Acesso Sala manutenção');
call add_usuario('Marcos','88888', 47320, 'Acesso Sala Segurança');
call add_usuario('marcio','30351', 77777, 'Acesso Refeitório');
call add_usuario('Jonas','104202', 78920, 'Acesso VIP');
call add_usuario('Adalberto','78910', 41450, 'Areas técnica');
call add_usuario('thomas','20377892', 03257, 'Areas técnica');
call add_usuario('luiz','7896203', 96320, 'Acesso Comum');
call add_usuario('Manoel','7896203', 96320, 'Acesso Total');
call add_usuario('josé','555555', 2222, 'Acesso Gerentes');
call add_usuario('sofia','8952000', 11112, 'Acesso Funcionarios');
call add_usuario('jhon','7855555', 44441, 'Acesso Funcionarios');
call add_usuario('sofia','4531222', 44442, 'Acesso segurança');
call add_usuario('sofia','123001', 333332, 'Acesso segurança');


call realizarAcesso(25013,'Entrada Refeitório' );
call realizarAcesso(12356,'Entrada Refeitório' );
call realizarAcesso(23485,'Entrada VIP' );
call realizarAcesso(78920,'Entrada VIP' );
call realizarAcesso(78920,'Saída VIP' );
call realizarAcesso(47320, 'Entrada Central Segurança');
call realizarAcesso(3258954, 'Entrada Central Segurança');
call realizarAcesso(33333, 'Entrada Sala Manunteção');
call realizarAcesso(41450, 'Entrada Sala Técnica');
call realizarAcesso(23485, 'Entrada Sala Técnica');
call realizarAcesso(23485, 'Saída Sala Manutenção');
call realizarAcesso(333332, 'Entrada Central Segurança');
call realizarAcesso(44442, 'Entrada VIP' );
call realizarAcesso(44441, 'Saída Refeitório');
call realizarAcesso(11112, 'Entrada Principal');
call realizarAcesso(2222, 'Entrada Sala Gerentes');
call realizarAcesso(47320, 'Entrada Central Segurança');
call realizarAcesso(3258954, 'Entrada Central Segurança');
call realizarAcesso(33333, 'Entrada Sala Manunteção');
call realizarAcesso(41450, 'Entrada Sala Técnica');
call realizarAcesso(23485, 'Entrada Sala Técnica');
call realizarAcesso(23485, 'Saída Sala Manutenção');
call realizarAcesso(78920,'Entrada VIP' );
call realizarAcesso(78920,'Saída VIP' );
call realizarAcesso(47320, 'Entrada Central Segurança');











