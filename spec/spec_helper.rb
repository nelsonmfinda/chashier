# frozen_string_literal: true

require 'bigdecimal'
require_relative '../lib/cashier'
require_relative '../lib/cashier/rules/pricing'
require_relative '../lib/cashier/helpers/parse_decimals'
require_relative '../lib/cashier/basket'
require_relative '../lib/cashier/product'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
