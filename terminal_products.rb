require "http"
system "clear"

while true
  puts "Welcome to the Mini Capstone API Store. Enter a page number:"
  puts "0: All products"
  puts "1: Headphones"
  puts "2: Skillet"
  puts "3: Sunglasses"
  puts ""
  puts "Type 'exit' to exit the store."
  selection = gets.chomp

  if selection == "0"
    response = HTTP.get("http://localhost:3000/products")
    index = 0
    while index < response.parse(:json).length
      puts "#{index + 1}. #{response.parse(:json)[index]["name"]}"
      index += 1
    end
  elsif selection == "1"
    response = HTTP.get("http://localhost:3000/products/1")
    puts "Name: #{response.parse(:json)["name"]}"
    puts "Price: $#{response.parse(:json)["price"]}"
    puts "Description: #{response.parse(:json)["description"]}"
    puts ""
  elsif selection == "2"
    response = HTTP.get("http://localhost:3000/products/2")
    puts "Name: #{response.parse(:json)["name"]}"
    puts "Price: $#{response.parse(:json)["price"]}"
    puts "Description: #{response.parse(:json)["description"]}"
    puts ""
  elsif selection == "3"
    response = HTTP.get("http://localhost:3000/products/3")
    puts "Name: #{response.parse(:json)["name"]}"
    puts "Price: $#{response.parse(:json)["price"]}"
    puts "Description: #{response.parse(:json)["description"]}"
    puts ""
  elsif selection.downcase == "exit"
    break
  else
    puts "Invalid selection. Try again."
    puts ""
  end
end
