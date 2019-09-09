# ETL-Project - Movie Database
In this project we explore the fun and exciting world of data cleansing

### Quick Start
In order to run the code and load data into a Postgres data base
- Create a Postgres Database called movies_db.
- Copy into the query tool window and execute the table creation code in ETL_Film_Project_DDL.
- Open the Python code located in the Jupyter Notebook Movies_ETL.ipynb.
- Enter Postgres username and password in the engine connection code.   
![Data Example](images/Movies_ETL_image1.PNG)
- Run Movies_ETL.ipynb
- Open the Python code located in the Jupyter Notebook OMDB_Data.ipynb.
- In order to run the OMDB API calls you will need an OMDP API Key.
- You can utilize the key by creating a file called api_keys.py and entering your key in that file as shown below.  
![API_Code](images/api_key_image.PNG)
- Or alternativley you can enter you API code directly into the API call f string at this location.  
![API_Code](images/api_key_image3.PNG)
- If you have opted to enter it directly into the API call then you must delete or comment out the api_keys import at this location.  
![API_Code](images/api_key_image2.PNG)
- Enter Postgres username and password in the engine connection code.  
![Data Example](images/OMDB_Data_image1.PNG)
- Run OMDB_Data.ipynb (Note: To run the entire code it will take over 1 hour due to the time it take making API calls, there is code included (image below) that by default is commented out, in order to provdie a shortcut it is possible to un-comment this code block and run the code from that point).  
![Data Example](images/OMDB_Data_image2.PNG)
- Enjoy exploring the data located in movies_db, use the [ETL_Movie_Data_ERD](ETL_Film_Project_ERD.PDF) as a guide.

### Files included
+ ETL_Movie_Data_ERD - ERD of the movies_db
* ETL_Film_Project_DDL - Schema code for movies_db
- Movies_ETL.ipynb - Jupyter Notebook Python Code file used for development of the movies_metadata.csv data extraction, authored by Martha Aguilar
+ movies_metadata - CSV file with data to be extracted by Movies_ETL-MAG.ipynb
* unique_indmID.csv - File of imdb_id's used to run API calls during development
- OMDB_Data.ipynb - Jupyter Notebook Python Code file used for development of the OMDB API data calls, authored by John Hawkins and improvements made with the assistance of Martha Aguilar.
- actor_df.csv - Output file of actor data used as backup
- director_df.csv - Output file of director data used as backup
- film_actor_df.csv - Output file of film_acotor data used as backup
- film_director_df.csv - Output file of film_director data used as backup
- film_writer_df.csv - Output file of film_writer data used as backup
- writer_df.csv - Output file of writer data used as backup
- film_awards_df.csv - Output file of film_awards data used as backup
- film_ratings_df.csv - Output file of film_ratings data used as backup

               
### Project Description

The purpose of this project was to **E**xtract **T**ransform and **L**oad (**ETL**) data from two sources.  The data chosen for this project was extracted form two sources, the first was is a movie data csv file located on kaggle at https://www.kaggle.com/rounakbanik/the-movies-dataset.  The second data set was extracted using the imdb_id's located in the csv files to extract additional data using OMDB API calls.   Follow is a description of the various steps taken to accomplish this.

#### Extract 
The data contained in the movie data csv file was in csv format but presented challenges to extract that column data into a                usable format.  Some snapshots of what the data format looked like prior to extraction into a pandas DataFrame is shown below.

#### movie_metadata.csv
![Data Example](images/movie_data_ex1.PNG)

#### movie_metadata.csv
![Data Example](images/movie_data_ex2.PNG)

In total there were xxx categories of data extracted from this data set.  The code which specifically associates with this csv is located within the repository and titled Movies_ETL.ipynb.

The data extracted from OMDB API calls was generated and extracted by using a list of imdb_id's to make API calls which were then stored as lists of dictionaries.  The data calls had a JSON format to them.  An example is shown below.  There was further cleaning of the data accomplished in the same step as the extraction, but this will be discussed later.  In all 45,415 calls were made with two calls containing no data, this iteration took approximately 1-1.5 hours to accomplish.

#### OMDB API Data response
![OMDB API Example](images/movie_data_ex3.PNG)

Other issues that arose during the API calls were errors associated with what I assume was the API call being made this often resulted in the error below.  Another error pictured below that caused the loop to crash was having no data resent for the requested response, in both cases the code was able to be restarted from the point it crashed, a try except calls were included later that seems to have worked to alleviate the issues.

#### API Call Error
![API Call Error Example](images/error3.PNG)

#### API Call Error
![API Call Error Example](images/error4.PNG)

#### Working Try Except
![Working Try Except](images/error6.PNG)



#### Transform
The data cleaning and transform portion of the project for both the movie_metadata and OMDB API calls data presented the majority of the challenge in this exercise.

The CSV file turned out to be more challenging than expected in the begining. Some columns contained pseudo-jason content that needed to be parsed and converted into a relation-table format. Two functions were created:
	1. Function to deal with data that will create a 1 - M relationship
	2. Function to deal with data that will create a M - M relationship

Regarding the data cleaning for the API calls, during the first version of the code the data was extracted and placed in a single list of dictionaries format, then separated to datasets and parsing of names and other dating accomplished by the use of multiple iterrow loops.  This presented a major issue with time, the original API calls took over 1 hour to perform and then each preceding iterrow loop took an additional hour to complete.  The code was then refined to do the majority of the parsing and data manipulation within the original API call loop.

#### Load
After completion of the extract and clean functions the data was then loaded into a Postgres Database via a sqlalchemy engine session being opened up with the pre-existing movies_db database and associated tables being present.

### Conclusions

This was a challenging project and presented team members with challenges that were not thought to be that great when the project started.  Issues with data cleaning and ensuring that code is efficient were learned.

## Authors

* Martha Aguilar
* John Hawkins
