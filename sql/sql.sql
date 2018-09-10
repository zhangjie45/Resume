use sx_database;
-- 删除表
drop table student;
-- 创建表
create table student (
NO char(20),
name varchar(20),
sex char(6),
age int(2),
password varchar(20),
birthday varchar(20),
mail varchar(20),
address varchar(100),
site varchar(20),
phoneNum varchar(20),
introduceHead varchar(100),
introduceContent varchar(2000),
primary key(NO)
);
-- 简单搜索
select * from student;
insert into student values
('1','王杰','male',20,'123456',
'2001-01-01',
'1223@qq.com','南信大滨江学院','www.wozuishuai.com','+(86) 110',
'我的介绍开头','自我介绍内容自我介绍内容自我介绍内容自我介绍内容自我介绍内容自我介绍内容');