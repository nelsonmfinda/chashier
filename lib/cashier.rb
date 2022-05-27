# frozen_string_literal: true

require_relative "cashier/version"
require_relative 'cashier/helpers/parse_decimals'

module Cashier
  class Error < StandardError; end
  include ::ParseDecimals
  attr_reader :basket

  def initialize(pricing_rules = nil)
    validate_rules(pricing_rules)
    @basket = Basket.new pricing_rules
  end

  def scan(item)
    @basket.scan(item)
  end

  def total
    ParseDecimals.big_decimal(basket.total - basket.total_discount)
  end

  private

    def validate_rules(pricing_rules)
      return if pricing_rules.nil? || pricing_rules.empty?

      raise StandardError, 'Pricing rules need to be an array' if pricing_rules.class.name != 'Array'

      pricing_rules.each do |rule|
        raise StandardError, "Rule not found or invalid" unless check_rule_name?(rule)
      end
    end

    def check_rule_name?(rule)
      PricingRules.methods.include? "#{rule[:name]}".to_sym
    end
end
