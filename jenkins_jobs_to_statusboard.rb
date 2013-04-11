#!/usr/bin/env ruby
require 'jenkins_api_client'

def job_order(client, job)
  status = client.job.get_current_build_status(job)

  case status
    when "failure"
      1
    when "unstable"
      2
    when "running"
      3
    when "not_run"
      4
    when "aborted"
      5
    when "success"
      6
    else
      7
  end
end

throw "Pass jenkins_ip, username and password as params" unless ARGV.length >= 3

client = JenkinsApi::Client.new(:server_ip => ARGV[0],
                                :username => ARGV[1], :password => ARGV[2])

file = File.new(ARGV[3] || "jenkins.html", "w+")
file.puts "<table>"

client.job.list_all.sort { |x, y| job_order(client, x) <=> job_order(client, y) }.each do |job|
  status = client.job.get_current_build_status(job)
  file.puts "<tr><td width='50'><img width='32' height='32' src='http://www.merowing.info/wp-content/uploads/jenkins/#{status}@2x.png'/></td><td>#{job}</td></tr>"
end
file.puts "</table>"

file.close()