DROP TABLE IF EXISTS Matches;
GO
CREATE TABLE Matches (
    id              INT PRIMARY KEY,
    season          VARCHAR(255),
    city            VARCHAR(255),
    date            VARCHAR(255),
    match_type      VARCHAR(255),
    player_of_match VARCHAR(255),
    venue           VARCHAR(255),
    team1           VARCHAR(255),
    team2           VARCHAR(255),
    toss_winner     VARCHAR(255),
    toss_decision   VARCHAR(255),
    winner          VARCHAR(255),
    result          VARCHAR(255),
    result_margin   VARCHAR(255),
    target_runs     VARCHAR(255),
    target_overs    VARCHAR(255),
    super_over      VARCHAR(255),
    method          VARCHAR(255),
    umpire1         VARCHAR(255),
    umpire2         VARCHAR(255)
);
GO
BULK INSERT Matches
FROM 'D:\ipl_analytics dataset\processed\matches_clean.csv'
WITH (
    FORMAT          = 'CSV',
    FIRSTROW        = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = '\n',
    TABLOCK
);
DROP TABLE IF EXISTS Deliveries;
GO

CREATE TABLE Deliveries (
   
    match_id            VARCHAR(255),
    inning              VARCHAR(255),
    batting_team        VARCHAR(255),
    bowling_team        VARCHAR(255),
    [over]              VARCHAR(255),
    ball                VARCHAR(255),
    batter              VARCHAR(255),
    bowler              VARCHAR(255),
    non_striker         VARCHAR(255),
    batsman_runs        VARCHAR(255),
    extra_runs          VARCHAR(255),
    total_runs          VARCHAR(255),
    extras_type         VARCHAR(255),
    is_wicket           VARCHAR(255),
    player_dismissed    VARCHAR(255),
    dismissal_kind      VARCHAR(255),
    fielder             VARCHAR(255)
);

GO

BULK INSERT Deliveries 
FROM 'D:\ipl_analytics dataset\processed\deliveries_clean.csv'
WITH (
    FIRSTROW        = 2,
    FIELDTERMINATOR = '|',      
    ROWTERMINATOR   = '\n',
  
    TABLOCK
);