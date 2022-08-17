## Indexing

> In the context of a database, an index is a mechanism that SQL engines use to speed up queries. They do this by storing indexed data in a table-like structure, which can be quickly searched using particular search algorithms. The results of the search provide a link back to the record(s) to which the indexed data belongs. Using an index means that the database engine can locate column values more efficiently since it doesn't have to search through every record in a table in sequence.

```sql
CREATE TABLE customers (
  id serial PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL
);

CREATE TABLE orders (
  id serial PRIMARY KEY,
  product_name text NOT NULL,
  price numeric NOT NULL,
  customer_id integer NOT NULL 
    REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name)
     VALUES ('Tommy', 'Muller'), ('Henry', 'Sider'),
            ('Nir', 'Kalam'), ('Wen', 'Choi');

INSERT INTO orders 
            (product_name, price, customer_id)
     VALUES ('Spoon', 2.49, 1),
            ('Fidget spinner', 3.99, 2),
            ('Chirping bird', 8.49, 3);
```

In this example, it makes sense to create an index on price column given that people would be interested in ordering products by the price. So, let's create an index on price.

```sql
CREATE INDEX price_index ON orders (price);
```

If we want to drop the index,  we can invoke the following command:

```sql
DROP INDEX price_index;
```

Although indexing facilitates faster look up, there is a significant cost to adding indexes on unnecessary columns. Indexes not only occupy extra space but also require extra resources to update or modify existing data. This is because when updating or modifying a value,the respective index has to be updated or modified. 

There are two major rules of thumb for determining when it is useful to create index:
> 1. Indexes are best used in cases where sequential reading would be too costly and/or ineffective. For example: columns that are frequently used as part of an ORDER BY clause, or columns that aid in mapping relationships (such as Foreign Key columns) are good candidates for indexing.
> 2. They are best used in tables and/ or columns where the data will be read much more frequently than it is created or updated.
