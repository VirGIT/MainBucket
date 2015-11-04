-- UPDATE STF

/* stergere din vp_stf */
create or replace procedure erase_stf is
begin
update vp_stf set ch_cls = 0;
update vp_stf set to_cls = 0;
update vp_stf set fr_cls = 0;
end;
/


/* update vp_stf campionat */
create or replace procedure upd_stf_ch is
begin
update vp_stf vpst set vpst.ch_cls = (select vps.cls from vp_stat vps where vps.id_stat = vpst.id_stat);
end;
/

/* update vp_stf turneu */
create or replace procedure upd_stf_to is
begin
update vp_stf vpst set vpst.to_cls = (select vps.cls from vp_stat vps where vps.id_stat = vpst.id_stat);
end;
/

/* update vp_stf free game */
create or replace procedure upd_stf_fr is
begin
update vp_stf vpst set vpst.fr_cls = (select vps.cls from vp_stat vps where vps.id_stat = vpst.id_stat);
end;
/


-- UPDATE BET

/* butonul placebet - se scade din totalul bugetelor sponsorilor suma trecuta in coloana ore_bet din vp_bet*/
create or replace procedure bet_placebet is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget - vpb.ore_bet where vpb.ore_bet <> 0 and vpb.id_bet in (
'BET01','BET02','BET03','BET04','BET05','BET06','BET07','BET08');
end;
/

/* butonul interplay_cash - se adauga suma coloanei ore_bet bugetului total Intrerplay */
create or replace procedure bet_interplay_cashin is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget + (
select sum(vpb.ore_bet) from vp_bet vpb where vpb.id_bet <> 'BET09' and vpb.id_bet <> 'INVALID') where vpb.id_bet = 'BET09';
end;
/

/* butonul sponsor_payment - se adauga bugetelor sponsorilor sumele din coloana orew*/
create or replace procedure bet_sponsor_cashout is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget - (
select sum(vpb.orew) from vp_bet vpb where vpb.id_bet <> 'BET09' and vpb.id_bet <> 'INVALID') where vpb.id_bet = 'BET09';
end;
/

/* butonul ch_payments */
create or replace procedure bet_cbudgets is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 4) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 1);  

update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 2) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 2);  

update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 1.5) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 3);
end;
/

/* butonul to_payments */
create or replace procedure bet_tbudgets is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 4) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 1);  

update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 3) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 2);  

update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 2) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 3);  

update vp_bet vpb set vpb.total_budget = vpb.total_budget + (vpb.ore_bet * 1.5) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 4);
end;
/

/* butonul free_payments */
create or replace procedure bet_fbudgets is
begin
update vp_bet vpb set vpb.total_budget = vpb.total_budget + vpb.ore_bet where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.fr_cls = 1); 
end;
/


/* plateste sponsor in campionat */
create or replace procedure sponsor_pay_ch is
begin
update vp_bet vpb set vpb.orew = vpb.total_budget + (vpb.ore_bet * 4) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 1);  

update vp_bet vpb set vpb.orew = vpb.total_budget + (vpb.ore_bet * 2) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 2);

update vp_bet vpb set vpb.orew = vpb.total_budget + (vpb.ore_bet * 1.5) where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.ch_cls = 3);
end;
/


/* plateste sponsor in turneu */
create or replace procedure sponsor_pay_to is
begin
update vp_bet vpb set vpb.orew = vpb.ore_bet * 4 where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 1);  

update vp_bet vpb set vpb.orew = vpb.ore_bet * 3 where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 2);  

update vp_bet vpb set vpb.orew = vpb.ore_bet * 2 where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 3);  

update vp_bet vpb set vpb.orew = vpb.ore_bet * 1.5 where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.to_cls = 4);
end;
/


/* plateste sponsor in free game */
create or replace procedure sponsor_pay_fr is
begin
update vp_bet vpb set vpb.orew = vpb.ore_bet where vpb.id_bet in (
select vps.id_bet from vp_stf vps where vps.id_bet = vpb.id_bet and vps.fr_cls = 1); 
end;
/


/* reset bets */
create or replace procedure bet_reset is
begin
update vp_bet set ore_bet = 0;
update vp_bet set orew = 0;
end;
/ 


-- UPDATE STAT

/* update vp_stat - seteaza player_rating */
create or replace procedure stats_upd is
begin
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT01';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT02';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT03';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT04';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT05';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT06';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT07';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT08';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT09';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT10';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT11';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT12';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT13';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT14';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT15';
update vp_stat set player_rating = 
(games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stat = 'STAT16';
end;
/


/* stergere din vp_stat dupa update history */
create or replace procedure stats_reset is
begin
update vp_stat set player_rating = 0;
update vp_stat set games_played = 0;
update vp_stat set games_won = 0;
update vp_stat set ball_ma = 0;
update vp_stat set balls_mpt = 0;
update vp_stat set average_run = 0;
update vp_stat set money_ball_ma = 0;
update vp_stat set points_scored = 0;
update vp_stat set longest_run = 0;
update vp_stat set ap_on_sb = 0;
end;
/


-- UPDATE STAT HISTORY

/* update vp_stat_history */
create or replace procedure history_stat is
begin
update vp_stat_history vpsh set vpsh.games_played = vpsh.games_played + (select vps.games_played from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.games_won = vpsh.games_won + (select vps.games_won from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.ball_ma = vpsh.ball_ma + (select vps.ball_ma from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.balls_mpt = vpsh.balls_mpt + (select vps.balls_mpt from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.average_run = vpsh.average_run + (select vps.average_run from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.money_ball_ma = vpsh.money_ball_ma + (select vps.money_ball_ma from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.points_scored = vpsh.points_scored + (select vps.points_scored from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.longest_run = vpsh.longest_run + (select vps.longest_run from vp_stat vps where vpsh.id_stath = vps.id_stat);
update vp_stat_history vpsh set vpsh.ap_on_sb = vpsh.ap_on_sb + (select vps.ap_on_sb from vp_stat vps where vpsh.id_stath = vps.id_stat);
end;
/


/* set player stat history */
create or replace procedure history_player is
begin
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT01';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT02';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT03';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT04';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT05';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT06';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT07';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT08';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT09';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT10';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT11';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT12';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT13';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT14';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT15';
update vp_stat_history set player_rating = (games_won - games_played) + ball_ma + balls_mpt + average_run + money_ball_ma + points_scored + longest_run + ap_on_sb + 1000 where id_stath = 'STAT16';
end;
/


-- UPDATE HISTORY 

/* update vp_history din vpc_nineball */
create or replace procedure upd_chistory_nine is
begin
update vp_history vph set vph.id_competition = (select vpcn.competition from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.id_game = (select vpcn.game from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpcn.gametype from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.break_order = (select vpcn.breaks from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpcn.playerone from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpcn.playertwo from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpcn.playerone_score from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpcn.playertwo_score from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.g_played = (select vpcn.played from vpc_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
end;
/

/* update vp_history din vpc_fifball */
create or replace procedure upd_chistory_fift is
begin
update vp_history vph set vph.id_competition = (select vpcf.competition from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.id_game = (select vpcf.game from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpcf.gametype from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.break_order = (select vpcf.breaks from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpcf.playerone from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpcf.playertwo from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpcf.playerone_score from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpcf.playertwo_score from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.g_played = (select vpcf.played from vpc_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
end;
/

/* update vp_history din vpc_snooker */
create or replace procedure upd_chistory_snooker is
begin
update vp_history vph set vph.id_competition = (select vpsn.competition from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.id_game = (select vpsn.game from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpsn.gametype from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.break_order = (select vpsn.breaks from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpsn.playerone from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpsn.playertwo from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpsn.playerone_score from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpsn.playertwo_score from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.g_played = (select vpsn.played from vpc_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
end;
/

/* update vp_history din vpc_eight */
create or replace procedure upd_chistory_eight is
begin
update vp_history vph set vph.id_competition = (select vpei.competition from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.id_game = (select vpei.game from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpei.gametype from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.break_order = (select vpei.breaks from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpei.playerone from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpei.playertwo from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpei.playerone_score from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpei.playertwo_score from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.g_played = (select vpei.played from vpc_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
end;
/

/* update vp_history din vpt_nineball */
create or replace procedure upd_thistory_nine is
begin
update vp_history vph set vph.id_competition = (select vpcn.competition from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.id_game = (select vpcn.game from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpcn.gametype from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.break_order = (select vpcn.breaks from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpcn.playerone from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpcn.playertwo from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpcn.playerone_score from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpcn.playertwo_score from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
update vp_history vph set vph.g_played = (select vpcn.played from vpt_nineball vpcn where vph.game_no = vpcn.gameno and vpcn.played = 'Yes');
end;
/

/* update vp_history din vpt_fifball */
create or replace procedure upd_thistory_fift is
begin
update vp_history vph set vph.id_competition = (select vpcf.competition from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.id_game = (select vpcf.game from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpcf.gametype from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.break_order = (select vpcf.breaks from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpcf.playerone from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpcf.playertwo from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpcf.playerone_score from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpcf.playertwo_score from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
update vp_history vph set vph.g_played = (select vpcf.played from vpt_fifball vpcf where vph.game_no = vpcf.gameno and vpcf.played = 'Yes');
end;
/

/* update vp_history din vpt_snooker */
create or replace procedure upd_thistory_snooker is
begin
update vp_history vph set vph.id_competition = (select vpsn.competition from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.id_game = (select vpsn.game from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpsn.gametype from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.break_order = (select vpsn.breaks from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpsn.playerone from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpsn.playertwo from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpsn.playerone_score from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpsn.playertwo_score from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
update vp_history vph set vph.g_played = (select vpsn.played from vpt_snooker vpsn where vph.game_no = vpsn.gameno and vpsn.played = 'Yes');
end;
/

/* update vp_history din vpt_eight */
create or replace procedure upd_thistory_eight is
begin
update vp_history vph set vph.id_competition = (select vpei.competition from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.id_game = (select vpei.game from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.game_obj = (select vpei.gametype from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.break_order = (select vpei.breaks from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl1 = (select vpei.playerone from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl2 = (select vpei.playertwo from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl1_score = (select vpei.playerone_score from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.pl2_score = (select vpei.playertwo_score from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
update vp_history vph set vph.g_played = (select vpei.played from vpt_eight vpei where vph.game_no = vpei.gameno and vpei.played = 'Yes');
end;
/




































