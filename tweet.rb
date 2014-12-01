#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'json'
require 'yaml'
require 'pp'

json_data = File.open(File.expand_path("../tweet.json", __FILE__)) {|f| JSON.load(f) }
config = YAML.load_file(File.expand_path("../config.yml", __FILE__))

tweets = json_data["tweets"]
count = json_data["count"]

most,tweet	= tweets.size,tweets[count-1]
count %= most

json_data["count"] = count

File.open(File.expand_path("../tweet.json", __FILE__),"w"){|f| f.write(JSON.pretty_generate(json_data))}

client = Twitter::REST::Client.new do |c|
	c.consumer_key = config["consumer_key"]
	c.consumer_secret = config["consumer_secret"]
	c.access_token = config["access_token"]
	c.access_token_secret	= config["access_token_secret"]
end
client.update tweet
