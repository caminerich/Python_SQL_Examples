--two tables. phones and calls.
-- create table phones( name varchar(20) not null, phone_number int not null, unique);
-- create table calls (id integer not null, caller integer not null, callee integer not null, duration integer not null, unique(id));
-- each row of the table phones has info about client (name) and his phone number. Each client has one phone number
-- each row of the table calls has info about one call. id is unique identifier of the call, 
-- caller is the phone number of the client who made the call, callee is the phone number of the client who received the call, duration is the duration of the call in minutes.
-- sql query to find all clients who talked for 10 minutes in total. table contain only clients who talked for 10 minutes or more (name)
-- name are strings lower and uper. phone_number are integers with range 1-9,999. 
-- each avlue of caller or callee column occurs in the phone_number column in phone table. 
-- each rowof calls table, callerand callee are different
-- order names ascending 
"""
-- Create table phones
CREATE TABLE phones (
    name VARCHAR(20) NOT NULL,
    phone_number INT NOT NULL UNIQUE
);

-- Create table calls
CREATE TABLE calls (
    id INTEGER NOT NULL UNIQUE,
    caller INTEGER NOT NULL,
    callee INTEGER NOT NULL,
    duration INTEGER NOT NULL
); 

test case 1: 
insert into phones values ('Jack', 1234);
insert into phones values ('Lena', 3333);
insert into phones values ('Mark', 9999);
insert into phones values ('Anna', 7582);
insert into calls values (25, 1234, 7582, 8);
insert into calls values (7, 9999, 7582, 1);
insert into calls values (18, 9999, 3333, 4);
insert into calls values (2, 7582, 3333, 3);
insert into calls values (3, 3333, 1234, 1);
insert into calls values (21, 3333, 1234, 1);
anna 12, 
jack 10
Lena 9
Mark 5

test case 2:
insert into phones values ('Addison', 4315)
insert into phones values ('Ginny', 9831)
insert into phones values ('Kate', 8003)
insert into phones values ('John', 6356)
insert into calls values (65, 8003, 9831, 7)
insert into calls values (100, 9831, 8003, 3)
insert into calls values (145, 4315, 9831, 18)
addison 18
ginny 28
kate 10
john 0
"""

-- SQL query to find all clients who talked for 10 minutes or more
SELECT p.name
FROM phones p
JOIN calls c ON p.phone_number = c.caller OR p.phone_number = c.callee
GROUP BY p.name
HAVING SUM(c.duration) >= 10
ORDER BY p.name ASC;