### Relational Database 	
A structured collection of data that follows the relational model.

### RDBMS 	
Relational Database Management System. A software application for managing relational databases, such as PostgreSQL, MySQL, SQLite.

### Relation 	
A set of individual but related data entries; analogous to a database table.

### SQL 	
Structured Query Language. The language used by RDBMSs.

### SQL Statement 	
A SQL command used to access/use the database or the data within that database via the SQL language.

### SQL query 	
A subset of a "SQL Statement". A query is a way to search, or lookup data within a database, as opposed to updating or changing data.

### Schema
> Schema is concerned with the structure of a database. This structure is defined by things such as the names of tables and table columns, the data types of those columns and any constraints that they may have.

### Data
> Data is concerned with the contents of a database. These are the actual values associated with specific rows and columns in a database table.

### Data Type
A data type classifies particular values that are allowed for that column. It specifies the kind of values permitted in that column. If a conversion is possible, then it will insert the converted value. For instance, if the data type is integer, but you enter a decimal value, then the value will be converted into an integer. Likewise, if the data type is integer and you input a number as a string, it will convert the string into a number. But if a conversion is not possible, then it will throw an error: `invalid input syntax for type` For instance, if you try to input a different data type, say input text ('hello') in a column with integer data type, it will throw an error. Thus, it offers a layer of protection from an invalid data being entered as a value.

### Constraints
> One of the key functions of a database is to maintain the integrity and quality of the data that it is storing. Keys and Constraints are rules that define what data values are allowed in certain columns. They are an important database concept and are part of a database's schema definition. Defining Keys and Constraints is part of the database design process and ensures that the data within a database is reliable and maintains its integrity. Constraints can apply to a specific column, an entire table, more than one table, or an entire schema. [source](https://launchschool.com/books/sql/read/create_table)

### serial
> serial is a special [pseudo] data type available in PostgreSQL. It uses the integer data type along with a DEFAULT constraint and a function called nextval which keeps a track of the current highest value and increments this by one to be used as the next value.[source](https://launchschool.com/books/sql/read/create_table)
* Imposes a NOT NULL constraint.

### Normalization
The process of splitting up data into different tables to remove duplication and improve data integrity is known as normalization.

1. The reason for normalization is to reduce redundancy in data and improve data integrity (update anomaly, insertion anomaly, delete anomaly)
2. Normalization is performedd by splitting the data across multiple tables and defining the relationships between them

### Database Design
> At a high level, the process of database design involves defining entities to represent different sorts of data and designing relationships between those entities.

### ERD-Entity Relationship Diagram
> An ERD is a graphical representation of entities and their relationships to each other, and is a commonly used tool within database design.

### Keys
> Keys are a special type of constraint used to establish relationships and uniqueness. They can be used to identify a specific row in the current table, or to refer to a specific row in another table. 

> A key uniquely identifies a single row in a database table.

> A __Primary Key__ is a unique identifier for a row of data.

> A __natural key__ is an existing value in a dataset that can be used to uniquely identify each row of data in that dataset. On the surface there appear to be a lot of values that might be satisfactory for this use: a person's phone number, email address, social security number, or a product number, [but none of these are all that unique in terms of identifying each individual.]
> __Composite key__ makes use of more than one value to uniqely identify a row.

> A surrogate key is a value that is created solely for the purpose of identifying a row of data in a database table. Because it is created specifically for that purpose, it can avoid many of the problems associated with natural keys.

> A __sequence__ is a special kind of relation that generates a series of numbers. A sequence will remember the last number it generated, so it will generate numbers in a predetermined sequence automatically.

> A __Foreign Key__ allows us to associate a row in one table to a row in another table. This is done by setting a column in one table as a Foreign Key and having that column reference another table's Primary Key column.

> __Referential integrity__ is the assurance that a column value within a record must reference an existing value; if it doesn't then an error is thrown. 
