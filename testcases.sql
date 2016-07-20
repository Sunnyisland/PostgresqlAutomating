-- HW7.1
INSERT INTO movieexec(name, address, cert, networth) VALUES ('VD', '1 Infinity Loop', 15, 10000001);
-- should be recorded into rich_execs table
INSERT INTO movieexec(name, address, cert, networth) VALUES ('HD', '1 Infinity Loop', 16, 91); 
-- should not be recorded into rich_execs table

-- HW7.2
INSERT INTO Studio (studioname, address, presCert) VALUES ('A', 'A Hills', 700); -- should not insert
INSERT INTO Studio (studioname, address, presCert) VALUES ('B', 'B Hills', 555);--should insert

-- HW7.3
UPDATE movieexec SET networth=networth+1000000 where networth is not null;
--should have a log in log_networth_stmt;

-- HW7.4
INSERT INTO Movies(title, year, length, inColor, studioName, producerC) VALUES('Star Wars: The Force Awakens', 2015, 135, 1, 'Disney', 123); --should not alter the mgmmovie

INSERT INTO Movies(title, year, length, inColor, studioName, producerC) VALUES('How to Be Single', 2016, 110, 1, 'MGM', 123);







