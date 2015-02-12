#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'json'

class TweetData
  attr_accessor :tweets

  def initialize file_name
    read(file_name)
  end

  def read file_name
    json_data = File.open(file_name, "r") {|f| JSON.load(f) }
    @tweets = json_data["tweets"]
  end

  def write file_name
    File.open(file_name, "w") {|f| f.write(to_json(true)) }
  end

  def tweet
    @tweets.sample
  end

  def tweets_size
    @tweets.size
  end

  def insert tweet
    if tweet.is_a? String
      @tweets.push(tweet)
    else
      raise ArgumentError, "invalid argument"
    end
    self
  end

  def to_hash
    {tweets: @tweets}
  end

  def to_json is_pretty = false
    is_pretty ? JSON.pretty_generate(to_hash) : JSON.generate(to_hash)
  end

end
