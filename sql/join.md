## JOIN statements

>  JOINs are clauses in SQL statements that link two tables together, usually based on the keys that define the relationship between those two tables. There are several types of JOINs: INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER and CROSS

The __join condition__ is the part of the statement that comes after the ON keyword; it is based on this condition a row in one table is joined to a row in another table.

An __INNER JOIN__ returns a result set that contains the common elements of the tables where the tables match on the join condition.

Consider the following `customers` and `orders` table:

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

--we can see inner join as follows:
--we get the firstname and lastname of people
--who have ordered something.
--customers who have not ordered anything will be 
--excluded

    SELECT  c.first_name, c.last_name, o.product_name
      FROM  customers AS c
INNER JOIN  orders AS o
        ON  c.id = o.customer_id;
```

A __LEFT JOIN__ or a __LEFT OUTER JOIN__ takes all the rows from one table, defined as the LEFT table, and joins it with a second table. The table preceding the __LEFT JOIN__ clause is the LEFT table.

If we perform a LEFT JOIN on `customers` and `orders`, we will get all the customers along with the rows that match the join condition.

```sql
    SELECT  c.first_name, c.last_name, o.product_name
      FROM  customers AS c
 LEFT JOIN  orders AS o
        ON  c.id = o.customer_id;
```

A __RIGHT JOIN__ [is a kind of JOIN where] all the rows on the second table are included along with all the matching rows from the first table. The table succeeding the __RIGHT JOIN__ clause is the RIGHT table.

A combination of LEFT JOIN and RIGHT JOIN is called the __FULL JOIN__ or __FULL OUTER JOIN__.

A __CROSS JOIN__, aka Cartesian JOIN, returns all rows from one table crossed with every row from the second table.