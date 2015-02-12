#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require_relative 'tweet_data'

tweets_filename = File.expand_path('../tweet.json', __FILE__)
data = TweetData.new(tweets_filename)

data.tweets.shuffle!
data.write(tweets_filename)
