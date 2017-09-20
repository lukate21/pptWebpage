desc users;

insert into users(no, id, domain, password, name, tel, reg_date) values(users_seq.nextval, 'admin', 'admin.com', 'admin', 'admin', '010-1111-1111', sysdate);

select * from user_sequence;

select * from users

alter table users modify (reg_date default sysdate)