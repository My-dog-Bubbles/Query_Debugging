# Query_Debugging

Question 1:
The error occurred when the group function was used because you did not include name as one of the columns that you want to selecte.

Question 2:
The error occurred because you have to use a bridge table. They bridge table is needed because boohbah_id and stand_id have no connections. This means you cannot set them equal to each other.

Question 3:
The error occurred when they were referencing the boohbah_name even though the column does not exist. You have to reference it as the column within the table which is name.

Question 4:
The error occurred because of how you were referencing the columns. Since you did not do dot notation (table_name.column_name) the query does not know where the column that you are referencing is. 

Question 5:
There is a logic error because the where clause in the subquery is not needed because its just says when itself is equal to itself. 

Question 6:
The error occurred because you are returning multiple value and comparing it to only one. This throws and error because comparisons are on a one to one relationship.

Question 7:
The error occurred because there was a cartesian join. There is not join so it shows all the data at once.

Question 8:
The error occurred when you ran the average function because you have to do a subquey that selects just the average.

Question 9:
The error occurred because the order switch selected columns in sub query. They will not check in the same order that the valuse were sub queried.

Question 10:
The error occurred when you tried to merge the boohbah table and the jojo_stand table using their ID. You cannot merge them because the ID's have no coralation. 