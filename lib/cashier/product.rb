# frozen_string_literal: true

require 'bigdecimal'
require_relative './helpers/parse_decimals'

class Product
  include ::ParseDecimals

  attr_reader :code, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = ParseDecimals.big_decimal(price)
  end
end
