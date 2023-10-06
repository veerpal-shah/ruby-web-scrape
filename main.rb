#require 'rubygems'
require_relative 'lib/data_collector.rb'

data = DataCollector.new
data.start

scraper = WebScraping.new
scraper.start

