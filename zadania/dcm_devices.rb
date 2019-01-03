#!/usr/local/bin/ruby

require 'hpricot'
require 'open-uri'

def die(msg,code)
  puts msg
  exit code
end
doc = Hpricot(open("https://www1.dotcom-monitor.com/reporting/card/detail.aspx?uid=35cba429f88041acbf74f91b4350dbaf&ID=0"))
devices_arr = Array.new
devices_stats = Array.new
result = Array.new
doc.search('//*[@id="stattd"]/td[1]/a').to_a.each { |item|
	devices_arr.push(item.to_s[/class="lnk">(.*?)<\/a>/m,1])
}
doc.search('//*[@id="stattd"]/td[3]/div/img').to_a.each { |item|
	devices_stats.push(item.to_s[/stat_(.*?).gif/m,1])
}
devices_arr.find_all{|item| item =~ /^\[#{ARGV[0]}\](.*)/}.each { |item| 
	devices_stats[devices_arr.index(item)] == 'down' ? result.push(devices_arr[devices_arr.index(item)]) : nil
}
result.size != 0 ? die("There are #{result.size} devices in down state: #{result.join(" ")}",2) : die("None of devices with priority: #{ARGV[0]} is down\n",0)
