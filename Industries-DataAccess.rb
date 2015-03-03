require 'pg'

def SqlStatement (str1)
conn = PGconn.open(:dbname => 'IndustriesDb', :user => 'IndustriesDb', :password => 'IndustriesDb')
conn.exec(str1)
end
