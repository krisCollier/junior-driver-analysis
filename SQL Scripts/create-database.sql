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

CREATE TABLE races (
  raceId int NOT NULL IDENTITY(1,1),
  year int NOT NULL DEFAULT '0',
  round int NOT NULL DEFAULT '0',
  circuitId int NOT NULL DEFAULT '0',
  name varchar(255) NOT NULL DEFAULT '',
  date date NOT NULL DEFAULT '0000-00-00',
  url varchar(255) DEFAULT NULL,
  p_time time DEFAULT NULL,
  q_time time DEFAULT NULL,
  sr_time time DEFAULT NULL,
  r_time time DEFAULT NULL,
  PRIMARY KEY (raceId),
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

CREATE TABLE status (
  statusId int NOT NULL IDENTITY(1,1),
  status varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (statusId)
);

CREATE TABLE lapTimes (
  raceId int NOT NULL,
  driverId int NOT NULL,
  lap int NOT NULL,
  seconds int DEFAULT NULL,
  sess_time int DEFAULT NULL,
  time_set date DEFAULT NULL,
  PRIMARY KEY (raceId, driverId, lap),
  FOREIGN KEY (raceId) REFERENCES races(raceId)
);