
require 'eventmachine'
require 'em-http'
require 'json'

http = EM::HttpRequest.new("http://127.0.0.1:4646/v1/event/stream", :keepalive => true, :connect_timeout => 0, :inactivity_timeout => 0)

emp = "{}"
EventMachine.run do
  s = http.get({'accept' => 'application/json'})
  depStart = 0
  depStop = 0

  s.stream do |data|

	unless data.to_s.strip.empty? 
	    if data.to_s.end_with?("}") && data.to_s.start_with?("{") && data.to_s != emp
	    json_str = data.gsub( '/\n/', '\\n')
	    #if json_str.include? "Deployment"
	    j_data = JSON.parse(json_str, symbolize_names: true)
	    hash =  Hash[j_data]
	    if hash[:Events][0][:Payload].key?(:Deployment)	
	      #depInfo =  Hash.new
	      depHash = hash[:Events][0][:Payload][:Deployment]
	      depStatus = depHash[:Status]
	      depId = depHash[:ID]
	      if depStatus.eql? 'running'
		depStart = Time.now
	      end # end equal running
	      if depStatus.eql? 'successful'
                depStop = Time.now
              end # end equal running
	      puts "Deployment status - > #{depStatus}"
	      puts "Deployment start time - > #{depStart}"
	      puts "Deployment stop time - > #{depStop}"
	      if !depStart.nil? && !depStop.nil? && depStart != 0 && depStop != 0
	        depTime = depStop - depStart
		puts "Deployment time - > #{depTime}"
	      end # end if time not 0 	
	end # include Deployment   
      end # end { } {}
    end # end unless empty
  end # end stream do 
end # end EventMachine
