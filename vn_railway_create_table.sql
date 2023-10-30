create database `viet_nam_railway`;
use `viet_nam_railway`;


-- user
create table `app_role`(
`id` smallint primary key auto_increment,
`name` varchar(50)
);

insert into `app_role`(`name`)
values ('ROLE_ADMIN'),('ROLE_CUSTOMER');

create table `app_user`(
`id` bigint primary key auto_increment,
`user_name` varchar(50) unique,
`password` varchar(255),
`is_deleted` bit(1)
);

insert into `app_user`(`user_name`,`password`,`is_deleted`)
values 	('adm','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0),
		('nhat','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0),
		('huy','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0),
		('hanh','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0),
		('quyen','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0),
		('tin','$2a$10$EJTKLNAT6NLqQae14DbY2.Ubasi9H46gABGALgcOl7HmRCGjfv5kq',0)
;

create table `user_role`(
`id` bigint primary key auto_increment,
`app_user_id` bigint,
`app_role_id` smallint,
foreign key (`app_user_id`) references `app_user`(`id`),
foreign key (`app_role_id`) references `app_role`(`id`)
);

insert into `user_role`(`app_user_id`,`app_role_id`)
values (1,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2);

create table `users`(
`id` bigint primary key auto_increment,
`code` varchar(20) unique,
`name` varchar(255),
`date_of_birth` date,
`id_card` varchar(20),
`mail` varchar(50),
`phone_number` varchar(15),
`deleted` bit(1),
`app_user_id` bigint unique,
foreign key (`app_user_id`) references `app_user`(`id`)
);

insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-001', 'Hoàng Nhật', '2000-06-30', '0727946102', 'hoangnhat3103@gmail.com', false, 1);
insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-002', 'Ngô Hữu Hoàng Nhật', '1996-03-16', '1779455615', 'hoangnhat3103@gmail.com', false, 2);
insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-003', 'Lê Huy', '2000-06-13', '9573562073', 'mrhuyle@gmail.com', false, 3);
insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-004', 'Nguyễn Lưu Minh Hạnh', '1990-12-28', '9745798975', 'minhhanhnguyenluu@gmail.com', false, 4);
insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-005', 'Hoàng Thị Quyên', '1996-02-14', '4458298496', 'quinquinisme@gmail.com', false, 5);
insert into `users` (code, `name`, `date_of_birth`, `id_card`, `mail`, `deleted`, `app_user_id`) values ('CS-006', 'Đàm Thoại Tin', '1991-11-03', '8892979019', 'tin@gmail.com', false, 6);

-- product
create table `type_of_coach`(
`id` bigint primary key auto_increment,
`name` varchar(50),
`deleted` bit(1),
`price` double
);

insert into `type_of_coach`(`name`,`deleted`,`price`)
values ('BED',false,850),('AIR_CHAIR',false,600),('WOODEN_CHAIR',false,400);

create table `train`(
`id` bigint primary key auto_increment,
`code` varchar(20) unique,
`name` varchar(50),
`deleted` bit(1)
);

insert into`train`(`code`,`name`,`deleted`)
values ('SE-001','Thống Nhất 1',0),('SE-002','Thống Nhất 2',0),('SE-003','Thống Nhất 3',0);

create table `coach`(
`id` bigint primary key auto_increment,
`code` varchar(20) unique,
`deleted` bit(1),
`train_id` bigint,
`type_of_coach_id` bigint,
 foreign key (`train_id`) references `train`(`id`),
 foreign key (`type_of_coach_id`) references `type_of_coach`(`id`)
);


insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-004', false, 1, 1);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-005', false, 1, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-006', false, 1, 3);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-007', false, 1, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-009', false, 1, 2);

insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-011', false, 2, 1);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-017', false, 2, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-018', false, 2, 3);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-019', false, 2, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-020', false, 2, 2);

insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-025', false, 3, 3);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-026', false, 3, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-027', false, 3, 2);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-028', false, 3, 1);
insert into `coach` (code, `deleted`, `train_id`, `type_of_coach_id`) values ('CS-029', false, 3, 2);


create table `chair`(
`id` bigint primary key auto_increment,
`code` varchar(20),
`deleted` bit(1),
`coach_id` bigint,
 foreign key (`coach_id`) references `coach`(`id`)
);

insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 1);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 1);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 2);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 2);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 3);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 3);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 4);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 4);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 5);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 5);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 6);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 6);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 7);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 7);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 8);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 8);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 9);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 9);


insert into `chair` (code, `deleted`, `coach_id`) values ('CS-001', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-002', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-003', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-004', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-005', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-006', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-007', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-008', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-009', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-010', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-011', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-012', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-013', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-014', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-015', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-016', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-017', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-018', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-019', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-020', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-021', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-022', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-023', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-024', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-025', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-026', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-027', false, 10);
insert into `chair` (code, `deleted`, `coach_id`) values ('CS-028', false, 10);



create table `distance`(
`id` bigint primary key auto_increment,
`from_station` varchar(100),
`to_station` varchar(100),
`length` float
);

insert into `distance`(`from_station`,`to_station`,`length`)values('Hà Nội', 'Vinh', 319);
insert into `distance`(`from_station`,`to_station`,`length`)values('Vinh', 'Huế',369);
insert into `distance`(`from_station`,`to_station`,`length`)values('Huế', 'Đà Nẵng', 103);
insert into `distance`(`from_station`,`to_station`,`length`)values('Đà Nẵng', 'Nha Trang', 524);
insert into `distance`(`from_station`,`to_station`,`length`)values('Nha Trang', 'TP Hồ Chí Minh', 394);

insert into `distance`(`from_station`,`to_station`,`length`)values('TP Hồ Chí Minh','Nha Trang', 394);
insert into `distance`(`from_station`,`to_station`,`length`)values('Nha Trang','Đà Nẵng', 524);
insert into `distance`(`from_station`,`to_station`,`length`)values('Đà Nẵng','Huế', 103);
insert into `distance`(`from_station`,`to_station`,`length`)values('Huế','Vinh', 369);
insert into `distance`(`from_station`,`to_station`,`length`)values('Vinh','Hà Nội', 319);



create table `trip`(
`id` bigint primary key auto_increment,
`start_date` timestamp,
`end_date` timestamp,
`distance_id` bigint,
`train_id` bigint,
 foreign key (`distance_id`) references `distance`(`id`),
 foreign key (`train_id`) references `train`(`id`)
);

-- SE 1 ĐI
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 06:10:34', '2023-10-27 12:32:05',1,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 12:32:05', '2023-10-27 20:38:30',2,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 20:38:30', '2023-10-27 23:13:30',3,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 23:13:30', '2023-10-28 09:58:30',4,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 09:58:30', '2023-10-28 18:36:03',5,1);
-- SE 1 Về
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-30 06:14:34', '2023-10-30 14:05:30',6,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-30 14:05:30', '2023-10-31 00:41:30',7,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 00:41:30', '2023-10-31 03:26:30',8,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 03:26:30', '2023-10-31 11:48:30',9,1);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 11:48:30', '2023-10-31 19:12:30',10,1);

-- SE 2 ĐI
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 15:30:34', '2023-10-27 21:55:34',1,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-27 21:55:34', '2023-10-28 05:40:40',2,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 05:40:40', '2023-10-28 08:46:40',3,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 08:46:40', '2023-10-28 20:34:40',4,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 20:34:40', '2023-10-29 05:40:19',5,2);
-- SE 2 Về
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-30 15:25:34', '2023-10-30 23:49:34',6,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-30 23:49:34', '2023-10-31 10:20:34',7,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 10:20:34', '2023-10-31 13:35:40',8,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 13:35:40', '2023-10-31 23:19:40',9,2);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 21:19:40', '2023-11-01 04:40:19',10,2);

-- SE 3 Đi
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 06:10:41', '2023-10-28 12:32:04',1,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 12:32:04', '2023-10-28 20:38:04',2,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 20:38:04', '2023-10-28 23:13:04',3,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-28 23:13:04', '2023-10-29 09:58:42',4,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-29 09:58:42', '2023-10-29 14:10:42',5,3);
-- SE 3 Về
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-30 19:00:41', '2023-10-31 02:34:04',6,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 02:34:04', '2023-10-31 12:38:04',7,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 12:38:04', '2023-10-31 15:35:04',8,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 15:35:04', '2023-10-31 23:09:42',9,3);
insert into `trip` (`start_date`, `end_date`,`distance_id`,`train_id`) values ('2023-10-31 23:09:42', '2023-11-01 05:55:42',10,3);

-- booking


create table `ticket`(
`id` bigint primary key auto_increment,
`code`varchar(20),
`current_price` double,
`user_id` bigint,
foreign key (`user_id`) references `users`(`id`)
);

create table `seat`(
`id` bigint primary key auto_increment,
`code` varchar(20),
`available` bit(1),
`coach_id` bigint,
`ticket_id` bigint,
`trip_id` bigint,
`user_id` bigint,
 foreign key (`coach_id`) references `coach`(`id`),
 foreign key (`ticket_id`) references `ticket`(`id`),
 foreign key (`trip_id`) references `trip`(`id`),
 foreign key (`user_id`) references `users`(`id`)
);


-- Dumping table seat
DELIMITER //
CREATE PROCEDURE insert_seat_loop()
BEGIN

  DECLARE coach_id INT DEFAULT 1;
  DECLARE trip_id INT DEFAULT 1;

  WHILE coach_id <= 15 DO
    WHILE trip_id <= 30 DO
      BEGIN
        
        insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-001', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-002', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-003', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-004', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-005', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-006', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-007', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-008', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-009', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-010', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-011', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-012', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-013', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-014', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-015', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-016', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-017', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-018', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-019', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-020', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-021', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-022', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-023', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-024', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-025', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-026', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-027', 0, coach_id, trip_id);
		insert into `seat` (code,`available`, `coach_id`, `trip_id`) values ('C-028', 0, coach_id, trip_id);
      END;
      SET trip_id = trip_id + 1;
    END WHILE;
    SET trip_id = 1;
    SET coach_id = coach_id + 1;
  END WHILE;

END //
DELIMITER ;

CALL insert_seat_loop();

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Stored Procedure for get all train in trip (from Station A to Station B and input date)
DELIMITER //
create procedure get_train_by_date_and_station(	from_station_first varchar(100), 
												to_station_first varchar(100), 
                                                from_station_second varchar(100), 
												to_station_second varchar(100), 
                                                start_date date)
begin
SELECT
		t.`id` AS trainId,
        t.`code` AS trainCode,
        t.`name` AS trainName,
        tr.id AS tripId,
        tr.start_date AS startDate,
        tr.end_date AS endDate,
        d.`length` AS distanceLength,
        d.from_station AS fromStation,
        d.to_station AS toStation
    FROM
        train t
    JOIN
        trip tr ON t.id = tr.train_id
    JOIN
        distance d ON d.id = tr.distance_id
    WHERE
        tr.start_date >= CONCAT(start_date, " 00:00:00")
        AND tr.end_date <= DATE_ADD(tr.start_date, INTERVAL 20 HOUR)
        AND deleted = false
        AND (d.id BETWEEN (
            SELECT MIN(id)
            FROM distance
            WHERE from_station = from_station_first AND to_station = to_station_first
        ) AND (
            SELECT MAX(id)
            FROM distance
            WHERE from_station = from_station_second AND to_station = to_station_second
        ))
        ORDER BY trainId ;
end //	
DELIMITER ;

-- call get_train_by_date_and_station("Hà Nội","Vinh", "Nha Trang", "TP Hồ Chí Minh","2023-10-20")

-- Get all seat of trip and coach
DELIMITER //
create procedure get_seat(coachId bigint, first_trip_id bigint, last_trip_id bigint)
begin
select 	
		seatCode,
        Max(available) as available,
        coachId,
        userName
from(
	select 	
		s.`code` as seatCode,
        s.available as available,
        c.id as coachId,
        max(au.user_name) as userName
	from seat s
	join coach c on c.id = s.coach_id
	join trip tr on tr.id = s.trip_id
    left join users u on u.id = s.user_id
    left join app_user au on au.id = u.app_user_id
	where c.deleted = false
	and c.id = coachId
	and tr.id between first_trip_id and last_trip_id
    group by s.`code`
    ) as subquery
group by seatCode, coachId, userName
;
end //
DELIMITER ;

-- call get_seat(12,21,25);

-- get seat by code, first trip, last trip, coach id

DELIMITER //
create procedure get_seat_by_code(coachId bigint, first_trip_id bigint, last_trip_id bigint, seat_code varchar(20))
begin

select 	
		seatCode,
        Max(available) as available,
        coachId,
        userName
from(
	select 	
		s.`code` as seatCode,
        s.available as available,
        c.id as coachId,
        max(au.user_name) as userName
	from seat s
	join coach c on c.id = s.coach_id
	join trip tr on tr.id = s.trip_id
    left join users u on u.id = s.user_id
    left join app_user au on au.id = u.app_user_id
	where c.deleted = false and  s.`code` = seat_code
	and c.id = coachId
	and tr.id between first_trip_id and last_trip_id
    ) as subquery
group by seatCode, coachId, userName
;
end //
DELIMITER ;
 
 -- call get_seat_by_code(6,12,15, 'C-002');

-- get coach by id
-- select  c.id as coachId, 
--                           c.`code` as coachCode, 
--                          toc.`name` as typeOfCoachName, 
--                           toc.price as typeOfCoachPrice 
-- 			from coach c
-- 			join type_of_coach toc on toc.id = c.type_of_coach_id 
--             where c.deleted = false 
--             and c.train_id = 1;

-- UPDATE seat s
-- SET user_id = 
--     CASE
--         WHEN user_id IS NULL THEN 1
--         WHEN user_id = 1 THEN NULL
--         ELSE user_id
--     END
-- WHERE s.trip_id BETWEEN 1 AND 2
--     AND s.code = 'C-001'
--     AND s.coach_id = 1;

    
    
    
-- get userId by username
-- select u.id
-- from users u 
-- join app_user au on u.app_user_id = au.id
-- where au.user_name = 'adm'


-- select seat temporary by userName
DELIMITER //
create procedure get_all_seat_temporary_by_user_name(user_name varchar(50))
begin
select 	s.`code` as seatCode,
		au.user_name as userName,
		s.coach_id as coachId,
        Max(s.trip_id) as lastTripId,
        Min(s.trip_id) as firstTripId,
        t.train_id as trainId,
        tr.`name` as trainName,
        c.`code` as coachCode,
		tr.`code` as trainCode,
        Min(t.start_date) as startDate,
        Sum(d.length) as totalDistance,
        toc.price as price
from seat s
join users u on s.user_id = u.id
join app_user au on au.id = u.app_user_id
join trip t on t.id = s.trip_id
join coach c on c.id = s.coach_id
join train tr on tr.id = t.train_id
join type_of_coach toc on toc.id = c.type_of_coach_id
join distance d on d.id = t.distance_id
where au.user_name = user_name  
group by seatCode, trainId, coachId;
end //
DELIMITER ;

-- call get_all_seat_temporary_by_user_name('nhat')

DELIMITER //
create procedure insert_ticket(
								user_name varchar(50), 
                                current_price double,
                                train_id bigint,
                                coach_id bigint,
                                seat_code varchar(20),
                                first_trip_id bigint,
                                last_trip_id bigint)
begin
start transaction;

set @user_id = (
	select u.id 
    from users u 
    join app_user au on au.id = u.app_user_id
    where au.user_name = user_name
    );
    
insert into ticket(current_price, user_id)
values (current_price, @user_id);

set @ticket_id = last_insert_id();

update seat s
join coach c on s.coach_id = c.id
join train tr on tr.id = c.train_id
join trip t on t.id = s.trip_id
set s.`available` = true, s.`ticket_id` = @ticket_id, s.`user_id` = null
where `user_id` = @user_id
and (t.id between first_trip_id and last_trip_id)
and c.id = coach_id
and tr.id = train_id
and s.`code` = seat_code
;
commit; 

select 	tr.`code` as trainCode,
		tr.`name` as trainName,
        c.`code` as coachCode,
        toc.`name` as typeOfCoachName,
        s.`code` as seatCode,
		t.start_date as startDate,
		t.end_date as endDate,
		u.`name` as customerName,
		tk.current_price as price,
        d.from_station AS fromStation,
        d.to_station AS toStation,
        u.mail AS mail
from ticket tk
join seat s on tk.id = s.ticket_id
join users u on tk.user_id = u.id
join trip t on t.id = s.trip_id
join coach c on c.id = s.coach_id
join train tr on tr.id = t.train_id
join type_of_coach toc on toc.id = c.type_of_coach_id
join distance d on d.id = t.distance_id
where s.ticket_id = @ticket_id
order by d.id
;
end //
DELIMITER ;
 
-- call insert_ticket('nhat', '1700000.0', 2, 6, 'C-006', 11, 15);
