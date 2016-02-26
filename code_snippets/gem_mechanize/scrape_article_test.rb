require 'mechanize'
require 'pry'

mechanize = Mechanize.new

# doc = mechanize.get("http://www.nytimes.com/2016/02/24/technology/justice-department-wants-apple-to-unlock-nine-more-iphones.html?hp&action=click&pgtype=Homepage&clickSource=story-heading&module=first-column-region&region=top-news&WT.nav=top-news&_r=1")

doc = mechanize.get("http://www.newyorker.com/news/news-desk/albert-woodfox-and-the-case-against-solitary-confinement")

link        = doc.at("[property='og:url']")["content"]
type        = doc.at("[property='og:type']")["content"]
title       = doc.at("[property='og:title']")["content"]
description = doc.at("[property='og:description']")["content"]
image       = doc.at("[property='og:image']")["content"]
section     = doc.at("[property='article:section']")["content"]
tags        = doc.search("[property='article:tag']")#["content"]

puts link
puts type
puts title
puts description
puts image
puts section

tags.each do |tag|
  puts tag["content"]
end

