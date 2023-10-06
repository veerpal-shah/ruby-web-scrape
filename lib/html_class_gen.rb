# Sample data
data = [
  ["Doctor in Computer Science", "123-456-7890", "http://cs.ohiostate.edu"],
  ["Doctor in Mathematics", "123-456-7891", "http://math.ohiostate.edu"],

]
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
data.each do |degree, phone, website|
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


#
