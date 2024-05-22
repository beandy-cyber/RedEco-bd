-- Table for storing file information
CREATE TABLE file (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  send_date TIMESTAMP,
  file_path VARCHAR(255),
  type VARCHAR(50),
  points INT,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table for storing user information
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(100),
  role VARCHAR(50), -- Role of the user in the platform (e.g., admin, user)
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50)
);

-- Table for storing ODS activities
CREATE TABLE ods_activities (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  activity_name VARCHAR(100),
  description TEXT,
  points INT,
  date TIMESTAMP,
  CONSTRAINT fk_user_activity FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table for storing groups
CREATE TABLE groups (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing group members
CREATE TABLE group_members (
  group_id INT,
  user_id INT,
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (group_id, user_id),
  CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups (id),
  CONSTRAINT fk_group_user FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table for storing favorites
CREATE TABLE favorites (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  item_type VARCHAR(50),
  item_id INT,
  favorited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_favorite_user FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table for storing comments
CREATE TABLE comments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  item_type VARCHAR(50),
  item_id INT,
  comment TEXT,
  commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Table for storing events
CREATE TABLE events (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  date TIMESTAMP,
  location VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing event participants
CREATE TABLE event_participants (
  event_id INT,
  user_id INT,
  registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (event_id, user_id),
  CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES events (id),
  CONSTRAINT fk_event_user FOREIGN KEY (user_id) REFERENCES users (id)
);

