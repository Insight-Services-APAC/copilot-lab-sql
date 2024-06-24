# Lab 3 help

## Fixing a query

You'll find a final solution (which may differ from yours) in the [lab3-fixedquery-solution.sql](lab3-fixedquery-solution.sql).

## Modifying the Customer table

The solution to this may vary based on your selected database server. Not all servers provide a case insensitive text type. Where it isn't supported, create a varchar(254) field instead.

For PostgreSQL if you are trying to use the `CITEXT` extension type, you will need to install the extension first. For Azure Database for PostgreSQL you can do this by following the process listed on [Microsoft Learn](https://learn.microsoft.com/azure/postgresql/flexible-server/concepts-extensions).

You'll find a final solution (which may differ from yours) in the [lab3-newfield-solution.sql](lab3-newfield-solution.sql).

## Fixing a stored procedure

This lab step is a bit involved, but it is possible to get GitHub Copilot to generate the SQL to fix the stored procedure. You will need to add a check to ensure the `EmailAddress` field is a valid email address and that the `CustomerID` exists in the `Customer` table.

You may need to introduce the fixes using individual prompts.

You'll find a final solution (which may differ from yours) in the [lab3-fixedsproc-solution.sql](lab3-fixedsproc-solution.sql).

---

[Home](../README.md#lab-3-debugging-sql)