CREATE DATABASE IF NOT EXISTS fitness_db;

USE fitness_db;


-- membership table
CREATE TABLE membership (
    membership_ID INT AUTO_INCREMENT PRIMARY KEY,
    class_ID INT NULL,                    
    customer_ID INT NOT NULL,
    membership_status CHAR(50) NOT NULL,
    benefits CHAR(50) NOT NULL
);


-- content table
CREATE TABLE content (
    content_ID INT AUTO_INCREMENT PRIMARY KEY,
    workout_ID INT NOT NULL,
    membership_ID INT NOT NULL,
    video_length INT NOT NULL,
    video_quality INT NOT NULL,
    video_type CHAR(50) NOT NULL
);


-- workout table
CREATE TABLE workouts (
    workout_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NOT NULL,
    content_ID INT NULL,                
    workout_name CHAR(50) NOT NULL,
    workout_length INT NOT NULL,
    workout_type CHAR(50) NOT NULL
);


-- customers table
CREATE TABLE customers (
    customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    membership_ID INT NULL,                
    class_ID INT NULL,                      
    workout_ID INT NULL,                    
    username VARCHAR(50) NOT NULL UNIQUE,   
    email VARCHAR(255) NOT NULL UNIQUE,     
    password_hash VARCHAR(255) NOT NULL,    -- store the hashed password
    customer_name CHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL
);


-- classes table
CREATE TABLE classes (
    class_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NULL,                   
    membership_ID INT NULL,                 
    class_date DATE NOT NULL,
    teacher_name CHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);


-- membership foreign keys
ALTER TABLE membership
ADD FOREIGN KEY (class_ID)
REFERENCES classes (class_ID);

ALTER TABLE membership
ADD FOREIGN KEY (customer_ID)
REFERENCES customers (customer_ID);

-- content foreign keys
ALTER TABLE content
ADD FOREIGN KEY (workout_ID)
REFERENCES workouts (workout_ID);

ALTER TABLE content
ADD FOREIGN KEY (membership_ID)
REFERENCES membership (membership_ID);

-- workout foreign keys
ALTER TABLE workouts
ADD FOREIGN KEY (customer_ID)
REFERENCES customers (customer_ID);

ALTER TABLE workouts
ADD FOREIGN KEY (content_ID)
REFERENCES content (content_ID);

-- customer foreign keys
ALTER TABLE customers
ADD FOREIGN KEY (membership_ID)
REFERENCES membership (membership_ID);

ALTER TABLE customers
ADD FOREIGN KEY (workout_ID)
REFERENCES workouts (workout_ID);

ALTER TABLE customers
ADD FOREIGN KEY (class_ID)
REFERENCES classes (class_ID);

-- class foreign keys
ALTER TABLE classes
ADD FOREIGN KEY (customer_ID)
REFERENCES customers (customer_ID);

ALTER TABLE classes
ADD FOREIGN KEY (membership_ID)
REFERENCES membership (membership_ID); 