# frozen_string_literal: true

class Coin
  attr_accessor :symbol, :usd, :eur
  def initialize(symbol, usd, eur)

    @symbol = symbol
    @usd = usd
    @eur = eur
  end

end