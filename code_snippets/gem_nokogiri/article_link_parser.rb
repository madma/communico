require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://www.nytimes.com/2016/02/24/technology/justice-department-wants-apple-to-unlock-nine-more-iphones.html?hp&action=click&pgtype=Homepage&clickSource=story-heading&module=first-column-region&region=top-news&WT.nav=top-news&_r=1"))

canonical_url = doc.at_css("[rel=canonical]")["href"]

puts canonical_url
