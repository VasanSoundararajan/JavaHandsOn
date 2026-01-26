-- 1) Question
-- Write an SQL query to display the name and age of players who are from India and whose age is greater than 30.
-- Use alias PLAYERNAME for the name column.
-- Table: players
-- Column Name	Data Type
-- player_id	INT
-- name	    VARCHAR(100)
-- age	        INT
-- country	VARCHAR(50)
-- Output
-- | PLAYERNAME | AGE |
use train;
create table players(
player_id	INT,
playerName  VARCHAR(100),
age	        INT,
country	    VARCHAR(50)
);
insert into players values(1, "player1", 40, "Foreign"), (2, "player2", 40, "India");
select playerName as "PLAYERNAME", age as "AGE" from players where country ="India" and age>30;
-- 2)Question

-- Write an SQL query to display the seat numbers and their corresponding stadium name where the seat category is 'Premium'.
-- Use alias SEATNO for seat number and STADIUMNAME for stadium name.
-- Display the result in ascending order of seat number.
-- Table: seats
-- Column Name	Data Type
-- seat_id	INT
-- seat_number	INT
-- seat_category	VARCHAR(50)
-- stadium_id	INT

-- Table: stadiums
-- Column Name	Data Type
-- stadium_id	INT
-- stadium_name	VARCHAR(100)

-- Output

-- | SEATNO | STADIUMNAME |
create table seat(
seat_id			INT,
seat_number		INT,
seat_category	VARCHAR(50),
stadium_id		INT
);
create table stadium(
stadium_id		INT,
stadium_name	VARCHAR(100)
);
insert into stadium values(1000, "First"), (1001, "Second");
insert into seat values(2, 2, "Premium", 1000), (3, 2, "Not Premium", 1000), (2, 2, "Premium", 1001);
select S.seat_number, St.stadium_name from seat S join stadium St 
on St.stadium_id = S.stadium_id where S.seat_category='Premium';
-- 3)Table: labels
-- Column Name	Data Type
-- label_id	INT
-- label_name	VARCHAR(100)
-- Question

-- Write an SQL query to display the label ID and label name where the label name contains the term "RECORD".
-- Use alias LABEL_NAME for the label name column.

-- Output Table

-- | LABEL_ID | LABEL_NAME |
SELECT label_id AS LABEL_ID, label_name AS LABEL_NAME
FROM labels
WHERE label_name LIKE '%RECORD%';

-- 4)able: seats
-- Column Name	Data Type
-- seat_id	INT
-- seat_number	INT
-- stadium_id	INT
-- seat_category	VARCHAR(50)
-- Question

-- Write an SQL query to display the stadium name and the total number of seats available in each stadium.
-- Use alias STADIUMNAME for stadium name and TOTALSEATS for the total seats.

-- Output Table

-- | STADIUMNAME | TOTALSEATS |
SELECT st.stadium_name AS STADIUMNAME, COUNT(s.seat_id) AS TOTALSEATS
FROM seats s
JOIN stadiums st ON s.stadium_id = st.stadium_id
GROUP BY st.stadium_name;


-- 5)Tables
-- users
-- Column Name	Data Type
-- user_id	INT
-- first_name	VARCHAR(50)
-- last_name	VARCHAR(50)
-- messages
-- Column Name	Data Type
-- message_id	INT
-- sender_id	INT
-- message_text	TEXT

-- Question
-- Write an SQL query to display the user_id, first_name, and last_name of the top 5 users who have sent the most messages, along with the number of messages sent.

-- Output Table
-- | USER ID | FIRST NAME | LAST NAME | MESSAGES SENT |
SELECT u.user_id,
       u.first_name,
       u.last_name,
       COUNT(m.message_id) AS messages_sent
FROM users u
LEFT JOIN messages m ON u.user_id = m.sender_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY messages_sent DESC
LIMIT 5;

-- 6)able: stadiums
-- Column Name	Data Type
-- stadium	VARCHAR
-- capacity	INT
-- Question

-- Write an SQL query to display the stadiums (STADIUMNAME) and CAPACITY where the capacity is greater than 40,000, sorted in descending order by capacity.

-- Output Table

-- STADIUMNAME|CAPACITY
SELECT stadium AS STADIUMNAME, capacity
FROM stadiums
WHERE capacity > 40000
ORDER BY capacity DESC;

-- 7)Table: players
-- Column Name	Data Type
-- player_id	INT
-- player_name	VARCHAR
-- team_name	VARCHAR
-- Question

-- Write an SQL query to display the team name (TEAMNAME) and number of players (TOTALPLAYERS) in each team.
-- Display the results in alphabetical order by the team name.

-- Output Table

-- TEAMNAME	TOTALPLAYERS
SELECT team_name AS TEAMNAME, COUNT(player_id) AS TOTALPLAYERS
FROM players
GROUP BY team_name
ORDER BY team_name ASC;

-- 8)Table: users
-- Column Name	Data Type
-- user_id	INT
-- username	VARCHAR
-- email	VARCHAR
-- phone	VARCHAR
-- Question

-- Write an SQL query to display the users (USERNAME) and their emails (EMAILID) who have a phone number ending with '29'.

-- Output Table

-- USERNAME	EMAILID
SELECT username AS USERNAME, email AS EMAILID
FROM users
WHERE phone LIKE '%29';

-- 9)Table: seat_pricing
-- Column Name	Data Type
-- category	VARCHAR
-- price	INT
-- Question

-- Write an SQL query to display all seat categories (CATEGORY_NAME) whose price is between 3000 and 9000 (inclusive).

-- Output Table

-- CATEGORY_NAME	PRICE
SELECT category AS CATEGORY_NAME, price
FROM seat_pricing
WHERE price BETWEEN 3000 AND 9000;

-- 10)Table: bookings
-- Column Name	Data Type
-- booking_id	INT
-- user_id	INT
-- trip_id	INT
-- fare	DECIMAL
-- booking_status	VARCHAR
-- Question

-- Write an SQL query to display the Booking_ID and User_ID of all trips whose booking status is 'Completed' and have a fare greater than 25.

-- Output Table

-- BOOKING_ID	USER_ID
SELECT booking_id AS BOOKING_ID, user_id AS USER_ID
FROM bookings
WHERE booking_status = 'Completed' AND fare > 25;

-- 1) Players from India aged > 30
-- SELECT name AS PLAYERNAME, age
-- FROM players
-- WHERE country = 'India' AND age > 30;


-- Output Table
-- | PLAYERNAME | AGE |

-- 2) Premium seats with stadium name
-- SELECT s.seat_number AS SEATNO, st.stadium_name AS STADIUMNAME
-- FROM seats s
-- JOIN stadiums st ON s.stadium_id = st.stadium_id
-- WHERE s.seat_category = 'Premium'
-- ORDER BY s.seat_number ASC;