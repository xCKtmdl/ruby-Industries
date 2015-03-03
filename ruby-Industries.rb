require '/home/code/ruby-Industries/shell.rb'
require '/home/code/ruby-Industries/Industries-DataAccess.rb'


# Author: Aaron Gabriel
# 
# Purpose of program is to start from YF sectors
# list and insert this data into my postgresql db.
# 
# I will add iterations until I have visited the industries
# pages and then stock pages and have a list of these pages
# 
# http://finance.yahoo.com/q?s=aa.ba&d=t
# 
# of the stocks
# and Historical Prices pages
# 
# http://finance.yahoo.com/q/hp?s=AA.BA+Historical+Prices
# 
# 
# Once I have a table of stock symbols and Historical Prices URLs
# in the database, I will write the ruby-capserjs driver program
# that pulls all the .csv files.
# 
# Once that is done, I will write the ruby program that calculates
# all the transfer entropies between all stock symbols with available
#  Historical Prices data and record the entropies in a mongodb collection.
# 
# TODO: New iteration to a go level deeper into
#  industries.




# Clear my table first.
# I typically toggle this line on/off as a comment.
# If table is not cleared first, should run into PK violations.

SqlStatement('delete from sectors')

# I like to work with a fresh curl each program run.
# => Delete any existing output.html

if File.file? 'output.html'
run 'rm output.html', ''
end

# The YF sectors page list we start with.
baseURL="http://biz.yahoo.com/p/"

# curl it
run 'curl ' + baseURL + '>output.html', ''


# read the curl output in as a string
if File.file? 'output.html'
	fileString=""
	file = File.open("output.html")
	file.each {|line|
	fileString << line
	}
end


# regex for the list of sectors
arry1=fileString.scan(/href=([1-9])conameu.html><font\nface=arial\nsize=-1>([a-zA-Z\s]+)</).to_a

# debugger statement
#p arry1.length


# insert scraped info into my sectors table
for element in arry1

	sqlString='insert into sectors values (' + element[0] + ',\'' + element[1] + '\',\'' + baseURL + element[0] + 'conameu.html\')'

	# debugger statement
	#p sqlString

	SqlStatement(sqlString)

end

