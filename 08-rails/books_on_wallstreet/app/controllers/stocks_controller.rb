class StocksController < ApplicationController
  def form
  end

  def info
    @stock_symbol = params[:stock_symbol].upcase
    StockQuote::Stock.new(:api_key => 'pk_16a849fd637243a79fff90fa4d42bc5d')
    info = StockQuote::Stock.quote @stock_symbol
    @price = info.previous_close
  end
end
