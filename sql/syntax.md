# Syntax for altering a table

## Syntax for renaming
Alter a table name:
```sql
ALTER TABLE  table_name
  RENAME TO  new_table_name;
```
Alter a column name:
```sql
ALTER TABLE table_name
     RENAME column_name TO new_column_name;
```

## Syntax for altering data-type
Altering the data-type of an existing column; if the column already contains values that cannot be converted into the new data_type, it will throw an error. 

```sql
ALTER TABLE table_name
ALTER COLUMN column_name TYPE new_type;
```

## Syntax for altering NOT NULL and DEFAULT constraint
Add NOT NULL constraint on a colum:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET NOT NULL
```

Add DEFAULT constraint on a column:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
SET DEFAULT default_value
```

Drop NOT NULL constraint from a column:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
DROP NOT NULL
```

Drop DEFAULT constraint from a column:
```sql
ALTER TABLE table_name
ALTER COLUMN column_name
DROP DEFAULT
```
## Syntax for adding a new colum

```sql
ALTER TABLE table_name
ADD COLUMN  new_column new_column_type [optional constraints]
```

# Syntax for updating data

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

# JOIN syntax 

```sql
SELECT table_name.column_name, ...
       FROM table_name1
       [INNER/LEFT/RIGHT/FULL/CROSS] JOIN table_name2
       ON join_condition;
```

See [JOIN statements](join.md)
