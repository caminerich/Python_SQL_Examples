--two tables buses and passengers
--buses: id,origin, destination, time, unique (origin, destination, time)
--passengers: id, origin, destination, time
--each row of table buses has info about origin, destination, and time of departure.
--each row of passengers describes single passenger and has info about origin station and destination station and time of arrival at destination station
--passengers board earliest bus that travels directly to destination. passengers can board bus at same minute they arrive. 
--all passengers who are still at the station at 23:59 dont board any of those 23:59 buses leave platform without boarding bus. 
--no two buses with same origin and destination depart at the same time
--SQL query that for each bus, returns the number of passengers boarding it. 
--SELECT bus.id, COUNT(passengers.id) as passengers_on_board. 
--Passenger time is time arriving at destination station. Buses time is time of departure.
--So passenger time has to be before bus departure time and passenger origin = bus origin, pass destination = bus destination
'''
Test data
CREATE TABLE buses (id INTEGER PRIMARY KEY, origin TEXT, destination TEXT, time TEXT);
CREATE TABLE passengers (id INTEGER PRIMARY KEY, origin TEXT, destination TEXT, time TEXT);
INSERT INTO buses values (20, 'Berlin', 'Paris', '06:20'); --bus num, origin, destination, departure time
INSERT INTO buses values (21, 'Berlin', 'Paris', '14:00');
INSERT INTO buses values (22, 'Berlin', 'Paris', '21:40');
INSERT INTO buses values (30, 'Paris', 'Madrid', '13:30');
INSERT INTO passengers values (1, 'Paris', 'Madrid', '13:30'); --this passenger on bus 30
INSERT INTO passengers values (2, 'Paris', 'Madrid', '13:31'); --this passenger misses bus 30
INSERT INTO passengers values (40, 'Berlin', 'Paris', '06:15'); --this passenger on bus 20
INSERT INTO passengers values (41, 'Berlin', 'Paris', '06:50'); --this passenger on bus 21
INSERT INTO passengers values (42, 'Berlin', 'Paris', '7:12'); --this passenger on bus 21
INSERT INTO passengers values (43, 'Berlin', 'Paris', '12:03'); --this passenger on bus 22
INSERT INTO passengers values (44, 'Berlin', 'Paris', '20:00'); --no bus for this passenger
'''

SELECT buses.id
,COUNT(passengers.id) as passengers_on_board
FROM buses
JOIN passengers ON buses.origin = passengers.origin 
    AND buses.destination = passengers.destination 
    AND buses.time = (
        SELECT MIN(b.time)
        FROM buses b
        WHERE b.origin = passengers.origin
            AND b.destination = passengers.destination
            AND b.time >= passengers.time
)
WHERE passengers.time < '23:59'
GROUP BY buses.id 
ORDER BY buses.id ASC;
