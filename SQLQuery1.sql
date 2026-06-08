--MATCH LEVEL ANALYSIS --
--Most successful teams (win count) --
SELECT 
	winner,
	count(*) AS wins
FROM Matches
WHERE winner != ''
GROUP BY winner
ORDER BY wins DESC;

-- Toss Advantage - does winning toss help win match ? --
SELECT 
	toss_decision,     
	COUNT(*) AS total,
	SUM( CASE WHEN toss_winner =  winner 
		 THEN 1 ELSE 0 END) AS won_after_toss
FROM Matches
GROUP BY toss_decision;

--Season-wise match count --
SELECT 
	season,
	COUNT(*) AS matches
FROM Matches
GROUP BY season
ORDER BY season

-- PLAYER LEVEL ANALYSIS --

--Top run scorers --
SELECT 
batter,
SUM(CAST(batsman_runs AS INT )) AS total_runs
FROM Deliveries 
GROUP BY batter
ORDER BY total_runs DESC;

-- Top wicket takers --
SELECT 
bowler,
COUNT(*) AS wickets
FROM Deliveries
GROUP BY bowler
ORDER BY wickets DESC 


-- Player of the match awards --

SELECT 
player_of_match,
COUNT(*) AS awards
FROM Matches 
GROUP BY player_of_match
ORDER BY awards DESC 


-- TEAM PERFORMANCE --

--Average runs per over by team --
SELECT 
ROUND(SUM (CAST (total_runs as int)) * 1.0 / COUNT(DISTINCT match_id), 2) AS avg_runs_per_match
FROM Deliveries
GROUP BY batting_team
ORDER BY avg_runs_per_match DESC

-- Most sixes and fours --
SELECT 
batter,
	SUM(CASE WHEN batsman_runs = 6 THEN 1 ELSE 0 END) AS sixes,
	SUM(CASE WHEN batsman_runs = 4 THEN 1 ELSE 0 END) AS fours
FROM Deliveries
GROUP BY batter 
ORDER BY sixes DESC





