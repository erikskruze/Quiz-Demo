# Quiz-Demo
WEB page with PHP microservices

(!) I use Tab with 8 in my editor. Just in case if you use some other configuration and code indentation in your 
editor looks strange. 

Description of directory structure:

	_dump_db - Folder with db dumps. If you will choose to cerate db from dump then its here. 
			Dumps created with mysqldump tool. 
	_setup_db - Scripts to drop and create database from schema and data file. 
			There are two scripts: 
				* _drop_db.sh - to drop database. 
				* _setup_db.sh - to create databae. 
			Before using scrips should be used set_env.sh script. 
			Please don't forget to modify set_env.sh if default values does not fit for you.
	API - Quiz API is located here.
	API/Config - contains classes related with connections and configurations. 
			At the moment only Database class. 
	API/Helper - contains misc helper classes. 
			At the moment only Autoloader class.
	API/Object - contains classes directly related with this API business needs.
			At the moment classes for database tables. 
			(!) At the moment +/- finished is only Quiz class. Othere classes are under development. 
	API/quiz - contains APIs related with Quiz. quiz/name, quiz/question and quiz/result all are as microservices.
			(!) At the moment +/- finshed is only quiz/name API.
			quiz/name - API is returning in JSON format list with all available quizzes.
			quiz/question - API will return in JSON format:
				1) if input (in JSON format) contains user_id, quiz_id, question_id and answer_id 
					then:
					* will check is answer correct
					* will store data in db tables quiz_session and quiz_session_answers 
					* will return next question with awailable answers
				2) if input (in JSON format) contains only user_id and quiz_id then:
					* will check if quiz_session table does not contain already such pair
						and if does not contain then will store
					* will return first question with available answers from this quiz
			quiz/result - API will receive as input on JSON format user_id and quiz_id. 
				As autput will return in JSON format user.name, quiz_sessioon.correct_answers 
				and count of questions in this quiz. 
	WEB - WEB pages (!) Not ready. 
	WEB/index.php - WEB page that by using http POST will call APIs.
				in following order: 
					* quiz/name - for initial screen. User is chooses quiz
					* quiz/question - for screen where user progesses quiz
					* quiz/result - for screen where user receives result

	set_env.sh - script that sets environment variables required for API and _set_db 



How to use this sample:

	1) Modify set_env.sh for your needs
	vim set_env.sh

	2) Set up database
	. set_env.sh
	cd ./_setup_db/
	./_setup_db.sh
	cd ..

	3) Run API (sample by using built-in php web server and by using port 8081)
	. set_env.sh
	php -S localhost:8081 -t ./API/

	(!) If you will test this demo app on Apache don't forget about envrionments 
	( should be placed in /etc/apache2/envvars from set_env.sh)

	4) Run WEB page. (sample by using built-in php web server and by using port 8080)
	. set_env.sh 
	php -S localhost:8080 -t ./WEB/

That's it!





