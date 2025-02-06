# frozen_string_literal: true
require './lib/currency_exchange'
require './lib/json_data_source'

class DisplayResult
  # data_path = File.expand_path('../data/eurofxref-hist-90d.json', __dir__)
  json_data_source = JsonDataSource.new('./data/eurofxref-hist-90d.json')
  CurrencyExchange.set_data_source = json_data_source

  begin
    rate = CurrencyExchange.rate(Date.new(2018, 11, 22), "EUR", "USD")
    puts "EUR to USD on 2018-11-22: #{rate}"
  rescue => e
    puts "Error: #{e.message}"
  end

  begin
    rate = CurrencyExchange.rate(Date.new(2018, 11, 22), "EUR", "EUR")
    puts "EUR to USD on 2018-11-22: #{rate}"
  rescue => e
    puts "Error: #{e.message}"
  end

  begin
    rate = CurrencyExchange.rate(Date.new(2018, 11, 22), "GBP", "USD")
    puts "GBP to USD on 2018-11-22: #{rate}"
  rescue => e
    puts "Error: #{e.message}"
  end
end
