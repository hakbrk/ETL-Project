# ETL-Project - Movie Database
Project Team : Martha Aguilar and John Hawkins

### Files included
+ ETL_Movie_Data_ERD - ERD of the movies_db
* ETL_Film_Project_MAGU - Schema code for movies_db
- Movies_ETL-MAG.ipynb - Jupyter Notebook Python Code file used for development of the movies_metadata.csv data extraction, authored by Martha Aguilar
+ movies_metadata - CSV file with data to be extracted by Movies_ETL-MAG.ipynb
* unique_indmID.csv - File of imdb_id's used to run API calls during development
- Folder OMDB
  - OMDB_Data.ipynb - Jupyter Notebook Python Code file used for development of the OMDB API data calls, authored by John Hawkins and improvments made with the assistance of Martha Aguilar.
  - actor_df.csv - Output file of actor data used as backup
  - director_df.csv - Output file of director data used as backup
  - film_actor_df.csv - Output file of film_acotor data used as backup
  - film_director_df.csv - Output file of film_director data used as backup
  - film_writer_df.csv - Output file of film_writer data used as backup
  - writer_df.csv - Output file of writer data used as backup

               
### Project Description

The purpose of this project was to **E**xtract **C**lean and **L**oad (**ETL**) data from two sources.  The data chosen for this project was extracted form two sourses, the first was is a movie data csv file located on kaggle at https://www.kaggle.com/rounakbanik/the-movies-dataset.  The second data set was extracted using the imdb_id's located in the csv files to extract additioanl data usin OMDB API calls.   Follow is a description of the various steps taken to accomplish this.

-  **E**xtract 
The data contained in the movie data csv file was in csv format but presented challenges to extract that column data into a                usable format.  Some snapshots of what the data format looked like prior to extraction into a pandas DataFrame is shown below.

![Data Example](movie_data_ex1.PNG)

![Data Example](movie_data_ex2.PNG)

In total there were xxx categories of data extracted from this data set.  The code which specifically associates wtih this csv is located within the reposity and titled Movies_ETL.ipynb.

The data extracted from OMDB API calls was generated and extracted by using a list of imdb_id's to make API calls which were then stored as lists of dictionaries.  The data calls had a JSON format to them.  An example is shown below.

![OMDB API Example](movie_data_ex3.PNG)

- **C**lean

