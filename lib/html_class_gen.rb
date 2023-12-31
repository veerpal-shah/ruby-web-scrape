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
		<title>Doctorate Degrees</title>
		</head>
		<body><h1>List of Doctorate Degrees</h1>
		<p>These are all the doctorate degrees offered at Ohio State University</p>
		<table border = "1">
			<tr>
				<th>Degree</th>
				<th>Phone no.</th>
				<th>Website</th>
			</tr>
		HTML
		@data.each_key do |k|
			html += <<-ROW
			<tr>
				<td>#{@data[k][0]}</td>
				<td>#{@data[k][1]}</td>
				<td><a href="#{@data[k][2]}">#{@data[k][2]}</a></td>
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
