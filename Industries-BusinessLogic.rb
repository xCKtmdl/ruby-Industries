require '/home/code/ruby-Industries/Industries-DataAccess.rb'
require '/home/code/ruby-Industries/shell.rb'






=begin

industries table CREATE script

-- Table: industries

-- DROP TABLE industries;

CREATE TABLE industries
(
  industries_id serial NOT NULL,
  industries_name character varying(100),
  industries_url character varying(100),
  sector_id integer,
  CONSTRAINT "industries_id_PK" PRIMARY KEY (industries_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE industries
  OWNER TO "IndustriesDb";



=end












def insertIndustriesData(sector_id,sector_url)
#	puts sector_id + ' ' + 


if File.file? 'output.html'
run 'rm output.html', ''
end


run 'curl ' + sector_url + '>output.html', ''
sleep(0.2)


if File.file? 'output.html'
	fileString=""
	file = File.open("output.html")
	file.each {|line|
	fileString << line
	}
end





arry1=fileString.scan(/<a\nhref=([0-9]+)conameu.html><font\nface=arial\nsize=-1>([^<]+)</).to_a


for element in arry1


	#puts element[0] + 'conameu.html' + ' ' + element[1].gsub(/\n/,' ')

industriesUrl= 'http://biz.yahoo.com/p/' + element[0] + 'conameu.html'

industriesName=element[1].gsub(/\n/,' ')

strSql= 'insert into industries (industries_name,industries_url,sector_id) values ('
strSql=strSql + '\'' + industriesName + '\',\'' + industriesUrl + '\',' + sector_id + ')'
SqlExec(strSql)

sleep(0.2)




end


end
