require_relative '../helpers/parse_decimals'

module PricingRules
  class << self
    include ::ParseDecimals

    def buy_one_get_one_free(items)
      num_to_discount = items.size / 2
      return 0 if num_to_discount.zero?
      ParseDecimals.big_decimal(num_to_discount * items.first.price)
    end

    def bulk_price_on(items)
      return 0 if items.size < 3
      ParseDecimals.currency(items.size * 0.5)
    end

    def bulk_discount_on(items)
      return 0 if items.size < 3
      new_price = items.first.price * (1.0 / 3.0)
      ParseDecimals.currency(items.size * new_price)
    end
  end
end
