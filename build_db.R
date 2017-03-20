# This is a script for the purpose of iterating over the RDF/XML files downloaded from 
# project gutenberg via zip file, and then parsing each file into a berkeley db (graph database)
library(commonmark)
library(desc)
library(roxygen2)
library(redland)

# set the working directory to the one this file is in before you run script
# ex: setwd("users/home/foo/bar")
setwd("")

# set the path of to the epub folder (the folder containing all the folders that contain one file on a book)
# ex: path = "/home/foo/bar/this_project/cache/epub"
file_list <<- list.files(path="", all.files = FALSE,
                         recursive = TRUE, full.names = TRUE, no.. = FALSE)

# initializing World, Storage, Model, and Parser classes
# all are from redland library
# storage options attribute is equal to a hash type = Berkeley db 
# berkeley db is a graph database
world <<- new("World")
storage <<- new("Storage", world, "hashes", name="", options="hash-type='bdb'")
model <<- new("Model", world=world, storage, options="")
parser <<- new("Parser", world)

# iterate over the list of files, parse each into the database model
for(file in file_list){
  parseFileIntoModel(parser, world, file, model)
}