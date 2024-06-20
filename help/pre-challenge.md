# Pre-challenge lab help

> [!NOTE]  
> This help is specific to Postgres. You may need to adjust steps if you are using a different database server.

Are you stuck and Copilot's not helping? Here's a hint to get you started.

1. Connect to your database server and select `postgres` as the database.
2. Once connected open a new SQL file in your editor.
3. Use Copilot to generate the SQL command to create a new database.

    ```sql
    -- create a database called copilotlab
    ```

    You should find that Copilot will respond with something like:

    ```sql
    CREATE DATABASE copilotlab;
    ```

    If Copilot isn't responding, clear your SQL editor and try again.

4. You also need to grant your user access to the new database. Use Copilot to generate the SQL command to grant access to the new database.

    ```sql
    -- grant user myuser access to the database
    ```

    You should find that Copilot will respond with something like:

    ```sql
    GRANT ALL PRIVILEGES ON DATABASE copilotlab TO myuser;
    ```

Once you have created this new database you should update your connection settings to use this new database and reconnect.

You can check which database you are connected to by running the following SQL command:

```sql
SELECT current_database();
```

----

[Home](../README.md)