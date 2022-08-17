## Keys

> A key uniquely identifies a single row in a database table.

> Keys are a special type of constraint used to establish relationships and uniqueness. They can be used to identify a specific row in the current table, or to refer to a specific row in another table. 

A __Primary Key__ is a unique identifier for a row (or an individual record) of data.

A __natural key__ is an existing value in a dataset that can be used to uniquely identify each row of data in that dataset. SSN might be close to being a natural_key, but then many folks do not have SSN. For this reason, one may rely one more than one data value to uniquely identity a record. __Composite key__ makes use of more than one value to uniqely identify a row.

Since natural keys are hard to come by, it is preferable to create a unique identifier for each record. Enter __surrogate key__. A __surrogate key__ is a value that is created solely for the purpose of uniquely identifying a row of data in a database table. 

Building a relationship between tables is done through foreign keys. It's like using a shortcut to refer to a record from another table. For this purpose, we create a column in the table to reference the PRIMARY KEY from another table. The identifiers that reference the PRIMARY KEY of another table are the FOREIGN KEYs. 

> A __Foreign Key__ allows us to associate a row in one table to a row in another table. This is done by setting a column in one table as a Foreign Key and having that column reference another table's Primary Key column.

> __Referential integrity__ is the assurance that a column value within a record must reference an existing value; if it doesn't then an error is thrown.