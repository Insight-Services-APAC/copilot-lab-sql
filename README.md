# GitHub Copilot lab for SQL

A hands-on lab to introduce people to working with GitHub Copilot and SQL

## Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/)
- [GitHub Copilot](https://copilot.github.com/) installed and licensed
- [SQLTools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
- [SQLTools PostgreSQL driver](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-pg) (or driver for your selected database server)
- PostgreSQL database server (or another database server of your choice) with an empty database (or permissions to create a new database).

### Database server

While SQL is a [standardised language](https://en.wikipedia.org/wiki/SQL#Interoperability_and_standardization) that can be used with many different database servers, this lab will use [PostgreSQL](https://www.postgresql.org/) as the database server.

You can use another database server if you prefer, but you may need to adjust some of the generated SQL commands to work with your selection.

If you cannot run a local PostgreSQL instance, consider using a cloud-based service like [Azure Database for PostgreSQL](https://learn.microsoft.com/azure/postgresql/flexible-server/how-to-deploy-on-azure-free-account) which offers a free tier (for 12 months) which will suffice for this lab.

You can complete the labs without access to a server, but you will not be able to run the SQL commands to see the results and validate that the code works as expected.

> [!IMPORTANT]
> GitHub Copilot Individual and Business works by referencing files held locally on your computer or in a Codespace. At time of writing GitHub Copilot does not support connecting to a database server to obtain additional context such as your database engine vendor and version or any deployed artefacts (schemas, tables, etc). Keep this in mind when working with SQL and GitHub Copilot.

---

### Pre-lab challenge

All database servers have a default database. For Postgres it's called `postgres`, for MySQL it's called `mysql`, and for SQL Server it's called `master`. Oracle has a default database called `system`.

It's not recommended to use the default database for your application data, so the for our first "pre-challenge" is to create a new database on your database server.

First you will need to connect to your database server and select the default database.

Next, open a new SQL file in your editor and use Copilot to generate the SQL command to create a new database and then also grant your user full privileges on the new database.

Once the database is created you may need to update your connection settings to use the new database and reconnect.

Stuck? Check out the [pre-challenge lab help](help/pre-challenge.md) for a hint.

---

## Lab 1: Create related tables

In the sample-data folder you will find three CSV files:

- [address.csv](sample-data/address.csv) - This file contains a list of addresses with the street, city, state, and postal code.
- [customer.csv](sample-data/customer.csv) - This file contains a list of customers with their name, email address, and the date they became a customer.
- [order.csv](sample-data/order.csv) - This file contains a list of orders with the order number, the customer who placed the order, the date the order was placed, and the total amount of the order.

Using these three files and GitHub Copilot, create the tables required to store this data in your database.

Make sure to create foreign key constraints where appropriate.

> [!TIP]
> Try using Copilot Chat and file referencing.

Once you have created the SQL make sure to save the file. Call it `lab1.sql`.

Ensure that you have documentation in the SQL file that explains the purpose of each table and the relationships between the tables.

While you can bulk insert the data from the CSV files, you don't need to do this for this lab. Use GitHub Copilot to create `INSERT` statements to insert the data from each CSV.

> [!TIP]
> Did you run into `-- More rows...` or a similar response from Copilot and didn't get the SQL for all the rows? You are likely experiencing the token limit for the large language model that sits behind Copilot. Try clearing your Chat history using `/clear` and trying again.

Stuck? Check out the [lab 1 help](help/lab1.md) for hints.

## Lab 2: Building Database Logic

Now we have a database defined, let's create some logic to interact with the data.

You may be familiar with database views, stored procedures, and triggers. These are all ways to interact with the data in the database.

### Create a view

Create a view that shows that shows customer orders and which doesn't include the customer's ID.

Once you've created the view, ask Copilot to update the definition so it includes the Customer ID field and that orders are grouped by customer.

> [!TIP]
> If you run into issues, make sure to use GitHub Copilot chat to help identify how to fix them. You should be able to create and update the view without needing to write the SQL from scratch.

### Create a stored procedure or function

Before you implement a solution for this brief, ask GitHub Copilot Chat what the differences are between a stored procedure and a function.

Once you understand the differences, create a solution for these scenarios:

- Provide a way to get the total number of orders for a customer.
- Provide a way to get the total value of orders for a customer.

Once you've created the stored procedure or function, see if you can optimise the resulting SQL. What changes does Copilot suggest? Are they valid?

Stuck? Check out the [lab 2 help](help/lab2.md) for hints.

## Lab 3: Debugging SQL

In this lab, you will be given a SQL file that contains a query that is not working as expected. Your task is to identify the issue and fix it.

The SQL file is called [lab3.sql](sample-data/lab3.sql) and is located in the `sample-data` folder. The query is designed to run against a database that has had the tables created in Lab 1. The query is shown below.

```sql
SELECT C.Firstname, A.AddressLine1, A.AddressLine2, A.City, A.State, A.ZipCode
FROM Customer AS C
JOIN Address AS A ON CustomerID = A.CustomerID
WHERE A.IsShippingAddress = TRUE AND A.IsBillingAddress = FALSE;
ORDER BY C.Firstname
GROUP BY A.City 
```

First up, try opening the SQL file and executing the query. If it doesn't run as expected, use GitHub Copilot to help identify the issue and fix it. There may be more than one problem with the query.

> [!TIP]
> Depending on the database server you are using you might need to copy/paste any errors you receive into the chat to get help from Copilot. If you are using the command-line you could try out the `@terminal` agent.

Stuck? Check out the [lab 3 help](help/lab3.md) for hints.
