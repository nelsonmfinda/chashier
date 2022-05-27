# frozen_string_literal: true

RSpec.describe PricingRules do
  describe 'buy one get one free offer' do
    subject(:buy_one_get_one_free) { described_class.buy_one_get_one_free(items) }

    context 'with only one item' do
      let(:items) do
        [
          Product.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a zero' do
        expect(buy_one_get_one_free).to eq 0
      end
    end

    context 'with only two items' do
      let(:items) do
        [
          Product.new('GR1', 'Green tea', 3.11),
          Product.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a price of one item' do
        expect(buy_one_get_one_free).to eq 3.11
      end
    end

    context 'with only three items' do
      let(:items) do
        [
          Product.new('GR1', 'Green tea', 3.11),
          Product.new('GR1', 'Green tea', 3.11),
          Product.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a price of one item' do
        expect(buy_one_get_one_free).to eq 3.11
      end
    end
  end

  describe 'get a price discount for bulk purchases' do
    subject(:bulk_price_on) { described_class.bulk_price_on(items) }

    context 'with less 3 items' do
      let(:items) do
        [
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a zero' do
        expect(bulk_price_on).to eq 0
      end
    end

    context 'with 3 items' do
      let(:items) do
        [
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a price of one item' do
        expect(bulk_price_on).to eq 1.5
      end
    end

    context 'with more 3 items' do
      let(:items) do
        [
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00),
          Product.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a price of one item' do
        expect(bulk_price_on).to eq 2
      end
    end
  end

  describe 'bulk discount if you buy 3 or more coffees' do
    subject(:bulk_discount_on) { described_class.bulk_discount_on(items) }

    context 'with less 3 items' do
      let(:items) do
        [
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a zero' do
        expect(bulk_discount_on).to eq 0
      end
    end

    context 'with 3 items' do
      let(:items) do
        [
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a price of one item' do
        expect(bulk_discount_on).to eq 11.23
      end
    end

    context 'with more 3 items' do
      let(:items) do
        [
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23),
          Product.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a price of one item' do
        expect(bulk_discount_on).to eq 14.97
      end
    end
  end
end
