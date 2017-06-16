 #!/usr/bin/env ruby
 
 require 'base64'
 #   gem install rest-client
 require 'rest-client'
 
def getTask(url,user,pwd)
 
	host = "https://#{url}.service-now.com"
	sys_id = '00589d8f935112003b4bb095e57ffb01'
	a = ''
	code = ''
	begin
		# Get the task with sys_id declared above
		response = RestClient.get("#{host}/api/now/table/task/#{sys_id}",
				{:authorization => "Basic #{Base64.strict_encode64("#{user}:#{pwd}")}",
				:accept => 'application/json'})
		#  puts "#{response.to_str}"
		# puts "Response status: #{response.code}"
		#  response.headers.each { |k,v|
		#     puts "Header: #{k}=#{v}"
		#  }
		code = response.code
		a = response.to_str

	rescue => e
		puts "ERROR: #{e}"
	end

	puts code
	# remove {"result": from the begining.
	a.tap{|s| s.slice!('{"result":{')}
	# remove the }} from the end.
	a.tap{|s| s.slice!('}}')}
	b = a.split(",")
	c = []
	d = ''
	for i in b do
		if i.to_s.index('"value":"') == 0
			#merge with previous 
			c.pop
			e = d + "," + i
			c.push(e)
			d = ''
		else
			d = i
			c.push(d)
		end
	end

	# puts "\n"
	# puts b
	if code == 200
	puts "\n"
	puts c
	end
 
 end
 #end getTask
