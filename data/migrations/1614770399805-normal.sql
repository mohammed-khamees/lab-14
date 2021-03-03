<!-- Query 1: create a second table -->

CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

<!--Query 2:  use a simple subquery to retrieve unique author values from the books table and insert each one into the authors table  -->

INSERT INTO authors(name) SELECT DISTINCT author FROM books;

<!-- Query 3: add a column to the books table named author_id  -->

ALTER TABLE books ADD COLUMN author_id INT;

<!-- Query 4:  prepare a connection between the two tables -->
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

<!-- Query 5:  modify the books table by removing the column named author  -->

ALTER TABLE books DROP COLUMN author;

<!-- Query 6:  modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table. -->

ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);