CREATE DATABASE TestInternship;

CREATE TABLE users 
 (
  id SERIAL,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(30) NOT NULL,
  email VARCHAR(20) NOT NULL,
  PRIMARY KEY(id)
  );

CREATE TABLE articles 
  (
  id SERIAL,
  user_id SERIAL,
  title VARCHAR(20) NOT NULL,
  content VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
  );

CREATE TABLE comments 
  (
  id SERIAL,
  user_id SERIAL NOT NULL,
  article_id SERIAL NOT NULL,
  content VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (article_id) REFERENCES articles (id)
  );

INSERT INTO users (username, password, email)
VALUES ('Yulii', 'password', 'yuliia@gmail.com');

INSERT INTO users (username, password, email)
VALUES ('Olha', 'qwerty12.08', 'olhaa@gmail.com');

INSERT INTO users (username, password, email)
VALUES ('Vlad', '12345pass', 'vladislav@gmail.com');

INSERT INTO articles (user_id, title, content)
VALUES (2, 'First title', 'Something interesting');

INSERT INTO articles (user_id, title, content)
VALUES (1, 'Second title', 'Text...');

INSERT INTO articles (user_id, title, content)
VALUES (3, 'Third title', 'qwerty:)');

INSERT INTO comments (user_id, article_id, content)
VALUES (1, 2, 'Good article');

INSERT INTO comments (user_id, article_id, comment_content)
VALUES (2, 3, 'Cool text');

INSERT INTO comments (user_id, article_id, comment_content)
VALUES (1, 2, 'My comment');

INSERT INTO comments (user_id, article_id, comment_content)
VALUES (3, 1, 'nice work');

UPDATE users
SET username = 'Nazar' WHERE id = 3;

UPDATE articles
SET content = 'Sweet dreams' WHERE id = 2;

UPDATE comments
SET content = 'Good night' WHERE article_id = 2 ;

UPDATE comments
SET content = 'Good night' WHERE article_id = 2 ;

ALTER TABLE comments 
RENAME COLUMN content TO comment_content;

ALTER TABLE articles
ADD updated_at TIMESTAMP NOT NULL 
DEFAULT NOW();

SELECT * FROM users;
SELECT * FROM articles;
SELECT * FROM comments;

SELECT COUNT(*) AS sum_articles FROM articles
WHERE id = 1;

SELECT email, title, comment_content  FROM comments
LEFT JOIN users
ON user_id = users.id
LEFT JOIN articles
ON users.id = articles.id;