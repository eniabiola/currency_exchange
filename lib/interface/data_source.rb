# frozen_string_literal: true

module DataSource
  def get_rates(date)
    raise NotImplementedError, "DataSource subclasses must implement `get_rates`"
  end
end