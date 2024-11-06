# 환경
- JDK17, Java EE
- Tomcat 10.1
- Bootstrap 4.0.0, JQuery 3.3.1, popper 1.x


# 데이터베이스
- Mysql

## 테이블 생성
use lecture_evaluation;

CREATE TABLE user(
	user_id VARCHAR(20) PRIMARY KEY,
    user_password VARCHAR(20),
    user_email VARCHAR(50),
    user_email_hash VARCHAR(64),
    user_email_checked BOOLEAN
);

CREATE TABLE evaluation(
    evaluation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(20),
    lecture_name VARCHAR(50),
    professor_name VARCHAR(20),
    lecture_year INT,
    semester_divide VARCHAR(20),
    lecture_divide VARCHAR(10),
    evaluation_title VARCHAR(50),
    evaluation_content VARCHAR(2048),
    total_score VARCHAR(5),
    credit_score VARCHAR(5),
    comfortable_score VARCHAR(5),
    lecture_score VARCHAR(5),
    like_count INT
);

CREATE TABLE likey(
	user_id VARCHAR(20),
    evaluation_id INT,
    user_ip VARCHAR(50)
);
