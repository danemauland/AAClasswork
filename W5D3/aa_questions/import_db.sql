DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Jane', 'Doe'),
    ('Chris', 'Lopez'),
    ('Christene', 'Adams');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('title1', 'question1', 1),
    ('title2', 'question2', 2),
    ('title3', 'question3', 3),
    ('title4', 'question4', 1),
    ('title5', 'question5', 2),
    ('title6', 'question6', 3);

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (1,2),
    (1,4),
    (2,3),
    (2,6),
    (3,1),
    (3,2);

INSERT INTO
    replies (question_id, parent_id, user_id, body)
VALUES
    (1, NULL, 2, "body1"),
    (1, 1, 1, "body2"),
    (3, NULL, 1, "body3");

INSERT INTO
    question_likes (user_id, question_id)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (1,2),
    (1,4),
    (2,3),
    (2,6),
    (3,1),
    (3,2);
