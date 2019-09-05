select * from users;

insert into users (username,passwords) values ('admin','admin');

drop table users;

create table users(
  username varchar(20),
  passwords varchar(20),
  age int
);