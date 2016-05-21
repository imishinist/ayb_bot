require 'json'

begin
  File.open(File.expand_path('../../tweet.json', __FILE__), "r") {|f| JSON.load(f) }
  puts 'Success'
rescue
  puts "Failed"
  exit(1)
end
