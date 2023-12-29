-- create table books

CREATE TABLE `type19_db`.`books` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `title` VARCHAR(255) NOT NULL , 
  `author` VARCHAR(255) NOT NULL , 
  `year` YEAR NOT NULL , 
  `cat_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`book_id`)) ENGINE = InnoDB;

-- create table categories
-- cat_id, category, book_id
CREATE TABLE `type19_db`.`categories` (
  `cat_id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `category` VARCHAR(255) NOT NULL , 
  PRIMARY KEY (`cat_id`)) ENGINE = InnoDB;

--add categories
INSERT INTO `categories` (`category`) 
VALUES 
('Comedy'), 
('Thriller'),
('Fantasy'),
('Detective'),
('Spiritual');

-- add books
INSERT INTO `books` (`title`, `author`, `year`, `cat_id`) 
VALUES 
('Book about Crime', 'James Band', '2014', '4'),
('1984', 'James Carr', '1984', '2'),
('Little Prince', 'Jane Dow', '1999', '3'),
('War and Peace', 'James Band', '1965', '2');


-- books with categories

SELECT `book_id`, `title`,`author`,`year`, categories.category  
FROM `books`
INNER JOIN categories
ON books.cat_id=categories.cat_id;

SELECT book_id, title, author,year, categories.category, isDeleted
FROM books
JOIN categories
ON books.cat_id=categories.cat_id
WHERE isDeleted=0


-- sukurti post_comments 
-- comm_id, content, post_id, author
CREATE TABLE `type19_db`.`post_comments` (
  `comm_id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `author` VARCHAR(255) NOT NULL , 
  `content` TEXT NOT NULL , 
  `post_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`comm_id`)) ENGINE = InnoDB;

-- irasyti bent 3 komentarus 
-- parasyti sql kuris atvaizduoja post title ir autoriu ir komentraro autoriu ir contenta
SELECT posts.title, posts.author, post_comments.author AS `comment author`, 
post_comments.content AS comment, post_comments.created_at AS `commented time`
FROM posts
JOIN post_comments
ON posts.post_id=post_comments.post_id