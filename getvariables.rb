#!/usr/bin/ruby
require 'net/https'
require 'json'


uri = URI.parse("https://raw.githubusercontent.com/NixOS/nixops/master/nix/ec2-amis.nix")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)

data = {}
http.request(request).body.each_line do |l|
  l.chomp!
  if m = l.match(/"([\d\.]+)"\."([\w-]+)"\.(hvm|ebs|s3) = "(ami-\w+)";/)
    data["#{m[1]}-#{m[2]}-#{m[3]}"] = m[4]
  end
end

output = {
  "variable" => {
    "all_amis" => {
      "description" => "The AMI to use",
      "default" => data 
    }
  }
}

puts JSON.pretty_generate(output)

