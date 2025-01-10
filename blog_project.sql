-- Active: 1736490110843@@127.0.0.1@3306@blogs
CREATE TABLE Authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Blogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(id) ON DELETE CASCADE
);

-- Authors Table: --
-- Create: Add a new author
INSERT INTO authors (author_name) VALUES ("John Doe");

-- Read: Retrieve all authors
SELECT * FROM authors;

-- Read: retrieve a specific author by their ID
SELECT * FROM authors WHERE id = 3;

-- Update: update an author’s name
UPDATE authors SET author_name = "Jasim Doe" WHERE id = 2;


-- Delete: delete an author by their ID
DELETE FROM authors WHERE id = 1;

-- Categories Table--

-- Create: add a new category
INSERT INTO categories (category_name) VALUES ("My Category");

-- Read: retrieve all categories
SELECT * FROM categories;


-- Read: retrieve a specific category by its ID
SELECT * FROM categories WHERE id = 5

-- Update: update a category’s name
UPDATE categories SET category_name = "Our Category" WHERE id = 1;

-- Delete: delete a category by its ID
DELETE FROM categories WHERE id = 1;

--blogs Table--

-- Create: Add a new blog
INSERT INTO blogs (title, body, category_id, author_id) 
VALUES ("My Blog", "My blog's content", 2, 2)


-- Read: Retrieve all blogs
SELECT * FROM blogs;

-- Read: Retrieve a specific blog by ID
SELECT * FROM blogs WHERE id = 1;

--Retrieve blogs with their category and author information
SELECT blogs.title, blogs.body, categories.category_name, authors.author_name
FROM blogs
JOIN categories ON blogs.category_id = categories.id
JOIN authors ON blogs.author_id = authors.id;

-- Update: Update a blog's title
UPDATE blogs SET title = "My Updated Blog Title" WHERE id = 1;


-- Update: Update a blog's category or author
UPDATE blogs SET category_id = 4, author_id = 2 WHERE id = 10

-- Delete: Delete a blog by ID
DELETE FROM blogs WHERE id=1;


-- To get all blogs written by a specific author:
SELECT authors.author_name, blogs.title, blogs.body
FROM blogs
JOIN authors ON blogs.author_id = authors.id
WHERE authors.id = 2;

-- To get all blogs under a specific category:
SELECT categories.category_name, blogs.title, blogs.body
FROM blogs
JOIN categories ON blogs.category_id = categories.id
WHERE categories.category_name = "Travel";