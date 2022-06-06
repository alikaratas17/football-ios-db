ER Model

- Entities
- Player -> position
- Team -> total number of trophies won
- Club Team (sub class of team) -> league titles won, cup titles won, international cup titles won
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

