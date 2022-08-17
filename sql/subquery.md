## Subquery

> Imagine executing a SELECT query, and then using the results of that SELECT query as a condition in another SELECT query. This is called nesting, and the query that is nested is referred to as a __subquery__.

Basically, subquery is a query that is used by another query in the same statement.

> There are however valid arguments to say that subqueries are more readable or make more logical sense in some situations. For example, if you want to return data from one table conditional on data from another table, but don't need to return any data from the second table, then a subquery may make more logical sense and be more readable. If you need to return data from both tables then you would need to use a join.

## Subquery Expressions

### EXISTS

> EXISTS effectively checks whether any rows at all are returned by the nested query. If at least one row is returned then the result of EXISTS is 'true', otherwise it is 'false'.

### IN

> IN compares an evaluated expression to every row in the subquery result. If a row equal to the evaluated expression is found, then the result of IN is 'true', otherwise it is 'false'.

### NOT IN

> NOT IN is similar to IN except that the result of NOT IN is 'true' if an equal row is not found, and 'false' otherwise.

### ANY/SOME

> ANY and SOME are synonyms, and can be used interchangeably. These expressions are used along with an operator (e.g. =, <, >, etc). The result of ANY / SOME is 'true' if any true result is obtained when the expression to the left of the operator is evaluated using that operator against the results of the nested query.