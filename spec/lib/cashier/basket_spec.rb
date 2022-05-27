# frozen_string_literal: true

RSpec.describe Basket do
  subject(:basket) { described_class.new }

  let(:tea) { Product.new 'GR1', 'Green tea', 3.11 }
  let(:strawberries) { Product.new 'SR1', 'Strawberries', 5.00 }
  let(:coffee) { Product.new 'CF1', 'Coffee', 11.23 }

  describe '#items' do
    context 'without items' do
      it 'return an empty array' do
        expect(basket.items).to eq []
      end
    end

    context 'with one item' do
      before { basket.items.push tea }

      it 'return an empty array' do
        expect(basket.items).to eq [tea]
      end
    end
  end

  describe '#add_item' do
    it 'increment one ellemt of items' do
      basket.scan(tea)
      expect(basket.items).to eq [tea]
    end
  end

  describe '#items_by_code' do
    before do
      basket.scan(tea)
      basket.scan(coffee)
    end

    it 'return an array with results' do
      expect(basket.items_by_code('GR1')).to eq [tea]
    end
  end

  describe '#total' do
    before { basket.scan(tea) }

    it 'returns a float with sum of all items' do
      expect(basket.total).to eq 3.11
    end
  end

  describe '#total_discount' do
    context 'without rules' do
      subject(:basket) { described_class.new }

      it 'returns a float with sum of all items' do
        expect(basket.total_discount).to eq 0
      end
    end

    context 'with rules' do
      subject(:basket) { described_class.new([{ name: 'buy_one_get_one_free', code: 'GR1' }]) }

      before do
        basket.scan(tea)
        basket.scan(tea)
      end

      it 'returns a float with sum of all items' do
        expect(basket.total_discount).to eq 3.11
      end
    end
  end
end
