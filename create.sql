CREATE TABLE Country (
	country_name VARCHAR(60) NOT NULL PRIMARY KEY
);


CREATE TABLE AwardType (
	award_type VARCHAR(35) NOT NULL PRIMARY KEY
);

CREATE TABLE Participant (
	participant_id NUMBER(6,0) NOT NULL PRIMARY KEY,
	firstname VARCHAR(120) NOT NULL,
	lastname VARCHAR(120) NOT NULL,
	country_name VARCHAR(60) NOT NULL REFERENCES Country(country_name)
);

CREATE TABLE Award (
	total INT NOT NULL CHECK(total >= 0 AND total <= 42),
	rank INT NOT NULL CHECK(rank > 0),
	award_type VARCHAR(35) NOT NULL REFERENCES AwardType(award_type),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Award PRIMARY KEY (participant_id, year)
);

CREATE TABLE Olympiad (
	country_name VARCHAR(60) REFERENCES Country(country_name),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Olympiad PRIMARY KEY (country_name, year)
);


CREATE TABLE Problem_1 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_1 PRIMARY KEY (participant_id, year)
);
CREATE TABLE Problem_2 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_2 PRIMARY KEY (participant_id, year)
);
CREATE TABLE Problem_3 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_3 PRIMARY KEY (participant_id, year)
);
CREATE TABLE Problem_4 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_4 PRIMARY KEY (participant_id, year)
);
CREATE TABLE Problem_5 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_5 PRIMARY KEY (participant_id, year)
);
CREATE TABLE Problem_6 (
	mark INT NOT NULL CHECK(mark >= 0 AND mark <= 7),
	participant_id NUMBER(6,0) NOT NULL REFERENCES Participant(participant_id),
	year NUMBER(4,0) NOT NULL CHECK(year > 0),
	CONSTRAINT PK_Problem_6 PRIMARY KEY (participant_id, year)
);