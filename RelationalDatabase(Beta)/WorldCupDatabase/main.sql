CREATE DATABASE worldcup;

\c worldcup;

CREATE TABLE IF NOT EXISTS teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS games(
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(50) NOT NULL,
  winner_id INT NOT NULL,
  opponent_id INT NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL,
  FOREIGN KEY(winner_id) REFERENCES teams(team_id),
  FOREIGN KEY(opponent_id) REFERENCES teams(team_id)
);

SELECT t.name FROM games g JOIN teams t ON g.winner_id = t.team_id WHERE g.round LIKE 'Final' AND g.year = 2018
