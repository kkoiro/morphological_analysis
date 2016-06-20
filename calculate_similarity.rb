#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# version: 2.3.1


def caluculate_simirlarity(vec_a, vec_b)
  dot_product = 0 # dot_product = vec_a(x1) * vec_b(x1) + ... + vec_a(xn) * vec_b(xn)
  size_of_a = 0 # |vec_a|
  size_of_b = 0 # |vec_b|

  vec_a.each do |key, value|
    dot_product += vec_b[key] * value
    size_of_a += value ** 2
    size_of_b += vec_b[key] ** 2
  end

  size_of_a = Math.sqrt(size_of_a)
  size_of_b = Math.sqrt(size_of_b)

  return dot_product / (size_of_a * size_of_b)
end


unless ARGV.length == 2
  puts "Usage: #{__FILE__} [path_to_dictionary_a] [path_to_dictionary_b]\nNote: corpus parameters are based on dictionary_a(ARGF[0])"
  exit 0
end


basic_corpus = Hash.new # vec_a
begin

  File.open(ARGV[0]) do |file|
    file.each_line do |line|
      word,num = line.chomp.split(',')
      basic_corpus[word] = num.to_i
    end
  end

rescue SystemCallError => e
  puts "class=[#{e.class}] message=[#{e.message}]"
rescue IOError => e
  puts "class=[#{e.class}] message=[#{e.message}]"
end


tmp_hash = Hash.new
begin

  File.open(ARGV[1]) do |file|
    file.each_line do |line|
      word,num = line.chomp.split(',')
      tmp_hash[word] = num.to_i
    end
  end

rescue SystemCallError => e
  puts "class=[#{e.class}] message=[#{e.message}]"
rescue IOError => e
  puts "class=[#{e.class}] message=[#{e.message}]"
end


target_corpus = Hash.new # vec_b
basic_corpus.each_key do |key|
  if tmp_hash.has_key?(key)
    target_corpus[key] = tmp_hash[key]
  else
    target_corpus[key] = 0
  end
end


puts caluculate_simirlarity(basic_corpus, target_corpus)
