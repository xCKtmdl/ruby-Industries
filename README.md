# ruby-Industries

# Author: Aaron Gabriel
Author: Aaron Gabriel

Purpose of program is to start from YF sectors
list and insert this data into my postgresql db.

I will add iterations until I have visited the industries
pages and then stock pages and have a list of these pages

http://finance.yahoo.com/q?s=aa.ba&d=t

of the stocks
and Historical Prices pages

http://finance.yahoo.com/q/hp?s=AA.BA+Historical+Prices


Once I have a table of stock symbols and Historical Prices URLs
in the database, I will write the ruby-capserjs driver program
that pulls all the .csv files.

Once that is done, I will write the ruby program that calculates
all the transfer entropies between all stock symbols with available
 Historical Prices data and record the entropies in a mongodb collection.

TODO: New iteration to a go level deeper into
 industries.
