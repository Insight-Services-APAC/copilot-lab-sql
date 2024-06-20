# Lab 1 help

## Creating the tables

Copilot Chat provides a way to explicitly reference files in a prompt. Historically you could open files in the IDE in other tabs and Copilot would use those as context (this still applies for inline code completion), but the exact files used was not always clear. With Copilot Chat you can now explicitly reference files in the prompt.

In Visual Studio Code you can use the `Attach Context` icon (see the image below) or type `#file` into the chat window to pull up a list of files you can reference. In Visual Studio the behaviour is available (at time of writing) on via the `#file` command.

![Attach Context button highlighted!](../media/2024-06-20_14-04-58.png "Attach Context button highlighted")

Once you have the files attached, make sure to be explicit in asking Copilot to create tables *and* to create foreign key constraints where based on the data in the CSV files.

## Inserting data

You can reference the SQL definition and the appropriate CSV file and ask Copilot to generate the `INSERT` statements for you. If you don't reference the CSV file, Copilot will give you a generic response that may not be what you need.

## Documentation

If Copilot explains the SQL but does not generate the documentation to be inserted in the SQL file reword your prompt and specify the format you want the response in.

---

[Home](../README.md#lab-1-create-related-tables)
