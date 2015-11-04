-- user_accounts

create table user_accounts (
 id_user number(5) primary key,
 nume varchar2 (25) default '<User modified row>',
 prenume varchar2 (25) default '<User modified row>',
 modificat_de varchar2(50),
 modificat_la date,
 descriere varchar2 (200) default '<User modified row>',
 foto blob default empty_blob()
 );
commit;
 
create sequence seq_001_user_accounts
minvalue 100
start with 100
increment by 1
cache 20;
commit;

create or replace trigger trg_001_user_accounts
before insert on user_accounts for each row 
begin
select seq_001_user_accounts.nextval
into :new.id_user
from dual;
end;
commit;

create or replace trigger trg_002_user_accounts
before insert or update
on user_accounts
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_002_user_accounts;
commit;

create or replace trigger trg_003_user_accounts
before insert or update
on user_accounts
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_003_user_accounts;
commit;


-- accounts

create table accounts (
 id_account number (5)
    constraint pk_accounts_id_account primary key
    constraint nn_accounts_id_account not null
    constraint ck_accounts_id_account check (id_account >= 100),
 user_id number (5) not null,
 tip varchar2 (30)
    constraint nn_accounts_acc_type not null
    constraint ck_accounts_acc_type check (account_type in
    ('EMAIL','IM','PC_LOGIN','SITE_LOGIN','FTP_LOGIN','APP_LOGIN','DB_LOGIN','REMOTE','PARENTAL','IBAN')),
 public_acc char (1) default 'Y'
    constraint nn_accounts_public not null
    constraint ck_accounts_public check (public_acc in ('Y','N')),
 protected_acc char (1) default 'Y'
    constraint nn_accounts_protected not null
    constraint ck_accounts_protected check (protected_acc in ('Y','N')),
 restricted_acc char (1) default 'Y'
    constraint nn_accounts_restricted not null
    constraint ck_accounts_restricted check (restricted_acc in ('Y','N')),
 disabled_acc char (1) default 'Y'
    constraint nn_accounts_disabled not null
    constraint ck_accounts_disabled check (disabled in ('Y','N')),
 locked_acc char (1) default 'Y'
    constraint nn_accounts_locked not null
    constraint ck_accounts_locked check (locked_acc in ('Y','N')),
 inherited_acc char (1) default 'Y'
    constraint nn_accounts_inherited not null
    constraint ck_accounts_inherited check (inherited in ('Y','N')),
 modificat_de varchar2(50),
 modificat_la date,
 descriere varchar2 (200) default '<User modified row>');
-- commit;
-- drop table accounts cascade constraints ;
 


create table user_passwords (
 id_pass number (5)
    constraint pk_passwords_id_pass primary key
    constraint nn_passwords_id_pass not null
    constraint ck_passwords_id_pass check (id_pass >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 user_name varchar2 (35) default '<User modified row>',
 user_pass varchar2 (25) default '<User modified row>',
 valid_pass char (1) default 'Y'
    constraint nn_passwords_valid not null
    constraint ck_passwords_valid check (valid_pass in ('Y','N')),
 required_pass char (1) default 'Y'
    constraint nn_passwords_required not null
    constraint ck_passwords_required check (required_pass in ('Y','N')),
 change_on_logon char (1) default 'N'
    constraint nn_passwords_change not null
    constraint ck_passwords_change check (change_on_logon in ('Y','N')),
 expires char (1) default 'N'
    constraint nn_passwords_expires not null
    constraint ck_passwords_expires check (expires in ('Y','N')),
 locked_pass char (1) default 'N'
    constraint nn_passwords_locked not null
    constraint ck_passwords_locked check (locked_pass in ('Y','N')),
 case_sensitive char (1) default 'Y'
    constraint nn_passwords_sensitive not null
    constraint ck_passwords_sensitive check (case_sensitive in ('Y','N')),
 visible_pass char (1) default 'N'
    constraint nn_passwords_visible not null
    constraint ck_passwords_visible check (visible_pass in ('Y','N')),
 encripted_name char (1) default 'N'
    constraint nn_passwords_encriptedn not null
    constraint ck_passwords_encriptedn check (encripted_name in ('Y','N')),
 encripted_pass char (1) default 'N'
    constraint nn_passwords_encriptedp not null
    constraint ck_passwords_encriptedp check (encripted_pass in ('Y','N')),
 encript_level number (1) default 0 
    constraint nn_passwords_elevel not null
    constraint ck_passwords_elevel check (encript_level in (0,1,2,3)),
 blank char (1) default 'N'
    constraint nn_passwords_blank not null
    constraint ck_passwords_blank check (blank in ('Y','N')),
 numbers_only char (1) default 'N'
    constraint nn_passwords_numbers not null
    constraint ck_passwords_numbers check (numbers_only in ('Y','N')),
 special_characters char (1) default 'Y'
    constraint nn_passwords_characters not null
    constraint ck_passwords_characters check (special_characters in ('Y','N')),
 credentials char (1) default 'N'
    constraint nn_passwords_credentials not null
    constraint ck_passwords_credentials check (credentials in ('Y','N')),
 min_length number (3) default 0,
 max_length number (3) default 512,
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table user_passwords cascade constraints ;



create table emails (
 id_email number (5)
    constraint pk_emails_id_email primary key
    constraint nn_emails_id_email not null
    constraint ck_emails_id_email check (id_email >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 site_name varchar2 (30) default '<User modified row>',
 site_address varchar2 (70) default '<User modified row>',
 email_address varchar2 (40) default '<User modified row>',
 email_protocol varchar2 (20) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table emails cascade constraints ;



create table ims (
 id_im number (5)
    constraint pk_ims_id_im primary key
    constraint nn_ims_id_im not null
    constraint ck_ims_id_im check (id_im >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 app_name varchar2 (50) default '<User modified row>',
 app_version varchar2 (20) default '<User modified row>',
 im_protocol varchar2 (50) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table ims cascade constraints ;



create table pc_logins (
 id_pcl number (5)
    constraint pk_pcl_id_pcl primary key
    constraint nn_pcl_id_pcl not null
    constraint ck_pcl_id_pcl check (id_pcl >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 host_name varchar2 (50) default '<User modified row>',
 ip_type varchar2 (7) default 'STATIC'
    constraint nn_pcl_ip_type not null
    constraint ck_pcl_ip_type check (ip_type in ('STATIC','DYNAMIC')),
 ip varchar2 (20) default '<User modified row>',
 os varchar2 (70) default '<User modified row>',
 pc_location varchar2 (50) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table workstation_logins cascade constraints ;



create table site_logins (
 id_sitel number (5)
    constraint pk_sitel_id_sitel primary key
    constraint nn_sitel_id_sitel not null
    constraint ck_sitel_id_sitel check (id_sitel >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 site_name varchar2 (50) default '<User modified row>',
 site_address varchar2 (50) default '<User modified row>',
 site_content varchar2 (50) default '<User modified row>',
 parental char (1) default 'N'
    constraint nn_sitel_login_parental not null
    constraint ck_sitel_login_parental check (parental in ('Y','N')),
 restricted_site char (1) default 'N'
    constraint nn_sitel_login_restricted not null
    constraint ck_sitel_login_restricted check (restricted_site in ('Y','N')),
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table site_logins cascade constraints ;



create table ftp_logins (
 id_fl number (5)
    constraint pk_fl_id_fl primary key
    constraint nn_fl_id_fl not null
    constraint ck_fl_id_fl check (id_fl >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 app_name varchar2 (50) default '<User modified row>',
 ftp_host varchar2 (70) default '<User modified row>',
 anonymous char (1) default 'Y'
    constraint nn_fl_anonymous not null
    constraint ck_fl_anonymous check (anonymous in ('Y','N')),
 local_dir varchar2 (70) default '<User modified row>',
 remote_dir varchar2 (70) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table ftp_logins cascade constraints ;



create table app_logins (
 id_al number (5)
    constraint pk_al_id_al primary key
    constraint nn_al_id_al not null
    constraint ck_al_id_al check (id_al >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 app_name varchar2 (50) default '<User modified row>',
 app_type varchar (8) default 'GENERAL'
    constraint nn_al_app_type not null
    constraint ck_al_app_type check (app_type in ('GENERAL','TOOL','SECURITY','SYSTEM')),
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table app_logins cascade constraints ;



create table db_logins (
 id_dbl number (5)
    constraint pk_dbl_id_dbl primary key
    constraint nn_dbl_id_dbl not null
    constraint ck_dbl_id_dbl check (id_dbl >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 db_version varchar2 (50) default '<User modified row>',
 db_name varchar2 (20) default '<User modified row>',
 db_schema varchar2 (20) default '<User modified row>',
 db_tablespace varchar2 (20) default '<User modified row>',
 user_type varchar2 (7) default 'NORMAL'
     constraint nn_dbl_user_type not null
     constraint ck_dbl_user_type check (user_type in ('NORMAL','SYSOPER','SYSDBA')),
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table db_logins cascade constraints ;



create table remotes (
 id_remote number (5)
    constraint pk_remotes_id_remote primary key
    constraint nn_remotes_id_remote not null
    constraint ck_remotes_id_remote check (id_remote >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 remote_type varchar2 (25) default 'FULL_CONTROL'
    constraint nn_remotes_remote_type not null
    constraint ck_remotes_remote_type check (remote_type in       
    ('FULL_CONTROL','VIEW_ONLY','TELNET','FILE_TRANSFER','SHUTDOWNS','CHAT','VOICE_CHAT','SEND_MESSAGE')), 
 remote_app varchar2 (30) default '<User modified row>',
 local_machine varchar2 (30) default '<User modified row>',
 remote_machine varchar2 (30) default '<User modified row>',
 filtered char (1) default 'N'
    constraint nn_remotes_filtered not null
    constraint ck_remotes_filtered check (filtered in ('Y','N')),
 filter_ip varchar2 (25) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table remotes cascade constraints ;



create table parentals (
 id_parental number (5)
    constraint pk_parentals_id_parental primary key
    constraint nn_parentals_id_parental not null
    constraint ck_parentals_id_parental check (id_parental >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 app_name varchar2 (50) default '<User modified row>',
 profiles varchar2 (30) default '<User modified row>',
 credentials char (1) default 'N'
    constraint nn_parentals_cr not null
    constraint ck_parentals_cr check (credentials in ('Y','N')),
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table parentals cascade constraints ;


create table ibans (
 id_iban number (5)
    constraint pk_ibans_id_iban primary key
    constraint nn_ibans_id_iban not null
    constraint ck_ibans_id_iban check (id_iban >= 100),
 id_user number (5) not null,
 id_account number (5) not null,
 id_pass number (5) not null,
 bank varchar2 (50) default '<User modified row>',
 site_name varchar2 (30) default '<User modified row>',
 obs varchar2 (100) default '<User modified row>');
-- commit;
-- drop table ibans cascade constraints ;


alter table accounts add constraint fk_accounts_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;

alter table user_passwords add constraint fk_passwords_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table user_passwords add constraint fk_passwords_id_account foreign key (id_account) references accounts (id_account) on delete cascade;

alter table emails add constraint fk_emails_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table emails add constraint fk_emails_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table emails add constraint fk_emails_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table ims add constraint fk_ims_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table ims add constraint fk_ims_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table ims add constraint fk_ims_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;
 
alter table pc_logins add constraint fk_pcl_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table pc_logins add constraint fk_pcl_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table pc_logins add constraint fk_pcl_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table site_logins add constraint fk_sitel_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table site_logins add constraint fk_sitel_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table site_logins add constraint fk_sitel_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;
 
alter table ftp_logins add constraint fk_fl_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table ftp_logins add constraint fk_fl_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table ftp_logins add constraint fk_fl_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;
 
alter table app_logins add constraint fk_al_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table app_logins add constraint fk_al_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table app_logins add constraint fk_al_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table db_logins add constraint fk_dbl_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table db_logins add constraint fk_dbl_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table db_logins add constraint fk_dbl_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table remotes add constraint fk_remote_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table remotes add constraint fk_remote_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table remotes add constraint fk_remote_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table parentals add constraint fk_parentals_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table parentals add constraint fk_parentals_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table parentals add constraint fk_parentals_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

alter table ibans add constraint fk_ibans_id_user foreign key (id_user) references user_accounts (id_user) on delete cascade;
alter table ibans add constraint fk_ibans_id_account foreign key (id_account) references accounts (id_account) on delete cascade; 
alter table ibans add constraint fk_ibans_id_pass foreign key (id_pass) references user_passwords (id_pass) on delete cascade;

