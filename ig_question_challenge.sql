-- we wanna reward our users who have been around the 5 longest
USE ig_clone_user;
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;
-- find the most registered day
SELECT DAYNAME(created_at) AS week_day,
    COUNT(*) AS registers
FROM users
GROUP BY week_day
ORDER BY registers DESC
LIMIT 2;
-- find the user who never post a photo(inactive user normal in real world)
SELECT username
FROM photos
    RIGHT JOIN users ON photos.user_id = users.id
WHERE image_url IS NULL;
-- a contest to see who can get the most likes on single photo
SELECT photos.id,
    photos.image_url,
    (
        SELECT username
        FROM users
        WHERE users.id = photos.user_id
    ) AS username,
    COUNT(*) AS like_count
FROM likes
    INNER JOIN photos ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY like_count DESC
LIMIT 1;
-- UNION
-- SELECT username
-- FROM users
--     INNER JOIN photos ON photos.user_id = users.id
-- WHERE users.id = photos.user_id
-- GROUP BY username;
-- Investor wanna know how many time does the average user post
SELECT COUNT(*) /(
        SELECT COUNT(*)
        FROM users
    ) AS "Average of user's posts"
FROM photos;
-- SELECT user_id,
--     COUNT(*)
-- FROM photos
--     RIGHT JOIN users ON photos.user_id = users.id
-- GROUP BY user_id;
--
-- FIND the most popular hashtags for advertising
-- INNER JOIN photos ON photo_tags.photo_id = photos.id
SELECT tag_name,
    COUNT(*) AS tag_amount
FROM photo_tags
    INNER JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY tag_amount DESC
LIMIT 6;
-- FIND the users who have liked every single photots on the site
SELECT username,
    IF(
        COUNT(username) = (
            SELECT COUNT(*)
            FROM photos
        ),
        'TRUE',
        'FALSE'
    ) AS "user like every photo"
FROM likes
    INNER JOIN users ON likes.user_id = users.id
GROUP BY username
HAVING COUNT(username) = (
        SELECT COUNT(*)
        FROM photos
    ) = 1;
