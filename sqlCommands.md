## TODOS FOR REPORT
- Project Description
- ER Diagram
- COMPLEX SQL Queries
- SCREENSHOTS


## Query Ideas
- Verilmis bir competitionda all time veya bir sezon icin en cok gol atan ve asist yapan oyuncu benzer sekilde en cok kirmizi kart alan, sari kart alan oyuncular


SELECT player.name, MAX(player.goals)
FROM competition, player_played_in, player
WHERE competition.name = inputField.text AND competition.comp_id = player_played_in.competition_id AND player.player_id = player_played_in.player_id  
GROUP BY player.player_id

select P.name, sum(P2.goals) from player P, PLAYER_PLAYED_IN P2, COMPETITION C WHERE C.comp_id= P2.competition_id and P.player_id= P2.player_id and C.name="allianz-cup" group by P.player_id order BY SUM(P2.goals) DESC limit 1;

- Top (forward) players [scored more than 20 times in their league] who have never scored in champions league
SELECT player.name
FROM player
WHERE player.position = "forward" AND player.player_id IN ((SELECT player.player_id
FROM player
WHERE player.goals > 20)
EXCEPT
(SELECT player.player_id
FROM competition, player_played_in, player
WHERE competition.name = "champions" AND competition.comp_id = player_played_in.competition_id AND player.player_id = player_played_in.player_id))


- top 10 ic saha ve top 10 deplasman maci kazanmis takimlarin kesisimi
SELECT
FROM
WHERE

- Emekli futbolculardan ATH market valuesu en yuksek olani
- Takim degeri 10m un uzerindeki takimlar arasindan bir oyuncusunun degeri percentage bazli en yuksek olan takimi o oyuncu ile birlikte
- En cok mac yapilan stat
- En gollu gecen mac
- Oyuncu ismi verildiginde en cok macini kazandigi hakem
- Hakemlerin yonettigi maclarda en yuksek gol ortalamasi olan hakem

UPDATE .. where ="NULL"


UPDATE club SET name=NULL WHERE name="NULL";
UPDATE club SET stadium_name=NULL WHERE stadium_name="NULL";
UPDATE club SET manager_name=NULL WHERE manager_name="NULL";

UPDATE competition SET NAME = NULL WHERE NAME ="NULL";
UPDATE competition SET COUNTRY_NAME = NULL WHERE COUNTRY_NAME ="NULL";
UPDATE competition SET type = NULL WHERE type ="NULL";


UPDATE player SET name=NULL WHERE name="NULL";
UPDATE player SET COUNTRY_NAME=NULL WHERE COUNTRY_NAME="NULL";
UPDATE player SET POSITION=NULL WHERE POSITION="NULL";
UPDATE player SET FOOT=NULL WHERE FOOT="NULL";


UPDATE clubs_played_in SET ROUND=NULL WHERE ROUND="NULL";
UPDATE clubs_played_in SET STADIUM=NULL WHERE STADIUM="NULL";
UPDATE clubs_played_in SET REFEREE=NULL WHERE REFEREE="NULL";

(preprocess to remove domestic_competition_id and index)
## Club:
- CLUB_ID : INTEGER (PRIMARY KEY)
- NAME : STRING 50
- TOTAL_MARKET_VALUE : FLOAT
- SQUAD_SIZE : INT
- AVERAGE_AGE : FLOAT
- FOREIGNERS_PERCENTAGE : FLOAT
- NATIONAL_TEAM_PLAYER_COUNT : INT
- STADIUM_NAME : STRING 40
- STADIUM_SEATS : INT
- NET_TRANSFER_RECORD : FLOAT
- MANAGER_NAME : STRING 40

(preprocess to remove index)
## Competition:
- COMPETITION_ID : STRING  10
- NAME: STRING  20
- TYPE : STRING 20
- COUNTRY_NAME: STRING 30




(prepocess to remove index)
## Player
- PLAYER_ID : INT
- LAST_SEASON : INT
- CURRENT_CLUB_ID : INT FOREIGN KEY
- NAME: STRING 50
- COUNTRY_NAME: STRING 30
- BIRTHDATE: DATE
- POSITION: STRING 20
- FOOT : STRING 10
- HEIGHT: INT
- MARKET_VALUE: FLOAT
- HIGHEST_MARKET_VALUE : FLOAT


(preprocess to remove index, make game_id int, remove appearance id)
## Player Played In
- PLAYER_ID: INT
- GAME_ID: INT
- COMPETITION_ID: STRING 10
- PLAYER_CLUB_ID: INT
- GOALS: INT
- ASSISTS: INT
- MINS_PLAYED: INT
- YELLOW_CARDS: INT
- RED_CARDS : INT
- PRIMARY KEY PLAYER_ID,GAME_ID



(preprocess remove index, make attndnc int)
## Clubs Played In
- GAME_ID: INT
- COMPETITION_ID :STRING 10
- SEASON: INT
- ROUND: STRING 40
- DATE: DATE
- HOME_CLUB_ID : INT
- AWAY_CLUB_ID: INT
- HOME_CLUB_GOALS: INT
- AWAY_CLUB_GOALS:INT
- STADIUM:STRING 100
- ATTENDANCE:INT
- REFEREE : STRING 40

CREATE TABLE 

create table competition( comp_id varchar(10), name varchar(20) not null, type varchar(20), country_name varchar(30), primary key(comp_id) );

create table club( club_id int, name varchar(50), total_market_value float, squad_size int, average_age float, foreigners_percentage float, national_team_player_count int, stadium_name varchar(40), stadium_seats int, net_transfer_record float, manager_name varchar(40), primary key (club_id));

create table player( player_id int, last_season int, current_club_id int,name varchar(50), country_name varchar(30), position varchar(20), foot varchar(10), height int, market_value float, top_market_value float, primary key(player_id), birthdate date ,foreign key (current_club_id) references club(club_id));

create table clubs_played_in( game_id int, competition_id varchar(10), season int, round varchar(40), match_date date, home_club_id int, away_club_id int, home_club_goals int, away_club_goals int, stadium varchar(100), attendance int, referee varchar(40),primary key(game_id),
foreign key (home_club_id) references club(club_id),foreign key (away_club_id) references club(club_id),foreign key (competition_id) references competition(comp_id));

create table player_played_in( player_id int, game_id int, competition_id varchar(10), player_club_id int, goals int, assists int, mins_played int, yellow_cards int, red_cards int, primary key ( player_id,game_id),foreign key (player_id) references player(player_id), foreign key (game_id) references clubs_played_in(game_id), foreign key (competition_id) references competition(comp_id), foreign key (player_club_id) references club(club_id));
