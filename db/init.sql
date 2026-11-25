
CREATE DATABASE IF NOT EXISTS fitness_db;

USE fitness_db;


-- MEMBERSHIP TABLE
CREATE TABLE membership (
    membership_ID INT AUTO_INCREMENT PRIMARY KEY,
    class_ID INT NOT NULL,
    customer_ID INT NOT NULL,
    membership_status CHAR(50) NOT NULL,
    benefits CHAR(50) NOT NULL
);


-- CONTENT TABLE
CREATE TABLE content (
    content_ID INT AUTO_INCREMENT PRIMARY KEY,
    workout_ID INT NOT NULL,
    membership_ID INT NOT NULL,
    video_length INT NOT NULL,
    video_quality INT NOT NULL,
    video_type CHAR(50) NOT NULL
);


-- WORKOUTS TABLE
CREATE TABLE workouts (
    workout_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NOT NULL,
    content_ID INT NOT NULL,
    workout_name CHAR(50) NOT NULL,
    workout_length INT NOT NULL,
    workout_type CHAR(50) NOT NULL
);


-- CUSTOMERS TABLE
CREATE TABLE customers (
    customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    membership_ID INT NOT NULL,
    class_ID INT NOT NULL,
    workout_ID INT NOT NULL,
    customer_name CHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL
);


-- CLASSES TABLE
CREATE TABLE classes (
    class_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NOT NULL,
    membership_ID INT NOT NULL,
    class_date DATE NOT NULL,
    teacher_name CHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);
