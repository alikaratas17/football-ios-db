ER Model

- Entities
- Player -> position
- Team
- Club Team (sub class of team)
- National Team (sub class of team)
- Manager
- Competition-> name, season


Relationships
- Played(team, team,competition) -> refree_name,stadium_name,score,all of match stats (expand later)
- Stats_of_player(Competition, Player)
- Stats_of_team(Competition, team) 
- Manages(manager,team)-> duration,start date
- Player_plays_in_club(club team, player) -> season, # of matches played, # of goals scores, # of clean sheets, # of assists
- Winner_of(competition,team)-> award_name
- Winner_of(competition,player)-> award_name

Relational Model
Player(name[key],position)
Team(name,id[key])
Manager(name[key])
Competition(name[key],season[key])
Club_Team(foreign key team_id[key])
National_Team(foreign_key team_id[key])
...


Queries
- Top [stat of choice]/Scorer/Asister in [Given Competion]
- Top (forward) players [scored more than 20 times in their league] who have never scored in champions league
- takimlarin Ust uste iki sezon ligi kazanma sayilari (>0lar icin) buyukten kucuge (with limit ~10)
- En cok kupa kazanmis manager
- takim yas ortalamasi (varsa) 25 ten kucuk olan takimlar arasinda en cok kupa kazanisi
- En cok takim odulu kazanmis 100 oyuncu arasinda en cok bireysel odul kazanmis 3 oyuncu
- En cok bireysel odul kazanmis 100 oyuncu arasinda en cok takim odulu kazanmis 3 oyuncu
- Premier lig, ispanya ligi, ve dunya kupa kupasi gibi 6 kupa arasindan userin checklist ile sectigi kupalari kazanmis oyunculardan rastgele 10 tanesini goster
- En cok mac yapilan stat
- Oyuncu ismi verildiginde en cok macini kazandigi hakem
- Takimlarin en cok personal award kazanilmasina gore siralanmasi
 
Needed data
- Personal statistics for club and national competitions ( if only club is available modif query)
- Team competition winning results
- manager manages team data
- team age average by compet.
- personal competition winning results
- stadiums of matches
- player played in match (or change query for player of team) player team data, referee of matches data

Datasets we plan to use:
- https://www.kaggle.com/datasets/hugomathien/soccer
- https://www.kaggle.com/datasets/cclayford/statbunker-football-stats?select=Tables+2014-15.csv
- https://www.kaggle.com/datasets/davidcariboo/player-scores?select=leagues.csv
    - appearances table - player_id, game_id, competition_id
    - clubs table - club_id, pretty_name, coach_name
    - competitions table - competition_id, name, domestic_league_code, country_name?
    - games table - game_id, season, home_club_id, away_club_id, home_club_goals, away_club_goals, stadium, referee
    - leagues table - league_id, name
    - players table - player_id, current_club_id, pretty_name, date_of_birth, position, last_season
    - player_valuations - player_id, market_value?
- https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017
    - home_team, away_team, home_score, away_score, tournament