-- CREATE DATABASE testWB;
------------------------------
CREATE TABLE IF NOT EXISTS department (
   id uuid primary key default gen_random_uuid(),
   department_name text not null,
   department_code int not null,
   address text ,
   bik char(9)  not null check (bik ~* '^\d+$'),
   contacts_phone varchar(20),
   date_from date not null default CURRENT_DATE,
   date_to date not null default '2999-12-31',
   created_at timestamp not null,
   updated_at timestamp,
	deleted_at timestamp
);

INSERT INTO department (department_name,department_code,address,bik,contacts_phone, created_at)
    VALUES ('Головной офис 1', 00001,'г.Москва, ул.Чайковского,д.1','123450001','88005553535', now());
INSERT INTO department (department_name,department_code,address,bik,contacts_phone, created_at)
    VALUES ('Головной офис 2', 00002,'г.Москва, ул.Чайковского,д.2','123450002','88005553536', now());
INSERT INTO department (department_name,department_code,address,bik,contacts_phone, created_at)
    VALUES ('Головной офис 3', 00003,'г.Москва, ул.Чайковского,д.3','123450003','88005553537', now());
INSERT INTO department (department_name,department_code,address,bik,contacts_phone, created_at)
    VALUES ('Головной офис 4', 00004,'г.Москва, ул.Чайковского,д.4','123450004','88005553538', now());
INSERT INTO department (department_name,department_code,address,bik,contacts_phone, created_at)
    VALUES ('Головной офис 5', 00005,'г.Москва, ул.Чайковского,д.5','123450005','88005553539', now());
----------------------
CREATE TABLE IF NOT EXISTS client (
   id uuid primary key default gen_random_uuid(),
   department_id uuid not null,
   last_name varchar(20) not null,
   first_name varchar(20) not null,
   surname varchar(20) not null,
   birthday date not null,
   gender char(1) not null,
   customer_type text,
   citizen text not null,
   personal_data_flg bool not null default false,
   inn char(12)  unique not null check (inn ~* '^\d+$'),
   address_document text not null,
   address_fact text,
   date_from date not null default CURRENT_DATE,
   date_to date not null default '2999-12-31',
   created_at timestamp not null,
   updated_at timestamp,
	deleted_at timestamp,
	CONSTRAINT fk_department foreign key (department_id) REFERENCES department(id)

);
select id from department;
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5', 'Иванов','Иван', 'Иванович', '1991-01-01', 'М','vip','РФ','230000001111', 'г.Москва, ул.Чайковского,д.1, кв.1', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5', 'Петров','Петр', 'Петрович', '1992-02-02', 'М','vip','РФ','230000002222', 'г.Москва, ул.Чайковского,д.2, кв.2', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028', 'Дмитриев','Дмитрий', 'Дмитриевич', '1993-03-03', 'М','vip','РФ','230000003333', 'г.Москва, ул.Чайковского,д.3, кв.3', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('833c37d0-a0d5-4f29-a43f-e63828d5a609', 'Костиев','Костя', 'Костевич', '1994-04-04', 'М','vip','РФ','230000004444', 'г.Москва, ул.Чайковского,д.4, кв.4', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028', 'Световна','Света', 'Свтеович', '1995-05-05', 'М','vip','РФ','230000005555', 'г.Москва, ул.Чайковского,д.5, кв.5', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('6b321166-ff71-48fa-9c8a-de377b796867', 'Катевна','Катя', 'Катевич', '1996-06-06', 'М','vip','РФ','230000006666', 'г.Москва, ул.Чайковского,д.6, кв.6', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667', 'Иринова','Ира', 'Ирович', '1997-07-07', 'М','vip','РФ','230000007777', 'г.Москва, ул.Чайковского,д.7, кв.7', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('6b321166-ff71-48fa-9c8a-de377b796867', 'Дианова','Диана', 'Дианович', '1998-08-08', 'М','vip','РФ','230000008888', 'г.Москва, ул.Чайковского,д.8, кв.8', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667', 'Александров','Саша', 'Сашевич', '1999-09-09', 'М','vip','РФ','230000009999', 'г.Москва, ул.Чайковского,д.9, кв.9', now(), true);
INSERT INTO client (department_id, last_name, first_name, surname, birthday, gender, customer_type, citizen, inn, address_document, created_at, personal_data_flg)
    VALUES ('6b321166-ff71-48fa-9c8a-de377b796867', 'Ильин','Илья', 'Иванович', '2000-10-10', 'М','vip','РФ','230000006789', 'г.Москва, ул.Чайковского,д.10, кв.10', now(), true);
---------------------------
CREATE TABLE IF NOT EXISTS account (
   	id uuid primary key default gen_random_uuid(),
   	department_id uuid not null,
   	client_id uuid not null,
   	account_num char(20) unique not null check (account_num ~* '^\d+$'),
   	account_type varchar(20) not null, --тариф
   	currency_iso_code char(3) not null,
   	description text,
   	date_from date not null default CURRENT_DATE,
   	date_to date not null default '2999-12-31',
   	created_at timestamp not null,
   	updated_at timestamp ,
	deleted_at timestamp,
	CONSTRAINT fk_department foreign key (department_id) REFERENCES department(id),
	CONSTRAINT fk_client foreign key (client_id) REFERENCES client(id)
);

select id, department_id from client;
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('9a97986b-586e-474b-a570-dcccc7228619','7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','12000000000000000001','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('260341f2-07fe-453e-9330-bb770794f991','7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','12000000000000000002','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('d0f3aa40-1e1c-4bef-8c5a-0c143fbf38d5','7e9c894c-94de-49b5-bad8-0205ace81028','12000000000000000003','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('a4b79c93-88b7-4928-a9d2-bbf43682878a','833c37d0-a0d5-4f29-a43f-e63828d5a609','12000000000000000004','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('af369ea9-c55c-4f9a-b1e4-24bb46319d5b','7e9c894c-94de-49b5-bad8-0205ace81028','12000000000000000005','VIP с капитализацей','RUB','',now());

INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('6d1b18e5-9e07-49fb-a8ab-d989c96977f5','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000006','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('6d1b18e5-9e07-49fb-a8ab-d989c96977f5','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000007','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','5d88eafc-b21b-4907-878f-f95c0d886667','12000000000000000008','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','5d88eafc-b21b-4907-878f-f95c0d886667','12000000000000000009','VIP с капитализацей','RUB','',now());

INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('f4f4baae-da61-443a-a001-50f388a3f45d','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000010','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('f4f4baae-da61-443a-a001-50f388a3f45d','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000011','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('f4f4baae-da61-443a-a001-50f388a3f45d','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000012','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','5d88eafc-b21b-4907-878f-f95c0d886667','12000000000000000013','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','5d88eafc-b21b-4907-878f-f95c0d886667','12000000000000000014','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','5d88eafc-b21b-4907-878f-f95c0d886667','12000000000000000015','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000016','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000017','VIP с капитализацей','RUB','',now());
INSERT INTO account(client_id, department_id, account_num, account_type, currency_iso_code, description, created_at)
    VALUES ('477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','6b321166-ff71-48fa-9c8a-de377b796867','12000000000000000018','VIP с капитализацей','RUB','',now());
--------------------------------------
CREATE TABLE IF NOT EXISTS card (
   id uuid primary key default gen_random_uuid(),
   department_id uuid  not null,
   client_id uuid  not null,
   account_id uuid  not null,
   card_num char(16) unique not null check (card_num ~* '^\d+$'),
   privilege_type varchar(20) not null default 'simple',
   payment_system_name varchar(30) not null,
   sum_balance numeric(15,2) not null default 0,
   price_service numeric(5,2) not null default 0,
   notification_flg bool default true,
   description text,
   date_from date not null default CURRENT_DATE,
   date_to date not null default '2999-12-31',
   created_at timestamp not null,
   updated_at timestamp,
	deleted_at timestamp,
	CONSTRAINT fk_department foreign key (department_id) REFERENCES department(id),
	CONSTRAINT fk_client foreign key (client_id) REFERENCES client(id),
	CONSTRAINT fk_account foreign key (account_id) REFERENCES account(id)
);

select department_id,  client_id, id from account;
-- INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
--     VALUES ('','','','4028000100010001','VISA', 0,'',now());

INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','9a97986b-586e-474b-a570-dcccc7228619','45b3a62b-c4b0-4158-9773-e6cda882760e','4028000100010001','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','9a97986b-586e-474b-a570-dcccc7228619','45b3a62b-c4b0-4158-9773-e6cda882760e','4028000100010002','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','260341f2-07fe-453e-9330-bb770794f991','0592a4aa-f30d-4731-a043-2bcfa6a9e5c8','4028000100010003','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','260341f2-07fe-453e-9330-bb770794f991','0592a4aa-f30d-4731-a043-2bcfa6a9e5c8','4028000100010004','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','d0f3aa40-1e1c-4bef-8c5a-0c143fbf38d5','59692441-0a01-4353-87e3-25c122e835da','4028000100010005','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','d0f3aa40-1e1c-4bef-8c5a-0c143fbf38d5','59692441-0a01-4353-87e3-25c122e835da','4028000100010006','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('833c37d0-a0d5-4f29-a43f-e63828d5a609','a4b79c93-88b7-4928-a9d2-bbf43682878a','4cd4c277-8970-4e76-931b-0ccc40431fbe','4028000100010007','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('833c37d0-a0d5-4f29-a43f-e63828d5a609','a4b79c93-88b7-4928-a9d2-bbf43682878a','4cd4c277-8970-4e76-931b-0ccc40431fbe','4028000100010008','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','af369ea9-c55c-4f9a-b1e4-24bb46319d5b','6fc0cf11-9ffe-4dcf-acad-7f490906b4f0','4028000100010009','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','af369ea9-c55c-4f9a-b1e4-24bb46319d5b','6fc0cf11-9ffe-4dcf-acad-7f490906b4f0','4028000100010010','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','6d1b18e5-9e07-49fb-a8ab-d989c96977f5','2b810aa5-93ec-4214-99da-778b79a7c01f','4028000100010011','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','6d1b18e5-9e07-49fb-a8ab-d989c96977f5','2b810aa5-93ec-4214-99da-778b79a7c01f','4028000100010012','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','6d1b18e5-9e07-49fb-a8ab-d989c96977f5','0cad7bed-7c47-465b-8107-aaf1f0412538','4028000100010013','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','6d1b18e5-9e07-49fb-a8ab-d989c96977f5','0cad7bed-7c47-465b-8107-aaf1f0412538','4028000100010014','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','c5cb4fd4-8253-4d6e-95c9-45825a561d23','4028000100010015','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','c5cb4fd4-8253-4d6e-95c9-45825a561d23','4028000100010016','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','9cdedc09-e1c3-4a12-a724-006dc0843180','4028000100010017','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','f9ef5077-be84-4fb4-a3d2-1ab3377d2f92','9cdedc09-e1c3-4a12-a724-006dc0843180','4028000100010018','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','da817d42-d244-4340-85b4-aff695f09ee4','4028000100010019','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','da817d42-d244-4340-85b4-aff695f09ee4','4028000100010020','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','ca2037ab-1db2-42b4-a8f4-4ebdcd828c90','4028000100010021','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','ca2037ab-1db2-42b4-a8f4-4ebdcd828c90','4028000100010022','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','932ecda0-9bc0-4d51-9b5c-1c571b736393','4028000100010023','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','f4f4baae-da61-443a-a001-50f388a3f45d','932ecda0-9bc0-4d51-9b5c-1c571b736393','4028000100010024','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','fa761a15-52dd-4ab2-855c-ba09c5d78bd2','4028000100010025','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','fa761a15-52dd-4ab2-855c-ba09c5d78bd2','4028000100010026','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','b89ed33c-8dc5-49c4-bc3d-4eca956f5340','4028000100010027','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','b89ed33c-8dc5-49c4-bc3d-4eca956f5340','4028000100010028','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','b1a50ea2-7326-4e41-a105-ce1e0ddeab26','4028000100010029','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('5d88eafc-b21b-4907-878f-f95c0d886667','3d35fdaa-2ea6-425f-a5dd-bcabf0c7642c','b1a50ea2-7326-4e41-a105-ce1e0ddeab26','4028000100010030','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','38aaab73-2c70-4484-9216-432208fc997e','4028000100010031','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','38aaab73-2c70-4484-9216-432208fc997e','4028000100010032','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','d943c78c-2f6c-4bae-9d3b-1c856be23f66','4028000100010033','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','d943c78c-2f6c-4bae-9d3b-1c856be23f66','4028000100010034','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','9ac3a22f-0f77-47a5-aee2-4b66db94919e','4028000100010035','VISA', 100,'',now());
INSERT INTO card(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_NUM, PAYMENT_SYSTEM_NAME, SUM_BALANCE, DESCRIPTION, CREATED_AT)
	VALUES ('6b321166-ff71-48fa-9c8a-de377b796867','477fa926-68fd-4e8a-b4e7-28fc90f2fdd2','9ac3a22f-0f77-47a5-aee2-4b66db94919e','4028000100010036','VISA', 100,'',now());

----------------------
CREATE TABLE IF NOT EXISTS card_operation (
   id uuid primary key default gen_random_uuid(),
   department_id uuid not null,
   client_id uuid not null,
   account_id uuid not null,
   card_id uuid not null,
   type_operation varchar(30) not null,
   sum_operation numeric(15,2) not null default 0,
   sum_balance_prev numeric(15,2) not null default 0,
   sum_balance numeric(15,2) not null default 0,
   description text,
   date_from date not null default CURRENT_DATE,
   date_to date not null default '2999-12-31',
   created_at timestamp not null,
   updated_at timestamp,
	deleted_at timestamp,
	CONSTRAINT fk_department foreign key (department_id) REFERENCES department(id),
	CONSTRAINT fk_client foreign key (client_id) REFERENCES client(id),
	CONSTRAINT fk_account foreign key (account_id) REFERENCES account(id),
	CONSTRAINT fk_card foreign key (card_id) REFERENCES card(id)

);
-- ДЕБЕТ
--

select department_id, client_id, account_id, id, sum_balance from card;
-- INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
--     VALUES ('','','','','ДЕБЕТ',100000.00,0,100000.00,'Зачисление заработной платы НДС не облагается',now())
----------------------
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','9a97986b-586e-474b-a570-dcccc7228619','45b3a62b-c4b0-4158-9773-e6cda882760e','7bab5551-5381-4a75-b726-1fa1272951e0','ДЕБЕТ',50,100.0,150.0,'Зачисление заработной платы НДС не облагается',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','9a97986b-586e-474b-a570-dcccc7228619','45b3a62b-c4b0-4158-9773-e6cda882760e','63988d18-7ad0-4998-90da-2bca85cbd4c4','КРЕДИТ',50,100.0,50.0,'Покупка товара успешно совершена',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','260341f2-07fe-453e-9330-bb770794f991','0592a4aa-f30d-4731-a043-2bcfa6a9e5c8','3153c336-4e69-411d-80b2-c33f80bc9744','ДЕБЕТ',50,100.0,150.0,'Зачисление заработной платы НДС не облагается',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7c6099c5-4e73-4d08-a6f3-7d9bd6ee14e5','260341f2-07fe-453e-9330-bb770794f991','0592a4aa-f30d-4731-a043-2bcfa6a9e5c8','4bde042c-dedc-4459-a647-cae528968019','КРЕДИТ',50,100.0,50.0,'Покупка товара успешно совершена',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','d0f3aa40-1e1c-4bef-8c5a-0c143fbf38d5','59692441-0a01-4353-87e3-25c122e835da','4ade624a-aaec-4d4f-9fb5-ac39a5c451e9','ДЕБЕТ',50,100.0,150.0,'Зачисление заработной платы НДС не облагается',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','d0f3aa40-1e1c-4bef-8c5a-0c143fbf38d5','59692441-0a01-4353-87e3-25c122e835da','1ca049ed-3ae3-4c25-9718-b1d383b50a8a','КРЕДИТ',50,100.0,50.0,'Покупка товара успешно совершена',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('833c37d0-a0d5-4f29-a43f-e63828d5a609','a4b79c93-88b7-4928-a9d2-bbf43682878a','4cd4c277-8970-4e76-931b-0ccc40431fbe','d03c4f24-dafa-4257-aba3-ab1c1f59b985','ДЕБЕТ',50,100.0,150.0,'Зачисление заработной платы НДС не облагается',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('833c37d0-a0d5-4f29-a43f-e63828d5a609','a4b79c93-88b7-4928-a9d2-bbf43682878a','4cd4c277-8970-4e76-931b-0ccc40431fbe','057e9c2d-b73c-443c-933f-2afca660c443','КРЕДИТ',50,100.0,50.0,'Покупка товара успешно совершена',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','af369ea9-c55c-4f9a-b1e4-24bb46319d5b','6fc0cf11-9ffe-4dcf-acad-7f490906b4f0','4a3ed86c-9ca8-48e5-94f0-4987b50acc7e','ДЕБЕТ',50,100.0,150.0,'Зачисление заработной платы НДС не облагается',now());
INSERT INTO card_operation(DEPARTMENT_ID, CLIENT_ID, ACCOUNT_ID, CARD_ID, TYPE_OPERATION,sum_operation,sum_balance_prev, sum_balance, DESCRIPTION, CREATED_AT)
	VALUES ('7e9c894c-94de-49b5-bad8-0205ace81028','af369ea9-c55c-4f9a-b1e4-24bb46319d5b','6fc0cf11-9ffe-4dcf-acad-7f490906b4f0','95d02ac5-2336-4540-bb46-c4180f1775e0','КРЕДИТ',50,100.0,50.0,'Покупка товара успешно совершена',now());

