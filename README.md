# sql-data-base-building!

![giphy](https://user-images.githubusercontent.com/110810531/187027975-b917814c-ae11-4b21-981a-bddb848f3fe9.gif)


In this project I've cleaned seven dataframes in order to have consistent information when forwarding the information into SQL. 


## Cleaning Databases

· Firstly, I've imported some csv and drop some unnecessary colums and rows.

· After checking the shape of the diferent DataFrames and the infroration includen in them, I've started to clean dirty columns. That means eliminating empty spaces or re-naming some columns in order to be easier to work with those.

· The next step was dropping duplicates

· Lastly checking wich informaton was important to join in SQL as they have the same information.

· Onced I've finished with the "cleaning" part, I've imported certain libraries that helped me to migrate the information to sql and transforming the data worked in Jupyter Notebook into CSVs.

## SQL: 

· At SQL, I've created firstly the EER in order to have a clear path to join tables and see specific information. 

· After doing that I've created the union between the different tables setting primary and foreign keys. 

· Once the connection was clear I've created 5 queries 

1)  Select a specific fil with the description, film_id and language_id
2)  Select films that a specific Actor/actress did, with FULLNAME and title. 
3)  Create a temporary table from query #2
4)  Select all the films and actors that play on a "Action" Genre film
5)  Select all the films and the lenght of the films with "R" genre.


