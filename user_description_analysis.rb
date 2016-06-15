#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# version: 2.3.1p112


require 'bundler/setup'
require 'yaml'
require 'twitter'
require 'natto'


def morphological_analysis!(text, word_counter)
  mn = Natto::MeCab.new
  re = /\n|https?:\/\/[\w\.\/-]*|RT|@\w+|\^|\$|\+|=|\p{Pc}|\p{Pd}|\p{Ps}|\p{Pe}|\p{Pi}|\p{Pf}|\p{Po}/
  t = text.gsub(re, ' ').downcase

  mn.parse(t) do |w|
    if w.feature.split(',').first == '名詞'
      next if /\A[\p{hiragana}|\p{katakana}|ー|a-z]\z|\A[0-9]+\z/ =~ w.surface
      if word_counter.has_key?(w.surface)
        word_counter[w.surface] += 1
      else
        word_counter[w.surface] = 1
      end
    end
  end

  word_counter.replace(word_counter)
end


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
word_counter = Hash.new

begin
  user = client.user(user_id)
  morphological_analysis!(user.description, word_counter) unless user.description.nil?
  client.friends(user_id).each do |friend|
    morphological_analysis!(friend.description, word_counter) unless friend.description.nil?
  end
rescue => e
  puts "error: #{e.message}"
  #exit -1
end


word_counter.each do |key, value|
  puts "#{key},#{value}"
end
