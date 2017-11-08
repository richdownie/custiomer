require 'httparty'
Given /There are "(.*)" open issues accross all repositories/i do |number|
  url = "https://api.github.com/users/customerio/repos"
  @response = HTTParty.get(url.to_s)
  open_issues_count = 0
  @response.parsed_response.each do |r|
    r["name"] + ": " + r["open_issues"].to_s
    open_issues_count += r["open_issues"]
  end
  puts open_issues_count.should == number.to_i
end

Given /I sort the repositories date updated in descending order/i do
  url = "https://api.github.com/users/customerio/repos"
  @response = HTTParty.get(url.to_s)
  array = []
  @response.parsed_response.each do |r|
    r["name"] + ": " + r["updated_at"]
    array << r["updated_at"].to_s + r["name"]
  end
  puts array.sort.reverse
end

Given /I display the which repository has the most watchers/i do
  url = "https://api.github.com/users/customerio/repos"
  @response = HTTParty.get(url.to_s)

  @response.parsed_response.each do |r|
    puts r["name"] + ": " + r["watchers"].to_s
  end
end