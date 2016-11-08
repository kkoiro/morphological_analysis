Morphological analysis
===

I made this as getting started of merphological analysis

---


## Discription
* tweet_analysis.rb
You can know how many times the noun words were used in one's past tweets. The data you can get is text file in which word and word count(how many times the word appeared) are written on every line in csv format. Mentioned tweets are not included in the data.

* description_analysis.rb
You can know how many times the noun words were used in both one's and his/her friends' profiles. The data you can get is a text file in which word and word count(how many times the word appeared) are written on every line in csv format.

* calculation_similarity.rb
This calculate similarity from two dictionaries by using cosine similarity method. Dictionary means a csv file which is composed of words and words' counts(how many times the word appeared). Each words is seperated by 'LF' or 'CR'. 'Corpus', which is a kind of vector, is created based on used parameters(words) in base dictionary.

### note:
1. It's impossible to get protected users' information.
2. Frequency of request is limited by Twitter company.
  - Timeline: 
  - User description: 180times/15min
3. We cannot get tweets older than the 3200th tweet


## Software versions
- Ruby 2.3.1p112
- natto 1.1.0
- twitter 5.16.0
- mecab 0.996


## Installation
```
brew install mecab macab-ipadic
gem install bundler
bundle install --path vendor/bundler
vim template.yml # add your developer's keys for accessing twitter
mv template.yml config.yml
```


## How to use
```
./tweet_analysis.rb [twitter_id] > example.txt
./description_analysis.rb [twitter_id] > example.txt
./calculate_similarity.rb [base_dictionary] [target_dictionary]
```
