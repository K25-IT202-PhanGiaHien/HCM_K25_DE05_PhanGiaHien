CREATE DATABASE ESportsManagement;
USE ESportsManagement;

CREATE TABLE Team (
    team_id VARCHAR(10) PRIMARY KEY,
    team_name VARCHAR(100),
    team_country VARCHAR(50),
    team_owner VARCHAR(100),
    YearOfEstablish INT
);

CREATE TABLE Players (
    Player_id VARCHAR(10) PRIMARY KEY,
    player_name VARCHAR(100),
    player_nickname VARCHAR(50),
    player_roles VARCHAR(50),
    player_salary DECIMAL(15,2),
    team_id VARCHAR(10),
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE matchs (
    match_id VARCHAR(10) PRIMARY KEY,
    match_time DATETIME,
    match_score VARCHAR(50)
);

CREATE TABLE match_statistic (
    match_id VARCHAR(10),
    player_id VARCHAR(10),
    Kills INT,
    Deaths INT,
    Assists INT,
    PRIMARY KEY (match_id, player_id),
    FOREIGN KEY (match_id) REFERENCES matchs(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

ALTER TABLE matchs ADD GiaiThuong DECIMAL(15,2);
ALTER TABLE team CHANGE team_country KhuVuc VARCHAR(50);

-- DROP TABLE match_statistic;
-- DROP TABLE matchs;

INSERT INTO Team VALUES ('T001','Saigon Phantom','Vietnam','Nguyen Van A',2018),
('T002','GAM Esports','Vietnam','Tran Van B',2017),
('T003','T1','Korea','Kim Min Soo',2015),
('T004','JD Gaming','China','Li Wei',2016),
('T005','Fnatic','Europe','John Smith',2010);

INSERT INTO Players VALUES ('P001','Nguyen Van C','Carter','Jungler',80000000,'T001'),
('P002','Le Van D','Dino','Mid',90000000,'T001'),
('P003','Tran Van E','Eagle','Top',70000000,'T002'),
('P004','Pham Van F','Flash','ADC',120000000,'T002'),
('P005','Kim J','Zeus','Top',150000000,'T003');

INSERT INTO Matchs VALUES ('MS_007','2024-05-01 18:00:00','2-1',50000000);

INSERT INTO match_statistic VALUES ('MS_007','P001',5,2,7),
('MS_007','P002',3,4,5),
('MS_007','P003',6,1,8),
('MS_007','P004',10,3,12),
('MS_007','P005',7,2,9);

SET SQl_SAFE_UPDATES = 0;

UPDATE Players
SET player_salary = player_salary * 1.2
WHERE player_roles = 'Jungler';

DELETE FROM Team
WHERE team_owner IS NULL;

SELECT * FROM Players
WHERE player_salary BETWEEN 50000000 AND 150000000;

SELECT * FROM Matchs
WHERE match_id = 'MS_007';

SELECT P.player_nickname, P.player_roles
FROM Players P
JOIN Team T ON P.team_id = T.team_id
WHERE T.KhuVuc = 'Vietnam';

