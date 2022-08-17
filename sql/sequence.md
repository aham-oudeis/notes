## Sequence

> A __sequence__ is a special kind of relation that generates a series of numbers. A sequence will remember the last number it generated, so it will generate numbers in a predetermined sequence automatically. It is used for auto generating a number that can be used as a PRIMARY KEY.

```sql
--create a sequence
CREATE SEQUENCE counter MINVALUE 132739 INCREMENT 111;

--output a value using the sequence
SELECT nextval('counter');

--drop the sequence
DROP SEQUENCE counter;

--create an auto incrementing column without using serial
--first, create a sequence
CREATE SEQUENCE counter;

CREATE TABLE test (
  id integer NOT NULL DEFAULT nextval('counter'),
  name text
)
```
