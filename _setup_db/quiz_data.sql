-- Seeding Quiz table
INSERT INTO quiz_app.quiz (id, name) VALUES 
(1, "Test 1"),
(2, "Test 2"),
(3, "Test 3"),
(4, "Test 4"),
(5, "Test 5"),
(6, "Test 6"),
(7, "Test 7"),
(8, "Test 8"),
(9, "Test 9"),
(10, "Test 10");

-- Seeding Question table
INSERT INTO quiz_app.question  (id, text, quiz_id) VALUES 
(1, "Question 1.1", 1),
(2, "Question 1.2", 1),
(3, "Question 2.1", 2),
(4, "Question 2.2", 2),
(5, "Question 2.3", 2),
(6, "Question 2.4", 2),
(7, "Question 2.5", 2),
(8, "Question 2.6", 2),
(9, "Question 2.7", 2),
(10, "Question 2.8", 2),
(11, "Question 2.9", 2),
(12, "Question 2.10", 2),
(13, "Question 3.1", 3),
(14, "Question 3.2", 3),
(15, "Question 4.1", 4),
(16, "Question 4.2", 4);

-- Seeding Answer table
INSERT INTO quiz_app.answer  (id, text, is_correct, question_id) VALUES 
(1, "Answer 1.1.1", 0, 1),
(2, "Answer 1.1.2 (correct)", 1, 1),
(3, "Answer 1.2.1", 0, 1),
(4, "Answer 1.2.2", 0, 1),
(5, "Answer 1.2.3", 0, 1),
(6, "Answer 1.2.4", 0, 1),
(7, "Answer 1.2.5 (correct)", 1, 1),
(8, "Answer 1.2.6", 0, 1),
(9, "Answer 1.2.7", 0, 1),
(10, "Answer 1.2.8", 0, 1),
(11, "Answer 1.2.9", 0, 1),
(12, "Answer 1.2.10", 0, 1),
(13, "Answer 1.2.11", 0, 1);

-- Seeding User table
INSERT INTO quiz_app.user (id, name) VALUES 
(1, "User 1"),
(2, "User 2"),
(3, "User 3"),
(4, "User 4"),
(5, "User 5"),
(6, "User 6"),
(7, "User 7"),
(8, "User 8"),
(9, "User 9"),
(10, "User 10");