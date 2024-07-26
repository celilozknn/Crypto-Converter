# frozen_string_literal: true

require "uri"
require "net/http"
require 'json'
require '/Users/pisano/Desktop/Ruby-c/v2_Basics/Crypto2/coin.rb'


class Controller

  @@repo = {}

  def initialize
    init_repo
  end


  def init_repo
    json = get_json
    json.each do |symbol, values|
      @@repo[symbol] = Coin.new(symbol, values["USD"], values["EUR"])
    end
  end

  def coin_list
    @@repo.keys
  end

  def calculate_cost(symbol, to)
    coin = @@repo[symbol]
    if to == "USD"
      coin.usd
    elsif to == "EUR"
      coin.eur
    else
      puts "You can only convert to USD or EUR"
    end
  end

  def inform_user
    puts " Crypto Converter ".center(50, "*")
    puts "a. Convert to USD"
    puts "b. Convert to EUR"
    puts "q. To quit"

    puts "Command: "
    gets.chomp
  end

  def get_json
    url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,DASH,LTC&tsyms=USD,EUR"
    uri = URI(url)
    respond = Net::HTTP.get(uri)
    json = JSON.parse(respond)
  end
end

