ER Model

- Entities
- Player
- Team -> total number of trophies won
- Club Team (sub class of team) -> league titles won, cup titles won, international cup titles won
- National Team (sub class of team)
- Manager
- Competition-> season


Relationships
- Played(team, team,competition) -> refree_name,stadium_name,score,all of match stats (expand later)
- Stats_of_player(Competition, Player)
- Stats_of_team(Competition, team) 
- Manages(manager,team)-> duration,start date
- Player_plays_in_club(club team, player) -> start date, duration, # of matches played, # of goals scores, # of clean sheets, # of assists
- Winner_of(competition,team)-> award_name
- Winner_of(competition,player)-> award_name

