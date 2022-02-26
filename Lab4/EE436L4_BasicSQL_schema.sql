# Schema Definition
create schema Boat_booking;
USE Boat_booking;

#Table Definition
create table Sailor 
(
	Sid INT NOT NULL, 
    Sname VARCHAR(15), 
    Rating INT,
    Age INT,
    PRIMARY KEY (Sid) 
);

#Table Definition
create table Boat 
(
	Bid INT NOT NULL, 
    Bname VARCHAR(15), 
    color VARCHAR(15),
    PRIMARY KEY (Bid) 
);

#Table Definition
create table Reserve 
(
	Sid INT NOT NULL, 
    Bid INT NOT NULL, 
    Rday DATETIME,
    PRIMARY KEY (Sid, Bid, Rday), 
    FOREIGN KEY (Sid) References Sailor(Sid) 
    ON UPDATE CASCADE On delete restrict,
	FOREIGN KEY (Bid) References Boat(Bid) 
    ON UPDATE CASCADE On delete restrict
);

# Data population
insert into Sailor VALUES (22, "Dustin", 7, 45);
insert into Sailor VALUES (29, "Brutos", 1, 25);
insert into Sailor VALUES (31, "Lubber", 3, 35);
insert into Sailor VALUES (32, "Andy", 5, 20);
insert into Sailor VALUES (58, "john", 7, 22);
insert into Sailor VALUES (64, "Dustin", 10, 55);
insert into Sailor VALUES (71, "Art", 10, 23);
insert into Sailor VALUES (74, "Bob", 8, 44);
insert into Sailor VALUES (85, "Harry", 6, 16);
insert into Sailor VALUES (95, "Bobby", 7, 31);
insert into Sailor VALUES (102, "Shaddy", 3, 13);
insert into Sailor VALUES (122, "Zoba", 5, 25);
insert into Sailor VALUES (212, "Candy", 2, 23);

# Data population
insert into Boat VALUES (101, "Interlake" , "blue");
insert into Boat VALUES (102, "Interlake" , "red");
insert into Boat VALUES (103, "Clipper" , "green");
insert into Boat VALUES (104, "Marine" , "yellow");
insert into Boat VALUES (105, "Zimba" , "white");
insert into Boat VALUES (106, "Sealion" , "black");
insert into Boat VALUES (107, "Monster" , "gray");
insert into Boat VALUES (108, "Queen" , "red");
insert into Boat VALUES (109, "Champ" , "green");
insert into Boat VALUES (110, "Bluewhale" , "blue");

# Data population
insert into Reserve VALUES (22, 101, '2021/11/10');
insert into Reserve VALUES (22, 102, '2020/05/10');
insert into Reserve VALUES (22, 103, '2021/04/10');
insert into Reserve VALUES (22, 104, '2021/03/10');
insert into Reserve VALUES (31, 102, '2021/02/10');
insert into Reserve VALUES (31, 103, '2021/04/10');
insert into Reserve VALUES (31, 105, '2021/01/10');
insert into Reserve VALUES (31, 107, '2021/06/10');
insert into Reserve VALUES (64, 108, '2021/06/10');
insert into Reserve VALUES (64, 110, '2021/07/10');
insert into Reserve VALUES (74, 101, '2021/08/10');
insert into Reserve VALUES (212, 104, '2021/09/10');
insert into Reserve VALUES (212, 108, '2021/01/10');
insert into Reserve VALUES (85, 104, '2021/07/10');



