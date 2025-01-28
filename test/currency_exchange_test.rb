# These are just suggested definitions to get you started.  Please feel
# free to make any changes at all as you see fit.


# http://test-unit.github.io/
require 'test/unit'
require_relative '../lib/currency_exchange'
require_relative '../lib/json_data_source'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup
  end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    json_data_source = JsonDataSource.new('./data/eurofxref-hist-90d.json')
    CurrencyExchange.set_data_source = json_data_source
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "GBP", "USD")
  end

  def test_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    json_data_source = JsonDataSource.new('./data/eurofxref-hist-90d.json')
    CurrencyExchange.set_data_source = json_data_source
    assert_equal correct_rate, CurrencyExchange.rate(Date.new(2018,11,22), "JPY", "EUR")
  end
end
