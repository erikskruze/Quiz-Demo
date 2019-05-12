-- Table Quiz
CREATE TABLE IF NOT EXISTS quiz_app.quiz  (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(250) NOT NULL
);
ALTER TABLE quiz_app.quiz AUTO_INCREMENT=1;

-- Table Question
CREATE TABLE IF NOT EXISTS quiz_app.question  (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	text TEXT NOT NULL,
	quiz_id BIGINT NOT NULL,

	CONSTRAINT question_quiz_id_fk		
	FOREIGN KEY (quiz_id) 
	REFERENCES quiz_app.quiz (id) 
	ON DELETE CASCADE			-- automaticaly delete questions as well if quiz is going to be removed
	ON UPDATE CASCADE
);
ALTER TABLE quiz_app.question AUTO_INCREMENT=1;

-- Table Answer
CREATE TABLE IF NOT EXISTS quiz_app.answer  (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	text TEXT NOT NULL,
	is_correct TINYINT(1) NOT NULL COMMENT "Is this correrct answer? 0 - False, anything else - True",	-- bit faster than bool with its preprocessing
	question_id BIGINT NOT NULL,

	CONSTRAINT answer_question_id_fk		
	FOREIGN KEY (question_id) 
	REFERENCES quiz_app.question (id) 
	ON DELETE CASCADE			-- automaticaly delete answers as well if question is going to be removed
	ON UPDATE CASCADE
);
ALTER TABLE quiz_app.question AUTO_INCREMENT=1;

-- Table User
CREATE TABLE IF NOT EXISTS quiz_app.user  (
	id BIGINT AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(200) NOT NULL,
	UNIQUE KEY unique_user_name (name) 	-- for future if a lot users to speed up search by username
);
ALTER TABLE quiz_app.user AUTO_INCREMENT=1;

-- Table Quiz_Session
-- TODO quiz_session (id, user_id, quiz_id, correct_answers)

-- Table Quiz_Session_Answers
-- TODO quiz_session_answers (question_id, answer_id, quiz_session_id)
