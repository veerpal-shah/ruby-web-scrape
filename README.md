# rubyWebScrape
Ruby Web Scrape

A simple Ruby-based web scraping project that extracts information about doctorate degrees offered at Ohio State University and generates an HTML page with the extracted data.

This program specifically extracts the name of the program (eg. Accounting and Management Information Systems - Doctor of Philosophy) and then redirects to the page with all the program information, and extracts the phone number for the office of that program, as well as the website linked for that specific program department. If there is no phone number, the output is 'NULL'. 

We used the mechanize and nokogiri gems for web scraping the data from the website: https://gpadmissions.osu.edu/programs/ 

Use Ruby Version -> 3.0.1

To run the script, say:
	ruby main.rb

This code will have the output:
	it will generate a output.html file, which will contain an HTML representation for all data mentioned above. Open the file in your browser to view the data.
	
We followed all guidelines for the website's data usage policies and are in line with the terms of usage and service. 

Authors : Brenden Naumovski, Cameron Barclay, Colin Reardon, Veerpal Shah
