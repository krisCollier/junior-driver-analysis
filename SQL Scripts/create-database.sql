CREATE TABLE drivers (
  driverId int NOT NULL IDENTITY(1,1),
  number int DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  forename varchar(255) NOT NULL DEFAULT '',
  surname varchar(255) NOT NULL DEFAULT '',
  dob date DEFAULT NULL,
  nationality varchar(255) DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (driverId)
);

CREATE TABLE constructors (
  constructorId int NOT NULL IDENTITY(1,1),
  constructorRef varchar(255) NOT NULL DEFAULT '',
  name varchar(255) NOT NULL DEFAULT '',
  nationality varchar(255) DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (constructorId),
);

CREATE TABLE seasons (
  year int NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (year),
);

CREATE TABLE circuits (
  circuitId int NOT NULL IDENTITY(1,1),
  circuitRef varchar(255) NOT NULL DEFAULT '',
  name varchar(255) NOT NULL DEFAULT '',
  location varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  lat float DEFAULT NULL,
  lng float DEFAULT NULL,
  alt int DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (circuitId),
);

CREATE TABLE races (
  raceId int NOT NULL IDENTITY(1,1),
  year int NOT NULL DEFAULT '0',
  round int NOT NULL DEFAULT '0',
  circuitId int NOT NULL DEFAULT '0',
  name varchar(255) NOT NULL DEFAULT '',
  date date NOT NULL DEFAULT '0000-00-00',
  url varchar(255) DEFAULT NULL,
  PRIMARY KEY (raceId),
  FOREIGN KEY (circuitId) REFERENCES circuits(circuitId)
);

CREATE TABLE sessionTypes (
	sessionTypeId int NOT NULL IDENTITY(1,1),
	sessionName varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (sessionTypeId),
);

CREATE TABLE sessions (
	sessionId int NOT NULL IDENTITY(1,1),
	raceId int NOT NULL,
	sessionTypeId int NOT NULL,
	start_time time DEFAULT NULL,
	PRIMARY KEY (sessionId),
	FOREIGN KEY (sessionTypeId) REFERENCES sessionTypes(sessionTypeId),
	FOREIGN KEY (raceId) REFERENCES races(raceId),
);

CREATE TABLE status (
  statusId int NOT NULL IDENTITY(1,1),
  status varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (statusId)
);

CREATE TABLE lapTimes (
  sessionId int NOT NULL,
  driverId int NOT NULL,
  lap int NOT NULL,
  seconds float DEFAULT NULL,
  sess_time int DEFAULT NULL,
  time_set time DEFAULT NULL,
  s1_time float DEFAULT NULL,
  s1_speed float DEFAULT NULL,
  s2_time float DEFAULT NULL,
  s2_speed float DEFAULT NULL,
  s3_time float DEFAULT NULL,
  s3_speed float DEFAULT NULL,
  position int DEFAULT NULL,
  gap float DEFAULT NULL,
  PRIMARY KEY (driverId, sessionId, lap),
  FOREIGN KEY (driverId) REFERENCES drivers(driverId),
  FOREIGN KEY (sessionId) REFERENCES sessions(sessionId),
);

CREATE TABLE pitStops (
  sessionId int NOT NULL,
  driverId int NOT NULL,
  stop int NOT NULL,
  lap int NOT NULL,
  time time NOT NULL,
  duration float DEFAULT NULL,
  PRIMARY KEY (sessionId, driverId, stop),
  FOREIGN KEY (driverId) REFERENCES drivers(driverId),
  FOREIGN KEY (sessionId) REFERENCES sessions(sessionId),
);

CREATE TABLE results (
  resultId int NOT NULL IDENTITY(1,1),
  sessionId int NOT NULL,
  driverId int NOT NULL DEFAULT '0',
  constructorId int NOT NULL DEFAULT '0',
  number int NOT NULL DEFAULT '0',
  grid int NOT NULL DEFAULT '0',
  position int DEFAULT NULL,
  positionOrder int NOT NULL DEFAULT '0',
  points float NOT NULL DEFAULT '0',
  laps int NOT NULL DEFAULT '0',
  time float DEFAULT NULL,
  fastestLapTime float DEFAULT NULL,
  fastestLapSpeed float DEFAULT NULL,
  statusId int NOT NULL DEFAULT '0',
  PRIMARY KEY (sessionId, driverId),
  FOREIGN KEY (sessionId) REFERENCES sessions(sessionId),
  FOREIGN KEY (driverId) REFERENCES drivers(driverId),
);