Morphological analysis
===

I made this as getting started of merphological analysis

---


## Introduction
* timeline_analysis.rb  
You can know how many times the noun words were used in one's past tweets

* user_description_analysis.rb  
You can know how many times the noun words were used in one's profile and their friends' it

note:  
It's impossible to get protected users information


## Software versions
- Ruby 2.3.1p112
- natto 1.1.0
- twitter


## Installation
```
bundle install --path vendor/bundler
vim template.yml # add your developer keys for accessing twitter
mv template.yml config.yml
```


## How to use
```
./timeline_analysis.rb [twitter_id]
./user_description_analysis.rb [twitter_id]
```
