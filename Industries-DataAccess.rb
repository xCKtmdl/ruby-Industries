require 'pg'

def SqlExec (str1)
conn = PGconn.open(:dbname => 'IndustriesDb', :user => 'IndustriesDb', :password => 'IndustriesDb')
conn.exec(str1)
conn.close
end

def SqlSelect (str1)
conn = PGconn.open(:dbname => 'IndustriesDb', :user => 'IndustriesDb', :password => 'IndustriesDb')
rs = conn.exec(str1)
arry1 = rs.to_a
conn.close
return arry1
end
