RSpec.describe Product do
  subject(:item) { described_class.new 'SR1', 'Strawberries', 5.00 }

  describe 'sets the product price' do
    it 'return a price value' do
      expect(item.price).to eq 5.00
    end
  end

  describe 'sets the product code' do
    it 'return a string with code of the product' do
      expect(item.code).to be_kind_of(String)
      expect(item.code).to eq 'SR1'
    end
  end
end
