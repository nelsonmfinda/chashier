require 'bigdecimal'

module ParseDecimals
  class << self
    def big_decimal(number)
      BigDecimal(number.to_s)
    end

    def currency(decimal)
      format('%.2f', decimal).to_f
    end
  end
end
