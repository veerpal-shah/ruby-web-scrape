# Sample data
require_relative 'web_scraping'

class HtmlWebGen
  def initialize
    @collector = WebScraping.new
    @data = @collector.extracted_data
  end
  
  def generate_html
		html = <<-HTML
		<!DOCTYPE html>
		<html>
		<head>
		<title>Page Title</title>
		</head>
		<body><h1>List of Doctor Degrees</h1>
		<p>These are all the doctor degrees offered at Ohio State University</p>
		<table border = "1">
			<tr>
				<th>Degree</th>
				<th>Phone no.</th>
				<th>Website</th>
			</tr>
		HTML
		@data.each do |degree, phone, website|
			html += <<-ROW
			<tr>
				<td>#{degree}</td>
				<td>#{phone}</td>
				<td><a href="#{website}">#{website}</a></td>
			</tr>
			ROW
		end
		html += <<-HTML
		</table></body>
		</html>
		HTML

		File.write('output.html', html)
	end
end

generator = HtmlWebGen.new
generator.generate_html
