require 'nomad'

#start = Time.now
Nomad.job.list
Nomad.agent.join("127.0.0.1:4647")
Nomad.job.create(File.read("nginx_nix.hcl"))
#finish = Time.now
#diff = finish - start 

#jlist = Nomad.job.status
#puts "Job started"
#puts diff
