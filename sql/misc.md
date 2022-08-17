# Notes in bulk

## Structured data
* It solves the limitation of unstructured data
* When it comes to retrieving information from unstructured data, it is rather difficult and the difficulty compounds as the size of the data becomes larger (like finding your old favorite book in a bookshelf that has no sensible structure)
* Benefit: easy retrieval and management

## Database
* A structured set of data held in a computer, for instance a spreadsheet.
* The whole of __spreadsheet__ can be thought of as the database and each individual __worksheet__ can be thought of as a table (relation). 

## Relational Database
* A database organized according to the relational model of data. Basically, relational model defines a set of relations (tables) and the relationship between them to determine how they interact. 
* Requires prior setting up the architecture
* Best suited when the data is of predictably limited kinds. 
* Using a relational database helps us to cut down on duplicated data and provides a much more useful data structure for us to interact with.

## RDBSM
> A relational database management system, or RDBMS, is essentially a software application, or system, for managing relational databases. An RDBMS allows a user, or another application, to interact with a database by issuing commands using syntax that conforms to a certain set of conventions or standards. [source](https://launchschool.com/books/sql/read/introduction)
* All RDBMSes share the same underlying language: SQL.

## SQL
* Originated with E.F.Codd (1970) "A relational model for large data banks".
>SQL is a language used to manipulate the structure and values of datasets stored in a relational database. It is described as a __special purpose language__ because it is typically used only for a very specific purpose: interacting with relational databases. [source](https://launchschool.com/lessons/a1779fd2/assignments/7673d9a9)

> SQL is a __declarative language__; when you write an SQL statement you describe what needs to be done, but not exactly how to do it -- the exact details of how the query is executed are handled internally by the RDBMS you are using. 

> Creating a well-designed database is like laying the foundations of a house, and learning SQL and relational database concepts will help you build your applications on a strong foundation. Since databases are such a key part of almost all web applications, understanding the language of databases and how they work is a vital step towards becoming a well-rounded web-developer.
> [source](https://launchschool.com/books/sql/read/introduction)

### PSQL console
1. Metacommands
   > The syntax for a psql console meta-command is a backslash \ followed by the command and any optional arguments. Meta-commands can be used for a number of different things, such as connecting to a different database (\c), listing tables (\l), describing the structure of a particular table (\d table_name), setting environment variables, and so on.

2. SQL statement
   * Issued to the database using SQL syntax.

### SQL Sub-languages
1. DDL: Data Definition Language: 
   * Used to define the structure of a database and the tables and the columns.
   * CREATE/ALTER/DROP TABLE
2. DML: Data Manipulation Language: SELECT/UPDATE/DELETE
   * Used to retrieve or modify data stored in a database
   * SELECT, UPDATE, DELETE
3. DCL: Data Control Language: 
   * Used to manage permissions to various users, such as determining what they are allowed to do when interaction with a database.
   * GRANT/REVOKE

### Describiing SQL code
```sql
SELECT * FROM orders;
```
This is a select statment. The wild card character (*) acts as an identifier for all the columns. The `FROM` clause is used to identify the table `orders`. In absence of any further clause, the statement selects all the rows and all the columns from the `orders` table.

### Altering a table
* This falls within altering the __schema__ of the table.

```sql
ALTER TABLE table_namee
      stuff_to_change
      additional_arguments;
```

### Data Manipulation Statements
1. INSERT
2. SELECT
3. UPDATE
4. DELETE

### CRUD operation
1. Create
2. Read
3. Update
4. Delete

```sql
ERROR:  invalid input syntax for integer: "John Smith"
LINE 1: INSERT INTO users VALUES ('John Smith', false);
```
We get this kind of error because
(1) we did not specify the column names after `users`
(2) POSTGreSQL attempts to insert 'John Smith' into the first column that has the data type `integer`.

### Operators

1. Comparison operators and comparison predicates
2. Logical
3. String matching

### Functions

__String Functions__

```sql
SELECT trim(leading ' ' from '   hello  '); --'hello  '
SELECT trim(trailing ' ' from ' ); --'   hello'
```