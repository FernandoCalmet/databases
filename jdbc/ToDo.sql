-- ----------------------------
-- Table structure for USERS
-- ----------------------------
CREATE TABLE USERS (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(50) UNIQUE NOT NULL,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  email VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(128),
  role VARCHAR(50) NOT NULL,
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP
);

-- ----------------------------
-- Table structure for TASKS
-- ----------------------------
CREATE TABLE TASKS (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(200),
  status SMALLINT NOT NULL DEFAULT 0,
  userId INTEGER NOT NULL REFERENCES USERS(id),
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP
);

-- ----------------------------
-- Table structure for NOTES
-- ----------------------------
CREATE TABLE NOTES (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200),
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP
 );
