# Constraints

Constraints are part of the schema and helps in restricting the kind of data that can be inserted in the database.

Consider the following `students` table:
```sql
CREATE TABLE students (
  id serial PRIMARY KEY,
  first_name text,
  last_name text,
  email text
  enrolled boolean
);
```
## NOT NULL CONSTRAINT

When we have a database for storing information about students, we would want to make certain information required. For instance, we want to make sure that the student has a first_name, last_name, email, and enrolled. To ensure that these values are not left empty, we can impose the NOT NULL constraint as follows:

```sql
ALTER TABLE students
ALTER COLUMN first_name SET NOT NULL,
ALTER COLUMN last_name SET NOT NULL,
ALTER COLUMN email SET NOT NULL,
ALTER COLUMN enrolled SET NOT NULL;
```

Say we add a middle_name colum with the NOT NULL constraint:

```sql
ALTER TABLE students
ADD COLUMN middle_name text NOT NULL;
```

But this is not a great idea, since there are many students who do not have a middle_name. When we want to drop the NOT NULL constraint, we can use the following syntax:

```sql
ALTER TABLE students
ALTER COLUMN middle_name DROP NOT NULL;
```

## UNIQUE

UNIQUE constraint ensures that the column (or the columns on which the constraint is applied) only has unique value or a unique combination of values (if the constraint is applied on more than one column).

In the case of students, it is reasonable that we want students to have unique emails. So, let's add that constraint:

```sql
ALTER TABLE students
ADD UNIQUE (email);

--or we could give the constraint a name
ALTER TABLE students
ADD CONSTRAINT unique_email UNIQUE (email);
```

For some reason if we have to drop the constraint, we can use the following syntax:

```sql
ALTER TABLE students
DROP CONSTRAINT unique_email;

--here, unique_email is the name of the constraint
```

## CHECK constraint

CHECK constraint applied to any attribute ensures that the attribute value meets the given condition. In the case of students, we want to make sure that first_name and last_name fields are not empty or filled with spaces.

```sql
ALTER TABLE students
ADD CONSTRAINT non_empty_first_name CHECK (length(trim(first_name)) > 0),
ADD CONSTRAINT non_empty_last_name CHECK (length(trim(first_name)) > 0);
```

If we have to drop the CHECK constraint, the syntax is the same as dropping UNIQUE constraint:

```sql
ALTER TABLE students
DROP CONSTRAINT non_empty_last_name;
```

## DEFAULT

We can  also have a default value for a given column. Say we want to put an empty string for middle names if they are not supplied:

```sql
ALTER TABLE students
ALTER COLUMN middle_name SET DEFAULT '';
```
That way we can can make sure that there are no null values. But it is important to avoid the NULL-phobia, because it can lead to the insertion of bogus values. Sometimes, absence of a value is more informative than the presence of some bogus value. One may reasonably think that inserting an empty string is similar to inserting a bogus value.

## FOREIGN KEY CONSTRAINT

While we are discussing constraints, it's good to talk about the syntax for adding and removing FOREIGN KEY CONSTRAINT.

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
    REFERENCES customers(id)
);
```

Suppose we want to add `ON DELETE CASCADE` clause to the FOREIGN KEY, then we would have to first delete the FOREIGN KEY constraint and add it back with the clause.

```sql
ALTER TABLE orders
DROP CONSTRAINT orders_customer_id_fkey;

ALTER TABLE orders
ADD FOREIGN KEY (customer_id) 
  REFERENCES customers(id) ON DELETE CASCADE;
```