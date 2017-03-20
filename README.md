## A Script for building a database from project gutenberg metadata 

# Set up:

- Make sure you have R installed on your machine
- install redland `install.packages("redland")` 
- go to: http://www.gutenberg.org/wiki/Gutenberg:Feeds and go to the bottom of the page and download zip file containing metadata (do no alter file structure when extracting)
- clone this project into the directory that contains the 'cache' directory 
- open the build_db.R file, set the working directory, and in the list.files function path to the directory epub inside the cache folder
- Run the script
- database should be written, this might take a while. 
- if successful you should be able to query the database using sparql