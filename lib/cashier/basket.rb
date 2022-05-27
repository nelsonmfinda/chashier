# frozen_string_literal: true

require_relative './rules/pricing'
require_relative  './helpers/parse_decimals'

class Basket
  include ::PricingRules
  include ::ParseDecimals
  attr_reader :items

  def initialize(pricing_rules = nil)
    @items = []
    @rules = pricing_rules
  end

  def scan(item)
    items.push(item)
  end

  def items_by_code(code)
    items.select { |item| item.code == code }
  end

  def total
    ParseDecimals.big_decimal(items.sum(&:price))
  end

  def total_discount
    return 0 if @rules.nil?

    sum_item = @rules.sum do |rule|
      PricingRules.public_send("#{rule[:name]}", items_by_code(rule[:code])).to_f
    end

    ParseDecimals.big_decimal(sum_item)
  end
end
