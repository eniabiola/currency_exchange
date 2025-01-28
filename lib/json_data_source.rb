# frozen_string_literal: true

require 'json'
require_relative 'interface/data_source'

class JsonDataSource
  include DataSource

  def initialize(file_path)
    @file_path = file_path
  end

  def get_rates(date)
    data = JSON.parse(File.read(@file_path))
    rates = data[date.to_s] # Fetch rates for the given date
    raise "No rates available for the date: #{date}" unless rates
    rates
  end
end
