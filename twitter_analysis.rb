#!/usr/bin/env ruby
# -* coding: utf-8 -*-
# version: 2.3.1p112

require 'bundler/setup'
require 'yaml'
require 'twitter'
require 'natto'


unless ARGV.length == 1
  puts "Usage: #{__FILE__} [twitter_account_id]"
  exit 0
end


config = YAML.load_file('config.yml')
client = Twitter::REST::Client.new do |c|
  c.consumer_key = config['consumer_key']
  c.consumer_secret = config['consumer_secret']
  c.access_token = config['access_token']
  c.access_token_secret = config['access_token_secret']
end


user_id = ARGV[0]
mn = Natto::MeCab.new
word_counter = Hash.new
re = /\\n|\(|\)|\[|\]|\{|\}|\.|,|:|;|\/|\\|\*|\+|-|=|$|%|&|'|^|~|<|>|#|\@|\?|!|\|/

begin
last_tweet_id = client.user_timeline(user_id).first.id
rescue => e
  puts "error: #{e.message}"
  exit -1
end

loop do
  second_last_tweet_id = last_tweet_id

  client.user_timeline(user_id, {max_id: last_tweet_id, count: 200}).each do |tweet|
    text = tweet.text.gsub(re, ' ')

    mn.parse(text) do |w|
      if w.feature.split(',').first == '名詞'
        if word_counter.has_key?(w.surface)
          word_counter[w.surface] += 1
        else
          word_counter[w.surface] = 1
        end
      end
    end

    last_tweet_id = tweet.id - 1
  end

  break if last_tweet_id == second_last_tweet_id
end

word_counter.each do |key, value|
  puts "#{key},#{value}"
end
