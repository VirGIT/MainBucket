create table vp_game (
 id_game varchar2 (20)
   constraint pk_vpg_id_game primary key,
 game_type varchar2 (20),
 game_name varchar2 (40));

commit;

insert into vp_game values ('GAMEPOOL01','BILLIARDS','Straight Pool');
insert into vp_game values ('GAMEPOOL02','BILLIARDS','9-Ball');
insert into vp_game values ('GAMEPOOL03','BILLIARDS','Rotation');
insert into vp_game values ('GAMEPOOL04','BILLIARDS','10-Ball');
insert into vp_game values ('GAMEPOOL05','BILLIARDS','6-Ball');
insert into vp_game values ('GAMEPOOL06','BILLIARDS','3-Ball');
insert into vp_game values ('GAMEPOOL07','BILLIARDS','One Pocket');
insert into vp_game values ('GAMEPOOL08','BILLIARDS','Bank Pool');
insert into vp_game values ('GAMEPOOL09','BILLIARDS','Fifteen Ball');
insert into vp_game values ('GAMEPOOL10','BILLIARDS','Basic Pocket Billiards');
insert into vp_game values ('GAMEPOOL11','BILLIARDS','Cowboy');
insert into vp_game values ('GAMEPOOL12','BILLIARDS','Honolulu');
insert into vp_game values ('GAMEPOOL13','BILLIARDS','Bowlliards');
insert into vp_game values ('GAMEPOOL14','BILLIARDS','Cribbage');
insert into vp_game values ('GAMEPOOL15','BILLIARDS','Snooker');
insert into vp_game values ('GAMEPOOL16','BILLIARDS','3 Cushion Billiards');
insert into vp_game values ('GAMEPOOL17','BILLIARDS','1 Cushion Billiards');
insert into vp_game values ('GAMEPOOL18','BILLIARDS','Eight Ball - Midwest');
insert into vp_game values ('GAMEPOOL19','BILLIARDS','Eight Ball - Bar');
insert into vp_game values ('GAMEPOOL20','BILLIARDS','Eight Ball - Pub');
insert into vp_game values ('GAMEPOOL21','BILLIARDS','Eight Ball - APA');
insert into vp_game values ('INVALID','INVALID','INVALID');
commit;



create table vp_bet (
 id_bet varchar2 (30)
   constraint pk_vpb_id_bet primary key,
 ent_name varchar2 (50),
 ent_location varchar2 (30),
 total_budget number (20),
 ore_bet number (20),
 orew number (10));
 
commit;
alter table vp_bet add constraint ck_vpb_bets check (ore_bet <= total_budget);
commit;

insert into vp_bet values ('BET01','Cpt.Jack Lighthouse','Pirate Camp',900000000,0,0);
insert into vp_bet values ('BET02','Raven Central Trust','Bandit Camp',880000000,0,0);
insert into vp_bet values ('BET03','Lord Hagen Inc.','Khorinis City',600000000,0,0);
insert into vp_bet values ('BET04','Lobart And Sekob','Pesants',350000000,0,0);
insert into vp_bet values ('BET05','Pyrokar Trust','Monastery',900000000,0,0);
insert into vp_bet values ('BET06','Orlan And Sons','Dead Harpy',355000000,0,0);
insert into vp_bet values ('BET07','Lee Central','Mercenaries',700000000,0,0);
insert into vp_bet values ('BET08','King Rhobar Central Bank','Castle',1000000000,0,0);
insert into vp_bet values ('BET09','Vpool Bank','Interplay CO',2000000000,0,0);
insert into vp_bet values ('INVALID','INVALID','INVALID',0,0,0);
commit;



create table vp_competition (
 id_competition varchar2 (30)
   constraint pk_vpc_id_competition primary key,
 competition_name varchar2 (30));

commit;

insert into vp_competition values ('COMPETITION01','Championship');
insert into vp_competition values ('COMPETITION02','Tournament');
insert into vp_competition values ('COMPETITION03','Free Game');
insert into vp_competition values ('INVALID','INVALID');
commit;



create table vp_stat (
 id_stat varchar2 (30)
   constraint pk_vps_id_stat primary key,
 player_rating number (10,3),
 games_won number (10),
 games_played number (10),
 ball_ma number (10,3),
 balls_mpt number (10,1),
 average_run number (10,1),
 money_ball_ma number (10,1),
 points_scored number (10),
 longest_run number (10),
 ap_on_sb number (10,1),
 cls number (2));


commit;

insert into vp_stat values ('STAT01',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT02',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT03',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT04',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT05',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT06',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT07',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT08',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT09',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT10',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT11',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT12',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT13',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT14',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT15',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('STAT16',0,0,0,0,0,0,0,0,0,0,0);
insert into vp_stat values ('INVALID',null,null,null,null,null,null,null,null,null,null,null);

commit;



create table vp_stat_history (
 id_stath varchar2 (30)
   constraint pk_vpsh_id_stath primary key,
 player_rating number (10),
 games_won number (10),
 games_played number (10),
 ball_ma number (10,3),
 balls_mpt number (10,1),
 average_run number (10,1),
 money_ball_ma number (10,1),
 points_scored number (10),
 longest_run number (10),
 ap_on_sb number (10,1));

commit;

insert into vp_stat_history values ('STATH01',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH02',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH03',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH04',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH05',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH06',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH07',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH08',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH09',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH10',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH11',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH12',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH13',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH14',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH15',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('STATH16',0,0,0,0,0,0,0,0,0,0);
insert into vp_stat_history values ('INVALID',null,null,null,null,null,null,null,null,null,null);

commit;



create table vp_player (
 id_player varchar2 (30)
   constraint pk_vpp_id_player primary key,
 id_bet varchar2 (30),
 id_stat varchar2 (30),
 id_stath varchar2 (30),
 player_name varchar2 (30));

commit;

alter table vp_player add constraint fk_vpp_id_bet foreign key (id_bet) references vp_bet (id_bet) on delete cascade;
alter table vp_player add constraint fk_vpp_id_stat foreign key (id_stat) references vp_stat (id_stat) on delete cascade;
alter table vp_player add constraint fk_vpp_id_stath foreign key (id_stath) references vp_stat_history (id_stath) on delete cascade;

commit;

insert into vp_player values ('PLAYER01','BET01','STAT01','STATH01','Aligator Jack');
insert into vp_player values ('PLAYER02','BET02','STAT02','STATH02','Fisk');
insert into vp_player values ('PLAYER03','BET03','STAT03','STATH03','Hagen');
insert into vp_player values ('PLAYER04','BET04','STAT04','STATH04','Hilda');
insert into vp_player values ('PLAYER05','BET05','STAT05','STATH05','Hyglas');
insert into vp_player values ('PLAYER06','BET06','STAT06','STATH06','Orlan');
insert into vp_player values ('PLAYER07','BET07','STAT07','STATH07','Sentenza');
insert into vp_player values ('PLAYER08','BET08','STAT08','STATH08','Keroloth');
insert into vp_player values ('PLAYER09','BET01','STAT09','STATH09','Henry');
insert into vp_player values ('PLAYER10','BET02','STAT10','STATH10','Bloodwin');
insert into vp_player values ('PLAYER11','BET03','STAT11','STATH11','Gritta');
insert into vp_player values ('PLAYER12','BET04','STAT12','STATH12','Rosi');
insert into vp_player values ('PLAYER13','BET05','STAT13','STATH13','Isgaroth');
insert into vp_player values ('PLAYER14','BET06','STAT14','STATH14','Dragomir');
insert into vp_player values ('PLAYER15','BET07','STAT15','STATH15','Lee');
insert into vp_player values ('PLAYER16','BET08','STAT16','STATH16','Sengrath');
insert into vp_player values ('INVALID','INVALID','INVALID','INVALID','INVALID');
commit;



create table vp_stf (
 id_stf number (3)
     constraint pk_vpst_id_stf primary key,
 id_stat varchar2 (30),
 id_bet varchar2 (30),
 ch_cls number (3),
 to_cls number (3),
 fr_cls number (3));

commit;
alter table vp_stf add constraint fk_vpst_id_stat foreign key (id_stat) references vp_stat (id_stat) on delete cascade;
alter table vp_stf add constraint fk_vpst_id_bet foreign key (id_bet) references vp_bet (id_bet) on delete cascade;
commit;

insert into vp_stf values (1,'STAT01','BET01',0,0,0);
insert into vp_stf values (2,'STAT02','BET02',0,0,0);
insert into vp_stf values (3,'STAT03','BET03',0,0,0);
insert into vp_stf values (4,'STAT04','BET04',0,0,0);
insert into vp_stf values (5,'STAT05','BET05',0,0,0);
insert into vp_stf values (6,'STAT06','BET06',0,0,0);
insert into vp_stf values (7,'STAT07','BET07',0,0,0);
insert into vp_stf values (8,'STAT08','BET08',0,0,0);
insert into vp_stf values (9,'STAT09','BET01',0,0,0);
insert into vp_stf values (10,'STAT10','BET02',0,0,0);
insert into vp_stf values (11,'STAT11','BET03',0,0,0);
insert into vp_stf values (12,'STAT12','BET04',0,0,0);
insert into vp_stf values (13,'STAT13','BET05',0,0,0);
insert into vp_stf values (14,'STAT14','BET06',0,0,0);
insert into vp_stf values (15,'STAT15','BET07',0,0,0);
insert into vp_stf values (16,'STAT16','BET08',0,0,0);
insert into vp_stf values (17,'INVALID','INVALID',0,0,0);
commit;



create table vp_g (
 game_no number (20)
    constraint pk_vpg_game_no primary key,
 id_competition varchar2 (30),
 id_game varchar2 (30),
 game_obj varchar2 (20)
    constraint ck_vpg_go check (game_obj in ('Single','First at 2','First at 3','First at 5','First at 7','First at 9',
    'First at 11','First at 17','Frist at 19')),
 break_order varchar2 (10)
    constraint ck_vpg_bo check (break_order in ('ROUND','RETURN','EXPECTED','REMATCH','MATCH')),
 pl1 varchar2 (30),
 pl2 varchar2 (30),
 pl3 varchar2 (30),
 pl4 varchar2 (30),
 pl1_score number (5) default 0,
 pl2_score number (5) default 0,
 pl3_score number (5) default 0,
 pl4_score number (5) default 0,
 g_played varchar2 (3) default 'No'
    constraint ck_vpg_gp check (g_played in ('Yes','No')));

commit;

alter table vp_g add constraint fk_vpg_id_competition foreign key (id_competition) references vp_competition (id_competition) on delete cascade;
alter table vp_g add constraint fk_vpg_id_game foreign key (id_game) references vp_game (id_game) on delete cascade;
alter table vp_g add constraint fk_vpg_pl1 foreign key (pl1) references vp_player (id_player) on delete cascade;
alter table vp_g add constraint fk_vpg_pl2 foreign key (pl2) references vp_player (id_player) on delete cascade;
alter table vp_g add constraint fk_vpg_pl3 foreign key (pl3) references vp_player (id_player) on delete cascade;
alter table vp_g add constraint fk_vpg_pl4 foreign key (pl4) references vp_player (id_player) on delete cascade;

commit;

insert into vp_g values (1,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (2,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER03','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (3,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER05','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (4,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER07','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (5,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (6,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (7,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER05','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (8,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER06','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (9,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (10,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (11,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER05','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (12,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER06','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (13,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (14,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (15,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER03','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (16,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER04','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (17,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (18,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (19,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER03','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (20,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER04','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (21,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (22,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (23,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER03','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (24,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER04','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (25,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER01','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (26,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER02','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (27,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER03','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (28,'COMPETITION01','GAMEPOOL02','First at 2','ROUND','PLAYER04','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (29,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER02','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (30,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER04','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (31,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER06','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (32,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (33,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER03','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (34,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER04','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (35,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (36,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (37,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER04','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (38,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER03','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (39,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (40,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (41,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER05','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (42,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER06','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (43,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (44,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (45,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER06','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (46,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER05','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (47,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (48,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (49,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (50,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (51,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER05','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (52,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER06','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (53,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER08','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (54,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER07','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (55,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER06','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (56,'COMPETITION01','GAMEPOOL02','First at 2','RETURN','PLAYER05','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (57,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (58,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER11','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (59,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER13','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (60,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER15','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (61,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (62,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (63,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER13','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (64,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER14','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (65,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (66,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (67,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER13','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (68,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER14','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (69,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (70,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (71,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER11','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (72,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER12','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (73,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (74,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (75,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER11','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (76,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER12','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (77,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (78,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (79,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER11','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (80,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER12','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (81,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER09','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (82,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER10','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (83,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER11','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (84,'COMPETITION01','GAMEPOOL09','First at 2','ROUND','PLAYER12','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (85,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER10','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (86,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER12','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (87,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER14','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (88,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (89,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER11','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (90,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER12','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (91,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (92,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (93,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER12','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (94,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER11','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (95,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (96,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (97,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER13','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (98,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER14','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (99,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (100,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (101,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER14','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (102,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER13','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (103,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (104,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (105,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (106,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (107,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER13','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (108,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER14','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (109,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER16','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (110,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER15','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (111,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER14','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (112,'COMPETITION01','GAMEPOOL09','First at 2','RETURN','PLAYER13','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (113,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (114,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER11','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (115,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER13','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (116,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER15','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (117,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (118,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (119,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER13','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (120,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER14','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (121,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (122,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (123,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER13','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (124,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER14','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (125,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (126,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (127,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER11','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (128,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER12','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (129,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (130,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (131,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER11','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (132,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER12','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (133,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (134,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (135,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER11','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (136,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER12','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (137,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER09','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (138,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER10','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (139,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER11','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (140,'COMPETITION01','GAMEPOOL15','Single','ROUND','PLAYER12','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (141,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER10','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (142,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER12','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (143,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER14','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (144,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (145,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER11','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (146,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER12','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (147,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (148,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (149,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER12','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (150,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER11','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (151,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (152,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (153,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER13','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (154,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER14','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (155,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (156,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (157,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER14','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (158,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER13','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (159,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (160,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (161,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (162,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (163,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER13','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (164,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER14','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (165,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER16','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (166,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER15','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (167,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER14','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (168,'COMPETITION01','GAMEPOOL15','Single','RETURN','PLAYER13','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (169,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (170,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER03','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (171,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER05','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (172,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER07','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (173,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (174,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (175,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER05','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (176,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER06','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (177,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (178,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (179,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER05','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (180,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER06','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (181,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (182,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (183,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER03','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (184,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER04','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (185,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (186,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (187,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER03','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (188,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER04','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (189,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (190,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (191,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER03','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (192,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER04','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (193,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER01','PLAYER08','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (194,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER02','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (195,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER03','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (196,'COMPETITION01','GAMEPOOL18','Single','ROUND','PLAYER04','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (197,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER02','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (198,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER04','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (199,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER06','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (200,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER07','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (201,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER03','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (202,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER04','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (203,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (204,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (205,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER04','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (206,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER03','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (207,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER05','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (208,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER06','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (209,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER05','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (210,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER06','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (211,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (212,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (213,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER06','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (214,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER05','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (215,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (216,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (217,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (218,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (219,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER05','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (220,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER06','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (221,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER08','PLAYER01','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (222,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER07','PLAYER02','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (223,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER06','PLAYER03','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (224,'COMPETITION01','GAMEPOOL18','Single','RETURN','PLAYER05','PLAYER04','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (225,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER01','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (226,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER02','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (227,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER03','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (228,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER04','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (229,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER05','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (230,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER06','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (231,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER07','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (232,'COMPETITION02','GAMEPOOL02','First at 3','MATCH','PLAYER08','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (233,'COMPETITION02','GAMEPOOL02','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (234,'COMPETITION02','GAMEPOOL02','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (235,'COMPETITION02','GAMEPOOL02','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (236,'COMPETITION02','GAMEPOOL02','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (237,'COMPETITION02','GAMEPOOL02','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (238,'COMPETITION02','GAMEPOOL02','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (239,'COMPETITION02','GAMEPOOL02','First at 9','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (240,'COMPETITION02','GAMEPOOL02','First at 9','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (241,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER01','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (242,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER02','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (243,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER03','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (244,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER04','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (245,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER05','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (246,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER06','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (247,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER07','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (248,'COMPETITION02','GAMEPOOL09','First at 3','MATCH','PLAYER08','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (249,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (250,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (251,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (252,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (253,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (254,'COMPETITION02','GAMEPOOL09','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (255,'COMPETITION02','GAMEPOOL09','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (256,'COMPETITION02','GAMEPOOL09','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (257,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER01','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (258,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER02','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (259,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER03','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (260,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER04','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (261,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER05','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (262,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER06','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (263,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER07','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (264,'COMPETITION02','GAMEPOOL15','First at 3','MATCH','PLAYER08','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (265,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (266,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (267,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (268,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (269,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (270,'COMPETITION02','GAMEPOOL15','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (271,'COMPETITION02','GAMEPOOL15','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (272,'COMPETITION02','GAMEPOOL15','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (273,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER01','PLAYER09','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (274,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER02','PLAYER10','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (275,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER03','PLAYER11','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (276,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER04','PLAYER12','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (277,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER05','PLAYER13','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (278,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER06','PLAYER14','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (279,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER07','PLAYER15','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (280,'COMPETITION02','GAMEPOOL18','First at 3','MATCH','PLAYER08','PLAYER16','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (281,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (282,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (283,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (284,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (285,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (286,'COMPETITION02','GAMEPOOL18','First at 5','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (287,'COMPETITION02','GAMEPOOL18','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
insert into vp_g values (288,'COMPETITION02','GAMEPOOL18','First at 7','MATCH','INVALID','INVALID','INVALID','INVALID',0,0,0,0,'No');
commit;



create table vp_history (
 game_no number (20)
    constraint pk_vph_game_no primary key,
 id_competition varchar2 (30),
 id_game varchar2 (30),
 game_obj varchar2 (20),
 break_order varchar2 (10),
 pl1 varchar2 (30),
 pl2 varchar2 (30),
 pl3 varchar2 (30),
 pl4 varchar2 (30),
 pl1_score number (5),
 pl2_score number (5),
 pl3_score number (5),
 pl4_score number (5),
 g_played varchar2 (3),
 g_date date default sysdate);

commit;

insert into vp_history (game_no) values (1);
insert into vp_history (game_no) values (2);
insert into vp_history (game_no) values (3);
insert into vp_history (game_no) values (4);
insert into vp_history (game_no) values (5);
insert into vp_history (game_no) values (6);
insert into vp_history (game_no) values (7);
insert into vp_history (game_no) values (8);
insert into vp_history (game_no) values (9);
insert into vp_history (game_no) values (10);
insert into vp_history (game_no) values (11);
insert into vp_history (game_no) values (12);
insert into vp_history (game_no) values (13);
insert into vp_history (game_no) values (14);
insert into vp_history (game_no) values (15);
insert into vp_history (game_no) values (16);
insert into vp_history (game_no) values (17);
insert into vp_history (game_no) values (18);
insert into vp_history (game_no) values (19);
insert into vp_history (game_no) values (20);
insert into vp_history (game_no) values (21);
insert into vp_history (game_no) values (22);
insert into vp_history (game_no) values (23);
insert into vp_history (game_no) values (24);
insert into vp_history (game_no) values (25);
insert into vp_history (game_no) values (26);
insert into vp_history (game_no) values (27);
insert into vp_history (game_no) values (28);
insert into vp_history (game_no) values (29);
insert into vp_history (game_no) values (30);
insert into vp_history (game_no) values (31);
insert into vp_history (game_no) values (32);
insert into vp_history (game_no) values (33);
insert into vp_history (game_no) values (34);
insert into vp_history (game_no) values (35);
insert into vp_history (game_no) values (36);
insert into vp_history (game_no) values (37);
insert into vp_history (game_no) values (38);
insert into vp_history (game_no) values (39);
insert into vp_history (game_no) values (40);
insert into vp_history (game_no) values (41);
insert into vp_history (game_no) values (42);
insert into vp_history (game_no) values (43);
insert into vp_history (game_no) values (44);
insert into vp_history (game_no) values (45);
insert into vp_history (game_no) values (46);
insert into vp_history (game_no) values (47);
insert into vp_history (game_no) values (48);
insert into vp_history (game_no) values (49);
insert into vp_history (game_no) values (50);
insert into vp_history (game_no) values (51);
insert into vp_history (game_no) values (52);
insert into vp_history (game_no) values (53);
insert into vp_history (game_no) values (54);
insert into vp_history (game_no) values (55);
insert into vp_history (game_no) values (56);
insert into vp_history (game_no) values (57);
insert into vp_history (game_no) values (58);
insert into vp_history (game_no) values (59);
insert into vp_history (game_no) values (60);
insert into vp_history (game_no) values (61);
insert into vp_history (game_no) values (62);
insert into vp_history (game_no) values (63);
insert into vp_history (game_no) values (64);
insert into vp_history (game_no) values (65);
insert into vp_history (game_no) values (66);
insert into vp_history (game_no) values (67);
insert into vp_history (game_no) values (68);
insert into vp_history (game_no) values (69);
insert into vp_history (game_no) values (70);
insert into vp_history (game_no) values (71);
insert into vp_history (game_no) values (72);
insert into vp_history (game_no) values (73);
insert into vp_history (game_no) values (74);
insert into vp_history (game_no) values (75);
insert into vp_history (game_no) values (76);
insert into vp_history (game_no) values (77);
insert into vp_history (game_no) values (78);
insert into vp_history (game_no) values (79);
insert into vp_history (game_no) values (80);
insert into vp_history (game_no) values (81);
insert into vp_history (game_no) values (82);
insert into vp_history (game_no) values (83);
insert into vp_history (game_no) values (84);
insert into vp_history (game_no) values (85);
insert into vp_history (game_no) values (86);
insert into vp_history (game_no) values (87);
insert into vp_history (game_no) values (88);
insert into vp_history (game_no) values (89);
insert into vp_history (game_no) values (90);
insert into vp_history (game_no) values (91);
insert into vp_history (game_no) values (92);
insert into vp_history (game_no) values (93);
insert into vp_history (game_no) values (94);
insert into vp_history (game_no) values (95);
insert into vp_history (game_no) values (96);
insert into vp_history (game_no) values (97);
insert into vp_history (game_no) values (98);
insert into vp_history (game_no) values (99);
insert into vp_history (game_no) values (100);
insert into vp_history (game_no) values (101);
insert into vp_history (game_no) values (102);
insert into vp_history (game_no) values (103);
insert into vp_history (game_no) values (104);
insert into vp_history (game_no) values (105);
insert into vp_history (game_no) values (106);
insert into vp_history (game_no) values (107);
insert into vp_history (game_no) values (108);
insert into vp_history (game_no) values (109);
insert into vp_history (game_no) values (110);
insert into vp_history (game_no) values (111);
insert into vp_history (game_no) values (112);
insert into vp_history (game_no) values (113);
insert into vp_history (game_no) values (114);
insert into vp_history (game_no) values (115);
insert into vp_history (game_no) values (116);
insert into vp_history (game_no) values (117);
insert into vp_history (game_no) values (118);
insert into vp_history (game_no) values (119);
insert into vp_history (game_no) values (120);
insert into vp_history (game_no) values (121);
insert into vp_history (game_no) values (122);
insert into vp_history (game_no) values (123);
insert into vp_history (game_no) values (124);
insert into vp_history (game_no) values (125);
insert into vp_history (game_no) values (126);
insert into vp_history (game_no) values (127);
insert into vp_history (game_no) values (128);
insert into vp_history (game_no) values (129);
insert into vp_history (game_no) values (130);
insert into vp_history (game_no) values (131);
insert into vp_history (game_no) values (132);
insert into vp_history (game_no) values (133);
insert into vp_history (game_no) values (134);
insert into vp_history (game_no) values (135);
insert into vp_history (game_no) values (136);
insert into vp_history (game_no) values (137);
insert into vp_history (game_no) values (138);
insert into vp_history (game_no) values (139);
insert into vp_history (game_no) values (140);
insert into vp_history (game_no) values (141);
insert into vp_history (game_no) values (142);
insert into vp_history (game_no) values (143);
insert into vp_history (game_no) values (144);
insert into vp_history (game_no) values (145);
insert into vp_history (game_no) values (146);
insert into vp_history (game_no) values (147);
insert into vp_history (game_no) values (148);
insert into vp_history (game_no) values (149);
insert into vp_history (game_no) values (150);
insert into vp_history (game_no) values (151);
insert into vp_history (game_no) values (152);
insert into vp_history (game_no) values (153);
insert into vp_history (game_no) values (154);
insert into vp_history (game_no) values (155);
insert into vp_history (game_no) values (156);
insert into vp_history (game_no) values (157);
insert into vp_history (game_no) values (158);
insert into vp_history (game_no) values (159);
insert into vp_history (game_no) values (160);
insert into vp_history (game_no) values (161);
insert into vp_history (game_no) values (162);
insert into vp_history (game_no) values (163);
insert into vp_history (game_no) values (164);
insert into vp_history (game_no) values (165);
insert into vp_history (game_no) values (166);
insert into vp_history (game_no) values (167);
insert into vp_history (game_no) values (168);
insert into vp_history (game_no) values (169);
insert into vp_history (game_no) values (170);
insert into vp_history (game_no) values (171);
insert into vp_history (game_no) values (172);
insert into vp_history (game_no) values (173);
insert into vp_history (game_no) values (174);
insert into vp_history (game_no) values (175);
insert into vp_history (game_no) values (176);
insert into vp_history (game_no) values (177);
insert into vp_history (game_no) values (178);
insert into vp_history (game_no) values (179);
insert into vp_history (game_no) values (180);
insert into vp_history (game_no) values (181);
insert into vp_history (game_no) values (182);
insert into vp_history (game_no) values (183);
insert into vp_history (game_no) values (184);
insert into vp_history (game_no) values (185);
insert into vp_history (game_no) values (186);
insert into vp_history (game_no) values (187);
insert into vp_history (game_no) values (188);
insert into vp_history (game_no) values (189);
insert into vp_history (game_no) values (190);
insert into vp_history (game_no) values (191);
insert into vp_history (game_no) values (192);
insert into vp_history (game_no) values (193);
insert into vp_history (game_no) values (194);
insert into vp_history (game_no) values (195);
insert into vp_history (game_no) values (196);
insert into vp_history (game_no) values (197);
insert into vp_history (game_no) values (198);
insert into vp_history (game_no) values (199);
insert into vp_history (game_no) values (200);
insert into vp_history (game_no) values (201);
insert into vp_history (game_no) values (202);
insert into vp_history (game_no) values (203);
insert into vp_history (game_no) values (204);
insert into vp_history (game_no) values (205);
insert into vp_history (game_no) values (206);
insert into vp_history (game_no) values (207);
insert into vp_history (game_no) values (208);
insert into vp_history (game_no) values (209);
insert into vp_history (game_no) values (210);
insert into vp_history (game_no) values (211);
insert into vp_history (game_no) values (212);
insert into vp_history (game_no) values (213);
insert into vp_history (game_no) values (214);
insert into vp_history (game_no) values (215);
insert into vp_history (game_no) values (216);
insert into vp_history (game_no) values (217);
insert into vp_history (game_no) values (218);
insert into vp_history (game_no) values (219);
insert into vp_history (game_no) values (220);
insert into vp_history (game_no) values (221);
insert into vp_history (game_no) values (222);
insert into vp_history (game_no) values (223);
insert into vp_history (game_no) values (224);
insert into vp_history (game_no) values (225);
insert into vp_history (game_no) values (226);
insert into vp_history (game_no) values (227);
insert into vp_history (game_no) values (228);
insert into vp_history (game_no) values (229);
insert into vp_history (game_no) values (230);
insert into vp_history (game_no) values (231);
insert into vp_history (game_no) values (232);
insert into vp_history (game_no) values (233);
insert into vp_history (game_no) values (234);
insert into vp_history (game_no) values (235);
insert into vp_history (game_no) values (236);
insert into vp_history (game_no) values (237);
insert into vp_history (game_no) values (238);
insert into vp_history (game_no) values (239);
insert into vp_history (game_no) values (240);
insert into vp_history (game_no) values (241);
insert into vp_history (game_no) values (242);
insert into vp_history (game_no) values (243);
insert into vp_history (game_no) values (244);
insert into vp_history (game_no) values (245);
insert into vp_history (game_no) values (246);
insert into vp_history (game_no) values (247);
insert into vp_history (game_no) values (248);
insert into vp_history (game_no) values (249);
insert into vp_history (game_no) values (250);
insert into vp_history (game_no) values (251);
insert into vp_history (game_no) values (252);
insert into vp_history (game_no) values (253);
insert into vp_history (game_no) values (254);
insert into vp_history (game_no) values (255);
insert into vp_history (game_no) values (256);
insert into vp_history (game_no) values (257);
insert into vp_history (game_no) values (258);
insert into vp_history (game_no) values (259);
insert into vp_history (game_no) values (260);
insert into vp_history (game_no) values (261);
insert into vp_history (game_no) values (262);
insert into vp_history (game_no) values (263);
insert into vp_history (game_no) values (264);
insert into vp_history (game_no) values (265);
insert into vp_history (game_no) values (266);
insert into vp_history (game_no) values (267);
insert into vp_history (game_no) values (268);
insert into vp_history (game_no) values (269);
insert into vp_history (game_no) values (270);
insert into vp_history (game_no) values (271);
insert into vp_history (game_no) values (272);
insert into vp_history (game_no) values (273);
insert into vp_history (game_no) values (274);
insert into vp_history (game_no) values (275);
insert into vp_history (game_no) values (276);
insert into vp_history (game_no) values (277);
insert into vp_history (game_no) values (278);
insert into vp_history (game_no) values (279);
insert into vp_history (game_no) values (280);
insert into vp_history (game_no) values (281);
insert into vp_history (game_no) values (282);
insert into vp_history (game_no) values (283);
insert into vp_history (game_no) values (284);
insert into vp_history (game_no) values (285);
insert into vp_history (game_no) values (286);
insert into vp_history (game_no) values (287);
insert into vp_history (game_no) values (288);
commit;



-- CHAMPIONSHIPS

create table vpc_nineball as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 1 and 56;



create table vpc_fifball as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 57 and 112;



create table vpc_snooker as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 113 and 168;



create table vpc_eight as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 169 and 224;



--TOURNAMENTS


create table vpt_nineball as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 225 and 240;


create table vpt_fifball as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 241 and 256;



create table vpt_snooker as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 257 and 272;



create table vpt_eight as
 select
  vpg.game_no as GameNo,
  vpc.competition_name as Competition,
  vg.game_name as Game,
  vpg.game_obj as GameType,
  vpg.break_order as Breaks,
  vpp.player_name as PlayerOne,
  vppp.player_name as PlayerTwo,
  vpg.pl1_score as PlayerOne_Score,
  vpg.pl2_score as PlayerTwo_Score,
  vpg.g_played as Played
 from vp_competition vpc, vp_player vpp, vp_player vppp, vp_game vg, vp_g vpg
 where 
  vpg.id_competition = vpc.id_competition and
  vpg.pl1 = vpp.id_player and
  vpg.pl2 = vppp.id_player and
  vpg.id_game = vg.id_game and
  vpg.game_no between 273 and 288;

commit;





























