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
This calculate similarity from two dictionaries by using cosine similarity method. Dictionary means a csv file which is composed of word and word count(how many times the word appeared), and one set of them are devided by 'LF' or 'CR'. When we make 'corpus' which is a kind of vector, used parameters(words) in target dictionary follow base dictionary them.

### note:
1. It's impossible to get protected users' information.
2. Frequency of request is limited by Twitter company.
  - Timeline: 
  - User description: 180times/15min
3. We cannot get tweets older than the 3200th tweet


## Software versions
- Ruby 2.3.1p112
- natto 1.1.0
- twitter


## Installation
```
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
