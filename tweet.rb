#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'yaml'
require_relative 'tweet_data'

config = YAML.load_file(File.expand_path("../config.yml", __FILE__))

client = Twitter::REST::Client.new do |c|
  c.consumer_key = config["consumer_key"]
  c.consumer_secret = config["consumer_secret"]
  c.access_token = config["access_token"]
  c.access_token_secret	= config["access_token_secret"]
end

tweets_filename = File.expand_path('../tweet.json', __FILE__)
data = TweetData.new(tweets_filename)

client.update(data.tweet)
