require 'json'
require 'date'

module CurrencyExchange
  @data_source = nil

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.

  def self.set_data_source=(data_source)
    @data_source = data_source
  end

  def self.rate(date, from_currency, to_currency)
    raise "Data source not set" unless @data_source

    # Handle the special case where both currencies are EUR
    return 1.0 if from_currency == "EUR" && to_currency == "EUR"

    rates = @data_source.get_rates(date)

    # Check if currencies exist in the rates and EURO especially since it is our base currency
    raise "Currency not found: #{from_currency}" unless (rates.key?(from_currency) || from_currency == "EUR")
    raise "Currency not found: #{to_currency}" unless (rates.key?(to_currency) || to_currency == "EUR")

    # the conversion happens and this conversion assumes that EUR is base
    if from_currency == "EUR"
      rates[to_currency] # Direct rate from EUR to to_currency
    elsif to_currency == "EUR"
      1.0 / rates[from_currency] # Inverse rate from from_currency to EUR
    else
      rates[to_currency] / rates[from_currency]
    end
  end

end
