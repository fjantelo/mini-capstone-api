require "http"
# system "clear"

# # For testing:
# response = HTTP.get("http://localhost:3000/all_products")
# puts response.parse(:json)["product_data"].length

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
    response = HTTP.get("http://localhost:3000/all_products")
    index = 0
    while index < response.parse(:json)["product_data"].length
      puts "#{index + 1}. #{response.parse(:json)["product_data"][index]["name"]}"
      index += 1
    end
  elsif selection == "1"
    response = HTTP.get("http://localhost:3000/headphones")
    puts "Name: #{response.parse(:json)["product_data"]["name"]}"
    puts "Price: $#{response.parse(:json)["product_data"]["price"]}"
    puts "Description: #{response.parse(:json)["product_data"]["description"]}"
    puts ""
  elsif selection == "2"
    response = HTTP.get("http://localhost:3000/skillet")
    puts "Name: #{response.parse(:json)["product_data"]["name"]}"
    puts "Price: $#{response.parse(:json)["product_data"]["price"]}"
    puts "Description: #{response.parse(:json)["product_data"]["description"]}"
    puts ""
  elsif selection == "3"
    response = HTTP.get("http://localhost:3000/sunglasses")
    puts "Name: #{response.parse(:json)["product_data"]["name"]}"
    puts "Price: $#{response.parse(:json)["product_data"]["price"]}"
    puts "Description: #{response.parse(:json)["product_data"]["description"]}"
    puts ""
  elsif selection.downcase == "exit"
    break
  else
    puts "Invalid selection. Try again."
    puts ""
  end
end
