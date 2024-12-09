CREATE DATABASE CP;
USE CP;

-- Create the students table
CREATE TABLE students (
    PRN INT NOT NULL,
    Name VARCHAR(255),
    Year INT,
    Mail VARCHAR(255),
    GitHub VARCHAR(255),
    LinkedIn VARCHAR(255),
    Bio TEXT,
    PRIMARY KEY (PRN)
);

-- Create the domains table
CREATE TABLE domains (
    D_ID INT NOT NULL,
    Domain VARCHAR(255),
    PRIMARY KEY (D_ID)
);

-- Create the expertise table
CREATE TABLE expertise (
    PRN INT NOT NULL,
    Expertise INT NOT NULL,
    FOREIGN KEY (PRN) REFERENCES students (PRN),
    FOREIGN KEY (Expertise) REFERENCES domains (D_ID)
);

-- Create the questions table
CREATE TABLE questions (
    Q_ID INT NOT NULL,
    Domain INT,
    PRN INT NOT NULL,
    Timestamp TIMESTAMP NOT NULL,
    Question TEXT NOT NULL,
    FOREIGN KEY (PRN) REFERENCES students (PRN),
    FOREIGN KEY (Domain) REFERENCES domains (D_ID),
    PRIMARY KEY (Q_ID)
);

-- Create the answers table
CREATE TABLE answers (
    Q_ID INT NOT NULL,
    A_ID INT NOT NULL,
    PRN INT NOT NULL,
    Timestamp TIMESTAMP NOT NULL,
    Answer TEXT NOT NULL,
    AvgRating DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (PRN) REFERENCES students (PRN),
    FOREIGN KEY (Q_ID) REFERENCES questions (Q_ID),
    PRIMARY KEY (A_ID)
);

-- Create the reviews table
CREATE TABLE reviews (
    A_ID INT NOT NULL,
    PRN INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (A_ID) REFERENCES answers (A_ID),
    FOREIGN KEY (PRN) REFERENCES students (PRN)
);

-- Insert data into the domains table
INSERT INTO domains (D_ID, Domain) VALUES
(1, 'Leadership'),
(2, 'Time management'),
(3, 'Public Speaking'),
(4, 'OOPs'),
(5, 'DBMS'),
(6, 'IoT and Blockchain'),
(7, 'DSA'),
(8, 'Web Development'),
(9, 'App Development'),
(10, 'AI/ML/DS'),
(11, 'Other');

INSERT INTO students (PRN, Name, Year, Mail, GitHub, LinkedIn)
VALUES
(12211315, 'John Doe', 1, 'ab.cd221@vit.edu', 'https://github.com/johndoe', 'https://linkedin.com/in/johndoe'),
(12211318, 'Jane Smith', 2, 'ef.gh22@vit.edu', 'https://github.com/janesmith', 'https://linkedin.com/in/janesmith'),
(12211320, 'Michael Johnson', 4, 'kl.mn223@vit.edu', 'https://github.com/michaeljohnson', 'https://linkedin.com/in/michaeljohnson'),
(12211325, 'Emily White', 3, 'op.qr224@vit.edu', 'https://github.com/emilywhite', 'https://linkedin.com/in/emilywhite'),
(12211330, 'Robert Brown', 1, 'st.uv225@vit.edu', 'https://github.com/robertbrown', 'https://linkedin.com/in/robertbrown'),
(12211335, 'Olivia Davis', 4, 'wx.yz226@vit.edu', 'https://github.com/oliviadavis', 'https://linkedin.com/in/oliviadavis'),
(12211340, 'William Wilson', 3, 'ab.cd227@vit.edu', 'https://github.com/williamwilson', 'https://linkedin.com/in/williamwilson'),
(12211345, 'Sophia Martinez', 2, 'ef.gh228@vit.edu', 'https://github.com/sophiamartinez', 'https://linkedin.com/in/sophiamartinez'),
(12211350, 'Liam Taylor', 1, 'kl.mn229@vit.edu', 'https://github.com/liamtaylor', 'https://linkedin.com/in/liamtaylor'),
(12211355, 'Ava Anderson', 3, 'op.qr230@vit.edu', 'https://github.com/avaanderson', 'https://linkedin.com/in/avaanderson');

-- Insert data into the expertise table
INSERT INTO expertise (PRN, Expertise) VALUES
(12211315, 1),  -- John Doe - Leadership
(12211315, 3), 
(12211318, 3),  -- Jane Smith - Public Speaking
(12211318, 4), 
(12211320, 8),  -- Michael Johnson - Web Development
(12211320, 5),
(12211325, 5),  -- Emily White - DBMS
(12211325, 6),
(12211330, 2),  -- Robert Brown - Time Management
(12211330, 7),
(12211335, 6),  -- Olivia Davis - IoT and Blockchain
(12211335, 8),
(12211340, 10), -- William Wilson - AI/ML/DS
(12211340, 9),
(12211345, 7),  -- Sophia Martinez - DSA
(12211345, 10),
(12211350, 9),  -- Liam Taylor - App Development
(12211350, 11),
(12211355, 11), -- Ava Anderson - Other
(12211355, 1),
(12211355, 2),
(12211355, 5);

INSERT INTO questions (Q_ID, Domain, PRN, Timestamp, Question)
VALUES
(1, 4, 12211315, '2023-08-15 09:30:00', 'How does encapsulation work in OOP?'),
(2, 8, 12211318, '2023-08-15 10:15:00', 'What are the key concepts of web development?'),
(3, 5, 12211320, '2023-08-15 11:00:00', 'Explain the normalization process in DBMS.'),
(4, 7, 12211325, '2023-08-15 12:00:00', 'How do you implement a stack using arrays?'),
(5, 9, 12211330, '2023-08-15 13:30:00', 'What are the main components of a mobile app?'),
(6, 6, 12211335, '2023-08-15 14:45:00', 'Discuss the applications of IoT and Blockchain.'),
(7, 10, 12211340, '2023-08-15 15:30:00', 'What\'s the difference between AI, ML, and Data Science?'),
(8, 3, 12211345, '2023-08-15 16:00:00', 'How can I improve my public speaking skills?'),
(9, 2, 12211350, '2023-08-15 16:45:00', 'Share tips for effective time management.'),
(10, 1, 12211355, '2023-08-15 17:30:00', 'What are the qualities of a good leader?');

INSERT INTO answers (Q_ID, A_ID, PRN, Timestamp, Answer)
VALUES
(1, 1, 12211318, '2023-08-15 10:45:00', 'Encapsulation in OOP refers to...'),
(1, 2, 12211315, '2023-08-15 11:15:00', 'Encapsulation ensures...'),
(2, 3, 12211320, '2023-08-15 11:45:00', 'Web development encompasses...'),
(3, 4, 12211325, '2023-08-15 12:30:00', 'Normalization in DBMS is the process of...'),
(3, 5, 12211330, '2023-08-15 13:00:00', 'Normalization helps in reducing...'),
(4, 6, 12211335, '2023-08-15 14:00:00', 'A stack can be implemented using arrays...'),
(4, 7, 12211340, '2023-08-15 14:30:00', 'Arrays provide a simple and efficient...'),
(5, 8, 12211345, '2023-08-15 15:00:00', 'Mobile app components include...'),
(5, 9, 12211350, '2023-08-15 15:30:00', 'User interface design, backend services...'),
(6, 10, 12211355, '2023-08-15 16:00:00', 'IoT and Blockchain have various applications...');

INSERT INTO reviews (A_ID, PRN, Rating, Comment, Timestamp)
VALUES
(1, 12211315, 5, 'Great explanation!', '2023-08-16 09:00:00'),
(1, 12211318, 4, 'Helpful answer.', '2023-08-16 09:15:00'),
(2, 12211320, 4, 'Clear and concise.', '2023-08-16 10:00:00'),
(3, 12211325, 5, 'Detailed response, thank you!', '2023-08-16 10:30:00'),
(3, 12211330, 4, 'Could use more examples.', '2023-08-16 11:00:00'),
(4, 12211335, 5, 'Explained well, thank you!', '2023-08-16 11:30:00'),
(4, 12211340, 3, 'Could be more detailed.', '2023-08-16 12:00:00'),
(5, 12211345, 5, 'Great overview of app components.', '2023-08-16 12:30:00'),
(5, 12211350, 4, 'Could include more backend details.', '2023-08-16 13:00:00'),
(6, 12211355, 5, 'Informative, thanks!', '2023-08-16 13:30:00');

DELIMITER &&
CREATE PROCEDURE firstProcedure()
BEGIN
SELECT * FROM students;
INSERT INTO students(PRN, Name, Year, Mail, Github, LinkedIn, Bio)
VALUES
(12210811, "Aabha Lokhande", 2, "aabha.lokhande22@vit.edu", "...", "---", NULL),
(12210428, "Aditya Adaki", 2, "aditya.adaki22@vit.edu", "...", "---", NULL);
SELECT * FROM students;
DELETE FROM students WHERE PRN = 12211315;
SELECT * FROM students;
END;
&& DELIMITER;

DELIMITER &&
CREATE PROCEDURE secondProcedure()
BEGIN
SELECT COUNT(Year) AS noStudents FROM students WHERE Year = 3;
END;
&& DELIMITER;

USE CP;
CALL firstProcedure();
CALL secondProcedure();

DELIMITER //
CREATE TRIGGER update_answer_avg_rating
AFTER INSERT ON reviews
FOR EACH ROW
BEGIN
    DECLARE total_ratings INT;
    DECLARE total_rating_value DECIMAL(5, 2);

    SELECT COUNT(*), SUM(Rating)
    INTO total_ratings, total_rating_value
    FROM reviews
    WHERE A_ID = NEW.A_ID;

    IF total_ratings > 0 THEN
        UPDATE answers
        SET AvgRating = total_rating_value / total_ratings
        WHERE A_ID = NEW.A_ID;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_answer_avg_rating_after_update
AFTER UPDATE ON reviews
FOR EACH ROW
BEGIN
    DECLARE total_ratings INT;
    DECLARE total_rating_value DECIMAL(5, 2);

    SELECT COUNT(*), SUM(Rating)
    INTO total_ratings, total_rating_value
    FROM reviews
    WHERE A_ID = NEW.A_ID;

    IF total_ratings > 0 THEN
        UPDATE answers
        SET AvgRating = total_rating_value / total_ratings
        WHERE A_ID = NEW.A_ID;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_answer_avg_rating
AFTER DELETE ON reviews
FOR EACH ROW
BEGIN
    -- Declare variables to store total ratings and total rating value
    DECLARE total_ratings INT;
    DECLARE total_rating_value DECIMAL(5, 2);

    SELECT COUNT(*), SUM(Rating)
    INTO total_ratings, total_rating_value
    FROM reviews
    WHERE A_ID = OLD.A_ID;

    IF total_ratings > 0 THEN
        UPDATE answers
        SET AvgRating = total_rating_value / total_ratings
        WHERE A_ID = OLD.A_ID;
    ELSE
        UPDATE answers
        SET AvgRating = NULL
        WHERE A_ID = OLD.A_ID;
    END IF;
END;
//
DELIMITER ;

UPDATE reviews
SET Rating = 4
WHERE A_ID = 1;