require "rqrcode"

# assign user input to be encoded
puts "What do you want to encode in a QR?"
to_qr = gets.to_s.chomp

# encodes user input
qr = RQRCode::QRCode.new(to_qr)

# translates qr data to svg
svg = qr.as_svg(offset: 0, color: '000',
      shape_rendering: 'crispEdges',
      module_size: 11).to_s

puts "Do you want to (s)ave the SVG, or (c)opy it now?"
ans = gets.chomp

# checks answer for valid answers
if ans.match(/(c|copy)|(s|save)/)
  if ans.match(/c/) or ans.match(/copy/)
    # prints svg to console
    puts svg
  elsif ans.match(/s/) or ans.match(/save/)
    puts "Enter a filename:"
    # adds svg file extension to user input
    file = gets.to_s.chomp + ".svg"
    # writes qrcode to svg file in current dir
    IO.write(file, svg)
  end
end
