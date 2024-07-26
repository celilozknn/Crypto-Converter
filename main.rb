# frozen_string_literal: true

# "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR"

require "/Users/pisano/Desktop/Ruby-c/v2_Basics/Crypto2/controller.rb"

def submenu(controller, to)
  coin_list = controller.coin_list
  puts " Available Coins ".center(50, "*")
  puts coin_list.join(", ")

  puts "Crypto: "
  symbol = gets.chomp.upcase

  puts "Amount: "
  amount = gets.chomp

  # Ensure an int value is given for amount value
  until amount.match?(/^\d+$/)
    puts "Invalid input. Please enter a valid integer amount: "
    amount = gets.chomp
  end
  amount = amount.to_i


  if to == "USD"
    if !controller.coin_list.include?(symbol)
      puts "Coin #{symbol} is not available"
    else
      cost = controller.calculate_cost(symbol, "USD")
      puts amount * cost
    end
  elsif to == "EUR"
    if !controller.coin_list.include?(symbol)
      puts "Coin #{symbol} is not available"
    else
      cost = controller.calculate_cost(symbol, "EUR")
      puts amount * cost
    end
  end
end

def menu
  controller = Controller.new

  while true
    cmd = controller.inform_user

    if cmd == "q"
      puts "Quitting..."
      break
    end

    case cmd
    when "a" then submenu(controller, "USD")
    when "b" then submenu(controller, "EUR")
    end
  end
end

menu