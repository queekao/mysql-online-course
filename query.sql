CREATE DATABASE ig_clone_user;
USE ig_clone_user;
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT chk_email CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    ),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP,
    comment_id INT NOT NULL,
    FOREIGN KEY(comment_id) REFERENCES comments(id)
);
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);
-- this comment relate to specific photo
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    photo_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);
CREATE TABLE likes (
    -- Some one who like the photo and only photo 
    -- id INT AUTO_INCREMENT PRIMARY KEY,
    -- is_like BOOLEAN NOT NULL DEFAULT 0,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    photo_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    created_at TIMESTAMP DEFAULT NOW(),
    -- UNIQUE (photo_id, user_id)
    PRIMARY KEY(user_id, photo_id)
);
-- a table with two different id refer to users (one way relationship)
CREATE TABLE follows(
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    -- deleted_at TIMESTAMP DEFAULT NOW() ON DELETE CURRENT_TIMESTAMP,
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);
CREATE TABLE hashtags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE followes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    is_following BOOLEAN NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE followees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    is_following BOOLEAN NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
-- INSERT INTO users(username, email)
-- VALUES('queekao', 'azxcvbnm512@yahoo.com'),
--     ('clotSteel', 'idontknow@gmail.com');
-- INSERT INTO photos(image_url, user_id)
-- VALUES('/123', 1),
--     ('/1234', 2),
--     ('/12345', 1);
-- INSERT INTO comments(comment_text, user_id, photo_id)
-- VALUES ('Meow!', 1, 2),
--     ('Amazing Shot!', 3, 2),
--     ('I < 3 this', 2, 1);
-- INSERT INTO likes(user_id, photo_id)
-- VALUES (1, 2),
--     (1, 1),
--     (2, 1),
--     (3, 3);
-- INSERT INTO follows(follower_id, followee_id)
-- VALUES(1, 2),
--     (1, 3),
--     (3, 1),
--     (2, 3);